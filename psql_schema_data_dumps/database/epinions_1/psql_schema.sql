create table if not exists item (
      i_id integer not null
    ,  title varchar(20) default null
    ,  primary key (i_id)
    );
   create table if not exists useracct (
                                           u_id integer not null
       ,  name varchar(128) default null
       ,  primary key (u_id)
       );
    create table if not exists review (
      a_id integer not null primary key
    ,  u_id integer not null
    ,  i_id integer not null
    ,  rating integer default null
    ,  rank integer default null
    , 	foreign key (u_id) references useracct(u_id)
    , 	foreign key (i_id) references item(i_id)
    );
   
    create index if not exists  idx_review_idx_rating_uid on review (u_id);
    create index if not exists idx_review_idx_rating_aid on review (a_id);
    create index if not exists idx_review_idx_rating_iid on review (i_id);
    create table if not exists trust (source_u_id integer not null, target_u_id integer not null, trust integer not null, foreign key (source_u_id) references useracct(u_id), foreign key (target_u_id) references useracct(u_id));
    create index if not exists idx_trust_idx_trust_sid on trust (source_u_id);
    create index if not exists idx_trust_idx_trust_tid on trust (target_u_id);
