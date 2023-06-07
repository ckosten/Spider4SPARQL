create table if not exists course_authors_and_tutors (
    author_id integer primary key,
    author_tutor_atb varchar(3),
    login_name varchar(40),
    password varchar(40),
    personal_name varchar(80),
    middle_name varchar(80),
    family_name varchar(80),
    gender_mf varchar(1),
    address_line_1 varchar(80)
    );
    
    
    create table if not exists students (
    student_id integer primary key,
    date_of_registration timestamp,
    date_of_latest_logon timestamp,
    login_name varchar(40),
    password varchar(10),
    personal_name varchar(40),
    middle_name varchar(40),
    family_name varchar(40)
    );
    
    create table if not exists subjects (
    subject_id integer primary key,
    subject_name varchar(120)
    );
    
    
    create table if not exists courses (
    course_id integer primary key,
    author_id integer not null,
    subject_id integer not null,
    course_name varchar(120),
    course_description varchar(255),
    foreign key (author_id ) references course_authors_and_tutors(author_id ),
    foreign key (subject_id ) references subjects(subject_id )
    );
    
    
    create table if not exists student_course_enrolment (
    registration_id integer primary key,
    student_id integer not null,
    course_id integer not null,
    date_of_enrolment timestamp not null,
    date_of_completion timestamp not null,
    foreign key (course_id ) references courses(course_id ),
    foreign key (student_id ) references students(student_id )
    );
    
    
    create table if not exists student_tests_taken (
    registration_id integer not null,
    date_test_taken timestamp not null,
    test_result varchar(255),
    foreign key (registration_id ) references student_course_enrolment(registration_id )
    );
    
