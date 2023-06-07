
     
     
     
     create table if not exists film (
     film_id int,
     title text,
     studio text,
     director text,
     gross_in_dollar int,
     primary key (film_id)
     );
     
     
     
     
     create table if not exists market (
     market_id int,
     country text,
     number_cities int,
     primary key (market_id)
     );
     
     
     
     create table if not exists film_market_estimation (
     estimation_id int,
     low_estimate real,
     high_estimate real,
     film_id int,
     type text,
     market_id int,
     year int,
     primary key (estimation_id),
     foreign key (film_id) references film(film_id),
     foreign key (market_id) references market(market_id)
     );
     
     
     
     
