import json
data= 'data/spider/dev.json'
table= 'spider/tables.json'
d= open(data)
t=open(table)
queries= json.load(d)
schema=json.load(t)

# function to add to JSON

#value_list=[]

#db_list=['flight_2', 'wta_1']
#db_list=['concert_singer', 'pets_1', 'car_1', 'flight_2', 'cre_Doc_Template_Mgt', 'course_teach', 'world_1', 'network_1', 'dog_kennels', 'battle_death',
#         'employee_hire_evaluation', 'museum_visit','orchestra','poker_player','real_estate_properties', 'singer', 'student_transcripts_tracking', 'tvshow', 'wta_1']
i= 0
for d in queries:
    j = 0
    pk_fk_tables = []
    db_id_queries = queries[i]["db_id"]
    db_id_list = [d for d in schema if d['db_id'] in db_id_queries]
    for pk_fk in db_id_list[0]["foreign_keys"]:
        for idx, value in enumerate(db_id_list[0]['column_names']):
            if pk_fk[0] == idx or pk_fk[1] == idx:
                if value[0] not in  pk_fk_tables:
                    pk_fk_tables.append(value[0])
    if len(queries[i]['sql']["from"]["conds"]) != 0:
        pk= queries[i]['sql']['from']['conds'][0][2][1][1]
        fk= queries[i]['sql']["from"]["conds"][0][3][1]
        if [pk, fk] in db_id_list[0]["foreign_keys"] or [fk, pk] in db_id_list[0]["foreign_keys"]:
            i += 1
        elif (db_id_list[0]['column_names'][pk][0] in pk_fk_tables) and (db_id_list[0]['column_names'][fk][0] in pk_fk_tables):
            i += 1
        else:
            print(db_id_list[0]["db_id"], [fk, pk], d['query'])
            i += 1
    else:
        i += 1
    # if len(value_list) == 0 :
    #     value_list.append(q)
    # elif (q["query"] not in value_list[i]['query']) and (q['db_id'] in db_list):
    #     value_list.append(q)
    #     i += 1


#with open("data/spider/dev_noDuplicates.json", 'w') as new_file:
 #   json.dump(value_list, new_file, indent=4) #indent formats it into a nice cute json