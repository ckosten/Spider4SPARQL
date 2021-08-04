# ValueNet4SPARQL
## ABSTRACT

As Knowledge Graphs (KGs) gain traction in both industry and the public sector, more and more legacy databases are accessed through a KG-based layer. Querying such layers requires the mastery of intricate declarative languages such as SPARQL, prompting the need for simpler interfaces, e.g. in natural language (NL). However, translating NL questions into SPARQL and executing the resulting queries on top of a KG-based access layer is impractical for two reasons: (i) automatically generating correct SPARQL queries from NL is difficult as training data is typically scarce and (ii) executing the resulting queries through a simplistic KG layer automatically derived from an underlying relational schema yields poor results. 

To solve both issues, we introduce ValueNet4SPARQL, an end-to-end NL-to-SPARQL system capable of generating high-quality SPARQL queries from NL questions using a transformer-based neural network architecture. ValueNet4SPARQL can re-use neural models that were trained on SQL databases and therefore does not require any additional NL/SPARQL-pairs as training data. In addition, our system is able to reconstruct rich schema information in the KG from its relational counterpart using a workload-based analysis, and to faithfully translate complex operations (such as joins or aggregates) from NL to SPARQL. We apply our approach for reconstructing schema information in the KG on a well-known dataset and show that it considerably improves the accuracy of the NL-to-SPARQL results---by up to 36\% (for a total accuracy of 94\%) ---compared to a standard baseline. 

## DATA

It is important to note that both the databases and developement set SQL queries have been improved to be conformant with PostgreSQL and best practices in data base design.

There are a number of queries that return false negative results sets. Most often these are queries that have a LIMIT 1 that would otherwise return several rows that have the same values in the column by which they are ordered. Other queries that are considered false negatives are queries that use AVG and SUM aggregations, the PostgreSQL queries return slightly more precise results sets than SPARQL. Additionally, there are 4 queries with very long results sets, to prevent a distorted output file, they have been removed from the output csv and insteaed added to the second sheet of the `false_negatives.xlsx` . 
The materialized wta_1 knowledge graph is located at this [google drive link](https://drive.google.com/file/d/1296XYgEcizHEREKMahFCemO8TVRPe3so/view?usp=sharing)

## Code

_Disclaimer_: this code is largely based on the ValueNet (https://github.com/brunnurs/valuenet) repository, where the original Valuenet evaluation is available. 

### SETUP
You can either install the script with pip `pip install -r requirements.txt` or with pipenv `pipenv install` . After installing you can run the tasks either from the command line or in PyCharm. To run then in PyCharm, simply import the run configurations from the .run folder. In addition, you will need to download the spacy en_core_web_sm model with `python -m spacy download en_core_web_sm` 

This setup will run the evaluation for the enriched Knowledge Graphs. To run the evaluation for the baseline knowledge graphs you will need to replace the filename with `KG_baseline_ont.json` in both the `playground_evaluation_sparql.py` and `spider_utils_sparql.py` .
