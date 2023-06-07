
    create table if not exists premises (
    premise_id integer primary key,
    premises_type varchar(15) not null,
    premise_details varchar(255)
    );
    
    
    create table if not exists products (
    product_id integer primary key,
    product_category varchar(15) not null,
    product_name varchar(80)
    );
    
    
    
    
    create table if not exists customers (
    customer_id integer primary key,
    payment_method varchar(15) not null,
    customer_name varchar(80),
    customer_phone varchar(80),
    customer_email varchar(80),
    customer_address varchar(255),
    customer_login varchar(80),
    customer_password varchar(10)
    );
    
    
    create table if not exists mailshot_campaigns (
    mailshot_id integer primary key,
    product_category varchar(15),
    mailshot_name varchar(80),
    mailshot_start_date timestamp,
    mailshot_end_date timestamp
    );
    
    
    create table if not exists customer_addresses (
    customer_id integer not null,
    premise_id integer not null,
    date_address_from timestamp not null,
    address_type_code varchar(15) not null,
    date_address_to timestamp,
    foreign key (premise_id ) references premises(premise_id ),
    foreign key (customer_id ) references customers(customer_id )
    );
    
    
    
    create table if not exists customer_orders (
    order_id integer primary key,
    customer_id integer not null,
    order_status_code varchar(15) not null,
    shipping_method_code varchar(15) not null,
    order_placed_timestamp timestamp not null,
    order_delivered_timestamp timestamp,
    order_shipping_charges varchar(255),
    foreign key (customer_id ) references customers(customer_id )
    );
    
    create table if not exists mailshot_customers (
    mailshot_id integer not null,
    customer_id integer not null,
    outcome_code varchar(15) not null,
    mailshot_customer_date timestamp,
    foreign key (customer_id ) references customers(customer_id ),
    foreign key (mailshot_id ) references mailshot_campaigns(mailshot_id )
    );
    create table if not exists order_items (
    item_id integer not null ,
    order_item_status_code varchar(15) not null,
    order_id integer not null,
    product_id integer not null,
    item_status_code varchar(15),
    item_delivered_timestamp timestamp,
    item_order_quantity varchar(80),
    foreign key (product_id ) references products(product_id ),
    foreign key (order_id ) references customer_orders(order_id )
    );
    
