create table if not exists customers (
     customer_id integer primary key,
     customer_first_name varchar(50),
     customer_middle_initial varchar(1),
     customer_last_name varchar(50),
     gender varchar(1),
     email_address varchar(255),
     login_name varchar(80),
     login_password varchar(20),
     phone_number varchar(255),
     town_city varchar(50),
     state_county_province varchar(50),
     country varchar(50)
     );
     
     
     
     create table if not exists orders (
     order_id integer primary key,
     customer_id integer not null,
     date_order_placed timestamp not null,
     order_details varchar(255),
     foreign key (customer_id ) references customers(customer_id )
     );
     
     
     
     create table if not exists invoices (
     invoice_number integer primary key,
     order_id integer not null,
     invoice_date timestamp,
     foreign key (order_id ) references orders(order_id )
     );
     
     
     create table if not exists accounts (
     account_id integer primary key,
     customer_id integer not null,
     date_account_opened timestamp,
     account_name varchar(50),
     other_account_details varchar(255),
     foreign key (customer_id ) references customers(customer_id )
     );
     
     
     
     
     
     create table if not exists product_categories (
     production_type_code varchar(15) primary key,
     product_type_description varchar(80),
     vat_rating decimal(19,4)
     );
     create table if not exists products (
     product_id integer primary key,
     parent_product_id integer,
     production_type_code varchar(15) not null,
     unit_price decimal(19,4),
     product_name varchar(80),
     product_color varchar(20),
     product_size varchar(20),
     foreign key (production_type_code ) references product_categories(production_type_code )
     );
     
     
     
     create table if not exists financial_transactions (
     transaction_id integer not null ,
     account_id integer not null,
     invoice_number integer,
     transaction_type varchar(15) not null,
     transaction_date timestamp,
     transaction_amount decimal(19,4),
     transaction_comment varchar(255),
     other_transaction_details varchar(255),
     foreign key (invoice_number ) references invoices(invoice_number ),
     foreign key (account_id ) references accounts(account_id )
     );
     create table if not exists order_items (
     order_item_id integer primary key,
     order_id integer not null,
     product_id integer not null,
     product_quantity varchar(50),
     other_order_item_details varchar(255),
     foreign key (product_id ) references products(product_id ),
     foreign key (order_id ) references orders(order_id )
     );
     
     
     
     create table if not exists invoice_line_items (
     order_item_id integer not null,
     invoice_number integer not null,
     product_id integer not null,
     product_title varchar(80),
     product_quantity varchar(50),
     product_price decimal(19,4),
     derived_product_cost decimal(19,4),
     derived_vat_payable decimal(19,4),
     derived_total_cost decimal(19,4),
     foreign key (order_item_id ) references order_items(order_item_id ),
     foreign key (invoice_number ) references invoices(invoice_number ),
     foreign key (product_id ) references products(product_id )
     );
