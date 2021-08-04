import argparse
import os
import traceback
import numbers
import random
import re
from intermediate_representation.graph import Graph
from intermediate_representation.sem2sparql.infer_from_clause import infer_from_clause
from intermediate_representation.semQL_SPARQL import Sup, Sel, Order, Root, Filter, A, N, C, T, Root1, V
from intermediate_representation.sem_utils import alter_column0



def split_logical_form(lf):
    indexs = [i + 1 for i, letter in enumerate(lf) if letter == ')']
    indexs.insert(0, 0)
    components = list()
    for i in range(1, len(indexs)):
        components.append(lf[indexs[i - 1]:indexs[i]].strip())
    return components


def pop_front(array):
    if len(array) == 0:
        return 'None'
    return array.pop(0)


def peek_front(array):
    if len(array) == 0:
        return 'None'
    return array[0]


def is_end(components, transformed_sql, is_root_processed):
    end = False
    c = pop_front(components)
    c_instance = eval(c)

    if isinstance(c_instance, Root) and is_root_processed:
        # intersect, union, except
        end = True
    elif isinstance(c_instance, Filter):
        if 'where' not in transformed_sql:
            end = True
        else:
            num_conjunction = 0
            for f in transformed_sql['where']:
                if isinstance(f, str) and (f == 'and' or f == 'or'):
                    num_conjunction += 1
            current_filters = len(transformed_sql['where'])
            valid_filters = current_filters - num_conjunction
            if valid_filters >= num_conjunction + 1:
                end = True
    elif isinstance(c_instance, Order):
        if 'order' not in transformed_sql:
            end = True
        elif len(transformed_sql['order']) == 0:
            end = False
        else:
            end = True
    elif isinstance(c_instance, Sup):
        if 'sup' not in transformed_sql:
            end = True
        elif len(transformed_sql['sup']) == 0:
            end = False
        else:
            end = True
    components.insert(0, c)
    return end


