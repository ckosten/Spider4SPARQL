
     
     create table if not exists services (
     service_id integer not null,
     service_type_code char(15) not null,
     primary key (service_id)
     );
     
     
     create table if not exists participants (
     participant_id integer not null,
     participant_type_code char(15) not null,
     participant_details varchar(255),
     primary key (participant_id)
     );
     
     
     create table if not exists events (
     event_id integer not null,
     service_id integer not null,
     event_details varchar(255),
     primary key (event_id),
     foreign key (service_id) references services (service_id)
     );
     
     
     create table if not exists participants_in_events (
     event_id integer not null,
     participant_id integer not null,
     primary key (event_id, participant_id),
     foreign key (participant_id) references participants (participant_id),
     foreign key (event_id) references events (event_id)
     );
