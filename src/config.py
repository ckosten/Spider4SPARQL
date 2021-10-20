import argparse
import json
import os


class Config:
    DATA_PREFIX = "data"
    EXPERIMENT_PREFIX = "experiments"


def write_config_to_file(args, output_path):
    config_path = os.path.join(output_path, "args.json")

    with open(config_path, 'w', encoding='utf-8') as f:
        json.dump(args.__dict__, f, indent=2)

def _add_postgresql_configuration(parser):
    parser.add_argument('--database_host', default='biosoda.cloudlab.zhaw.ch', type=str)
    parser.add_argument('--database_port', default='5432', type=str)
    parser.add_argument('--database_user', default='postgres', type=str)

def read_arguments_evaluation():
    parser = argparse.ArgumentParser(description="Run evaluation with following arguments")

    # evaluation
    parser.add_argument('--evaluation_type', default='spider', type=str)
    parser.add_argument('--prediction_dir', default= 'src/experiments/prediction', type=str)

    # general configuration
    parser.add_argument('--data_set', default='spider', type=str)

    # DB config is only needed in case evaluation is executed on PostgreSQL DB
    _add_postgresql_configuration(parser)

    args = parser.parse_args()

    args.data_dir = os.path.join(Config.DATA_PREFIX, args.data_set)

    print("*** parsed configuration from command line and combine with constants ***")

    for argument in vars(args):
        print("argument: {}={}".format(argument, getattr(args, argument)))

    return args

