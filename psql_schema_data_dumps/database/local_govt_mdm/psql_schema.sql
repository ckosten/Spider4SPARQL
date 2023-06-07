
     create table if not exists customer_master_index (
     master_customer_id integer not null,
     cmi_details varchar(255),
     primary key (master_customer_id)
     );
     
     create table if not exists cmi_cross_references (
     cmi_cross_ref_id integer not null,
     master_customer_id integer not null,
     source_system_code char(15) not null,
     primary key (cmi_cross_ref_id),
     foreign key (master_customer_id) references customer_master_index (master_customer_id)
     
     );
     
     create table if not exists council_tax (
     council_tax_id integer not null,
     cmi_cross_ref_id integer not null,
     primary key (council_tax_id),
     foreign key (cmi_cross_ref_id) references cmi_cross_references (cmi_cross_ref_id)
     );
     create table if not exists business_rates (
     business_rates_id integer not null,
     cmi_cross_ref_id integer not null,
     primary key (business_rates_id),
     foreign key (cmi_cross_ref_id) references cmi_cross_references (cmi_cross_ref_id)
     );
     create table if not exists benefits_overpayments (
     council_tax_id integer not null,
     cmi_cross_ref_id integer not null,
     primary key (council_tax_id),
     foreign key (cmi_cross_ref_id) references cmi_cross_references (cmi_cross_ref_id)
     );
     create table if not exists parking_fines (
     council_tax_id integer not null,
     cmi_cross_ref_id integer not null,
     primary key (council_tax_id),
     foreign key (cmi_cross_ref_id) references cmi_cross_references (cmi_cross_ref_id)
     );
     create table if not exists rent_arrears (
     council_tax_id integer not null,
     cmi_cross_ref_id integer not null,
     primary key (council_tax_id),
     foreign key (cmi_cross_ref_id) references cmi_cross_references (cmi_cross_ref_id)
     );
     create table if not exists electoral_register (
     electoral_register_id integer not null,
     cmi_cross_ref_id integer not null,
     primary key (electoral_register_id),
     foreign key (cmi_cross_ref_id) references cmi_cross_references (cmi_cross_ref_id)
     );
     
     
     
     
