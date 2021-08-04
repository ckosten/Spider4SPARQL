# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.

# -*- coding: utf-8 -*-
"""
# @Time    : 2019/5/27
# @Author  : Jiaqi&Zecheng
# @File    : sem_utils.py
# @Software: PyCharm
"""

import os
import json
import re as regex

import spacy
from nltk.stem import WordNetLemmatizer

wordnet_lemmatizer = WordNetLemmatizer()
nlp = spacy.load('en_core_web_sm', disable=['parser', 'ner'])


def partial_match(query, table_name):
    query = [token.lemma_ for token in nlp(query)]
    table_name = [nlp(token)[0].lemma_ for token in table_name]
    if query in table_name:
        return True
    return False


def is_partial_match(query, table_names):
    query = nlp(query)[0].lemma_
    table_names = [[token.lemma_ for token in nlp(names)] for names in table_names]
    same_count = 0
    result = None
    for names in table_names:
        if query in names:
            same_count += 1
            result = names
    return result if same_count == 1 else False


def multi_option(question, q_ind, names, N):
    for i in range(q_ind + 1, q_ind + N + 1):
        if i < len(question):
            re = is_partial_match(question[i][0], names)
            if re is not False:
                return re
    return False


def multi_equal(question, q_ind, names, N):
    for i in range(q_ind + 1, q_ind + N + 1):
        if i < len(question):
            if question[i] == names:
                return i
    return False


def random_choice(question_arg, question_arg_type, names, ground_col_labels, q_ind, N, origin_name):
    # first try if there are other table
    for t_ind, t_val in enumerate(question_arg_type):
        if t_val == ['table']:
            return names[origin_name.index(question_arg[t_ind])]
    for i in range(q_ind + 1, q_ind + N + 1):
        if i < len(question_arg):
            if len(ground_col_labels) == 0:
                for n in names:
                    if partial_match(question_arg[i][0], n) is True:
                        return n
            else:
                for n_id, n in enumerate(names):
                    if n_id in ground_col_labels and partial_match(question_arg[i][0], n) is True:
                        return n
    if len(ground_col_labels) > 0:
        return names[ground_col_labels[0]]
    else:
        return names[0]


def alter_column0(datas):
    """
    Attach column * table
    :return: model_result_replace
    """
    zero_count = 0
    count = 0
    result = []
    for d in datas:
        if 'C(0)' in d['model_result']:
            pattern = regex.compile('C\(.*?\) T\(.*?\)')
            result_pattern = list(set(pattern.findall(d['model_result'])))
            ground_col_labels = []
            for pa in result_pattern:
                pa = pa.split(' ')
                if pa[0] != 'C(0)':
                    index = int(pa[1][2:-1])
                    ground_col_labels.append(index)

            ground_col_labels = list(set(ground_col_labels))
            question_arg_type = d['question_arg_type']
            question_arg = d['question_arg']
            table_names = [[token.lemma_ for token in nlp(names)] for names in d['table_names']]
            origin_table_names = [[wordnet_lemmatizer.lemmatize(x.lower()) for x in names.split(' ')] for names in
                                  d['table_names']]
            count += 1
            easy_flag = False
            for q_ind, q in enumerate(d['question_arg']):
                q_str = " ".join(" ".join(x) for x in d['question_arg'])
                if 'how many' in q_str or 'number of' in q_str or 'count of' in q_str:
                    easy_flag = True
            if easy_flag:
                # check for the last one is a table word
                for q_ind, q in enumerate(d['question_arg']):
                    if (q_ind > 0 and q == ['many'] and d['question_arg'][q_ind - 1] == ['how']) or (
                            q_ind > 0 and q == ['of'] and d['question_arg'][q_ind - 1] == ['number']) or (
                            q_ind > 0 and q == ['of'] and d['question_arg'][q_ind - 1] == ['count']):
                        re = multi_equal(question_arg_type, q_ind, ['table'], 2)
                        if re is not False:
                            # This step work for the number of [table] example
                            table_result = table_names[origin_table_names.index(question_arg[re])]
                            result.append((d['query'], d['question'], table_result, d))
                            break
                        else:
                            re = multi_option(question_arg, q_ind, d['table_names'], 2)
                            if re is not False:
                                table_result = re
                                result.append((d['query'], d['question'], table_result, d))
                                pass
                            else:
                                re = multi_equal(question_arg_type, q_ind, ['table'], len(question_arg_type))
                                if re is not False:
                                    # This step work for the number of [table] example
                                    table_result = table_names[origin_table_names.index(question_arg[re])]
                                    result.append((d['query'], d['question'], table_result, d))
                                    break
                                pass
                                table_result = random_choice(question_arg=question_arg,
                                                             question_arg_type=question_arg_type,
                                                             names=table_names,
                                                             ground_col_labels=ground_col_labels, q_ind=q_ind, N=2,
                                                             origin_name=origin_table_names)
                                result.append((d['query'], d['question'], table_result, d))

                                zero_count += 1
                        break

            else:
                M_OP = False
                for q_ind, q in enumerate(d['question_arg']):
                    if M_OP is False and q in [['than'], ['least'], ['most'], ['msot'], ['fewest']] or \
                            question_arg_type[q_ind] == ['M_OP']:
                        M_OP = True
                        re = multi_equal(question_arg_type, q_ind, ['table'], 3)
                        if re is not False:
                            # This step work for the number of [table] example
                            table_result = table_names[origin_table_names.index(question_arg[re])]
                            result.append((d['query'], d['question'], table_result, d))
                            break
                        else:
                            re = multi_option(question_arg, q_ind, d['table_names'], 3)
                            if re is not False:
                                table_result = re
                                #                             print(table_result)
                                result.append((d['query'], d['question'], table_result, d))
                                pass
                            else:
                                #                             zero_count += 1
                                re = multi_equal(question_arg_type, q_ind, ['table'], len(question_arg_type))
                                if re is not False:
                                    # This step work for the number of [table] example
                                    table_result = table_names[origin_table_names.index(question_arg[re])]
                                    result.append((d['query'], d['question'], table_result, d))
                                    break

                                table_result = random_choice(question_arg=question_arg,
                                                             question_arg_type=question_arg_type,
                                                             names=table_names,
                                                             ground_col_labels=ground_col_labels, q_ind=q_ind, N=2,
                                                             origin_name=origin_table_names)
                                result.append((d['query'], d['question'], table_result, d))

                                pass
                if M_OP is False:
                    table_result = random_choice(question_arg=question_arg,
                                                 question_arg_type=question_arg_type,
                                                 names=table_names, ground_col_labels=ground_col_labels, q_ind=q_ind,
                                                 N=2,
                                                 origin_name=origin_table_names)
                    result.append((d['query'], d['question'], table_result, d))

    for re in result:
        table_names = [[token.lemma_ for token in nlp(names)] for names in re[3]['table_names']]
        origin_table_names = [[x for x in names.split(' ')] for names in re[3]['table_names']]
        if re[2] in table_names:
            re[3]['rule_count'] = table_names.index(re[2])
        else:
            re[3]['rule_count'] = origin_table_names.index(re[2])

    for data in datas:
        if 'rule_count' in data:
            str_replace = 'C(0) T(' + str(data['rule_count']) + ')'
            replace_result = regex.sub('C\(0\) T\(.\)', str_replace, data['model_result'])
            data['model_result_replace'] = replace_result
        else:
            data['model_result_replace'] = data['model_result']
