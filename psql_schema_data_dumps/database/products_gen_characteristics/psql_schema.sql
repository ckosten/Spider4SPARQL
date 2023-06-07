create table if not exists ref_characteristic_types (
     characteristic_type_code varchar(15) primary key,
     characteristic_type_description varchar(80)
     );
     create table if not exists ref_colors (
     color_code varchar(15) primary key,
     color_description varchar(80)
     );
     create table if not exists ref_product_categories (
     product_category_code varchar(15) primary key,
     product_category_description varchar(80),
     unit_of_measure varchar(20)
     );
     
     create table if not exists characteristics (
     characteristic_id integer primary key,
     characteristic_type_code varchar(15) not null,
     characteristic_data_type varchar(10),
     characteristic_name varchar(80),
     other_characteristic_details varchar(255),
     foreign key (characteristic_type_code ) references ref_characteristic_types(characteristic_type_code )
     );
     
     
     create table if not exists products (
     product_id integer primary key,
     color_code varchar(15) not null,
     product_category_code varchar(15) not null,
     product_name varchar(80),
     typical_buying_price varchar(20),
     typical_selling_price varchar(20),
     product_description varchar(255),
     other_product_details varchar(255),
     foreign key (product_category_code ) references ref_product_categories(product_category_code ),foreign key (color_code ) references ref_colors(color_code )
     );
     
     
     create table if not exists product_characteristics (
     product_id integer not null,
     characteristic_id integer not null,
     product_characteristic_value varchar(50),
     foreign key (characteristic_id ) references characteristics(characteristic_id ),
     foreign key (product_id ) references products(product_id )
     );
