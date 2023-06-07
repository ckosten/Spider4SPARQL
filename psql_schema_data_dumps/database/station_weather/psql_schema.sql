
     create table if not exists train (
         id int,
         train_number int,
         name text,
         origin text,
         destination text,
         time text,
         interval text,
         primary key (id)
     );
     
     create table if not exists station (
         id int,
         network_name text,
         services text,
         local_authority text,
         primary key (id)
     );
     
     create table if not exists route (
         train_id int,
         station_id int,
         primary key (train_id, station_id),
         foreign key (train_id) references train(id),
         foreign key (station_id) references station(id)
     );
     
     create table if not exists weekly_weather (
         station_id int,
         day_of_week text,
         high_temperature int,
         low_temperature int,
         precipitation real,
         wind_speed_mph int,
         primary key (station_id, day_of_week),
         foreign key (station_id) references station(id)
     );
     
     
     
     
     
