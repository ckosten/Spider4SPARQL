
     
     create table if not exists product (
     product_id int,
     product text,
     dimensions text,
     dpi real,
     pages_per_minute_color real,
     max_page_size text,
     interface text,
     primary key (product_id)
     );
     
     create table if not exists store (
     store_id int,
     store_name text,
     type text,
     area_size real,
     number_of_product_category real,
     ranking int,
     primary key (store_id)
     );
     
     create table if not exists district (
     district_id int,
     district_name text,
     headquartered_city text,
     city_population real,
     city_area real,
     primary key (district_id)
     );
     
     
     
     
     
     create table if not exists store_product (
     store_id int,
     product_id int,
     primary key (store_id,product_id),
     foreign key (store_id) references store(store_id),
     foreign key (product_id) references product(product_id)
     );
     
     
     
     
     
     
     
     create table if not exists store_district (
     store_id int,
     district_id int,
     primary key (store_id),
     foreign key (store_id) references store(store_id),
     foreign key (district_id) references district(district_id)
     );
     