def _transform(components, transformed_sql, col_set, table_names, values, schema):
    processed_root = False
    current_table = schema

    while len(components) > 0:
        if is_end(components, transformed_sql, processed_root):
            break
        c = pop_front(components)
        c_instance = eval(c)

        if isinstance(c_instance, Root):
            processed_root = True
            # a list with only 2 elements - similar to the spider data structure
            # [0] is used for distinct true/false. [1] contains the array with selection columns
            transformed_sql['select'] = [False, list()]
            if c_instance.id_c == 0:
                transformed_sql['where'] = list()
                transformed_sql['sup'] = list()
            elif c_instance.id_c == 1:
                transformed_sql['where'] = list()
                transformed_sql['order'] = list()
            elif c_instance.id_c == 2:
                transformed_sql['sup'] = list()
            elif c_instance.id_c == 3:
                transformed_sql['where'] = list()
            elif c_instance.id_c == 4:
                transformed_sql['order'] = list()
        elif isinstance(c_instance, Sel):
            if c_instance.id_c == 1:
                transformed_sql['select'][0] = True
        elif isinstance(c_instance, N):
            for i in range(c_instance.id_c + 1):
                agg = eval(pop_front(components))
                column = eval(pop_front(components))
                _table = pop_front(components)
                table = eval(_table)
                if not isinstance(table, T):
                    table = None
                    components.insert(0, _table)
                assert isinstance(agg, A) and isinstance(column, C)

                if table is not None:
                    col, _ = replace_col_with_original_col(col_set[column.id_c], table_names[table.id_c], current_table)
                else:
                    col = col_set[column.id_c]

                # if we have an aggregation (e.g. COUNT(xy)) and the query as a whole is a distinct, we also use distinct
                # inside the aggregation (e.g. COUNT(DISTINCT xy)). While this is an oversimplification, it works for most cases
                # as it is hard to formulate a question in a way that some things are distinct and some are not.
                use_distinct = False
                if agg.id_c != 0 and transformed_sql['select'][0]:
                    use_distinct = True

                transformed_sql['select'][1].append((
                    agg.production.split()[1],
                    col,
                    table_names[table.id_c] if table is not None else table,
                    use_distinct
                ))

        elif isinstance(c_instance, Sup):
            transformed_sql['sup'].append(c_instance.production.split()[1])
            agg = eval(pop_front(components))
            column = eval(pop_front(components))
            _table = pop_front(components)
            table = eval(_table)
            if not isinstance(table, T):
                table = None
                components.insert(0, _table)
            assert isinstance(agg, A) and isinstance(column, C)

            transformed_sql['sup'].append(agg.production.split()[1])
            if table:
                column_final, _ = replace_col_with_original_col(col_set[column.id_c], table_names[table.id_c],
                                                                current_table)
            else:
                column_final = col_set[column.id_c]
                raise RuntimeError('not found table !!!!')
            transformed_sql['sup'].append(column_final)
            transformed_sql['sup'].append(table_names[table.id_c] if table is not None else table)

        elif isinstance(c_instance, Order):
            transformed_sql['order'].append(c_instance.production.split()[1])
            agg = eval(pop_front(components))
            column = eval(pop_front(components))
            _table = pop_front(components)
            table = eval(_table)
            if not isinstance(table, T):
                table = None
                components.insert(0, _table)
            assert isinstance(agg, A) and isinstance(column, C)
            transformed_sql['order'].append(agg.production.split()[1])
            transformed_sql['order'].append(
                replace_col_with_original_col(col_set[column.id_c], table_names[table.id_c], current_table)[0])
            transformed_sql['order'].append(table_names[table.id_c] if table is not None else table)

        elif isinstance(c_instance, Filter):

            op = c_instance.production.split()[1]
            if op == 'and' or op == 'or':
                transformed_sql['where'].append(op)
            else:
                # No sub-query
                agg = eval(pop_front(components))
                column = eval(pop_front(components))
                _table = pop_front(components)
                table = eval(_table)
                if not isinstance(table, T):
                    table = None
                    components.insert(0, _table)
                assert isinstance(agg, A) and isinstance(column, C)

                # here we verify if there is a sub- query
                component = peek_front(components)
                if isinstance(eval(component), V):
                    if table:
                        column_final, column_final_idx = replace_col_with_original_col(col_set[column.id_c],
                                                                                       table_names[table.id_c],
                                                                                       current_table)
                    else:
                        column_final = col_set[column.id_c]
                        raise RuntimeError('Table not found!')

                    second_value = None
                    # now we handle the values - we also handle data types properly.
                    value_obj = eval(pop_front(components))
                    value = format_value_given_datatype(column_final_idx, schema, values[value_obj.id_c], c_instance)

                    # there is a few special cases where we have to deal with multiple values - e.g. in the "X BETWEEN Y AND Z" case.
                    if isinstance(eval(peek_front(components)), V):
                        #group
                        #by ?t1_document_id
                        #Having(?agg >= 1 & & ?agg <= 2)
                        second_value_obj = eval(pop_front(components))
                        second_value = format_value_given_datatype(column_final_idx, schema,
                                                                   values[second_value_obj.id_c], c_instance)

                    transformed_sql['where'].append((
                        op,
                        agg.production.split()[1],
                        column_final,
                        table_names[table.id_c] if table is not None else table,
                        value,
                        second_value,
                    ))


                else:
                    # sub-query
                    new_dict = dict()
                    new_dict['sql'] = transformed_sql['sql']
                    transformed_sql['where'].append((
                        op,
                        agg.production.split()[1],
                        replace_col_with_original_col(col_set[column.id_c], table_names[table.id_c], current_table)[0],
                        table_names[table.id_c] if table is not None else table,
                        _transform(components, new_dict, col_set, table_names, values, schema),
                        None
                    ))

    return transformed_sql


def transformSparql(query, schema, origin=None):
    preprocess_schema(schema)
    if origin is None:
        lf = query['model_result_replace']
    else:
        lf = origin
    # lf = query['rule_label']
    col_set = query['col_set']
    table_names = query['table_names']
    values = query['values']
    current_table = schema

    current_table['schema_content_clean'] = [x[1] for x in current_table['column_names']]
    current_table['schema_content'] = [x[1] for x in current_table['column_names_original']]

    components = split_logical_form(lf)

    transformed_sql = dict()
    transformed_sql['sql'] = query
    c = pop_front(components)
    c_instance = eval(c)
    assert isinstance(c_instance, Root1)
    if c_instance.id_c == 0:
        transformed_sql['intersect'] = dict()
        transformed_sql['intersect']['sql'] = query
        _transform(components, transformed_sql, col_set, table_names, values, schema)
        _transform(components, transformed_sql['intersect'], col_set, table_names, values, schema)
    elif c_instance.id_c == 1:
        transformed_sql['union'] = dict()
        transformed_sql['union']['sql'] = query
        _transform(components, transformed_sql, col_set, table_names, values, schema)
        _transform(components, transformed_sql['union'], col_set, table_names, values, schema)
    elif c_instance.id_c == 2:
        transformed_sql['except'] = dict()
        transformed_sql['except']['sql'] = query
        _transform(components, transformed_sql, col_set, table_names, values, schema)
        _transform(components, transformed_sql['except'], col_set, table_names, values, schema)
    else:
        _transform(components, transformed_sql, col_set, table_names, values, schema)

    parse_result = to_str(transformed_sql, 1, schema)

    parse_result = parse_result.replace('\t', '')
    return [parse_result]


