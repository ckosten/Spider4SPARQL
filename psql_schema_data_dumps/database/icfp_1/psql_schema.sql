create table if not exists inst (
       instid integer,
       name text,
       country text, -- the home country of the institution (this is obviously an impoverished model)
       primary key (instid)
     );
     create table if not exists authors (
       authid integer,
       lname text,
       fname text,
       primary key (authid)
     );
     create table if not exists papers (
       paperid integer,
       title text,
       primary key (paperid)
     );
     create table if not exists authorship (
       authid integer,
       instid integer,
       paperid integer,
       authorder integer,
       primary key (authid, instid, paperid),
       foreign key (authid) references authors (authid),
       foreign key (instid) references inst (instid),
       foreign key (paperid) references papers (paperid)
     );
