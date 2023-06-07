create table if not exists ref_document_types (
     document_type_code char(15) not null,
     document_type_name varchar(255) not null,
     document_type_description varchar(255) not null,
     primary key (document_type_code)
     );
     
     create table if not exists ref_calendar (
     calendar_date timestamp not null,
     day_number integer,
     primary key (calendar_date)
     );
     create table if not exists ref_locations (
     location_code char(15) not null,
     location_name varchar(255) not null,
     location_description varchar(255) not null,
     primary key (location_code)
     );
     
     create table if not exists roles (
     role_code char(15) not null,
     role_name varchar(255),
     role_description varchar(255),
     primary key (role_code)
     );
     
     create table if not exists all_documents (
     document_id integer not null,
     date_stored timestamp,
     document_type_code char(15) not null,
     document_name char(255),
     document_description char(255),
     other_details varchar(255),
     primary key (document_id),
     foreign key (document_type_code) references ref_document_types (document_type_code),
     foreign key (date_stored) references ref_calendar (calendar_date)
     );
     
     create table if not exists employees (
     employee_id integer not null,
     role_code char(15) not null,
     employee_name varchar(255),
     gender_mfu char(1) not null,
     date_of_birth timestamp not null,
     other_details varchar(255),
     primary key (employee_id),
     foreign key (role_code) references roles (role_code)
     );
     
     create table if not exists document_locations (
     document_id integer not null,
     location_code char(15) not null,
     date_in_location_from timestamp not null,
     date_in_locaton_to timestamp,
     primary key (document_id, location_code, date_in_location_from),
     foreign key (location_code) references ref_locations (location_code),
     foreign key (date_in_location_from) references ref_calendar (calendar_date),
     foreign key (date_in_locaton_to) references ref_calendar (calendar_date),
     foreign key (document_id) references all_documents (document_id)
     );
     
     create table if not exists documents_to_be_destroyed (
     document_id integer not null,
     destruction_authorised_by_employee_id integer,
     destroyed_by_employee_id integer,
     planned_destruction_date timestamp,
     actual_destruction_date timestamp,
     other_details varchar(255),
     primary key (document_id),
     foreign key (destroyed_by_employee_id) references employees (employee_id),
     foreign key (destruction_authorised_by_employee_id) references employees (employee_id),
     foreign key (planned_destruction_date) references ref_calendar (calendar_date),
     foreign key (actual_destruction_date) references ref_calendar (calendar_date),
     foreign key (document_id) references all_documents (document_id)
     );
     
     
     
