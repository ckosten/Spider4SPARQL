
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
      
     
     create table if not exists dorm (
            dormid		integer primary key ,
            dorm_name	varchar(20),
            student_capacity	integer,
            gender			varchar(1)
     ) ;
     
     create table if not exists dorm_amenity (
            amenid			integer primary key ,
            amenity_name		varchar(25)
     ) ;
     
     create table if not exists has_amenity (
            dormid			integer,
            amenid				integer,
     	foreign key (dormid) references dorm(dormid),
     	foreign key (amenid) references dorm_amenity(amenid)
     );
     
     create table if not exists lives_in (
            stuid 	      integer,
            dormid		integer,
            room_number	integer,
     	foreign key (stuid) references student(stuid),
             foreign key (dormid) references dorm(dormid)
     );
     
