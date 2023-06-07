
     
     create table if not exists festival_detail (
     festival_id int,
     festival_name text,
     chair_name text,
     location text,
     year int,
     num_of_audience int,
     primary key (festival_id)
     );
     
     
     
     create table if not exists artwork (
     artwork_id int,
     type text,
     name text,
     primary key (artwork_id)
     );
     
     
     
     create table if not exists nomination (
     artwork_id int,
     festival_id int,
     result text,
     primary key (artwork_id,festival_id),
     foreign key (artwork_id) references artwork(artwork_id),
     foreign key (festival_id) references festival_detail(festival_id)
     );
     
     
