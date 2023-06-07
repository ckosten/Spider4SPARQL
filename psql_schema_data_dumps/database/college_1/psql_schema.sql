create table if not exists employee (
                                            emp_num int primary key,
                                            emp_lname varchar(15),
        emp_fname varchar(12),
        emp_initial varchar(1),
        emp_jobcode varchar(5),
        emp_hiredate timestamp,
        emp_dob timestamp
        );
    
    
    
    create table if not exists department (
        dept_code varchar(10) primary key,
        dept_name varchar(30),
        school_code varchar(8),
        emp_num int,
        dept_address varchar(20),
        dept_extension varchar(4),
        foreign key (emp_num) references employee(emp_num)
        );
     create table if not exists course (
     crs_code varchar(10) primary key,
     dept_code varchar(10),
     crs_description varchar(35),
     crs_credit float(8),
     foreign key (dept_code) references department(dept_code)
     );
    create table if not exists class (
        class_code varchar(5) primary key,
        crs_code varchar(10),
        class_section varchar(2),
        class_time varchar(20),
        class_room varchar(8),
        prof_num int,
        foreign key (crs_code) references course(crs_code),
        foreign key (prof_num) references employee(emp_num)
        );
    
    
     create table if not exists professor (
     emp_num int,
     dept_code varchar(10),
     prof_office varchar(50),
     prof_extension varchar(4),
     prof_high_degree varchar(5),
     foreign key (emp_num) references employee(emp_num),
     foreign key (dept_code) references department(dept_code)
     );
     create table if not exists student (
     stu_num int primary key,
     stu_lname varchar(15),
     stu_fname varchar(15),
     stu_init varchar(1),
     stu_dob timestamp,
     stu_hrs int,
     stu_class varchar(2),
     stu_gpa float(8),
     stu_transfer numeric,
     dept_code varchar(18),
     stu_phone varchar(4),
     prof_num int,
     foreign key (dept_code) references department(dept_code)
     );
    
    create table if not exists enroll (
        class_code varchar(5),
        stu_num int,
        enroll_grade varchar(50),
        foreign key (class_code) references class(class_code),
        foreign key (stu_num) references student(stu_num)
        );
     create table if not exists classroom
     	(building		varchar(15),
     	 room_number		varchar(7),
     	 capacity		numeric(4,0),
     	 primary key (building, room_number)
     	);
