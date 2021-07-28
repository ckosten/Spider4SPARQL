# ValueNet4SPARQL
##DATA
-In order to run this code you will need to set up the PostgreSQL databases, the PostgreSQL dumps are located in PostgreSQL_SpiderResources. The Knowledge Graphs are set up at http://biosoda.cloudlab.zhaw.ch:7200/
-It is important to note that both the databases and developement set SQL queries have been improved to be conformant to best practices in data base design. 
-There are a number of queries that return false negative results sets. Most often these are queries that have a LIMIT 1 that would otherwise return several tuples that have the same values in the column by which they are ordered. See queries and additional explanations in FalseNegatives file. 
