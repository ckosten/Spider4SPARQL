create table if not exists customers (
     customer_id integer primary key,
     customer_name varchar(80),
     customer_details varchar(255)
     );
     create table if not exists invoices (
     invoice_number integer primary key,
     invoice_date timestamp,
     invoice_details varchar(255)
     );
     
     create table if not exists orders (
     order_id integer primary key,
     customer_id integer not null,
     order_status varchar(10) not null,
     date_order_placed timestamp not null,
     order_details varchar(255),
     foreign key (customer_id ) references customers(customer_id )
     );
     
     create table if not exists products (
     product_id integer primary key,
     product_name varchar(80),
     product_details varchar(255)
     );
     
     create table if not exists order_items (
     order_item_id integer primary key,
     product_id integer not null,
     order_id integer not null,
     order_item_status varchar(10) not null,
     order_item_details varchar(255),
     foreign key (order_id ) references orders(order_id ),
     foreign key (product_id ) references products(product_id )
     );
     
     create table if not exists shipments (
     shipment_id integer primary key,
     order_id integer not null,
     invoice_number integer not null,
     shipment_tracking_number varchar(80),
     shipment_date timestamp,
     other_shipment_details varchar(255),
     foreign key (order_id ) references orders(order_id ),
     foreign key (invoice_number ) references invoices(invoice_number )
     );
     
     create table if not exists shipment_items (
     shipment_id integer not null,
     order_item_id integer not null,
     foreign key (order_item_id ) references order_items(order_item_id ),
     foreign key (shipment_id ) references shipments(shipment_id )
     );
     
     
     
     
     
     
