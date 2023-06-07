
     create table if not exists building (
     building_id text,
     name text,
     street_address text,
     years_as_tallest text,
     height_feet int,
     floors int,
     primary key(building_id)
     );
     
     create table if not exists institution (
     institution_id  text,
     institution text,
     location text,
     founded real,
     type text,
     enrollment int,
     team text,
     primary_conference text,
     building_id text,
     primary key(institution_id),
     foreign  key (building_id) references building(building_id)
     );
     
     create table if not exists protein (
     common_name text,
     protein_name text,
     divergence_from_human_lineage real,
     accession_number text,
     sequence_length real,
     sequence_identity_to_human_protein text,
     institution_id text,
     primary key(common_name),
     foreign key(institution_id) references institution(institution_id)
     );
     
     
     
     
     
