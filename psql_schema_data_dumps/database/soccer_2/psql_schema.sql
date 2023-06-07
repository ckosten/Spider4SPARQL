/* 
      * sql scripts for cs61 intro to sql lectures
      * filename soccer2.sql
      */
    
     
     create table if not exists 	college 
       ( cname   	varchar(20) not null,
         state   	varchar(2),
         enr     	numeric(5,0),
         primary key (cname)
       );
     
     create table if not exists 	player
       ( pid			numeric(5,0) not null,
       	pname   	varchar(20),
         ycard   	varchar(3),
         hs      	numeric(5,0),
         primary key (pid)
       );
     
     create table if not exists 	tryout
       ( pid			numeric(5,0),
       	cname   	varchar(20),
         ppos    	varchar(8),
         decision    varchar(3),
         primary key (pid, cname),
         foreign key (pid) references player(pid),
         foreign key (cname) references college(cname)
       );
     
     /* note that left and right are reserved words in sql */
     
     
     
