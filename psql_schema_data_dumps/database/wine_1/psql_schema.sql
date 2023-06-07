create table if not exists grapes ( 
     	id integer primary key, 
     	grape text unique, 
     	color text 
     );
     create table if not exists appellations ( 
     	no integer primary key, 
     	appelation text unique, 
     	county text, 
     	state text, 
     	area text, 
     	isava text
     );
     create table if not exists wine ( 
     	no integer, 
     	grape text, 
     	winery text, 
     	appelation text, 
     	state text, 
     	name text, 
     	year integer, 
     	price integer, 
     	score integer, 
     	cases integer, 
     	drink text,
     	foreign key (grape) references grapes(grape),
     	foreign key (appelation) references appellations(appelation)
     );
