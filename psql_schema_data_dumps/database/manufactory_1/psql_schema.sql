-- link: https://en.wikibooks.org/wiki/sql_exercises/the_computer_store
     
     create table if not exists manufacturers (
       code integer,
       name varchar(255) not null,
       headquarter varchar(255) not null,
       founder varchar(255) not null,
       revenue real,
       primary key (code)   
     );
     
     create table if not exists products (
       code integer,
       name varchar(255) not null ,
       price decimal not null ,
       manufacturer integer not null,
       primary key (code), 
       foreign key (manufacturer) references manufacturers(code)
     );
     
     
