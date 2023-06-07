create table if not exists problem_category_codes (
    problem_category_code varchar(20) primary key,
    problem_category_description varchar(80)
    );
   create table if not exists problem_status_codes (
       problem_status_code varchar(20) primary key,
       problem_status_description varchar(80)
       );
   
   create table if not exists product (
                                          product_id integer primary key,
                                          product_name varchar(80),
       product_details varchar(255)
       );
   create table if not exists staff (
                                        staff_id integer primary key,
                                        staff_first_name varchar(80),
       staff_last_name varchar(80),
       other_staff_details varchar(255)
       );
   create table if not exists problems (
                                           problem_id integer primary key,
                                           product_id integer not null,
                                           closure_authorised_by_staff_id integer not null,
                                           reported_by_staff_id integer not null,
                                           date_problem_reported timestamp not null,
                                           date_problem_closed timestamp,
                                           problem_description varchar(255),
       other_problem_details varchar(255),
       foreign key (closure_authorised_by_staff_id ) references staff(staff_id ),
       foreign key (product_id ) references product(product_id ),
       foreign key (reported_by_staff_id ) references staff(staff_id )
       );
   
   
   create table if not exists problem_log (
    problem_log_id integer primary key,
    assigned_to_staff_id integer not null,
    problem_id integer not null,
    problem_category_code varchar(20) not null,
    problem_status_code varchar(20) not null,
    log_entry_date timestamp,
    log_entry_description varchar(255),
    log_entry_fix varchar(255),
    other_log_details varchar(255),
    foreign key (problem_category_code ) references problem_category_codes(problem_category_code ),foreign key (assigned_to_staff_id ) references staff(staff_id ),foreign key (problem_id ) references problems(problem_id ),foreign key (problem_status_code ) references problem_status_codes(problem_status_code )
    );
   
    
   
    
    
    
    
    
    
