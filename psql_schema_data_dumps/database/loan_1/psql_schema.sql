create table if not exists bank (
    branch_id int primary key,
    bname varchar(20),
    no_of_customers int,
    city varchar(10),
    state varchar(20));
    
    
    create table if not exists customer (
    cust_id varchar(3) primary key,
    cust_name varchar(20),
    acc_type char(1),
    acc_bal int,
    no_of_loans int,
    credit_score int,
    branch_id int,
    state varchar(20),
    foreign key(branch_id) references bank(branch_id));
    
    
    create table if not exists loan (
    loan_id varchar(3) primary key,
    loan_type varchar(15),
    cust_id varchar(3),
    branch_id int,
    amount int,
    foreign key(branch_id) references bank(branch_id),
    foreign key(cust_id) references customer(cust_id));
    
