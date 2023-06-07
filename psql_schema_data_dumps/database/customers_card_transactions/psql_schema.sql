
    create table if not exists accounts (
    account_id integer primary key,
    customer_id integer not null,
    account_name varchar(50),
    other_account_details varchar(255)
    );
    create table if not exists customers (
    customer_id integer primary key,
    customer_first_name varchar(20),
    customer_last_name varchar(20),
    customer_address varchar(255),
    customer_phone varchar(255),
    customer_email varchar(255),
    other_customer_details varchar(255)
    );
    create table if not exists customers_cards (
    card_id integer primary key,
    customer_id integer not null,
    card_type_code varchar(15) not null,
    card_number varchar(80),
    date_valid_from timestamp,
    date_valid_to timestamp,
    other_card_details varchar(255)
    );
    create table if not exists financial_transactions (
    transaction_id integer not null ,
    previous_transaction_id integer,
    account_id integer not null,
    card_id integer not null,
    transaction_type varchar(15) not null,
    transaction_date timestamp,
    transaction_amount real null,
    transaction_comment varchar(255),
    other_transaction_details varchar(255),
    foreign key (card_id ) references customers_cards(card_id ),
    foreign key (account_id ) references accounts(account_id )
    );
    
