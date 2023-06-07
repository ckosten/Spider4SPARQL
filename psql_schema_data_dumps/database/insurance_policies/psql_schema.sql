create table if not exists customers (
     customer_id integer not null,
     customer_details varchar(255) not null,
     primary key (customer_id)
     );
     
     create table if not exists customer_policies (
     policy_id integer not null,
     customer_id integer not null,
     policy_type_code char(15) not null,
     start_date date,
     end_date date,
     primary key (policy_id),
     foreign key (customer_id) references customers (customer_id)
     );
     
     create table if not exists claims (
     claim_id integer not null,
     policy_id integer not null,
     date_claim_made date,
     date_claim_settled date,
     amount_claimed integer,
     amount_settled integer,
     primary key (claim_id),
     foreign key (policy_id) references customer_policies (policy_id)
     );
     
     
     
     
     create table if not exists settlements (
     settlement_id integer not null,
     claim_id integer not null,
     date_claim_made date,
     date_claim_settled date,
     amount_claimed integer,
     amount_settled integer,
     customer_policy_id integer not null,
     primary key (settlement_id),
     foreign key (claim_id) references claims (claim_id)
     );
     create table if not exists payments (
     payment_id integer not null,
     settlement_id integer not null,
     payment_method_code varchar(255),
     date_payment_made date,
     amount_payment integer,
     primary key (payment_id),
     foreign key (settlement_id) references settlements (settlement_id)
     );
     
     
     
     
