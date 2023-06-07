
     create table if not exists roles (
     role_code varchar(15) primary key,
     role_description varchar(80)
     );
     
     create table if not exists users (
     user_id integer primary key,
     role_code varchar(15) not null,
     user_name varchar(40),
     user_login varchar(40),
     password varchar(40),
     foreign key (role_code ) references roles(role_code )
     );
     
     create table if not exists document_structures (
     document_structure_code varchar(15) primary key,
     parent_document_structure_code varchar(15),
     document_structure_description varchar(80)
     );
     
     
     create table if not exists functional_areas (
     functional_area_code varchar(15) primary key,
     parent_functional_area_code varchar(15),
     functional_area_description varchar(80) not null
     );
     
     
     
     create table if not exists images (
     image_id integer primary key,
     image_alt_text varchar(80),
     image_name varchar(40),
     image_url varchar(255)
     );
     
     
     create table if not exists documents (
     document_code varchar(15) primary key,
     document_structure_code varchar(15) not null,
     document_type_code varchar(15) not null,
     access_count integer,
     document_name varchar(80),
     foreign key (document_structure_code ) references document_structures(document_structure_code )
     );
     
     
     
     
     
     create table if not exists document_functional_areas (
     document_code varchar(15) not null,
     functional_area_code varchar(15) not null,
     foreign key (document_code ) references documents(document_code ),
     foreign key (functional_area_code ) references functional_areas(functional_area_code )
     );
     
     
     create table if not exists document_sections (
     section_id integer primary key,
     document_code varchar(15) not null,
     section_sequence integer,
     section_code varchar(20),
     section_title varchar(80),
     foreign key (document_code ) references documents(document_code )
     );
     
     create table if not exists document_sections_images (
     section_id integer not null,
     image_id integer not null,
     primary key (section_id,image_id),
     foreign key (section_id ) references document_sections(section_id ),
     foreign key (image_id ) references images(image_id )
     );
     
