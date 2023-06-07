create table if not exists ref_template_types (
     template_type_code char(15) not null,
     template_type_description varchar(255) not null,
     primary key (template_type_code)
     );
     create table if not exists templates (
     template_id integer not null,
     version_number integer not null,
     template_type_code char(15) not null,
     date_effective_from timestamp,
     date_effective_to timestamp,
     template_details varchar(255) not null,
     primary key (template_id),
     foreign key (template_type_code) references ref_template_types (template_type_code)
     );
     create table if not exists documents (
     document_id integer not null,
     template_id integer,
     document_name varchar(255),
     document_description varchar(255),
     other_details varchar(255),
     primary key (document_id),
     foreign key (template_id) references templates (template_id)
     );
     create table if not exists paragraphs (
     paragraph_id integer not null,
     document_id integer not null,
     paragraph_text varchar(255),
     other_details varchar(255),
     primary key (paragraph_id),
     foreign key (document_id) references documents (document_id)
     );
     
     
