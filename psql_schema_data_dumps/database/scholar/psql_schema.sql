
     
     
     create table if not exists venue (
       venueid integer not null
     ,  venuename varchar(100) default null
     ,  primary key (venueid)
     );
     
     
     
     create table if not exists author (
       authorid integer not null
     ,  authorname varchar(50) default null
     ,  primary key (authorid)
     );
     
     
     create table if not exists dataset (
       datasetid integer not null
     ,  datasetname varchar(50) default null
     ,  primary key (datasetid)
     );
     
     
     create table if not exists journal (
       journalid integer not null
     ,  journalname varchar(100) default null
     ,  primary key (journalid)
     );
     
     create table if not exists keyphrase (
       keyphraseid integer not null
     ,  keyphrasename varchar(50) default null
     ,  primary key (keyphraseid)
     );
     
     
     create table if not exists paper (
       paperid integer not null
     ,  title varchar(300) default null
     ,  venueid integer default null
     ,  year integer default null
     ,  numciting integer default null
     ,  numcitedby integer default null
     ,  journalid integer default null
     ,  primary key (paperid)
     ,  foreign key(journalid) references journal(journalid)
     ,  foreign key(venueid) references venue(venueid)
     );
     
     
     
     create table if not exists cite (
       citingpaperid integer not null
     ,  citedpaperid integer not null
     ,  primary key (citingpaperid,citedpaperid)
     ,  foreign key(citedpaperid) references paper(paperid)
     ,  foreign key(citingpaperid) references paper(paperid)
     );
     
     
     create table if not exists paperdataset (
       paperid integer default null
     ,  datasetid integer default null
     ,  primary key (datasetid, paperid)
     );
     
     
     
     create table if not exists paperkeyphrase (
       paperid integer default null
     ,  keyphraseid integer default null
     ,  primary key (keyphraseid,paperid)
     ,  foreign key(paperid) references paper(paperid)
     ,  foreign key(keyphraseid) references keyphrase(keyphraseid)
     );
     
     
     create table if not exists writes (
       paperid integer default null
     ,  authorid integer default null
     ,  primary key (paperid,authorid)
     ,  foreign key(paperid) references paper(paperid)
     ,  foreign key(authorid) references author(authorid)
     );
     
