create table if not exists continents ( 
    	contid integer primary key, 
    	continent text 
    );
    create table if not exists countries (
    	countryid integer primary key, 
    	countryname text, 
    	continent integer,
    	foreign key (continent) references continents(contid)
    );
    create table if not exists car_makers ( 
    	id integer primary key, 
    	maker text, 
    	fullname text, 
    	country integer,
    	foreign key (country) references countries(countryid)
    );
    create table if not exists model_list ( 
    	modelid integer primary key, 
    	maker integer, 
    	model text unique,
    	foreign key (maker) references car_makers (id)
    
    );
    create table if not exists car_names ( 
    	makeid integer primary key, 
    	model text, 
    	make text,
    	foreign key (model) references model_list (model)
    );
    create table if not exists cars_data (
    	id integer primary key, 
    	mpg text, 
    	cylinders integer, 
    	edispl real, 
    	horsepower text, 
    	weight integer, 
    	accelerate real, 
    	year integer,
    	foreign key (id) references car_names (makeid)
    );
