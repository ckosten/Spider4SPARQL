-- phpmyadmin sql dump
     -- version 4.0.10.7
     -- http://www.phpmyadmin.net
     --
     -- host: localhost
     -- generation time: mar 20, 2015 at 01:43 am
     -- server version: 5.5.34-cll-lve
     -- php version: 5.4.23
     
     
     
     /*!40101 set @old_character_set_client=@@character_set_client */;
     /*!40101 set @old_character_set_results=@@character_set_results */;
     /*!40101 set @old_collation_connection=@@collation_connection */;
     /*!40101 set names utf8 */;
     create table if not exists regions (
       region_id decimal(5,0) not null,
       region_name varchar(25) default null,
       primary key (region_id)
     );
     
     --
     -- dumping data for table regions
    
     --
     
     -- --------------------------------------------------------
     
     --
     -- table structure for table countries
     --
     
     create table if not exists countries (
       country_id varchar(2) not null,
       country_name varchar(40) default null,
       region_id decimal(10,0) default null,
       primary key (country_id),
       foreign key (region_id) references regions (region_id)
     );
     
     --
     -- dumping data for table countries
     --
    
     
     -- --------------------------------------------------------
     
     --
     -- table structure for table departments
     --
     
     create table if not exists departments (
       department_id decimal(4,0) not null default '0',
       department_name varchar(30) not null,
       manager_id decimal(6,0) default null,
       location_id decimal(4,0) default null,
       primary key (department_id)
     );
     
     --
     -- dumping data for table departments
     --
     
    
     
     create table if not exists jobs (
       job_id varchar(10) not null default '',
       job_title varchar(35) not null,
       min_salary decimal(6,0) default null,
       max_salary decimal(6,0) default null,
       primary key (job_id)
     );
     
     --
     -- dumping data for table jobs
     --
     
    
     
     --
     -- table structure for table employees
     --
     
     create table if not exists employees (
       employee_id decimal(6,0) not null default '0',
       first_name varchar(20) default null,
       last_name varchar(25) not null,
       email varchar(25) not null,
       phone_number varchar(20) default null,
       hire_date date not null,
       job_id varchar(10) not null,
       salary decimal(8,2) default null,
       commission_pct decimal(2,2) default null,
       manager_id decimal(6,0) default null,
       department_id decimal(4,0) default null,
       primary key (employee_id),
       foreign key (department_id) references departments(department_id),
       foreign key (job_id) references jobs(job_id)
     );
     
     --
     -- dumping data for table employees
     --
     
    
     -- --------------------------------------------------------
     
     --
     -- table structure for table job_history
     --
     
     create table if not exists job_history (
       employee_id decimal(6,0) not null,
       start_date date not null,
       end_date date not null,
       job_id varchar(10) not null,
       department_id decimal(4,0) default null,
       primary key (employee_id,start_date),
       foreign key (employee_id) references employees(employee_id),
       foreign key (department_id) references departments(department_id),
       foreign key (job_id) references jobs(job_id)
     );
     
     --
     -- dumping data for table job_history
     --
     
    
     
     -- --------------------------------------------------------
     
     --
     -- table structure for table jobs
     --
     
     
     --
     -- table structure for table locations
     --
     
     create table if not exists locations (
       location_id decimal(4,0) not null default '0',
       street_address varchar(40) default null,
       postal_code varchar(12) default null,
       city varchar(30) not null,
       state_province varchar(25) default null,
       country_id varchar(2) default null,
       primary key (location_id),
       foreign key (country_id) references countries(country_id)
     );
     
     --
     -- dumping data for table locations
     --
     
    
     -- --------------------------------------------------------
     
     --
     -- table structure for table regions
     --
     
     
     /*!40101 set character_set_client=@old_character_set_client */;
     /*!40101 set character_set_results=@old_character_set_results */;
     /*!40101 set collation_connection=@old_collation_connection */;
