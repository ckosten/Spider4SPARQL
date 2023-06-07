
     
     
     create table if not exists region (
     region_id int,
     region_name text,
     date text,
     label text,
     format text,
     catalogue text,
     primary key (region_id)
     );
     
     
     
     
     
     create table if not exists party (
     party_id int,
     minister text,
     took_office text,
     left_office text,
     region_id int,
     party_name text,
     primary key (party_id),
     foreign key (region_id) references region(region_id)
     );
     
     create table if not exists member (
     member_id int,
     member_name text,
     party_id int,
     in_office text,
     primary key (member_id),
     foreign key (party_id) references party(party_id)
     );
     
     
     
     
     
     
     create table if not exists party_events (
     event_id int,
     event_name text,
     party_id int,
     member_in_charge_id int,
     primary key (event_id),
     foreign key (party_id) references party(party_id),
     foreign key (member_in_charge_id) references member(member_id)
     );
     
     
