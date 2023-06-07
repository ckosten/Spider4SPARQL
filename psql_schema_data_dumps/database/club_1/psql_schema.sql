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
     
     
     create table if not exists club (
            clubid           integer primary key,
            clubname         varchar(40),
            clubdesc         varchar(1024),
            clublocation varchar(40)
     );
     
     create table if not exists member_of_club (
            stuid            integer,
            clubid           integer,
            position     varchar(40),
            foreign key(stuid) references student(stuid),
            foreign key(clubid) references club(clubid)
     );
     
     
