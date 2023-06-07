create table if not exists student (
            stuid    	integer primary key,
            lname		varchar(12),
            fname		varchar(12),
            age		integer,
            sex		varchar(1),
            major		integer,
            advisor		integer,
            city_code	varchar(3)
     );
    
    create table if not exists pets (
                          petid		integer primary key,
                          pettype		varchar(20),
                          pet_age integer,
                          weight real
    );
     create table if not exists has_pet (
            stuid		integer,
            petid		integer,
            foreign key(petid) references pets(petid),
            foreign key(stuid) references student(stuid)
     );
     
    
     
