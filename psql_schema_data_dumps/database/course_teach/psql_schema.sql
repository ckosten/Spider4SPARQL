
     
     create table if not exists course (
     course_id int,
     staring_date text,
     course text,
     primary key (course_id)
     );
     
     create table if not exists teacher (
     teacher_id int,
     name text,
     age text,
     hometown text,
     primary key (teacher_id)
     );
     
     
     
     create table if not exists course_arrange (
     course_id int,
     teacher_id int,
     grade int,
     primary key (course_id,teacher_id,grade),
     foreign key (course_id) references course(course_id),
     foreign key (teacher_id) references teacher(teacher_id)
     );
     
