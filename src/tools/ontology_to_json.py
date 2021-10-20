import ontospy
import json

import os

#directors for enriched ontop files with domain and range info
directory = os.fsencode('KG Construction/Generated')
db_names=['concert_singer', 'pets_1', 'car_1', 'flight_2', 'cre_Doc_Template_Mgt', 'course_teach', 'world_1', 'network_1', 'dog_kennels', 'battle_death',
         'employee_hire_evaluation', 'museum_visit','orchestra','poker_player','real_estate_properties', 'singer', 'student_transcripts_tracking', 'tvshow', 'wta_1']
directories=[]
for root, subdirectories, files in os.walk(directory):
    for file in files:
        subfilename = os.fsdecode(file)
        if subfilename.endswith('.owl'):
            full_path=(os.fsdecode(os.path.join(root, file)))
            directories.append(full_path)

def newTable(directories):
    all_tables = []
    y= 0
    while y < len(directories):
        model = ontospy.Ontospy(uri_or_path= directories[y], verbose = "true")
        rdfClasses = model.all_classes
        new_tables= {"column_names": [[-1, "*"]],
        "column_names_original":[[-1, "*"]],
        "column_types":["text",],
        "db_id":[],
        "foreign_keys":[],
        "primary_keys":[],
        "table_names":[],
        "table_names_original":[]
        }
        new_tables["db_id"]=[i for i in db_names if i in model.sources[0]]
        for i, OntoClass in enumerate(rdfClasses):
            new_tables["table_names"].append(OntoClass.locale)
            new_tables["table_names_original"].append(OntoClass.locale)
        z = 0
        for i, OntoClass in enumerate(rdfClasses):
            for dict in OntoClass.domain_of_inferred:
                for key, properties in dict.items():
                    for property in properties:
                        z = z + 1
                        clean_property= property.locale.replace('_',' ').replace('-', ' ')
                        new_tables["column_names"].append([i, clean_property])
                        new_tables["column_names_original"].append([i, property.locale])
                        if property.ranges[0].locale == 'string':
                            new_tables["column_types"].append('text')
                        elif property.ranges[0].locale == 'dateTime':
                            new_tables["column_types"].append('time')
                        elif property.ranges[0].locale == 'integer':
                            new_tables["column_types"].append('number')
                        else:
                            new_tables["column_types"].append('text')
                        for j, range in enumerate(property.ranges):
                            if range.locale in new_tables["table_names"]:
                                new_tables["foreign_keys"].append([z, new_tables["table_names"].index(range.locale)])
        all_tables.append(new_tables)
        y+=1
    with open("data/spider/original/KG_enriched_ont.json", 'w') as new_file:
        json.dump([all_tables], new_file, indent=4)  # indent formats it into a nice cute json
newTable(directories)