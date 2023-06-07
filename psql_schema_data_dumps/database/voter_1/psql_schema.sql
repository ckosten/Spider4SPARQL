create table area_code_state
(
    area_code integer    not null
        primary key,
    state     varchar(2) not null
);


create table contestants
(
    contestant_number integer     not null
        primary key,
    contestant_name   varchar(50) not null
);


create table votes
(
    vote_id           integer                             not null,
    phone_number      varchar(10)                         not null,
    area_code         integer                             not null
        references area_code_state,
    contestant_number integer                             not null
        references contestants,
    created           timestamp default CURRENT_TIMESTAMP not null
);

create index idx_votes_idx_votes_phone_number
    on votes (phone_number);