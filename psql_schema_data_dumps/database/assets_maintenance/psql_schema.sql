
     create table if not exists third_party_companies (
     company_id integer primary key ,
     company_type varchar(5) not null,
     company_name varchar(255),
     company_address varchar(255),
     other_company_details varchar(255)
     );
     
     
     
     create table if not exists maintenance_contracts (
     maintenance_contract_id integer primary key,
     maintenance_contract_company_id integer not null,
     contract_start_date timestamp,
     contract_end_date timestamp,
     other_contract_details varchar(255),
     foreign key (maintenance_contract_company_id ) references third_party_companies(company_id )
     );
     
     
     
     create table if not exists parts (
     part_id integer primary key,
     part_name varchar(255),
     chargeable_yn varchar(1),
     chargeable_amount varchar(20),
     other_part_details varchar(255)
     );
     
     
     create table if not exists skills (
     skill_id integer primary key,
     skill_code varchar(20),
     skill_description varchar(255)
     );
     
     
     
     create table if not exists staff (
     staff_id integer primary key,
     staff_name varchar(255),
     gender varchar(1),
     other_staff_details varchar(255)
     );
     
     
     
     create table if not exists assets (
     asset_id integer primary key,
     maintenance_contract_id integer not null,
     supplier_company_id integer not null,
     asset_details varchar(255),
     asset_make varchar(20),
     asset_model varchar(20),
     asset_acquired_date timestamp,
     asset_disposed_date timestamp,
     other_asset_details varchar(255),
     foreign key (maintenance_contract_id )
     references maintenance_contracts(maintenance_contract_id ),
     foreign key (supplier_company_id ) references third_party_companies(company_id )
     );
     
     
     
     
     
     
     create table if not exists asset_parts (
     asset_id integer not null,
     part_id integer not null,
     foreign key (part_id ) references parts(part_id ),
     foreign key (asset_id ) references assets(asset_id )
     );
     
     
     
     
     create table if not exists maintenance_engineers (
     engineer_id integer primary key,
     company_id integer not null,
     first_name varchar(50),
     last_name varchar(50),
     other_details varchar(255),
     foreign key (company_id ) references third_party_companies(company_id )
     );
     
     
     
     
     
     create table if not exists engineer_skills (
     engineer_id integer not null,
     skill_id integer not null,
     foreign key (engineer_id ) references maintenance_engineers(engineer_id ),
     foreign key (skill_id ) references skills(skill_id )
     );
     
     
     create table if not exists fault_log (
     fault_log_entry_id integer primary key,
     asset_id integer not null,
     recorded_by_staff_id integer not null,
     fault_log_entry_timestamp timestamp,
     fault_description varchar(255),
     other_fault_details varchar(255),
     foreign key (asset_id ) references assets(asset_id ),
     foreign key (recorded_by_staff_id ) references staff(staff_id )
     );
     
     
     create table if not exists engineer_visits (
     engineer_visit_id integer primary key,
     contact_staff_id integer,
     engineer_id integer not null,
     fault_log_entry_id integer not null,
     fault_status varchar(10) not null,
     visit_start_timestamp timestamp,
     visit_end_timestamp timestamp,
     other_visit_details varchar(255),
     foreign key (fault_log_entry_id ) references fault_log(fault_log_entry_id ),
     foreign key (engineer_id ) references maintenance_engineers(engineer_id ),
     foreign key (contact_staff_id ) references staff(staff_id )
     );
     
     
     
     
     
     
     create table if not exists part_faults (
     part_fault_id integer primary key,
     part_id integer not null,
     fault_short_name varchar(20),
     fault_description varchar(255),
     other_fault_details varchar(255),
     foreign key (part_id ) references parts(part_id )
     );
     
     
     create table if not exists fault_log_parts (
     fault_log_entry_id integer not null,
     part_fault_id integer not null,
     fault_status varchar(10) not null,
     foreign key (part_fault_id ) references part_faults(part_fault_id ),
     foreign key (fault_log_entry_id ) references fault_log(fault_log_entry_id )
     );
     
     
     
     
     
     
     create table if not exists skills_required_to_fix (
     part_fault_id integer not null,
     skill_id integer not null,
     foreign key (part_fault_id ) references part_faults(part_fault_id ),
     foreign key (skill_id ) references skills(skill_id )
     );
     
     
     
     
