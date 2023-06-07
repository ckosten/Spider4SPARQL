begin transaction;
     create table if not exists department (
     department_id int,
     name text,
     creation text,
     ranking int,
     budget_in_billions real,
     num_employees real,
     primary key (department_id)
     );
     create table if not exists head (
     head_id int,
     name text,
     born_state text,
     age real,
     primary key (head_id)
     );
     create table if not exists management (
     department_id int,
     head_id int,
     temporary_acting text,
     primary key (department_id,head_id),
     foreign key (department_id) references department(department_id),
     foreign key (head_id) references head(head_id)
     );
     commit;
     
