
     
     create table if not exists party (
     party_id int,
     party_theme text,
     location text,
     first_year text,
     last_year text,
     number_of_hosts int,
     primary key (party_id)
     );
     
     create table if not exists host (
     host_id int,
     name text,
     nationality text,
     age text,
     primary key (host_id)
     );
     
     
     
     
     
     
     create table if not exists party_host (
     party_id int,
     host_id int,
     is_main_in_charge bool,
     primary key (party_id,host_id),
     foreign key (host_id) references host(host_id),
     foreign key (party_id) references party(party_id)
     );
     
     
