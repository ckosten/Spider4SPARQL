create table if not exists medicine (
     id int,
     name text,
     trade_name text,
     fda_approved text,
     primary key (id)
     );
     
     create table if not exists enzyme (
     id int,
     name text,
     location text,
     product text,
     chromosome text,
     omim int,
     porphyria text,
     primary key (id)
     );
     
     
     create table if not exists medicine_enzyme_interaction (
     enzyme_id int,
     medicine_id int,
     interaction_type text,
     primary key (enzyme_id, medicine_id),
     foreign key (enzyme_id) references enzyme(id),
     foreign key (medicine_id) references medicine(id)
     );
     
     
     
     
     
     
     
     
     
     
     
     
