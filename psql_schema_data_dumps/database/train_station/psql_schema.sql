
     create table if not exists station (
     station_id int,
     name text,
     annual_entry_exit real,
     annual_interchanges real,
     total_passengers real,
     location text,
     main_services text,
     number_of_platforms int,
     primary key (station_id)
     );
     
     create table if not exists train (
     train_id int,
     name text,
     time text,
     service text,
     primary key (train_id)
     );
     
     
     
     
     
     create table if not exists train_station (
     train_id int,
     station_id int,	
     primary key (train_id,station_id),
     foreign key (train_id) references train(train_id),
     foreign key (station_id) references station(station_id)
     );
     
     
     
