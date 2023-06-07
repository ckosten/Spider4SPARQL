create table if not exists addresses (
    address_id integer primary key,
    address_details varchar(255)
    );
   
    
    create table if not exists staff (
    staff_id integer primary key,
    staff_gender varchar(1),
    staff_name varchar(80)
    );
    
    
    create table if not exists suppliers (
    supplier_id integer primary key,
    supplier_name varchar(80),
    supplier_phone varchar(80)
    );
    
    
    create table if not exists department_store_chain (
    dept_store_chain_id integer primary key,
    dept_store_chain_name varchar(80)
    );
    
    
    
    create table if not exists customers (
    customer_id integer primary key,
    payment_method_code varchar(10) not null,
    customer_code varchar(20),
    customer_name varchar(80),
    customer_address varchar(255),
    customer_phone varchar(80),
    customer_email varchar(80)
    );
   
    
    
    create table if not exists products (
    product_id integer primary key,
    product_type_code varchar(10) not null,
    product_name varchar(80),
    product_price decimal(19,4)
    );
    
    create table if not exists supplier_addresses (
    supplier_id integer not null,
    address_id integer not null,
    date_from timestamp not null,
    date_to timestamp,
    primary key (supplier_id, address_id),
    foreign key (address_id ) references addresses(address_id ),
    foreign key (supplier_id ) references suppliers(supplier_id )
    );
    
    
    
    create table if not exists customer_addresses (
    customer_id integer not null,
    address_id integer not null,
    date_from timestamp not null,
    date_to timestamp,
    primary key (customer_id, address_id),
    foreign key (address_id ) references addresses(address_id ),
    foreign key (customer_id ) references customers(customer_id )
    );
    
    
    
    
    
    create table if not exists customer_orders (
    order_id integer primary key,
    customer_id integer not null,
    order_status_code varchar(10) not null,
    order_date timestamp not null,
    foreign key (customer_id ) references customers(customer_id )
    );
    
    
    
    create table if not exists department_stores (
    dept_store_id integer primary key,
    dept_store_chain_id integer,
    store_name varchar(80),
    store_address varchar(255),
    store_phone varchar(80),
    store_email varchar(80),
    foreign key (dept_store_chain_id ) references department_store_chain(dept_store_chain_id )
    );
    
    
    create table if not exists departments (
    department_id integer primary key,
    dept_store_id integer not null,
    department_name varchar(80),
    foreign key (dept_store_id ) references department_stores(dept_store_id )
    );
    
    
    create table if not exists order_items (
    order_item_id integer primary key,
    order_id integer not null,
    product_id integer not null,
    foreign key (order_id ) references customer_orders(order_id ),
    foreign key (product_id ) references products(product_id )
    );
    create table if not exists product_suppliers (
    product_id integer not null,
    supplier_id integer not null,
    date_supplied_from timestamp not null,
    date_supplied_to timestamp,
    total_amount_purchased varchar(80),
    total_value_purchased decimal(19,4),
    primary key (product_id, supplier_id),
    foreign key (supplier_id ) references suppliers(supplier_id ),
    foreign key (product_id ) references products(product_id )
    );
    
    
    create table if not exists staff_department_assignments (
    staff_id integer not null,
    department_id integer not null,
    date_assigned_from timestamp not null,
    job_title_code varchar(10) not null,
    date_assigned_to timestamp,
    primary key (staff_id, department_id),
    foreign key (department_id ) references departments(department_id ),
    foreign key (staff_id ) references staff(staff_id )
    );
    
    
