import json
data= 'Valuenet4Sparql/data/spider/dev.json'
f= open(data)
dev_json= json.load(f)


value_list=[]
db_list=['concert_singer', 'pets_1', 'car_1', 'flight_2', 'cre_Doc_Template_Mgt', 'course_teach', 'world_1', 'network_1', 'dog_kennels', 'battle_death',
         'employee_hire_evaluation', 'museum_visit','orchestra','poker_player','real_estate_properties', 'singer', 'student_transcripts_tracking', 'tvshow', 'wta_1']
i= 0
for q in dev_json:
    if len(value_list) == 0 :
        value_list.append(q)
    elif (q["query"] not in value_list[i]['query']) and (q['db_id'] in db_list):
        value_list.append(q)
        i += 1
with open("data/spider/dev_no_duplicates_baseline.json", 'w') as new_file:
    json.dump(value_list, new_file, indent=4) #indent formats it into a nice cute json





