create table if not exists campuses (
     	id integer primary key, 
     	campus text, 
     	location text, 
     	county text, 
     	year integer 
     );
     
     create table if not exists csu_fees ( 
     	campus integer primary key, 
     	year integer, 
     	campusfee integer,
     	foreign key (campus) references campuses(id)
     );
     
     create table if not exists degrees ( 
     	year integer,
     	campus integer, 
     	degrees integer,
     	primary key (year, campus),
     	foreign key (campus) references campuses(id)
     );
     
     
     
     create table if not exists discipline_enrollments ( 
     	campus integer, 
     	discipline integer, 
     	year integer, 
     	undergraduate integer, 
     	graduate integer,
     	primary key (campus, discipline),
     	foreign key (campus) references campuses(id)
     );
     
     
     
     create table if not exists enrollments ( 
     	campus integer, 
     	year integer, 
     	totalenrollment_ay integer, 
     	fte_ay integer,
     	primary key(campus, year),
     	foreign key (campus) references campuses(id)
     );
     
     create table if not exists faculty ( 
     	campus integer, 
     	year integer, 
     	faculty real,
     	foreign key (campus) references campuses(id) 
     );
     
     
