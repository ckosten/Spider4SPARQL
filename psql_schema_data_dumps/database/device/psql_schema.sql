
     create table if not exists device (
     device_id int,
     device text,
     carrier text,
     package_version text,
     applications text,
     software_platform text,
     primary key (device_id)
     );
     
     create table if not exists shop (
     shop_id int,
     shop_name text,
     location text,
     open_date text,
     open_year int,
     primary key (shop_id)
     );
     
     
     
     
     
     create table if not exists stock (
     shop_id int,
     device_id int,
     quantity int,
     primary key (shop_id,device_id),
     foreign key (shop_id) references shop(shop_id),
     foreign key (device_id) references device(device_id)
     );
     
     
