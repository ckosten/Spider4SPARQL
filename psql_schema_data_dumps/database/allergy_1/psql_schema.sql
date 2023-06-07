
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
 create table if not exists allergy_type (
           allergy 		  varchar(20) primary key,
           allergytype 	  varchar(20)
    );
 
    create table if not exists has_allergy (
           stuid 		 integer,
           allergy 		 varchar(20),
           foreign key(stuid) references student(stuid),
           foreign key(allergy) references allergy_type(allergy)
    );
    
   
    
