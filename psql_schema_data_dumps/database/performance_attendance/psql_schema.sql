
    
    create table if not exists member (
        member_id int,
        name text,
        nationality text,
        role text,
        primary key (member_id)
    );
    
    
    
    
    create table if not exists performance (
        performance_id int,
        date text,
        host text,
        location text,
        attendance int,
        primary key (performance_id)
    );
    
    
    
    create table if not exists member_attendance (
        member_id int,
        performance_id int,
        num_of_pieces int,
        primary key (member_id,performance_id),
        foreign key (member_id) references member(member_id),
        foreign key (performance_id) references performance(performance_id)
    );
    
    
