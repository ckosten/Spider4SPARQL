BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS artist(
	artist_name varchar2(50) not null,
	country varchar2(20),
	gender varchar2(20),
	preferred_genre varchar2(50),
	constraint a_name primary key(artist_name),
	foreign key(preferred_genre) references genre(g_name) ON DELETE CASCADE
);
INSERT INTO "artist" VALUES('Shrikanta','India','Male','tagore');
INSERT INTO "artist" VALUES('Prity','Bangladesh','Female','nazrul');
INSERT INTO "artist" VALUES('Farida','Bangladesh','Female','folk');
INSERT INTO "artist" VALUES('Topu','India','Female','modern');
INSERT INTO "artist" VALUES('Enrique','USA','Male','blues');
INSERT INTO "artist" VALUES('Michel','UK','Male','pop');
CREATE TABLE IF NOT EXISTS files(
	f_id number(10) not null,
	artist_name varchar2(50),
	file_size varchar2(20),
	duration varchar2(20),
	formats varchar2(20),
	primary key(f_id),
	foreign key(artist_name) references artist(artist_name) ON DELETE CASCADE
);
INSERT INTO "files" VALUES(1,'Shrikanta','3.78 MB','3:45','mp4');
INSERT INTO "files" VALUES(2,'Prity','4.12 MB','2:56','mp3');
INSERT INTO "files" VALUES(3,'Farida','3.69 MB','4:12','mp4');
INSERT INTO "files" VALUES(4,'Enrique','4.58 MB','5:23','mp4');
INSERT INTO "files" VALUES(5,'Michel','5.10 MB','4:34','mp3');
INSERT INTO "files" VALUES(6,'Topu','4.10 MB','4:30','mp4');
CREATE TABLE IF NOT EXISTS genre(
	g_name varchar2(20) not null,
	rating varchar2(10),
	most_popular_in varchar2(50),
	primary key(g_name)
);
INSERT INTO "genre" VALUES('tagore','8','Bangladesh');
INSERT INTO "genre" VALUES('nazrul','7','Bangladesh');
INSERT INTO "genre" VALUES('folk','9','Sylhet,Chittagong,Kustia');
INSERT INTO "genre" VALUES('modern','8','Bangladesh');
INSERT INTO "genre" VALUES('blues','7','Canada');
INSERT INTO "genre" VALUES('pop','9','America');
CREATE TABLE IF NOT EXISTS song(
	song_name varchar2(50),
	artist_name varchar2(50),
	country varchar2(20),
	f_id number(10),
    	genre_is varchar2(20),
	rating number(10) check(rating>0 and rating<11),
	languages varchar2(20),
	releasedate Date, 
	resolution number(10) not null,
	constraint s_name primary key(song_name),
	foreign key(artist_name) references artist(artist_name) ON DELETE CASCADE,
	foreign key(f_id) references files(f_id) ON DELETE CASCADE,
	foreign key(genre_is) references genre(g_name) ON DELETE CASCADE
);
INSERT INTO "song" VALUES('Tumi robe nirobe','Shrikanta','India',1,'tagore',8,'bangla','28-AUG-2011',1080);
INSERT INTO "song" VALUES('Shukno patar nupur pae','Prity','Bangladesh',2,'nazrul',5,'bangla','21-SEP-1997',512);
INSERT INTO "song" VALUES('Ami opar hoye','Farida','Bangladesh',3,'folk',7,'bangla','7-APR-2001',320);
INSERT INTO "song" VALUES('My love','Enrique','USA',4,'blues',6,'english','24-JAN-2007',1080);
INSERT INTO "song" VALUES('Just beat it','Michel','UK',5,'pop',8,'english','17-MAR-2002',720);
INSERT INTO "song" VALUES('Aj ei akash','Topu','India',6,'modern',10,'bangla','27-MAR-2004',320);
COMMIT;
