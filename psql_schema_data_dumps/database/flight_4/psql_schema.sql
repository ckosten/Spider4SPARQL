
 create table if not exists airlines (
                                         alid integer primary key,
                                         name text,
                                         iata varchar(2),
                                         icao varchar(3),
                                         callsign text,
                                         country text,
                                         active varchar(2)
 );
 create table if not exists airports (
                                         apid integer primary key,
                                         name text not null,
                                         city text,
                                         country text,
                                         x real,
                                         y real,
                                         elevation bigint,
                                         iata  varchar(3),
                                         icao varchar(4)
 
 );
 
 create table if not exists routes (
       rid integer primary key,
       dst_apid integer,
       dst_ap varchar(4),
       src_apid bigint,
       src_ap varchar(4),
       alid bigint,
       airline varchar(4),
       codeshare text,
   
       foreign key(dst_apid) references airports(apid),
       foreign key(src_apid) references airports(apid),
       foreign key(alid)     references airlines(alid)
    );
 
