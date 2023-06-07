create table if not exists student (
            stuid        integer primary key,
            lname        varchar(12),
            fname        varchar(12),
            age      integer,
            sex      varchar(1),
            major        integer,
            advisor      integer,
            city_code    varchar(3)
     );
    
    create table if not exists voting_record (
           stuid    	integer,
           registration_date		varchar(12),
           election_cycle		varchar(12),
           president_vote		integer,
           vice_president_vote		integer,
           secretary_vote		integer,
           treasurer_vote		integer,
           class_president_vote		integer,
           class_senator_vote		integer,
           foreign key(stuid) references student(stuid), 
           foreign key(president_vote) references student(stuid),
           foreign key(vice_president_vote) references student(stuid),
           foreign key(secretary_vote) references student(stuid),
           foreign key(treasurer_vote) references student(stuid),
           foreign key(class_president_vote) references student(stuid),
           foreign key(class_senator_vote) references student(stuid)
    );
    
