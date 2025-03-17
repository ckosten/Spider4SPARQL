# Natural Language/SPARQL Pairs
1,034 Dev queries are available in a csv file located in [natural language sparql pairs dev file](nl_sparql_pairs/dev/dev_nl_sparql.csv)
8,659 Train queries are available in a csv file located in [natural language sparql pairs train file](nl_sparql_pairs/train/train_nl_sparql.csv)

# Materialized Knowledge Graphs
This repository contains materialized Knowledge graphs for the dev and train set. 

Materialized Knowledge Graphs Dev set: [link to zip file with materialized KGs for dev set](https://drive.google.com/file/d/1S6xaI0VfnFMrsuyjxv2uQPok_CikhLLx/view?usp=sharing)

Materialized Knowledge Graphs Train set: [link to zip file with materialized KGs for train set](https://drive.google.com/file/d/1MHfPD0IuF4tWzbJEGSDmUMEavkB4lEs0/view?usp=sharing)

# PostgreSQL compatible data dumps & schemas
The 20 Spider dev databases and 146 train databases have been converted from sqlite to PostgreSQL compatible databases. [Link to the zip file with the PostgreSQL dumps](https://drive.google.com/file/d/1wh3S5EexLZeUXIxzQmUpuFC817Yg1QQ1/view?usp=sharing).

It is important to note that both the databases and developement set SQL queries have been improved and are now conformant with PostgreSQL and best practices in data base design.

The code and all parameters used in the experiments for ValueNet4SPARQL can be found here: [Link to gitfront repo](https://gitfront.io/r/user-4351818/DRHWmMVu7YTJ/ValueNet4SPARQL/)

The code and all parameters used in the experiments for T5-Small and T5-Base can be found here: [Link to gitfront repo](https://gitfront.io/r/user-4351818/ZLScR8epDL57/nlql/)

The zero- and few-shot prompts used in the GPT-3.5 experiments are located in [GPT-3.5](GPT-3.5)



# Citation
```
@INPROCEEDINGS {10386182,
author = {C. Kosten and P. Cudre-Mauroux and K. Stockinger},
booktitle = {2023 IEEE International Conference on Big Data (BigData)},
title = {Spider4SPARQL: A Complex Benchmark for Evaluating Knowledge Graph Question Answering Systems},
year = {2023},
volume = {},
issn = {},
pages = {5272-5281},
abstract = {With the recent spike in the number and availability of Large Language Models (LLMs), it has become increasingly important to provide large and realistic benchmarks for evaluating Knowledge Graph Question Answering (KGQA) systems. So far the majority of benchmarks rely on pattern-based SPARQL query generation approaches. The subsequent natural language (NL) question generation is conducted through crowdsourcing or other automated methods, such as rule-based paraphrasing or NL question templates. Although some of these datasets are of considerable size, their pitfall lies in their pattern-based generation approaches, which do not always generalize well to the vague and linguistically diverse questions asked by humans in real-world contexts. In this paper, we introduce Spider4SPARQL -a new SPARQL benchmark dataset featuring 9,693 previously existing manually generated NL questions and 4,721 unique, novel, and complex SPARQL queries of varying complexity. In addition to the NL/SPARQL pairs, we also provide their corresponding 166 knowledge graphs and ontologies, which cover 138 different domains. Our complex benchmark enables novel ways of evaluating the strengths and weaknesses of modern KGQA systems. We evaluate the system with state-of-the-art KGQA systems as well as LLMs, which achieve only up to 45% execution accuracy, demonstrating that Spider4SPARQL is a challenging benchmark for future research.},
keywords = {measurement;crowdsourcing;natural languages;knowledge graphs;benchmark testing;ontologies;question answering (information retrieval)},
doi = {10.1109/BigData59044.2023.10386182},
url = {https://doi.ieeecomputersociety.org/10.1109/BigData59044.2023.10386182},
publisher = {IEEE Computer Society},
address = {Los Alamitos, CA, USA},
month = {dec}
}

