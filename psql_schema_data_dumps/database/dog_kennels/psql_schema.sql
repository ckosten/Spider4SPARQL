create table if not exists breeds (
     breed_code varchar(10) primary key ,
     breed_name varchar(80)
     );
     create table if not exists charges (
     charge_id integer primary key ,
     charge_type varchar(50),
     charge_amount decimal(19,4)
     );
     
     create table if not exists sizes (
     size_code varchar(10) primary key ,
     size_description varchar(80)
     );
     
     
     
     create table if not exists treatment_types (
     treatment_type_code varchar(10) primary key ,
     treatment_type_description varchar(80)
     );
     
     create table if not exists owners (
     owner_id integer primary key ,
     first_name varchar(50),
     last_name varchar(50),
     street varchar(50),
     city varchar(50),
     state varchar(20),
     zip_code varchar(20),
     email_address varchar(50),
     home_phone varchar(20),
     cell_number varchar(20)
     );
     
     
     create table if not exists dogs (
     dog_id integer primary key ,
     owner_id integer not null,
     abandoned_yn varchar(1),
     breed_code varchar(10) not null,
     size_code varchar(10) not null,
     name varchar(50),
     age varchar(20),
     date_of_birth timestamp,
     gender varchar(1),
     weight varchar(20),
     date_arrived timestamp,
     date_adopted timestamp,
     date_departed timestamp,
     foreign key (breed_code ) references breeds(breed_code ),
     foreign key (size_code ) references sizes(size_code ),
     foreign key (owner_id ) references owners(owner_id ),
     foreign key (owner_id ) references owners(owner_id )
     );
     
     
     
     create table if not exists professionals (
     professional_id integer primary key ,
     role_code varchar(10) not null,
     first_name varchar(50),
     street varchar(50),
     city varchar(50),
     state varchar(20),
     zip_code varchar(20),
     last_name varchar(50),
     email_address varchar(50),
     home_phone varchar(20),
     cell_number varchar(20)
     );
     
     create table if not exists treatments (
     treatment_id integer primary key ,
     dog_id integer not null,
     professional_id integer not null,
     treatment_type_code varchar(10) not null,
     date_of_treatment timestamp,
     cost_of_treatment decimal(19,4),
     foreign key (treatment_type_code ) references treatment_types(treatment_type_code ),
     foreign key (professional_id ) references professionals(professional_id ),
     foreign key (dog_id ) references dogs(dog_id )
     );
     
