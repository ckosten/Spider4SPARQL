# ValueNet4SPARQL
## ABSTRACT

As Knowledge Graphs (KGs) gain traction in both industry and the public sector, more and more legacy databases are accessed through a KG-based layer. Querying such layers requires the mastery of intricate declarative languages such as SPARQL, prompting the need for simpler interfaces, e.g. in natural language (NL). However, translating NL questions into SPARQL and executing the resulting queries on top of a KG-based access layer is impractical for two reasons: (i) automatically generating correct SPARQL queries from NL is difficult as training data is typically scarce and (ii) executing the resulting queries through a simplistic KG layer automatically derived from an underlying relational schema yields poor results. 

To solve both issues, we introduce ValueNet4SPARQL, an end-to-end NL-to-SPARQL system capable of generating high-quality SPARQL queries from NL questions using a transformer-based neural network architecture. ValueNet4SPARQL can re-use neural models that were trained on SQL databases and therefore does not require any additional NL/SPARQL-pairs as training data. In addition, our system is able to reconstruct rich schema information in the KG from its relational counterpart using a workload-based analysis, and to faithfully translate complex operations (such as joins or aggregates) from NL to SPARQL. We apply our approach for reconstructing schema information in the KG on a well-known dataset and show that it considerably improves the accuracy of the NL-to-SPARQL results---by up to 36\% (for a total accuracy of 94\%) ---compared to a standard baseline. 

## DATA

It is important to note that both the databases and developement set SQL queries have been improved to be conformant with PostgreSQL and best practices in data base design.

There are a number of queries that return false negative results sets. Most often these are queries that have a LIMIT 1 that would otherwise return several rows that have the same values in the column by which they are ordered. See queries and additional explanations in FalseNegatives file.


## SETUP
You can either install the script with pip (pip install -r requirements.txt) or with pipenv (pipenv install). After installing you can run the tasks either from the command line or in PyCharm. To run then in PyCharm, simply import the run configurations from the .run folder.
