create table if not exists addresses (
     address_id integer primary key,
     line_1_number_building varchar(80),
     city varchar(50),
     zip_postcode varchar(20),
     state_province_county varchar(50),
     country varchar(50)
     );
     
     
     
     
     create table if not exists products (
     product_id integer primary key,
     product_type_code varchar(15),
     product_name varchar(80),
     product_price real null
     );
     
     
     create table if not exists customers (
     customer_id integer primary key,
     payment_method_code varchar(15),
     customer_number varchar(20),
     customer_name varchar(80),
     customer_address varchar(255),
     customer_phone varchar(80),
     customer_email varchar(80)
     );
     
     create table if not exists contacts (
     contact_id integer primary key,
     customer_id integer not null,
     gender varchar(1),
     first_name varchar(80),
     last_name varchar(50),
     contact_phone varchar(80)
     );
     
     
     
     create table if not exists customer_address_history (
     customer_id integer not null,
     address_id integer not null,
     date_from timestamp not null,
     date_to timestamp,
     foreign key (customer_id ) references customers(customer_id ),
     foreign key (address_id ) references addresses(address_id )
     );
     create table if not exists customer_orders (
     order_id integer primary key,
     customer_id integer not null,
     order_date timestamp not null,
     order_status_code varchar(15),
     foreign key (customer_id ) references customers(customer_id )
     );
     
     create table if not exists order_items (
     order_item_id integer not null ,
     order_id integer not null,
     product_id integer not null,
     order_quantity varchar(80),
     foreign key (product_id ) references products(product_id ),
     foreign key (order_id ) references customer_orders(order_id )
     );
