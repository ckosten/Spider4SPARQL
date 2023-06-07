
     create table if not exists state (
       state_name text
     ,  population integer default null
     ,  area real default null
     ,  country_name varchar(3) not null default ''
     ,  capital text
     ,  density real default null
     ,  primary key (state_name)
     );
     
     create table if not exists city (
       city_name text
     ,  population integer default null
     ,  country_name varchar(3) not null default ''
     ,  state_name text
     ,  primary key (city_name,state_name)
     ,  foreign key(state_name) references state(state_name)
     );
     create table if not exists border_info (
       state_name text
     ,  border text
     ,  primary key (border,state_name)
     ,  foreign key(state_name) references state(state_name)
     ,  foreign key(border) references state(state_name)
     );
     create table if not exists highlow (
       state_name text
     ,  highest_elevation text
     ,  lowest_point text
     ,  highest_point text
     ,  lowest_elevation text
     ,  primary key (state_name)
     ,  foreign key(state_name) references state(state_name)
     );
     create table if not exists lake (
       lake_name text
     ,  area real default null
     ,  country_name varchar(3) not null default ''
     ,  state_name text
     );
     create table if not exists mountain (
       mountain_name text
     ,  mountain_altitude integer default null
     ,  country_name varchar(3) not null default ''
     ,  state_name text
     ,  primary key (mountain_name, state_name)
     ,  foreign key(state_name) references state(state_name)
     );
     create table if not exists river (
       river_name text
     ,  length integer default null
     ,  country_name varchar(3) not null default ''
     ,  traverse text
     ,  primary key (river_name)
     ,  foreign key(traverse) references state(state_name)
     );