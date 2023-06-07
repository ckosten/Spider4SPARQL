
     
     create table if not exists workshop (
     workshop_id int,
     date text,
     venue text,
     name text,
     primary key (workshop_id)
     );
     
     create table if not exists submission (
     submission_id int,
     scores real,
     author text,
     college text,
     primary key (submission_id)
     );
     
     
     
     
     
     create table if not exists acceptance (
     submission_id int,
     workshop_id int,
     result text,
     primary key (submission_id,workshop_id),
     foreign key (submission_id) references submission(submission_id),
     foreign key (workshop_id) references workshop(workshop_id)
     );
     
     