# table names are created here
def col_to_str(agg, col, tab, table_names, N=1, is_distinct=False):
    global lastUsedCol
    _col = col.replace(' ', '_')
    distinct_str = 'DISTINCT' if is_distinct else ''
    if agg == 'none':
        if tab not in table_names:
            table_names[tab] = 'T' + str(len(table_names) + N)
        table_alias = table_names[tab]
        if col == '*':
            return '*'
        lastUsedCol = '?%s_%s' % (table_alias, _col)
        return '?%s_%s' % (table_alias, _col)
    else:
        if col == '*':
            if tab is not None and tab not in table_names:
                table_names[tab] = 'T' + str(len(table_names) + N)
            lastUsedCol = '?aggregation_all'
            return '(%s(%s %s) as ?%s_%s)' % (agg, distinct_str, _col, "aggregation", "all")
        else:
            if tab not in table_names:
                table_names[tab] = 'T' + str(len(table_names) + N)
            table_alias = table_names[tab]
            aggRandom = random.randint(0, 500)
            lastUsedCol = '?%s_%s_%s_%s' % ("aggregation", table_alias, _col, str(aggRandom))
            return '(%s(%s ?%s_%s) as ?%s_%s_%s_%s )' % (
            agg, distinct_str, table_alias, _col, "aggregation", table_alias, _col, str(
                aggRandom))


def replace_col_with_original_col(query, col, current_table):
    # print(query, col)
    if query == '*':
        return query, None

    cur_table = col
    cur_col = query
    single_final_col = None
    single_final_col_idx = None
    # print(query, col)
    for col_ind, col_name in enumerate(current_table['schema_content_clean']):
        if col_name == cur_col:
            assert cur_table in current_table['table_names']
            if current_table['table_names'][current_table['col_table'][col_ind]] == cur_table:
                single_final_col = current_table['column_names_original'][col_ind][1]
                single_final_col_idx = col_ind
                break
    # SELECT package_option ,  series_name FROM TV_Channel WHERE high_definition_TV  =  "yes"
    assert single_final_col
    # if query != single_final_col:
    #     print(query, single_final_col)
    return single_final_col, single_final_col_idx


def build_graph(schema):
    relations = list()
    foreign_keys = schema['foreign_keys']
    for (fkey, pkey) in foreign_keys:
        fkey_table = schema['table_names_original'][schema['column_names'][fkey][0]]
        fkey_original_name = schema['column_names_original'][fkey][1]

        pkey_table = schema['table_names_original'][schema['column_names'][pkey][0]]
        pkey_original_name = schema['column_names_original'][pkey][1]

        relations.append((fkey_table, fkey_original_name, pkey_table, pkey_original_name))
        relations.append((pkey_table, pkey_original_name, fkey_table, fkey_original_name))

    return Graph(relations)


# takes the info for one database from the schemas var
def preprocess_schema(schema):
    tmp_col = []
    for cc in [x[1] for x in schema['column_names']]:
        if cc not in tmp_col:
            tmp_col.append(cc)
    schema['col_set'] = tmp_col
    # print table
    schema['schema_content'] = [col[1] for col in schema['column_names']]
    schema['col_table'] = [col[0] for col in schema['column_names']]
    graph = build_graph(schema)
    schema['graph'] = graph


def alias(select_clause):
    aliases = []
    # aliases= ['?col' + str(idx+1) for idx,val in enumerate(select_clause) if idx <= len(select_clause) and select_clause]
    for idx, val in enumerate(select_clause):
        if '*' not in select_clause[0] and 'count' not in select_clause[0]:
            if idx <= len(select_clause):
                alias = '?col' + str(idx + 1)
            aliases.append(alias)
        else:
            aliases = select_clause
    aliases = ''.join(aliases)
    return aliases


def format_value_given_datatype(column_final_idx, schema, value, filter_instance):
    # there is some special cases on the training set where the user asks for an "empty" history or
    # similar. In that case, we need to really add an empty string.
    if value == '':
        return "\'\'"

    # before we handle the values, we wanna find out what data-type the value has (based on the schema)
    if column_final_idx is not None:
        data_type = schema['column_types'][column_final_idx]
        if data_type == 'text':
            use_quotes = True
        elif data_type == 'time':
            use_quotes = True
        else:
            use_quotes = False
    else:
        # this means we are comparing the value with an aggregation - e.g. a COUNT(*). So it must be a number.
        use_quotes = False

    # sometimes a column is text, but the value in it is a number. We then have to remove the floating point, as
    # otherwise, the comparison is wrong. Example: a boolean column (as VARCHAR(1), you have compare 1 with '1' and not with '1.0'
    # for every other numeric comparison, the float/int difference is handled properly by SQL.
    if use_quotes and isinstance(value, numbers.Number):
        value = int(value)

    # filter 9 is 'LIKE' - we need to add the wildcards to the value.
    # TODO: introduce new filter actions for LIKE_FUZZY_BEGINNING and LIKE_FUZZY_ENDING
    if filter_instance.id_c == 9:
        # value = f'%{value}%'
        value = f'{value}'

    value_formatted = "'{}'".format(value) if use_quotes else value

    return value_formatted


