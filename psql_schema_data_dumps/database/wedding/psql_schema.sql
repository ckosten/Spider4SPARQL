
     
     create table if not exists people (
     people_id int,
     name text,
     country text,
     is_male text,
     age int,
     primary key (people_id)
     );
     
     
     
     
     
     create table if not exists church (
     church_id int,
     name text,
     organized_by text,
     open_date int,
     continuation_of text,
     primary key (church_id)
     );
     
     
     
     
     create table if not exists wedding (
     church_id int,
     male_id int,
     female_id int,
     year int,
     primary key (church_id,male_id,female_id),
     foreign key (church_id) references church(church_id),
     foreign key (male_id) references people(people_id),
     foreign key (female_id) references people(people_id)
     );
     
     
