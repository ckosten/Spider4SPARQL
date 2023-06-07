
    create table if not exists products (
    product_id integer primary key,
    product_name varchar(20),
    product_price decimal(19,4),
    product_description varchar(255)
    );
    
    
    create table if not exists addresses (
    address_id integer primary key,
    address_details varchar(80),
    city varchar(50),
    zip_postcode varchar(20),
    state_province_county varchar(50),
    country varchar(50)
    );
    
    
    create table if not exists customers (
    customer_id integer primary key,
    payment_method varchar(10) not null,
    customer_name varchar(80),
    customer_phone varchar(80),
    customer_email varchar(80),
    date_became_customer timestamp
    );
    
    
    create table if not exists regular_orders (
    regular_order_id integer primary key,
    distributer_id integer not null,
    foreign key (distributer_id ) references customers(customer_id )
    );
    
    
    
    create table if not exists regular_order_products (
    regular_order_id integer not null,
    product_id integer not null,
    foreign key (product_id ) references products(product_id ),
    foreign key (regular_order_id ) references regular_orders(regular_order_id )
    );
    
    
    
    create table if not exists actual_orders (
    actual_order_id integer primary key,
    order_status_code varchar(10) not null,
    regular_order_id integer not null,
    actual_order_date timestamp,
    foreign key (regular_order_id ) references regular_orders(regular_order_id )
    );
    
    
    
    
    create table if not exists actual_order_products (
    actual_order_id integer not null,
    product_id integer not null,
    foreign key (product_id ) references products(product_id ),
    foreign key (actual_order_id ) references actual_orders(actual_order_id )
    );
    
    
    
    
    
    
    create table if not exists customer_addresses (
    customer_id integer not null,
    address_id integer not null,
    date_from timestamp not null,
    address_type varchar(10) not null,
    date_to timestamp,
    foreign key (customer_id ) references customers(customer_id ),
    foreign key (address_id ) references addresses(address_id )
    );
    
    
    
    
    create table if not exists delivery_routes (
    route_id integer primary key,
    route_name varchar(50),
    other_route_details varchar(255)
    );
    
    create table if not exists delivery_route_locations (
    location_code varchar(10) primary key,
    route_id integer not null,
    location_address_id integer not null,
    location_name varchar(50),
    foreign key (location_address_id ) references addresses(address_id ),
    foreign key (route_id ) references delivery_routes(route_id )
    );
    
    
    create table if not exists trucks (
    truck_id integer primary key,
    truck_licence_number varchar(20),
    truck_details varchar(255)
    );
    
    
    
    create table if not exists employees (
    employee_id integer primary key,
    employee_address_id integer not null,
    employee_name varchar(80),
    employee_phone varchar(80),
    foreign key (employee_address_id ) references addresses(address_id )
    );
    
    
    
    create table if not exists order_deliveries (
    location_code varchar(10) not null,
    actual_order_id integer not null,
    delivery_status_code varchar(10) not null,
    driver_employee_id integer not null,
    truck_id integer not null,
    delivery_date timestamp,
    foreign key (truck_id ) references trucks(truck_id ),
    foreign key (actual_order_id ) references actual_orders(actual_order_id ),
    foreign key (location_code ) references delivery_route_locations(location_code ),
    foreign key (driver_employee_id ) references employees(employee_id )
    );
    
