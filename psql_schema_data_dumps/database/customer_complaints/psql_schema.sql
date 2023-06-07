
     
     create table if not exists staff (
     staff_id integer primary key,
     gender varchar(1),
     first_name varchar(80),
     last_name varchar(80),
     email_address varchar(255),
     phone_number varchar(80)
     );
     
     
     create table if not exists customers (
     customer_id integer primary key,
     customer_type_code varchar(20) not null,
     address_line_1 varchar(80),
     address_line_2 varchar(80),
     town_city varchar(80),
     state varchar(80),
     email_address varchar(255),
     phone_number varchar(80)
     );
     
     
     create table if not exists products (
     product_id integer primary key,
     parent_product_id integer,
     product_category_code varchar(20) not null,
     date_product_first_available timestamp,
     date_product_discontinued timestamp,
     product_name varchar(80),
     product_description varchar(255),
     product_price decimal(19,4)
     );
     
     
     create table if not exists complaints (
     complaint_id integer not null ,
     product_id integer not null,
     customer_id integer not null,
     complaint_outcome_code varchar(20) not null,
     complaint_status_code varchar(20) not null,
     complaint_type_code varchar(20) not null,
     date_complaint_raised timestamp,
     date_complaint_closed timestamp,
     staff_id integer not null ,
     foreign key (staff_id ) references staff(staff_id ),
     foreign key (product_id ) references products(product_id ),
     foreign key (customer_id ) references customers(customer_id )
     );
     
