
     create table if not exists customers (
     customer_id integer not null,
     customer_name varchar(40),
     primary key (customer_id)
     );
     
     create table if not exists services (
     service_id integer not null,
     service_name varchar(40),
     primary key (service_id)
     );
     
     
     create table if not exists available_policies (
     policy_id integer not null,
     policy_type_code char(15),
     customer_phone varchar(255),
     primary key (policy_id),
     unique (policy_id)
     );
     
     create table if not exists customers_policies (
     customer_id integer not null,
     policy_id integer not null,
     date_opened date,
     date_closed date,
     primary key (customer_id, policy_id),
     foreign key (customer_id) references customers (customer_id),
     foreign key (policy_id) references available_policies (policy_id)
     );
     
     create table if not exists first_notification_of_loss (
     fnol_id integer not null,
     customer_id integer not null,
     policy_id integer not null,
     service_id integer not null,
     primary key (fnol_id),
     unique (fnol_id),
     foreign key (service_id) references services (service_id),
     foreign key (customer_id, policy_id) references customers_policies (customer_id,policy_id)
     );
     
     create table if not exists claims (
     claim_id integer not null,
     fnol_id integer not null,
     effective_date date,
     primary key (claim_id),
     unique (claim_id),
     foreign key (fnol_id) references first_notification_of_loss (fnol_id)
     );
     create table if not exists settlements (
     settlement_id integer not null,
     claim_id integer,
     effective_date date,
     settlement_amount real,
     primary key (settlement_id),
     unique (settlement_id),
     foreign key (claim_id) references claims (claim_id)
     );
     
     
     
     
     
