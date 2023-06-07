create table if not exists ref_document_types (
     document_type_code char(15) not null,
     document_type_description varchar(255) not null,
     primary key (document_type_code)
     );
     
     create table if not exists roles (
     role_code char(15) not null,
     role_description varchar(255),
     primary key (role_code)
     );
     
     create table if not exists addresses (
     address_id integer not null,
     address_details varchar(255),
     primary key (address_id)
     );
     
     create table if not exists ref_document_status (
     document_status_code char(15) not null,
     document_status_description varchar(255) not null,
     primary key (document_status_code)
     );
     
     create table if not exists ref_shipping_agents (
     shipping_agent_code char(15) not null,
     shipping_agent_name varchar(255) not null,
     shipping_agent_description varchar(255) not null,
     primary key (shipping_agent_code)
     );
     
     create table if not exists documents (
     document_id integer not null,
     document_status_code char(15) not null,
     document_type_code char(15) not null,
     shipping_agent_code char(15),
     receipt_date timestamp,
     receipt_number varchar(255),
     other_details varchar(255),
     primary key (document_id),
     foreign key (document_type_code) references ref_document_types (document_type_code),
     foreign key (document_status_code) references ref_document_status (document_status_code),
     foreign key (shipping_agent_code) references ref_shipping_agents (shipping_agent_code)
     );
     
     create table if not exists employees (
     employee_id integer not null,
     role_code char(15) not null,
     employee_name varchar(255),
     other_details varchar(255),
     primary key (employee_id),
     foreign key (role_code) references roles (role_code)
     );
     
     create table if not exists document_drafts (
     document_id integer not null,
     draft_number integer not null,
     draft_details varchar(255),
     primary key (document_id, draft_number),
     foreign key (document_id) references documents (document_id)
     );
     
     create table if not exists draft_copies (
     document_id integer not null,
     draft_number integer not null,
     copy_number integer not null,
     primary key (document_id, draft_number, copy_number),
     foreign key (document_id, draft_number) references document_drafts (document_id,draft_number)
     );
     
     create table if not exists circulation_history (
     document_id integer not null,
     draft_number integer not null,
     copy_number integer not null,
     employee_id integer not null,
     primary key (document_id, draft_number, copy_number, employee_id),
     foreign key (document_id, draft_number, copy_number) references draft_copies (document_id,draft_number,copy_number),
     foreign key (employee_id) references employees (employee_id)
     );
     
     create table if not exists documents_mailed (
     document_id integer not null,
     mailed_to_address_id integer not null,
     mailing_date timestamp,
     primary key (document_id, mailed_to_address_id),
     foreign key (document_id) references documents (document_id),
     foreign key (mailed_to_address_id) references addresses (address_id)
     );
     
