begin transaction;
     create table if not exists station (
         id integer primary key,
         name text,
         lat numeric,
         long numeric,
         dock_count integer,
         city text,
         installation_date text);
     create table if not exists status (
         station_id integer ,
         bikes_available integer,
         docks_available integer,
         time text,
         foreign key (station_id) references station(id)
     );
     create table if not exists trip (
         id integer primary key,
         duration integer,
         start_date text,
         start_station_name text, -- this should be removed
         start_station_id integer,
         end_date text,
         end_station_name text, -- this should be removed
         end_station_id integer,
         bike_id integer,
         subscription_type text,
         zip_code text);
     create table if not exists weather (
         date text ,
         max_temperature_f integer,
         mean_temperature_f integer,
         min_temperature_f integer,
         max_dew_point_f integer,
         mean_dew_point_f integer,
         min_dew_point_f integer,
         max_humidity integer,
         mean_humidity integer,
         min_humidity integer,
         max_sea_level_pressure_inches numeric,
         mean_sea_level_pressure_inches numeric,
         min_sea_level_pressure_inches numeric,
         max_visibility_miles integer,
         mean_visibility_miles integer,
         min_visibility_miles integer,
         max_wind_speed_mph integer,
         mean_wind_speed_mph integer,
         max_gust_speed_mph integer,
         precipitation_inches integer,
         cloud_cover integer,
         events text,
         wind_dir_degrees integer,
         zip_code integer);
     commit;
