
    create table if not exists addresses (
    address_id integer not null,
    line_1 varchar(80),
    line_2 varchar(80),
    city varchar(50),
    zip_postcode char(20),
    state_province_county varchar(50),
    country varchar(50),
    primary key (address_id)
    );
    
   
    
    create table if not exists people (
    person_id integer not null,
    first_name varchar(255),
    middle_name varchar(255),
    last_name varchar(255),
    cell_mobile_number varchar(40),
    email_address varchar(40),
    login_name varchar(40),
    password varchar(40),
    primary key (person_id)
    );
    
    
    
    create table if not exists students (
    student_id integer not null,
    student_details varchar(255),
    primary key (student_id),
    foreign key (student_id) references people (person_id)
    );
    
    
    create table if not exists courses (
    course_id integer not null,
    course_name varchar(120),
    course_description varchar(255),
    other_details varchar(255),
    primary key (course_id)
    );
    
    
    
    create table if not exists people_addresses (
    person_address_id integer not null,
    person_id integer not null,
    address_id integer not null,
    date_from timestamp,
    date_to timestamp,
    primary key (person_address_id),
    foreign key (person_id) references people (person_id),
    foreign key (address_id) references addresses (address_id)
    );
    
    
    create table if not exists student_course_registrations (
    student_id integer not null,
    course_id integer not null,
    registration_date timestamp not null,
    primary key (student_id, course_id),
    foreign key (student_id) references students (student_id),
    foreign key (course_id) references courses (course_id)
    );
    
    
    
    create table if not exists student_course_attendance (
    student_id integer not null,
    course_id integer not null,
    date_of_attendance timestamp not null,
    primary key (student_id, course_id),
    foreign key (student_id, course_id) references student_course_registrations (student_id,course_id)
    );
    
    
    
    create table if not exists candidates (
    candidate_id integer not null ,
    candidate_details varchar(255),
    primary key (candidate_id),
    foreign key (candidate_id) references people (person_id)
    );
    create table if not exists candidate_assessments (
    candidate_id integer not null,
    qualification char(15) not null,
    assessment_date timestamp not null,
    asessment_outcome_code char(15) not null,
    primary key (candidate_id, qualification),
    foreign key (candidate_id) references candidates (candidate_id)
    );
    
    
