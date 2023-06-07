
     
     create table if not exists songs ( 
     	songid integer primary key, 
     	title text 
     );
     create table if not exists albums ( 
     	aid integer primary key, 
     	title text, 
     	year integer, 
     	label text, 
     	type text );
     create table if not exists band ( 
     	id integer primary key, 
     	firstname text, 
     	lastname text );
     create table if not exists instruments ( 
     	songid integer, 
     	bandmateid integer, 
     	instrument text ,
     	primary key(songid, bandmateid, instrument),
     	foreign key (songid) references songs(songid),
     	foreign key (bandmateid) references band(id)
     );
     create table if not exists performance ( 
     	songid integer, 
     	bandmate integer, 
     	stageposition text,
     	primary key(songid, bandmate),
     	foreign key (songid) references songs(songid),
     	foreign key (bandmate) references band(id)
     );
     create table if not exists tracklists ( 
     	albumid integer, 
     	position integer, 
     	songid integer ,
     	primary key(albumid, position),
     	foreign key (songid) references songs(songid),
     	foreign key (albumid) references albums(aid)
     );
     create table if not exists vocals ( 
     	songid integer, 
     	bandmate integer, 
     	type text,
     	primary key(songid, bandmate),
     	foreign key (songid) references songs(songid),
     	foreign key (bandmate) references band(id)
     );
     
