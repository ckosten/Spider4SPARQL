create table if not exists document_types (
    document_type_code varchar(10) primary key,
    document_description varchar(255) not null
    );
   
   create table if not exists organisation_types (
                                                     organisation_type varchar(10) primary key,
                                                     organisation_type_description varchar(255) not null
   );
   create table if not exists organisations (
                                                organisation_id integer primary key,
                                                organisation_type varchar(10) not null,
                                                organisation_details varchar(255) not null,
                                                foreign key (organisation_type ) references organisation_types(organisation_type )
   );
   
   create table if not exists grants (
                                         grant_id integer primary key,
                                         organisation_id integer not null,
                                         grant_amount decimal(19,4) not null default 0,
                                         grant_start_date timestamp not null,
                                         grant_end_date timestamp not null,
                                         other_details varchar(255) not null,
                                         foreign key (organisation_id ) references organisations(organisation_id )
   );
   create table if not exists projects (
                                           project_id integer primary key,
                                           organisation_id integer not null,
                                           project_details varchar(255) not null,
                                           foreign key (organisation_id ) references organisations(organisation_id )
   );
   
   create table if not exists research_outcomes (
                                                    outcome_code varchar(10) primary key,
                                                    outcome_description varchar(255) not null
   );
   create table if not exists staff_roles (
                                              role_code varchar(10) primary key,
                                              role_description varchar(255) not null
   );
    create table if not exists documents (
    document_id integer primary key,
    document_type_code varchar(10),
    grant_id integer not null,
    sent_date timestamp not null,
    response_received_date timestamp not null,
    other_details varchar(255) not null,
    foreign key (document_type_code ) references document_types(document_type_code ),
    foreign key (grant_id ) references grants(grant_id )
    );
   
   
   
    create table if not exists project_staff (
    staff_id real primary key,
    project_id integer not null,
    role_code varchar(10) not null,
    date_from timestamp,
    date_to timestamp,
    other_details varchar(255),
    foreign key (project_id ) references projects(project_id ),foreign key (role_code ) references staff_roles(role_code )
    );
   
   
    create table if not exists research_staff (
    staff_id integer primary key,
    employer_organisation_id integer not null,
    staff_details varchar(255) not null,
    foreign key (employer_organisation_id ) references organisations(organisation_id )
    );
   
    create table if not exists tasks (
    task_id integer primary key,
    project_id integer not null,
    task_details varchar(255) not null,
    "eg agree objectives" varchar(1),
    foreign key (project_id ) references projects(project_id )
    );
   create table if not exists project_outcomes (
                                                   project_id integer not null,
                                                   outcome_code varchar(10) not null,
                                                   outcome_details varchar(255),
                                                   foreign key (project_id ) references projects(project_id ),foreign key (outcome_code ) references research_outcomes(outcome_code )
   );
    
