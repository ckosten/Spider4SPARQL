create table if not exists customers (
     customer_id integer not null,
     customer_details varchar(255) not null,
     primary key (customer_id)
     );
     
     create table if not exists staff (
     staff_id integer not null,
     staff_details varchar(255) not null,
     primary key (staff_id)
     );
     
     create table if not exists policies (
     policy_id integer not null,
     customer_id integer not null,
     policy_type_code char(15) not null,
     start_date timestamp,
     end_date timestamp,
     primary key (policy_id),
     foreign key (customer_id) references customers (customer_id)
     );
     
     
     
     
     
     
     create table if not exists claim_headers (
     claim_header_id integer not null,
     claim_status_code char(15) not null,
     claim_type_code char(15) not null,
     policy_id integer not null,
     date_of_claim timestamp,
     date_of_settlement timestamp,
     amount_claimed decimal(20,4),
     amount_piad decimal(20,4),
     primary key (claim_header_id),
     foreign key (policy_id) references policies (policy_id)
     );
     
     
     create table if not exists claims_documents (
     claim_id integer not null,
     document_type_code char(15) not null,
     created_by_staff_id integer,
     created_date integer,
     primary key (claim_id, document_type_code),
     foreign key (claim_id) references claim_headers (claim_header_id),
     foreign key (created_by_staff_id) references staff (staff_id)
     );
     
     
     create table if not exists claims_processing_stages (
     claim_stage_id integer not null,
     next_claim_stage_id integer,
     claim_status_name varchar(255) not null,
     claim_status_description varchar(255) not null,
     primary key (claim_stage_id)
     );
     
     
     
     create table if not exists claims_processing (
     claim_processing_id integer not null,
     claim_id integer not null,
     claim_outcome_code char(15) not null,
     claim_stage_id integer not null,
     staff_id integer,
     primary key (claim_processing_id),
     foreign key (claim_id) references claim_headers (claim_header_id),
     foreign key (staff_id) references staff (staff_id)
     );
