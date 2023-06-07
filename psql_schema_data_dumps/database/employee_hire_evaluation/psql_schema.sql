
    
    create table if not exists employee (
    employee_id int,
    name text,
    age int,
    city text,
    primary key (employee_id)
    );
    
    
    
    
    
    create table if not exists shop (
    shop_id int,
    name text,
    location text,
    district text,
    number_products int,
    manager_name text,
    primary key (shop_id)
    );
    
    
    
    
    create table if not exists hiring (
    shop_id int,
    employee_id int,
    start_from text,
    is_full_time bool,
    primary key (employee_id),
    foreign key (shop_id) references shop(shop_id),
    foreign key (employee_id) references employee(employee_id)
    );
    
    
    
    
    
    create table if not exists evaluation (
    employee_id int,
    year_awarded text,
    bonus real,
    primary key (employee_id,year_awarded),
    foreign key (employee_id) references employee(employee_id)
    );
    
    
    
