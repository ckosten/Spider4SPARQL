create table if not exists works_on(
     essn integer,
     pno integer,
     hours real,
     primary key(essn, pno));
     create table if not exists employee(
     fname text,
     minit text,
     lname text,
     ssn integer primary key,
     bdate text,
     address text,
     sex text,
     salary integer,
     super_ssn integer, 
     dno integer);
     create table if not exists department(
     dname text,
     dnumber integer primary key,
     mgr_ssn integer,
     mgr_start_date text);
     create table if not exists project(
     pname text,
     pnumber integer primary key,
     plocation text,
     dnum integer);
     create table if not exists dependent(
     essn integer,
     dependent_name text,
     sex text,
     bdate text,
     relationship text,
     primary key(essn, dependent_name));
     create table if not exists dept_locations(
     dnumber integer,
     dlocation text,
     primary key(dnumber, dlocation));
