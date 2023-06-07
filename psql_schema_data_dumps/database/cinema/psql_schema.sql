
     
     
     create table if not exists film (
     film_id int,
     rank_in_series int,
     number_in_season int,
     title text,
     directed_by text,
     original_air_date text,
     production_code text,
     primary key (film_id)
     );
     
     create table if not exists cinema (
     cinema_id int,
     name text,
     openning_year int,
     capacity int,
     location text,
     primary key (cinema_id));
     
     
     
     create table if not exists schedule (
     cinema_id int,
     film_id int,
     date text,
     show_times_per_day int,
     price float,
     primary key (cinema_id,film_id),
     foreign key (film_id) references film(film_id),
     foreign key (cinema_id) references cinema(cinema_id)
     );
     
     
     
