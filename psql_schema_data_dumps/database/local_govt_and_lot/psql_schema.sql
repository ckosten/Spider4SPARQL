
     create table if not exists customers (
     customer_id integer not null,
     customer_details varchar(255),
     primary key (customer_id)
     );
     
     create table if not exists properties (
     property_id integer not null,
     property_type_code char(15) not null,
     property_address varchar(255),
     other_details varchar(255),
     primary key (property_id)
     );
     
     
     create table if not exists residents (
     resident_id integer not null,
     property_id integer not null,
     date_moved_in timestamp not null,
     date_moved_out timestamp not null,
     other_details varchar(255),
     primary key (resident_id, property_id, date_moved_in),
     foreign key (property_id) references properties (property_id)
     );
     
     
     
     create table if not exists organizations (
     organization_id integer not null,
     parent_organization_id integer,
     organization_details varchar(255),
     primary key (organization_id)
     );
     
     
     
     create table if not exists services (
     service_id integer not null,
     organization_id integer not null,
     service_type_code char(15) not null,
     service_details varchar(255),
     primary key (service_id),
     foreign key (organization_id) references organizations (organization_id)
     );
     
     
     
     create table if not exists residents_services (
     resident_id integer not null,
     service_id integer not null,
     date_moved_in timestamp,
     property_id integer,
     date_requested timestamp,
     date_provided timestamp,
     other_details varchar(255),
     primary key (resident_id, service_id),
     foreign key (service_id) references services (service_id),
     foreign key (resident_id, property_id, date_moved_in) references residents (resident_id,property_id,date_moved_in)
     );
     
     
     
     create table if not exists things (
     thing_id integer not null,
     organization_id integer not null,
     type_of_thing_code char(15) not null,
     service_type_code char(10) not null,
     service_details varchar(255),
     primary key (thing_id),
     foreign key (organization_id) references organizations (organization_id)
     );
     
     
     create table if not exists customer_events (
     customer_event_id integer not null,
     customer_id integer,
     date_moved_in timestamp,
     property_id integer,
     resident_id integer,
     thing_id integer not null,
     primary key (customer_event_id),
     foreign key (thing_id) references things (thing_id),
     foreign key (customer_id) references customers (customer_id),
     foreign key (resident_id, property_id, date_moved_in) references residents (resident_id,property_id,date_moved_in)
     );
     
     
     create table if not exists customer_event_notes (
     customer_event_note_id integer not null,
     customer_event_id integer not null,
     service_type_code char(15) not null,
     resident_id integer not null,
     property_id integer not null,
     date_moved_in timestamp not null,
     primary key (customer_event_note_id),
     foreign key (customer_event_id) references customer_events (customer_event_id)
     );
     
     
     
     create table if not exists timed_status_of_things (
     thing_id integer not null,
     date_and_date timestamp not null,
     status_of_thing_code char(15) not null,
     primary key (thing_id, date_and_date, status_of_thing_code),
     foreign key (thing_id) references things (thing_id)
     );
     create table if not exists timed_locations_of_things (
     thing_id integer not null,
     date_and_time timestamp not null,
     location_code char(15) not null,
     primary key (thing_id, date_and_time, location_code),
     foreign key (thing_id) references things (thing_id));
     
     
