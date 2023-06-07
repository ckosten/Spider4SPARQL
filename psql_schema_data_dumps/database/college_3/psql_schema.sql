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
    
   create table if not exists department (
           dno   		integer primary key,
           division		varchar(2),
           dname		varchar(25),
           room		varchar(5),
           building		varchar(13),
           dphone		integer
    );
   
  create table if not exists gradeconversion (
                                    lettergrade	     varchar(2) primary key,
                                    gradepoint	     float
   );
   
  create table if not exists member_of (
           facid 	       integer,
           dno	       integer,
           appt_type       varchar(15),
           foreign key(facid) references faculty(facid),
           foreign key(dno) references department(dno)
    );
    
   create table if not exists course (
           cid   	    	varchar(7) primary key,
           cname		varchar(40),
           credits		integer,
           instructor	integer,
           days		varchar(5),
           hours		varchar(11),
           dno		integer,
           foreign key(instructor) references faculty(facid),
           foreign key(dno) references department(dno)
    );
    
   create table if not exists minor_in (
           stuid 	      integer,
           dno		integer,
           foreign key(stuid) references student(stuid),
           foreign key(dno) references department(dno)
    );
    
   create table if not exists enrolled_in (
           stuid 		 integer,
           cid		varchar(7),
           grade		varchar(2),
           foreign key(stuid) references student(stuid),
           foreign key(cid) references course(cid),
           foreign key(grade) references gradeconversion(lettergrade)
    );
   
