begin transaction;
     
     create table if not exists tv_channel (
     id text,
     series_name text,
     country text,
     language text,
     content text,
     pixel_aspect_ratio_par text,
     hight_definition_tv text,
     pay_per_view_ppv text,
     package_option text,
     primary key (id)
     );
     
     create table if not exists tv_series (
     id real,
     episode text,
     air_date text,
     rating text,
     share real,
     "18_49_rating_share" text,
     viewers_m text,
     weekly_rank real,
     channel text,
     primary key (id),
     foreign key (channel) references tv_channel(id)
     );
     
     create table if not exists cartoon (
     id real,
     title text,
     directed_by text,
     written_by text,
     original_air_date text,
     production_code real,
     channel text,
     primary key (id),
     foreign key (channel) references tv_channel(id)
     );
