create table if not exists activity (
       actid integer primary key,
       activity_name varchar(25)
     );
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
    
    create table if not exists faculty (
                             facid 	       integer primary key,
                             lname		varchar(15),
                             fname		varchar(15),
                             rank		varchar(15),
                             sex		varchar(1),
                             phone		integer,
                             room		varchar(5),
                             building		varchar(13)
    );
     
     create table if not exists participates_in (
       stuid integer,
       actid integer,
       foreign key(stuid) references student(stuid),
       foreign key(actid) references activity(actid)
     );
     
     create table if not exists faculty_participates_in (
       facid integer,
       actid integer,
       foreign key(facid) references faculty(facid),
       foreign key(actid) references activity(actid)
     );
     
    
     
     
    
     
