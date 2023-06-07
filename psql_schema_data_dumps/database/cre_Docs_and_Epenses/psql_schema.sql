
     create table if not exists ref_document_types (
     document_type_code char(15) not null,
     document_type_name varchar(255) not null,
     document_type_description varchar(255) not null,
     primary key (document_type_code)
     );
     create table if not exists ref_budget_codes (
     budget_type_code char(15) not null,
     budget_type_description varchar(255) not null,
     primary key (budget_type_code)
     );
     
     
     create table if not exists projects (
     project_id integer not null,
     project_details varchar(255),
     primary key (project_id)
     );
     
     
     create table if not exists documents (
     document_id integer not null,
     document_type_code char(15) not null,
     project_id integer not null,
     document_date timestamp,
     document_name varchar(255),
     document_description varchar(255),
     other_details varchar(255),
     primary key (document_id),
     foreign key (document_type_code) references ref_document_types (document_type_code),
     foreign key (project_id) references projects (project_id)
     );
     
     
     create table if not exists statements (
     statement_id integer not null,
     statement_details varchar(255),
     primary key (statement_id),
     foreign key (statement_id) references documents (document_id)
     );
     
     
     
     create table if not exists documents_with_expenses (
     document_id integer not null,
     budget_type_code char(15) not null,
     document_details varchar(255),
     primary key (document_id),
     foreign key (budget_type_code) references ref_budget_codes (budget_type_code),
     foreign key (document_id) references documents (document_id)
     );
     
     
     create table if not exists accounts (
     account_id integer not null,
     statement_id integer not null,
     account_details varchar(255),
     primary key (account_id),
     foreign key (statement_id) references statements (statement_id)
     );
