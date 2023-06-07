-- drop table flight cascade constraints;
     -- drop table aircraft cascade constraints;
     -- drop table employee cascade constraints;
     -- drop table certificate cascade constraints;
 create table if not exists aircraft(
                                        aid int primary key,
                                        name varchar(30),
                                        distance int);
 
 create table if not exists employee(
                                        eid int primary key,
                                        name varchar(30),
                                        salary int);
     create table if not exists flight(
     	flno int primary key,
     	origin varchar(20),
     	destination varchar(20),
     	distance int,
     	departure_date date,
     	arrival_date date,
     	price int,
         aid int,
         foreign key(aid) references aircraft(aid));
     
 
     
     create table if not exists certificate(
     	eid int,
     	aid int,
     	primary key(eid,aid),
     	foreign key(eid) references employee(eid),
     	foreign key(aid) references aircraft(aid)); 
     
     
     
     
     
     
     
     
     
     
     
     
