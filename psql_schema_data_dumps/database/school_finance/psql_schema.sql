
    create table if not exists school (
    school_id int,
    school_name text,
    location text,
    mascot text,
    enrollment int,
    ihsaa_class text,
    ihsaa_football_class text,
    county text,
    primary key (school_id)
    );
    
    create table if not exists budget (
    school_id int,
    year int,
    budgeted int,
    total_budget_percent_budgeted real,
    invested int,
    total_budget_percent_invested real,
    budget_invested_percent text,
    primary key(school_id,year),
    foreign key(school_id) references school(school_id)
    
    );
    
    create table if not exists endowment (
    endowment_id int,
    school_id int,
    donator_name text,
    amount real,
    primary key(endowment_id),
    foreign key(school_id) references school(school_id)
    );
    
    
