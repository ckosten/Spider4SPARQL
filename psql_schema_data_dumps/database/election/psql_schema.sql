
     create table if not exists county (
     county_id int,
     county_name text,
     population real,
     zip_code text,
     primary key (county_id)
     );
     
     
     
     create table if not exists party (
     party_id int,
     year real,
     party text,
     governor text,
     lieutenant_governor text,
     comptroller text,
     attorney_general text,
     us_senate text,
     primary key (party_id)
     );
     
     
     
     
     
     create table if not exists election (
     election_id int,
     counties_represented text,
     district int,
     delegate text,
     party int,
     first_elected real,
     committee text,
     primary key (election_id),
     foreign key (party) references party(party_id),
     foreign key (district) references county(county_id)
     );
     
     
