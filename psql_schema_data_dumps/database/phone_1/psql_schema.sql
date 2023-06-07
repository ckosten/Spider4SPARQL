begin transaction;
     create table if not exists chip_model (
     model_name text,
     launch_year real,
     ram_mib real,
     rom_mib real,
     slots text,
     wifi text,
     bluetooth text,
     primary key (model_name)
     );
     create table if not exists screen_mode (
     graphics_mode real,
     char_cells text,
     pixels text,
     hardware_colours real,
     used_kb real,
     map text,
     type text,
     primary key (graphics_mode)
     );
     
     create table if not exists phone (
     company_name text,
     hardware_model_name text,
     accreditation_type text,
     accreditation_level text,
     date text,
     chip_model text,
     screen_mode real,
     primary key(hardware_model_name),
     foreign key (screen_mode) references screen_mode(graphics_mode),
     foreign key (chip_model) references chip_model(model_name)
     );
     commit;
