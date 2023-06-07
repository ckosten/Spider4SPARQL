
     create table if not exists college (
     college_id int,
     name text,
     leader_name text,
     college_location text,
     primary key (college_id)
     );
     
     
     
     
     
     create table if not exists member (
     member_id int,
     name text,
     country text,
     college_id int,
     primary key (member_id),
     foreign key (college_id) references college(college_id)
     );
     
     
     
     
     create table if not exists round (
     round_id int,
     member_id int,
     decoration_theme text,
     rank_in_round int,
     primary key (member_id,round_id),
     foreign key (member_id) references member(member_id)
     );
     
     
     