# N_T is the number of tables
def to_str(sql_json, N_T, schema, pre_table_names=None):
    all_columns = list()
    select_clause = list()
    table_names = dict()
    conjunctions = list()
    filters = list()
    filter_not_exists = list()
    filter_subqueries = list()
    filter_not_in = list()
    where_clause = ''
    sup_clause = ''
    order_clause = ''
    direction_map = {"des": 'DESC', 'asc': 'ASC'}

    current_table = schema

    whole_select_distinct = 'DISTINCT ' if sql_json['select'][0] or 'intersect' in sql_json else ''

    for (agg, col, tab, distinct) in sql_json['select'][1]:
        all_columns.append((agg, col, tab))
        select_clause.append(col_to_str(agg, col, tab, table_names, N_T, distinct))
        #if 'sup' in sql_json:
            #if ('count' in sql_json['sup'] and '(count( *) as ?aggregation_all)' not in select_clause):
             #   select_clause.append('(count( *) as ?aggregation_all)')
    global nested_query_filter
    if agg in select_clause[0]:
        nested_query_filter = lastUsedCol
    else:
        nested_query_filter = select_clause[0]
    global table_names_for_intersect
    table_names_for_intersect = table_names
    global column_not_in
    # at this point the select clause is just the name of the projected columns
    # for union and except, the subquery column names need to be aliased as the samename, in order to work.
    if 'Root1(1)' in sql_json['sql']['model_result'] or 'Root1(2)' in sql_json['sql']['model_result']:
        # checking how to alias the columns, if there are more than 2 columns in the select then they both need to be aliased.
        aliased_select_clause = list()
        if select_clause[0] == '*':
            select_clause_str = 'SELECT ' + whole_select_distinct + ' '.join(select_clause).strip()
            select_clause_str += ' WHERE {'
        else:
            i = 1
            for column_name in select_clause:
                column_name = '(' + column_name + ' as ?col' + str(i) + ')'
                aliased_select_clause.append(column_name)
                i += 1
            select_clause_str = 'SELECT ' + whole_select_distinct + ' '.join(aliased_select_clause).strip()
            select_clause_str += ' WHERE {'
    # for Intersect
    elif 'Root1(0)' in sql_json['sql']['model_result'] and whole_select_distinct == '':
        select_clause_str = ''
    elif select_clause[0] == '*':
        # for cases like SELECT * from TABLE, in sparql it would otherwise return the ?s?p?o instead of just the literals
        select_clause_str = 'SELECT ?literal WHERE {'
    else:
        select_clause_str = 'SELECT ' + whole_select_distinct + ' '.join(
            select_clause).strip()  # removed comma for column projection
        select_clause_str += ' WHERE {'

    if 'sup' in sql_json:
        (direction, agg, col, tab,) = sql_json['sup']
        all_columns.append((agg, col, tab))
        sup_subject = col_to_str(agg, col, tab, table_names, N_T)
        # subject = col_to_str(agg, col, tab, table_names, N_T)
        if sup_subject == '(count( *) as ?aggregation_all)':
            sup_clause = ('ORDER BY %s (count(*)) LIMIT 1' % (direction_map[direction])).strip()
        elif '(count( *) as ?aggregation_all)' in select_clause and sup_subject not in select_clause:
            sup_clause = ('GROUP BY %s ORDER BY %s (%s) LIMIT 1' % (sup_subject, direction_map[direction], sup_subject)).strip()
        elif agg == 'sum':
            sup_subject= re.sub(r'as.*',')', sup_subject)
            sup_clause = ('ORDER BY %s %s LIMIT 1' % (
                direction_map[direction], sup_subject)).strip()
        else:
            sup_clause = ('ORDER BY %s (%s) LIMIT 1' % (
            direction_map[direction], sup_subject)).strip()  # changed order of vars
    elif 'order' in sql_json:
        (direction, agg, col, tab,) = sql_json['order']
        all_columns.append((agg, col, tab))
        subject = col_to_str(agg, col, tab, table_names, N_T)
        if subject == '(count( *) as ?aggregation_all)':
            subject=('count(*)')
            order_clause = ('ORDER BY %s (%s)' % (direction_map[direction], subject)).strip()  # changed order of vars
        else:
            order_clause = ('ORDER BY %s (%s)' % (direction_map[direction], subject)).strip()
    has_group_by = False
    have_clause = ''

    if 'where' in sql_json:
        for f in sql_json['where']:
            if isinstance(f, str):
                conjunctions.append(f)
            else:
                # parses the where clause into the following components... value for a subquery, such as with 'not_in'
                op, agg, col, tab, value, value2 = f
                all_columns.append((agg, col, tab))
                subject = col_to_str(agg, col, tab, table_names, N_T)

                # here we detect the difference between a simple value or a value which refers to a subquery
                if not isinstance(value, dict):
                    column_not_in = ''.join(select_clause)
                    values_combined = value
                    # sparql equivalent is contains and the syntax is slightly different.
                    if op == 'contains':
                        values_combined = "{}".format(value)
                        filters.append('%s (%s, %s)' % (op, subject.lower(), values_combined))
                    elif value2 is not None:  # right now the only case where two values are allowed is a BETWEEN X AND Y statement.
                        if subject.startswith('(count'):
                            subject_2 = subject[1:]
                            values_combined = "{} >= {} && {} <= {}".format(subject.lower(), value, subject_2.lower(),value2)
                        else:
                            values_combined = "{} >= {} && {} <= {}".format(subject.lower(), value, subject.lower(), value2)
                        filters.append(values_combined)
                    else:
                        filters.append('%s %s %s' % (subject.lower(), op, values_combined))  # removed ? here
                else:
                    column_not_in = subject.lower()
                    value['sql'] = sql_json['sql']

                    # This is kind of a style-change: instead of "xy IN (SELECT z FROM a)" one can also rewrite the query to a simple JOIN (this is done with adding the table).
                    # While it is critical for Exact Matching (where joins are checked), it is also necessary for Execution Accuracy. The reason is simply that a "EXISTS (SELECT ID FROM ...)" or a "IN (SELECT ID FROM ...)"
                    # behave slightly different than a JOIN, especially when it comes to their shortcut-behaviour and therefore also the natural order by (read more here) https://blog.jooq.org/2016/03/09/sql-join-or-exists-chances-are-youre-doing-it-wrong/

                    # as we choose to model simple joins (see model_simple_joins_as_filter.py) with a filter, we use the opportunity here to change the filter back to a normal join - as in the ground truth expected.
                    # Obviously this would be an issue if a query tries to exactly use "IN (SELECT ID FROM XY)". There is a few examples where this is the case, e.g.
                    # SELECT avg(age) FROM Dogs WHERE dog_id IN ( SELECT dog_id FROM Treatments ) (look for this in ground truth)

                    number_of_selects = len(value['select'][1])
                    # here it shows if there is an aggregation in the select or not, name of the column, name of the table, false? not sure what this is for.
                    first_select_aggregation = value['select'][1][0][0]

                    if op == 'in' and number_of_selects == 1 \
                            and first_select_aggregation == 'none' \
                            and 'where' not in value \
                            and 'order' not in value \
                            and 'sup' not in value:

                        if value['select'][1][0][2] not in table_names:
                            table_names[value['select'][1][0][2]] = 'T' + str(len(table_names) + N_T)

                        # This is necessary to avoid incorrect queries: if there is an "and/or" conjunction at the end of the filter, we need to put a next filter to avoid an invalid query.
                        # If we though apply a join instead of an "IN ()" statement, we need to remove that conjunction.
                        if len(conjunctions) > 0:
                            conjunctions.pop()

                        filters.append(None)
                    else:
                        if op == 'not_in':
                            filter_not_exists.append(
                                'Filter not exists {{' + to_str(value, len(table_names) + N_T + 20, schema) + '}')
                            if len(filter_not_exists) == 1:
                                # when there is also a filter in the outside query where is longer than 1
                                if isinstance(sql_json['where'][0], tuple) and 'where' not in sql_json['where'][0][4]:
                                    # and
                                    filter_not_in = 'FILTER ({} in ({}))'.format(subject.lower(),
                                                                                 lastUsedCol.lower()) + '}'
                                else:
                                    filter_not_in = 'FILTER ({} in ({}))'.format(subject.lower(),
                                                                                 column_not_in.lower()) + '}'
                            else:
                                filter_not_in = ''
                        else:
                            filter_subqueries.append('{' + to_str(value, len(table_names) + N_T + 20, schema) + '}')
                            # for every other sub-query we use a recursion to transform it to a string. By using a high NT-value we avoid conflicts with table-aliases.
                            filters.append(
                                '%s %s %s' % (subject.lower(), op, nested_query_filter.lower()))  # removed ? here too

                if len(conjunctions):
                    filters.append(conjunctions.pop())

        aggs = ['count(', 'avg(', 'min(', 'max(', 'sum(']
        having_filters = list()
        idx = 0
        while idx < len(filters):
            _filter = filters[idx]
            if _filter is None:
                idx += 1
                continue
            for agg in aggs:
                if _filter.lower().startswith(agg, 1):
                    # because count in sparql looks like this '(count( *) as ?aggregation_all) > 1', starts with needs to start from index 1 to check if there are aggregations
                    if agg != 'count(':
                        _filter = re.sub(r'as(.*?)\)', '', _filter)
                    having_filters.append(_filter)
                    filters.pop(idx)
                    # print(filters)
                    if 0 < idx and (filters[idx - 1] in ['and', 'or']):
                        filters.pop(idx - 1)
                        # print(filters)
                    break
            else:
                idx += 1
        if len(having_filters) > 0:
            have_clause = 'HAVING' + ' '.join(having_filters).strip() + ')'
            have_clause = have_clause.replace('as ?aggregation_all)', '')
        if len(filters) > 0:
            # print(filters)
            filters = [_f for _f in filters if _f is not None]
            conjun_num = 0
            filter_num = 0
            for _f in filters:
                if _f in ['or', 'and']:
                    conjun_num += 1
                else:
                    filter_num += 1
            if conjun_num > 0 and filter_num != (conjun_num + 1):
                # assert 'and' in filters
                idx = 0
                while idx < len(filters):
                    if filters[idx] == 'and':
                        if idx - 1 == 0:
                            filters.pop(idx)
                            break
                        if filters[idx - 1] in ['and', 'or']:
                            filters.pop(idx)
                            break
                        if idx + 1 >= len(filters) - 1:
                            filters.pop(idx)
                            break
                        if filters[idx + 1] in ['and', 'or']:
                            filters.pop(idx)
                            break
                    idx += 1
            if len(filters) > 0:
                where_clause = 'FILTER(' + ' '.join(filters).strip() + ') . '
            else:
                where_clause = ''

        if len(having_filters) > 0:
            has_group_by = True

    for agg in ['count(', 'avg(', 'min(', 'max(', 'sum(']:
        if (len(sql_json['select'][1]) > 1 and agg in select_clause_str.lower()) \
                or agg in sup_clause or agg in order_clause or ('sup' in sql_json and agg in sup_subject):
            has_group_by = True
            break

    group_by_clause = ''
    if has_group_by:
        if len(table_names) == 1:
            # check none agg
            is_agg_flag = False
            all_group_by_columns= []
            #i = 0
            for (agg, col, tab, _) in sql_json['select'][1]:
                if agg == 'none':
                    group_by_column = col_to_str(agg, col, tab, table_names, N_T)
                    all_group_by_columns.append(group_by_column)
                    group_by_clause = 'GROUP BY ' + ' '.join(column for column in all_group_by_columns)
                else:
                    is_agg_flag = True
                # if i <= len(sql_json['select'][1]):
                #     if agg == 'none':
                #         group_by_column = col_to_str(agg, col, tab, table_names, N_T)
                #         all_group_by_columns.append(group_by_column)
                #         i +=1
                #     else:
                #         is_agg_flag = True
                #         i+=1
                # elif all_group_by_columns is not None:
                #     group_by_clause = 'GROUP BY ' + ' '.join(column for column in all_group_by_columns)
            if is_agg_flag is False and len(group_by_clause) > 5:
                group_by_clause = "GROUP BY"
                for (agg, col, tab, _) in sql_json['select'][1]:
                    group_by_clause = group_by_clause + ' ' + col_to_str(agg, col, tab, table_names, N_T)
                # remove the last comma
                #group_by_clause = group_by_clause.replace['']
                #< 5 bc if it comes here the group by is empty. -Kate
            if len(group_by_clause) < 5:
                if 'COUNT(*)' in select_clause_str:
                    # it doesn't seem like this case is never actually used...-Kate
                    current_table = schema
                    for primary in current_table['primary_keys']:
                        if current_table['table_names'][current_table['col_table'][primary]] in table_names:
                            group_by_clause = 'GROUP BY ' + col_to_str('none', current_table['schema_content'][primary],
                                                                       current_table['table_names'][
                                                                           current_table['col_table'][primary]],
                                                                       table_names, N_T)
        else:
            group_by_columns= list()
            i = 0
            for projection in sql_json['select'][1]:
                if projection[0] == 'none':
                    if select_clause[i].startswith('?'):
                        group_by_columns.append(select_clause[i])
                    else:
                        i += 1
                        group_by_columns.append(select_clause[i])
                i += 1

            group_by_clause = 'GROUP BY ' + ' '.join(column for column in group_by_columns)
                # for key, value in table_names.items():
                #     if key not in non_lists:
                #         non_lists.append(key)
                #
                # a = non_lists[0]
                # b = None
                # for non in non_lists:
                #     if a != non:
                #         b = non
                # if b:
                #     for pair in current_table['foreign_keys']:
                #         t1 = current_table['table_names'][current_table['col_table'][pair[0]]]
                #         t2 = current_table['table_names'][current_table['col_table'][pair[1]]]
                #         if t1 in [a, b] and t2 in [a, b]:
                #             if pre_table_names and t1 not in pre_table_names:
                #                 assert t2 in pre_table_names
                #                 t1 = t2
                #             group_by_clause = 'GROUP BY ' + col_to_str('none',
                #                                                        current_table['schema_content'][pair[0]],
                #                                                        t1,
                #                                                        table_names, N_T)
                #             fix_flag = True
                #             break
                #
                # if fix_flag is False:
                #     agg, col, tab, _ = sql_json['select'][1][0]
                #     group_by_clause = 'GROUP BY ' + col_to_str(agg, col, tab, table_names, N_T)

            # else:
            #     # check if there is only one non agg
            #     non_agg, non_agg_count = None, 0
            #     non_lists = []
            #     for (agg, col, tab, _) in sql_json['select'][1]:
            #         if agg == 'none':
            #             non_agg = (agg, col, tab)
            #             non_lists.append(tab)
            #             non_agg_count += 1
            #
            #     non_lists = list(set(non_lists))
            #     # print(non_lists)
            #     if non_agg_count == 1:
            #         group_by_clause = 'GROUP BY ' + col_to_str(non_agg[0], non_agg[1], non_agg[2], table_names, N_T)
            #     elif non_agg:
            #         find_flag = False
            #         fix_flag = False
            #         find_primary = None
            #         if len(non_lists) <= 1:
            #             for key, value in table_names.items():
            #                 if key not in non_lists:
            #                     non_lists.append(key)
            #         if len(non_lists) > 1:
            #             a = non_lists[0]
            #             b = None
            #             for non in non_lists:
            #                 if a != non:
            #                     b = non
            #             if b:
            #                 for pair in current_table['foreign_keys']:
            #                     t1 = current_table['table_names'][current_table['col_table'][pair[0]]]
            #                     t2 = current_table['table_names'][current_table['col_table'][pair[1]]]
            #                     if t1 in [a, b] and t2 in [a, b]:
            #                         if pre_table_names and t1 not in pre_table_names:
            #                             assert t2 in pre_table_names
            #                             t1 = t2
            #                         group_by_clause = 'GROUP BY ' + col_to_str('none',
            #                                                                    current_table['schema_content'][pair[0]],
            #                                                                    t1,
            #                                                                    table_names, N_T)
            #                         fix_flag = True
            #                         break
            #         tab = non_agg[2]
            #         assert tab in current_table['table_names']
            #
            #         for primary in current_table['primary_keys']:
            #             if current_table['table_names'][current_table['col_table'][primary]] == tab:
            #                 find_flag = True
            #                 find_primary = (current_table['schema_content'][primary], tab)
            #         if fix_flag is False:
            #             if find_flag is False:
            #                 # rely on count *
            #                 foreign = []
            #                 for pair in current_table['foreign_keys']:
            #                     if current_table['table_names'][current_table['col_table'][pair[0]]] == tab:
            #                         foreign.append(pair[1])
            #                     if current_table['table_names'][current_table['col_table'][pair[1]]] == tab:
            #                         foreign.append(pair[0])
            #
            #                 for pair in foreign:
            #                     if current_table['table_names'][current_table['col_table'][pair]] in table_names:
            #                         group_by_clause = 'GROUP BY ' + col_to_str('none',
            #                                                                    current_table['schema_content'][pair],
            #                                                                    current_table['table_names'][
            #                                                                        current_table['col_table'][pair]],
            #                                                                    table_names, N_T)
            #                         find_flag = True
            #                         break
            #                 if find_flag is False:
            #                     for (agg, col, tab, _) in sql_json['select'][1]:
            #                         if 'id' in col.lower():
            #                             group_by_clause = 'GROUP BY ' + col_to_str(agg, col, tab, table_names, N_T)
            #                             break
            #                     if len(group_by_clause) > 5:
            #                         pass
            #                     else:
            #                         raise RuntimeError('fail to convert')
            #             else:
            #                 group_by_clause = 'GROUP BY ' + col_to_str('none', find_primary[0],
            #                                                            find_primary[1],
            #                                                            table_names, N_T)
    intersect_clause = ''
    if 'intersect' in sql_json:
        sql_json['intersect']['sql'] = sql_json['sql']
        intersect_clause = '{' + to_str(sql_json['intersect'], len(table_names) + 1, schema, table_names) +'}'
        filter_columns = []
        for (agg, col, tab, distinct) in sql_json['intersect']['select'][1]:
            filter_columns.append(col_to_str(agg, col, tab, table_names_for_intersect, len(table_names) + 1, distinct))

        for index in range(len(filter_columns)):
            where_clause = where_clause + 'FILTER ({} in ({})) . '.format(select_clause[index].lower(),
                                                                          filter_columns[index].lower())

    union_clause = ''
    if 'union' in sql_json:
        sql_json['union']['sql'] = sql_json['sql']
        # union_clause = 'UNION {' + to_str(sql_json['union'], len(table_names) + 1, schema, table_names) #to reset table alias count to 1 for union clauses
        union_clause = 'UNION {' + to_str(sql_json['union'], 1, schema, table_names)
    except_clause = ''
    if 'except' in sql_json:
        sql_json['except']['sql'] = sql_json['sql']
        except_clause = 'MINUS {' + to_str(sql_json['except'], len(table_names) + 1, schema, table_names)
    # print(current_table['table_names_original'])
    table_names_replace = {}
    for a, b in zip(current_table['table_names_original'], current_table['table_names']):
        table_names_replace[b] = a
    new_table_names = {}
    for key, value in table_names.items():
        if key is None:
            continue
        new_table_names[table_names_replace[key].lower()] = value
    from_clause = infer_from_clause(new_table_names, schema, all_columns).strip()
    #    sql = select_clause_str + agg so that the count aggregation appears in the select clause and NOT after the order by and desc.
    # here checks if the union clause is non or if it is an empty string

    # the first case is for intersect type clauses ie Root1(0)

    if 'Root1(0)' in sql_json['sql']['model_result'] and whole_select_distinct == '':
        sql = ' '.join([select_clause_str.lower(), from_clause.lower(), intersect_clause, where_clause,
                        union_clause, except_clause, order_clause.lower(),
                        sup_clause.lower()])
    elif (union_clause is None or union_clause.strip() == "") and (
            except_clause is None or except_clause.strip() == ""):
        sql = ' '.join([select_clause_str.lower(), from_clause.lower(), where_clause, intersect_clause,
                        union_clause.lower(), except_clause, ' '.join(filter_not_exists), ''.join(filter_not_in),
                        ' '.join(filter_subqueries), "}", group_by_clause.lower(), order_clause.lower(),
                        sup_clause.lower(),
                        have_clause.lower()])
    # #if there is a union clause or an except clause, there needs to be an additional select statement.sup_clause.lower(), have_clause.lower()])
    # is elif or else for all of the normal queries
    else:
        # column names in the select statements for except and union type statements need to be aliased
        aliases = alias(select_clause)
        sql = ' '.join(
            ["SELECT distinct" + aliases + " WHERE { {", select_clause_str.lower(), from_clause.lower(), where_clause,
             intersect_clause, "}}", union_clause, except_clause, "} }", group_by_clause.lower(), order_clause.lower(),
             sup_clause.lower(), have_clause.lower()])

    # improvement putting curly bracket in from clause and in general the order of the statements
    sql = sql.replace(' and ', ' && ').replace(' or ', ' || ')
    return sql


