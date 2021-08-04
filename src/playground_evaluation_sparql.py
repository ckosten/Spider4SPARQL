import os

from config import read_arguments_evaluation
from intermediate_representation.sem2sparql.sem2SPARQL import transform_semQL_to_sparql
from spider import spider_utils_sparql
from spider.evaluation.spider_evaluation_sparql import build_foreign_key_map_from_json, spider_evaluation

####### use this code to test the ground-truth directly with the Spider-Execution validation
####### that way we can test the SQL -> SemQL -> SQL round trip. Use sql_data for the whole training set or val_sql_data for dev
####### that way we can test the SQL -> SemQL -> SPARQL round trip. Use sql_data for the whole training set or val_sql_data for dev

args = read_arguments_evaluation()

#val_data is the test data
val_sql_data, val_table_data = spider_utils_sparql.load_dataset(args.data_dir, use_small=False)


for d in val_sql_data:
    d['model_result'] = d['rule_label']

#counts the number of queries that were successfully transformed to SQL from SemQL
count_success, count_failed= transform_semQL_to_sparql(val_table_data, val_sql_data, args.prediction_dir)

print("Transformed {} samples successful to SQL. {} samples failed. Generated the files a 'ground_truth.txt' "
      "and a 'output.txt' file. We now use the official Spider evaluation script to evaluate this files.".format(
    count_success, count_failed))

kmaps = build_foreign_key_map_from_json(os.path.join(args.data_dir, 'original', 'KG_enriched_ont.json'))

#So the evaluation should actually be, ground truth, sql prediciton, sparql prediction
spider_evaluation(os.path.join(args.prediction_dir, 'ground_truth.txt'),
                  os.path.join(args.prediction_dir, 'output.txt'),
                  "exec", kmaps)