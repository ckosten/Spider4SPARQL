
     create table if not exists addresses (
     address_id integer primary key,
     address_content varchar(80),
     city varchar(50),
     zip_postcode varchar(20),
     state_province_county varchar(50),
     country varchar(50),
     other_address_details varchar(255)
     );
     
     
     
     
     create table if not exists products (
     product_id integer primary key,
     product_details varchar(255)
     );
     
     
     create table if not exists customers (
     customer_id integer primary key,
     payment_method varchar(15) not null,
     customer_name varchar(80),
     date_became_customer timestamp,
     other_customer_details varchar(255)
     );
     
     
     create table if not exists customer_addresses (
     customer_id integer not null,
     address_id integer not null,
     date_address_from timestamp not null,
     address_type varchar(15) not null,
     date_address_to timestamp,
     foreign key (address_id ) references addresses(address_id ),
     foreign key (customer_id ) references customers(customer_id )
     );
     
     
     create table if not exists customer_contact_channels (
     customer_id integer not null,
     channel_code varchar(15) not null,
     active_from_date timestamp not null,
     active_to_date timestamp,
     contact_number varchar(50) not null,
     foreign key (customer_id ) references customers(customer_id )
     );
     create table if not exists customer_orders (
     order_id integer primary key,
     customer_id integer not null,
     order_status varchar(15) not null,
     order_date timestamp,
     order_details varchar(255),
     foreign key (customer_id ) references customers(customer_id )
     );
     
     create table if not exists order_items (
     order_id integer not null,
     product_id integer not null,
     order_quantity varchar(15),
     foreign key (product_id ) references products(product_id ),
     foreign key (order_id ) references customer_orders(order_id )
     );
