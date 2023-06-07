create table if not exists classroom
     	(building		varchar(15),
     	 room_number		varchar(7),
     	 capacity		numeric(4,0),
     	 primary key (building, room_number)
     	);
     create table if not exists department
     	(dept_name		varchar(20),
     	 building		varchar(15),
     	 budget		        numeric(12,2) check (budget > 0),
     	 primary key (dept_name)
     	);
     create table if not exists course
     	(course_id		varchar(8),
     	 title			varchar(50),
     	 dept_name		varchar(20) null,
     	 credits		numeric(2,0) check (credits > 0),
     	 primary key (course_id),
         foreign key (dept_name)
         references department (dept_name)
         on delete set null
     --    on update no action
     --    foreign key (dept_name) references department
     -- on delete set null
        );
     create table if not exists instructor
     	(id			varchar(5),
     	 name			varchar(20) not null,
     	 dept_name		varchar(20),
     	 salary			numeric(8,2) check (salary > 29000),
     	 primary key (id),
     	 foreign key (dept_name) references department (dept_name)
     		on delete set null
     	);
     create table if not exists section
     	(course_id		varchar(8),
              sec_id			varchar(8),
     	 semester		varchar(6)
     		check (semester in ('fall', 'winter', 'spring', 'summer')),
     	 year			numeric(4,0) check (year > 1701 and year < 2100),
     	 building		varchar(15),
     	 room_number		varchar(7),
     	 time_slot_id		varchar(4),
     	 primary key (course_id, sec_id, semester, year),
     	 foreign key (course_id) references course (course_id)
     		on delete cascade,
     	 foreign key (building, room_number) references classroom (building, room_number)
     		on delete set null
     	);
     create table if not exists teaches
     	(id			varchar(5),
     	 course_id		varchar(8),
     	 sec_id			varchar(8),
     	 semester		varchar(6),
     	 year			numeric(4,0),
     	 primary key (id, course_id, sec_id, semester, year),
     	 foreign key (course_id,sec_id, semester, year) references section (course_id, sec_id, semester, year)
     		on delete cascade,
     	 foreign key (id) references instructor (id)
     		on delete cascade
     	);
     create table if not exists student
     	(id			varchar(5),
     	 name			varchar(20) not null,
     	 dept_name		varchar(20),
     	 tot_cred		numeric(3,0) check (tot_cred >= 0),
     	 primary key (id),
     	 foreign key (dept_name) references department (dept_name)
     		on delete set null
     	);
     create table if not exists takes
     	(id			varchar(5),
     	 course_id		varchar(8),
     	 sec_id			varchar(8),
     	 semester		varchar(6),
     	 year			numeric(4,0),
     	 grade		        varchar(2),
     	 primary key (id, course_id, sec_id, semester, year),
     	 foreign key (course_id,sec_id, semester, year) references section (course_id, sec_id, semester, year)
     		on delete cascade,
     	 foreign key (id) references student (id)
     		on delete cascade
     	);
     create table if not exists advisor
     	(s_id			varchar(5),
     	 i_id			varchar(5),
     	 primary key (s_id),
     	 foreign key (i_id) references instructor (id)
     		on delete set null,
     	 foreign key (s_id) references student (id)
     		on delete cascade
     	);
     create table if not exists time_slot
     	(time_slot_id		varchar(4),
     	 day			varchar(1),
     	 start_hr		numeric(2) check (start_hr >= 0 and start_hr < 24),
     	 start_min		numeric(2) check (start_min >= 0 and start_min < 60),
     	 end_hr			numeric(2) check (end_hr >= 0 and end_hr < 24),
     	 end_min		numeric(2) check (end_min >= 0 and end_min < 60),
     	 primary key (time_slot_id, day, start_hr, start_min)
     	);
     create table if not exists prereq
     	(course_id		varchar(8),
     	 prereq_id		varchar(8),
     	 primary key (course_id, prereq_id),
     	 foreign key (course_id) references course (course_id)
     		on delete cascade,
     	 foreign key (prereq_id) references course (course_id)
     	);
