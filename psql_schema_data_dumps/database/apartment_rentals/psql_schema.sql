
    create table if not exists apartment_buildings (
    building_id integer not null,
    building_short_name char(15),
    building_full_name varchar(80),
    building_description varchar(255),
    building_address varchar(255),
    building_manager varchar(50),
    building_phone varchar(80),
    primary key (building_id),
    unique (building_id)
    );
    
   
    
    create table if not exists apartments (
    apt_id integer not null ,
    building_id integer not null,
    apt_type_code char(15),
    apt_number char(10),
    bathroom_count integer,
    bedroom_count integer,
    room_count char(5),
    primary key (apt_id),
    unique (apt_id),
    foreign key (building_id) references apartment_buildings (building_id)
    );
    
    create table if not exists apartment_facilities (
    apt_id integer not null,
    facility_code char(15) not null,
    primary key (apt_id, facility_code),
    foreign key (apt_id) references apartments (apt_id)
    );
    create table if not exists guests (
    guest_id integer not null ,
    gender_code char(1),
    guest_first_name varchar(80),
    guest_last_name varchar(80),
    date_of_birth timestamp,
    primary key (guest_id),
    unique (guest_id)
    );
    
    
    
    create table if not exists apartment_bookings (
    apt_booking_id integer not null,
    apt_id integer,
    guest_id integer not null,
    booking_status_code char(15) not null,
    booking_start_date timestamp,
    booking_end_date timestamp,
    primary key (apt_booking_id),
    unique (apt_booking_id),
    foreign key (apt_id) references apartments (apt_id),
    foreign key (guest_id) references guests (guest_id)
    );
    create table if not exists view_unit_status (
    apt_id integer,
    apt_booking_id integer,
    status_date timestamp not null,
    available_yn bit,
    primary key (status_date),
    foreign key (apt_id) references apartments (apt_id),
    foreign key (apt_booking_id) references apartment_bookings (apt_booking_id)
    );
    
