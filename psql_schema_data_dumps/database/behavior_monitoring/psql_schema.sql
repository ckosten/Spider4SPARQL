create table if not exists ref_address_types (
     address_type_code varchar(15) primary key,
     address_type_description varchar(80)
     );
     create table if not exists ref_detention_type (
     detention_type_code varchar(10) primary key,
     detention_type_description varchar(80)
     );
     create table if not exists ref_incident_type (
     incident_type_code varchar(10) primary key,
     incident_type_description varchar(80)
     );
     
     
     
     
     
     create table if not exists addresses (
     address_id integer primary key,
     line_1 varchar(120),
     line_2 varchar(120),
     line_3 varchar(120),
     city varchar(80),
     zip_postcode varchar(20),
     state_province_county varchar(50),
     country varchar(50),
     other_address_details varchar(255)
     );
     
     
     
     create table if not exists students (
     student_id integer primary key,
     address_id integer not null,
     first_name varchar(80),
     middle_name varchar(40),
     last_name varchar(40),
     cell_mobile_number varchar(40),
     email_address varchar(40),
     date_first_rental timestamp,
     date_left_university timestamp,
     other_student_details varchar(255),
     foreign key (address_id ) references addresses(address_id )
     );
     
     
     
     create table if not exists teachers (
     teacher_id integer primary key,
     address_id integer not null,
     first_name varchar(80),
     middle_name varchar(80),
     last_name varchar(80),
     gender varchar(1),
     cell_mobile_number varchar(40),
     email_address varchar(40),
     other_details varchar(255),
     foreign key (address_id ) references addresses(address_id )
     );
     
     
     create table if not exists assessment_notes (
     notes_id integer not null ,
     student_id integer,
     teacher_id integer not null,
     date_of_notes timestamp,
     text_of_notes varchar(255),
     other_details varchar(255),
     foreign key (student_id ) references students(student_id ),
     foreign key (teacher_id ) references teachers(teacher_id )
     );
     
     
     create table if not exists behavior_incident (
     incident_id integer primary key,
     incident_type_code varchar(10) not null,
     student_id integer not null,
     date_incident_start timestamp,
     date_incident_end timestamp,
     incident_summary varchar(255),
     recommendations varchar(255),
     other_details varchar(255),
     foreign key (incident_type_code ) references ref_incident_type(incident_type_code ),
     foreign key (student_id ) references students(student_id )
     );
     
     
     create table if not exists detention (
     detention_id integer primary key,
     detention_type_code varchar(10) not null,
     teacher_id integer,
     timestamp_detention_start timestamp,
     timestamp_detention_end timestamp,
     detention_summary varchar(255),
     other_details varchar(255),
     foreign key (detention_type_code ) references ref_detention_type(detention_type_code ),
     foreign key (teacher_id ) references teachers(teacher_id )
     );
     
     create table if not exists student_addresses (
     student_id integer not null,
     address_id integer not null,
     date_address_from timestamp not null,
     date_address_to timestamp,
     monthly_rental decimal(19,4),
     other_details varchar(255),
     foreign key (address_id ) references addresses(address_id ),
     foreign key (student_id ) references students(student_id )
     );
     
     create table if not exists students_in_detention (
     student_id integer not null,
     detention_id integer not null,
     incident_id integer not null,
     foreign key (incident_id ) references behavior_incident(incident_id ),
     foreign key (detention_id ) references detention(detention_id ),
     foreign key (student_id ) references students(student_id )
     );
     
