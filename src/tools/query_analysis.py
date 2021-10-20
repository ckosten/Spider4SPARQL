import pandas as pd
# line 1 points
data_enrichedKG=pd.read_csv('experiments/SparqlPrediction/KG_enriched_ont.csv')
data_enrichedKG['COUNTER'] =1
group_data_baselineKG = data_enrichedKG.groupby(['database','score'])['COUNTER'].sum().reset_index()


