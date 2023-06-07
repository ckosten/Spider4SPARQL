create table if not exists addresses (
     address_id integer primary key,
     line_1 varchar(255),
     line_2 varchar(255),
     line_3 varchar(255),
     city varchar(255),
     zip_postcode varchar(20),
     state_province_county varchar(255),
     country varchar(255),
     other_address_details varchar(255)
     );
     create table if not exists courses (
     course_id integer primary key,
     course_name varchar(255),
     course_description varchar(255),
     other_details varchar(255)
     );
     
     
     
     create table if not exists departments (
     department_id integer primary key,
     department_name varchar(255),
     department_description varchar(255),
     other_details varchar(255)
     );
     
     
     
     create table if not exists degree_programs (
     degree_program_id integer primary key,
     department_id integer not null,
     degree_summary_name varchar(255),
     degree_summary_description varchar(255),
     other_details varchar(255),
     foreign key (department_id ) references departments(department_id )
     );
     
     
     
     
     create table if not exists sections (
     section_id integer primary key,
     course_id integer not null,
     section_name varchar(255),
     section_description varchar(255),
     other_details varchar(255),
     foreign key (course_id ) references courses(course_id )
     );
     
     
     
     create table if not exists semesters (
     semester_id integer primary key,
     semester_name varchar(255),
     semester_description varchar(255),
     other_details varchar(255)
     );
     
     
     create table if not exists students (
     student_id integer primary key,
     current_address_id integer not null,
     permanent_address_id integer not null,
     first_name varchar(80),
     middle_name varchar(40),
     last_name varchar(40),
     cell_mobile_number varchar(40),
     email_address varchar(40),
     ssn varchar(40),
     date_first_registered timestamp,
     date_left timestamp,
     other_student_details varchar(255),
     foreign key (current_address_id ) references addresses(address_id ),
     foreign key (permanent_address_id ) references addresses(address_id )
     );
     
     
     
     
     create table if not exists student_enrolment (
     student_enrolment_id integer primary key,
     degree_program_id integer not null,
     semester_id integer not null,
     student_id integer not null,
     other_details varchar(255),
     foreign key (degree_program_id ) references degree_programs(degree_program_id ),
     foreign key (semester_id ) references semesters(semester_id ),
     foreign key (student_id ) references students(student_id )
     );
     
     
     
     create table if not exists student_enrolment_courses (
     student_course_id integer primary key,
     course_id integer not null,
     student_enrolment_id integer not null,
     foreign key (course_id ) references courses(course_id ),
     foreign key (student_enrolment_id ) references student_enrolment(student_enrolment_id )
     );
     
     create table if not exists transcripts (
     transcript_id integer primary key,
     transcript_date timestamp,
     other_details varchar(255)
     );
     
     create table if not exists transcript_contents (
     student_course_id integer not null,
     transcript_id integer not null,
     foreign key (student_course_id ) references student_enrolment_courses(student_course_id ),
     foreign key (transcript_id ) references transcripts(transcript_id )
     );
     
     
