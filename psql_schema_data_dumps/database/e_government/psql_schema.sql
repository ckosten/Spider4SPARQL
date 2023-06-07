create table if not exists addresses (
     address_id integer primary key,
     line_1_number_building varchar(80),
     town_city varchar(50),
     zip_postcode varchar(20),
     state_province_county varchar(50),
     country varchar(50)
     );
     
     
     create table if not exists services (
     service_id integer primary key,
     service_type_code varchar(15) not null,
     service_name varchar(80),
     service_descriptio varchar(255)
     );
     
     
     create table if not exists forms (
     form_id integer primary key,
     form_type_code varchar(15) not null,
     service_id integer,
     form_number varchar(50),
     form_name varchar(80),
     form_description varchar(255),
     foreign key (service_id ) references services(service_id )
     );
     
     
     
     
     create table if not exists individuals (
     individual_id integer primary key,
     individual_first_name varchar(80),
     individual_middle_name varchar(80),
     inidividual_phone varchar(80),
     individual_email varchar(80),
     individual_address varchar(255),
     individual_last_name varchar(80)
     );
     
     
     create table if not exists organizations (
     organization_id integer primary key,
     date_formed timestamp,
     organization_name varchar(255),
     uk_vat_number varchar(20)
     );
     
     
     create table if not exists parties (
     party_id integer primary key,
     payment_method_code varchar(15) not null,
     party_phone varchar(80),
     party_email varchar(80)
     );
     
     
     create table if not exists organization_contact_individuals (
     individual_id integer not null,
     organization_id integer not null,
     date_contact_from timestamp not null,
     date_contact_to timestamp,
     primary key (individual_id,organization_id ),
     foreign key (organization_id ) references organizations(organization_id ),
     foreign key (individual_id ) references individuals(individual_id )
     );
     
     
     
     create table if not exists party_addresses (
     party_id integer not null,
     address_id integer not null,
     date_address_from timestamp not null,
     address_type_code varchar(15) not null,
     date_address_to timestamp,
     primary key (party_id, address_id),
     foreign key (address_id ) references addresses(address_id ),
     foreign key (party_id ) references parties(party_id )
     );
     
     
     create table if not exists party_forms (
     party_id integer not null,
     form_id integer not null,
     date_completion_started timestamp not null,
     form_status_code varchar(15) not null,
     date_fully_completed timestamp,
     primary key (party_id, form_id),
     foreign key (party_id ) references parties(party_id ),
     foreign key (form_id ) references forms(form_id )
     );
     create table if not exists party_services (
     booking_id integer not null ,
     customer_id integer not null,
     service_id integer not null,
     service_timestamp timestamp not null,
     booking_made_date timestamp,
     foreign key (service_id ) references services(service_id ),
     foreign key (customer_id ) references parties(party_id )
     );
