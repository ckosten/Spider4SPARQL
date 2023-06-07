
     
     create table if not exists repair (
     repair_id int,
     name text,
     launch_date text,
     notes text,
     primary key (repair_id)
     );
     
     
     create table if not exists machine (
     machine_id int,
     making_year int,
     class text,
     team text,
     machine_series text,
     value_points real,
     quality_rank int,
     primary key (machine_id)
     );
     
     
     
     create table if not exists technician (
     technician_id real,
     name text,
     team text,
     starting_year real,
     age int,
     primary key (technician_id)
     );
     
     
     
     
     
     create table if not exists repair_assignment (
     technician_id int,
     repair_id int,
     machine_id int,
     primary key (technician_id,repair_id,machine_id),
     foreign key (technician_id) references technician(technician_id),
     foreign key (repair_id) references repair(repair_id),
     foreign key (machine_id) references machine(machine_id)
     );
     
     
