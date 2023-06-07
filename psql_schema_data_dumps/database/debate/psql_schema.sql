
     
     create table if not exists people (
     people_id int,
     district text,
     name text,
     party text,
     age int,
     primary key (people_id)
     );
     
     create table if not exists debate (
     debate_id int,
     date text,
     venue text,
     num_of_audience int,
     primary key (debate_id)
     );
     
     
     
     
     
     
     
     
     create table if not exists debate_people (
     debate_id int,
     affirmative int,
     negative int,
     if_affirmative_win bool,
     primary key (debate_id,affirmative,negative),
     foreign key (debate_id) references debate(debate_id),
     foreign key (affirmative) references people(people_id),
     foreign key (negative) references people(people_id)
     );
     
     
