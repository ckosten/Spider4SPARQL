create table if not exists list ( 
     	lastname text, 
     	firstname text, 
     	grade integer, 
     	classroom integer,
     	primary key(lastname, firstname)
     );
     create table if not exists teachers ( 
     	lastname text, 
     	firstname text, 
     	classroom integer,
     	primary key(lastname, firstname)
     );
