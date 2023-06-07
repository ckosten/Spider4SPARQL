
    create table if not exists ref_payment_methods (
    payment_method_code char(10) not null,
    payment_method_description varchar(80),
    primary key (payment_method_code),
    unique (payment_method_code)
    );
    
    create table if not exists ref_service_types (
    service_type_code char(15) not null,
    parent_service_type_code char(15),
    service_type_description varchar(255),
    primary key (service_type_code),
    unique (service_type_code)
    );
    
    
    
    
    create table if not exists addresses (
    address_id integer not null,
    line_1 varchar(255),
    line_2 varchar(255),
    city_town varchar(255),
    state_county varchar(255),
    other_details varchar(255),
    primary key (address_id),
    unique (address_id)
    );
    
    
    
    create table if not exists products (
    product_id integer not null,
    product_name varchar(255),
    product_price decimal(20,4),
    product_description varchar(255),
    other_product_service_details varchar(255),
    primary key (product_id),
    unique (product_id)
    );
    
    
    create table if not exists marketing_regions (
    marketing_region_code char(15) not null,
    marketing_region_name varchar(255) not null,
    marketing_region_descriptrion varchar(255) not null,
    other_details varchar(255),
    primary key (marketing_region_code),
    unique (marketing_region_code)
    );
    
    
    
    create table if not exists clients (
    client_id integer not null,
    address_id integer not null,
    customer_email_address varchar(255),
    customer_name varchar(255),
    customer_phone varchar(255),
    other_details varchar(255),
    primary key (client_id),
    unique (client_id),
    foreign key (address_id) references addresses (address_id)
    );
    
    
    create table if not exists drama_workshop_groups (
    workshop_group_id integer not null,
    address_id integer not null,
    currency_code char(15) not null,
    marketing_region_code char(15) not null,
    store_name varchar(255),
    store_phone varchar(255),
    store_email_address varchar(255),
    other_details varchar(255),
    primary key (workshop_group_id),
    unique (workshop_group_id),
    foreign key (address_id) references addresses (address_id)
    );
    
    
    
    create table if not exists performers (
    performer_id integer not null,
    address_id integer not null,
    customer_name varchar(255),
    customer_phone varchar(255),
    customer_email_address varchar(255),
    other_details varchar(255),
    primary key (performer_id),
    unique (performer_id),
    foreign key (address_id) references addresses (address_id)
    );
    
    
    create table if not exists customers (
    customer_id integer not null,
    address_id integer not null,
    customer_name varchar(255),
    customer_phone varchar(255),
    customer_email_address varchar(255),
    other_details varchar(255),
    primary key (customer_id),
    unique (customer_id),
    foreign key (address_id) references addresses (address_id)
    );
    
    
    create table if not exists stores (
    store_id integer not null,
    address_id integer not null,
    marketing_region_code char(15) not null,
    store_name varchar(255),
    store_phone varchar(255),
    store_email_address varchar(255),
    other_details varchar(255),
    primary key (store_id),
    unique (store_id),
    foreign key (address_id) references addresses (address_id),
    foreign key (marketing_region_code) references marketing_regions (marketing_region_code)
    );
    
    
    create table if not exists bookings (
    booking_id integer not null ,
    customer_id integer not null,
    workshop_group_id integer not null,
    status_code char(15) not null,
    store_id integer not null,
    order_date timestamp not null,
    planned_delivery_date timestamp not null,
    actual_delivery_date timestamp not null,
    other_order_details varchar(255),
    primary key (booking_id),
    unique (booking_id),
    foreign key (customer_id) references clients (client_id),
    foreign key (workshop_group_id) references drama_workshop_groups (workshop_group_id)
    );
    
    
    create table if not exists performers_in_bookings (
    order_id integer not null,
    performer_id integer not null,
    primary key (order_id, performer_id),
    foreign key (performer_id) references performers (performer_id),
    foreign key (order_id) references bookings (booking_id)
    );
    
    
    create table if not exists customer_orders (
    order_id integer not null ,
    customer_id integer not null,
    store_id integer not null,
    order_date timestamp not null,
    planned_delivery_date timestamp not null,
    actual_delivery_date timestamp not null,
    other_order_details varchar(255),
    primary key (order_id),
    unique (order_id),
    foreign key (customer_id) references customers (customer_id),
    foreign key (store_id) references stores (store_id)
    );
    
    create table if not exists order_items (
    order_item_id integer not null ,
    order_id integer not null,
    product_id integer not null,
    order_quantity varchar(288),
    other_item_details varchar(255),
    primary key (order_item_id),
    foreign key (order_id) references customer_orders (order_id),
    foreign key (product_id) references products (product_id)
    );
    
    create table if not exists invoices (
    invoice_id integer not null,
    order_id integer not null,
    payment_method_code char(15),
    product_id integer not null,
    order_quantity varchar(288),
    other_item_details varchar(255),
    order_item_id integer not null,
    primary key (invoice_id),
    foreign key (order_id) references customer_orders (order_id),
    foreign key (order_id) references bookings (booking_id),
    foreign key (payment_method_code) references ref_payment_methods (payment_method_code)
    );
    
    
    create table if not exists services (
    service_id integer not null,
    service_type_code char(15),
    workshop_group_id integer not null,
    product_description varchar(255),
    product_name varchar(255),
    product_price decimal(20,4),
    other_product_service_details varchar(255),
    primary key (service_id),
    unique (service_id),
    foreign key (workshop_group_id) references drama_workshop_groups (workshop_group_id),
    foreign key (service_type_code) references ref_service_types (service_type_code)
    );
    
    
    
    create table if not exists bookings_services (
    order_id integer not null,
    product_id integer not null,
    primary key (order_id, product_id),
    foreign key (order_id) references bookings (booking_id),
    foreign key (product_id) references services (service_id)
    );
    
    
    
    
    create table if not exists invoice_items (
    invoice_item_id integer not null ,
    invoice_id integer not null,
    order_id integer not null,
    order_item_id integer not null,
    product_id integer not null,
    order_quantity integer,
    other_item_details varchar(255),
    primary key (invoice_item_id),
    foreign key (order_item_id) references order_items (order_item_id),
    foreign key (invoice_id) references invoices (invoice_id),
    foreign key (order_id, product_id) references bookings_services (order_id,product_id)
    );
