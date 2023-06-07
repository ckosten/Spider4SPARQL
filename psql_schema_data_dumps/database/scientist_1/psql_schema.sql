create table if not exists scientists (
       ssn int,
       name char(30) not null,
       primary key (ssn)
     );
     
     create table if not exists projects (
       code char(4),
       name char(50) not null,
       hours int,
       primary key (code)
     );
     	
     create table if not exists assignedto (
       scientist int not null,
       project char(4) not null,
       primary key (scientist, project),
       foreign key (scientist) references scientists (ssn),
       foreign key (project) references projects (code)
     );
     
