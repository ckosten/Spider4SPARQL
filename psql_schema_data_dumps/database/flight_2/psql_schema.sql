create table if not exists airlines (
    	uid integer primary key, 
    	airline text, 
    	abbreviation text, 
    	country text
    );
    create table if not exists airports (
    	city text, 
    	airportcode text primary key, 
    	airportname text, 
    	country text, 
    	countryabbrev text
    );
    create table if not exists flights (
    	airline integer, 
    	flightno integer, 
    	sourceairport text, 
    	destairport text, 
    	primary key(airline, flightno),
    	foreign key (sourceairport) references airports(airportcode),
    	foreign key (destairport) references airports(airportcode)
    );
