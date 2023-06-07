
    create table if not exists member (
    member_id int,
    card_number text,
    name text,
    hometown text,
    level int,
    primary key (member_id)
    );
    
    
    
    
    create table if not exists branch (
    branch_id int,
    name text,
    open_year text,
    address_road text,
    city text,
    membership_amount text,
    primary key (branch_id)
    );
    
    
    
    
    create table if not exists membership_register_branch (
    member_id int,
    branch_id int,
    register_year text,
    primary key (member_id),
    foreign key (member_id) references member(member_id),
    foreign key (branch_id) references branch(branch_id)
    );
    
    
    
    
    create table if not exists purchase (
    member_id int,
    branch_id int,
    year text,
    total_pounds real,
    primary key (member_id,branch_id,year),
    foreign key (member_id) references member(member_id),
    foreign key (branch_id) references branch(branch_id)
    );
    
    
