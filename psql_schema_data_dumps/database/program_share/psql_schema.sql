
     
     
     create table if not exists program (
     program_id int,
     name text,
     origin text,
     launch real,
     owner text,
     primary key (program_id)
     );
     
     
     create table if not exists channel (
     channel_id int,
     name text,
     owner text,
     share_in_percent real,
     rating_in_percent real,
     primary key (channel_id)
     );
     
     
     
     
     
     
     
     create table if not exists broadcast (
     channel_id int,
     program_id int,
     time_of_day text,
     primary key (channel_id,program_id),
     foreign key (channel_id) references channel(channel_id),
     foreign key (program_id) references program(program_id)
     );
     
     
     
     
     
     create table if not exists broadcast_share (
     channel_id int,
     program_id int,
     date text,
     share_in_percent real,
     primary key (channel_id,program_id),
     foreign key (channel_id) references channel(channel_id),
     foreign key (program_id) references program(program_id)
     );
     