def transform_semQL_to_sparql(schemas, sem_ql_prediction, output_dir):
    # schemas contains all of the database info, taken from the db json files
    # TODO: find out if this adds any benefit for the trained models. If we run it with the ground truth (so no prediction, just SQL -> SemQL -> SQL) it is even slightly better without it.
    # alter_not_in(sem_ql_prediction, schemas=schemas)
    # alter_inter(sem_ql_prediction)
    alter_column0(sem_ql_prediction)
    index = range(len(sem_ql_prediction))
    count = 0
    exception_count = 0
    with open(os.path.join(output_dir, 'output.txt'), 'w', encoding='utf8') as d, open(
            os.path.join(output_dir, 'ground_truth.txt'), 'w', encoding='utf8') as g:
        for i in index:
            try:
                result = transformSparql(sem_ql_prediction[i], schemas[sem_ql_prediction[i]['db_id']])
                d.write(result[0] + '\n')
                g.write("%s\t%s\t%s\n" % (
                sem_ql_prediction[i]['query'], sem_ql_prediction[i]["db_id"], sem_ql_prediction[i]["question"]))
                count += 1
            except Exception as e:
                # This origin seems to be the fallback-query. Not sure how we come up with it, most probably it's just a dummy query to fill in a result for each example.
                result = transformSparql(sem_ql_prediction[i], schemas[sem_ql_prediction[i]['db_id']],
                                         origin='Root1(3) Root(5) Sel(0) N(0) A(3) C(0) T(0)')
                exception_count += 1
                d.write(result[0] + '\n')
                g.write("%s\t%s\t%s\n" % (
                sem_ql_prediction[i]['query'], sem_ql_prediction[i]["db_id"], sem_ql_prediction[i]["question"]))
                count += 1
                print(e)
                print('Exception')
                print(traceback.format_exc())
                print(sem_ql_prediction[i]['question'])
                print(sem_ql_prediction[i]['query'])
                print(sem_ql_prediction[i]['db_id'])
                print('===\n\n')

    return count, exception_count
