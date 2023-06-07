create table if not exists investors (
     investor_id integer primary key,
     investor_details varchar(255)
     );
     
     create table if not exists lots (
     lot_id integer primary key,
     investor_id integer not null,
     lot_details varchar(255),
     foreign key (investor_id ) references investors(investor_id )
     );
     
     create table if not exists ref_transaction_types (
     transaction_type_code varchar(10) primary key,
     transaction_type_description varchar(80) not null
     );
     
     
     
     create table if not exists transactions (
     transaction_id integer primary key,
     investor_id integer not null,
     transaction_type_code varchar(10) not null,
     date_of_transaction timestamp,
     amount_of_transaction decimal(19,4),
     share_count varchar(40),
     other_details varchar(255),
     foreign key (investor_id ) references investors(investor_id ),foreign key (transaction_type_code ) references ref_transaction_types(transaction_type_code )
     );
     
     
     create table if not exists sales (
     sales_transaction_id integer primary key,
     sales_details varchar(255),
     foreign key (sales_transaction_id ) references transactions(transaction_id )
     );
     
     
     create table if not exists purchases (
     purchase_transaction_id integer not null,
     purchase_details varchar(255) not null,
     foreign key (purchase_transaction_id ) references transactions(transaction_id )
     );
     
     
     
     create table if not exists transactions_lots (
     transaction_id integer not null,
     lot_id integer not null,
     foreign key (lot_id ) references lots(lot_id ),
     foreign key (transaction_id ) references transactions(transaction_id )
     );
     
     
