
     create table if not exists addresses (
     address_id integer primary key,
     line_1_number_building varchar(80),
     city varchar(50),
     zip_postcode varchar(20),
     state_province_county varchar(50),
     country varchar(50)
     );
     
     
     
     create table if not exists staff (
     staff_id integer primary key,
     staff_address_id integer not null,
     nickname varchar(80),
     first_name varchar(80),
     middle_name varchar(80),
     last_name varchar(80),
     date_of_birth timestamp,
     date_joined_staff timestamp,
     date_left_staff timestamp,
     foreign key (staff_address_id ) references addresses(address_id )
     );
     
     
     
     create table if not exists vehicles (
     vehicle_id integer primary key,
     vehicle_details varchar(255)
     );
     
     create table if not exists customers (
     customer_id integer primary key,
     customer_address_id integer not null,
     customer_status_code varchar(15) not null,
     date_became_customer timestamp,
     date_of_birth timestamp,
     first_name varchar(80),
     last_name varchar(80),
     amount_outstanding double precision null,
     email_address varchar(250),
     phone_number varchar(255),
     cell_mobile_phone_number varchar(255),
     foreign key (customer_address_id ) references addresses(address_id )
     );
     
     
     create table if not exists customer_payments (
     customer_id integer not null,
     timestamp_payment timestamp not null,
     payment_method_code varchar(10) not null,
     amount_payment double precision null,
     primary key (customer_id,timestamp_payment),
     foreign key (customer_id ) references customers(customer_id )
     );
     create table if not exists lessons (
     lesson_id integer primary key,
     customer_id integer not null,
     lesson_status_code varchar(15) not null,
     staff_id integer,
     vehicle_id integer not null,
     lesson_date timestamp,
     lesson_time varchar(10),
     price double precision null,
     foreign key (vehicle_id ) references vehicles(vehicle_id ),
     foreign key (staff_id ) references staff(staff_id ),
     foreign key (customer_id ) references customers(customer_id )
     );
