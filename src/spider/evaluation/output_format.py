import pandas as pd
from datetime import datetime
class Format(object):
    rows= []
    @staticmethod
    def appendRow(db_name, nl_q, g_str, q_res, sparql_str, sparql_res, hardness, isMatch = None, score = -2, exception = ''):
        q_res_str=', '.join(map(str, q_res))
        sparql_res_str=', '.join(map(str, sparql_res))
        row = {'database': db_name, 'natural language q': nl_q, 'sql': g_str, 'sql_result': q_res_str, 'sparql':sparql_str, 'sparql_result':sparql_res_str, 'difficulty':hardness, 'match': isMatch, 'score': score, 'exception':exception}
        Format.rows.append(row)

    @staticmethod
    def appendRow_SQL(db_name, nl_q, g_str, q_res, p_str, p_res, hardness, isMatch=None, score=-2, exception=''):
        q_res_str = ', '.join(map(str, q_res))
        p_res_str = ', '.join(map(str, p_res))
        row = {'database': db_name, 'natural language q': nl_q, 'sql': g_str, 'sql_result': q_res_str,
               'pred_sql': p_str, 'pred_sql_result': p_res_str, 'difficulty': hardness, 'match': isMatch,
               'score': score, 'exception': exception}
        Format.rows.append(row)

    @staticmethod
    def exportDf():
        df = pd.DataFrame(Format.rows, columns=['database', 'natural language q', 'sql', 'sql_result', 'sparql', 'sparql_result', 'difficulty', 'match', 'score', 'exception'])
        df.to_csv('src/experiments/SparqlPrediction/KG_enriched_ont.csv')

    @staticmethod
    def exportDf_SQL():
        df = pd.DataFrame(Format.rows,
                          columns=['database', 'natural language q', 'sql', 'sql_result', 'pred_sql', 'pred_sql_result',
                                   'difficulty', 'match', 'score', 'exception'])
        df.to_csv('src/experiments/SparqlPrediction/ValueNet_baseline.csv')