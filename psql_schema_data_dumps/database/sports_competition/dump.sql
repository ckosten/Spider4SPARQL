BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "club" (
"Club_ID" int,
"name" text,
"Region" text,
"Start_year" text,
PRIMARY KEY ("Club_ID")
);
INSERT INTO "club" VALUES(1,'AIB','USA','2009');
INSERT INTO "club" VALUES(2,'BK Slide','UK','1998');
INSERT INTO "club" VALUES(3,'IFG','China','2005');
INSERT INTO "club" VALUES(4,'ASC','Japan','2001');
INSERT INTO "club" VALUES(5,'HGS2','England','2000');
INSERT INTO "club" VALUES(6,'HSBIF','Brazil','2011');
CREATE TABLE IF NOT EXISTS "club_rank" (
"Rank" real,
"Club_ID" int,
"Gold" real,
"Silver" real,
"Bronze" real,
"Total" real,
PRIMARY KEY ("Rank","Club_ID")
FOREIGN KEY (Club_ID) REFERENCES club(Club_ID)
);
INSERT INTO "club_rank" VALUES(1.0,2,11.0,11.0,9.0,31.0);
INSERT INTO "club_rank" VALUES(2.0,3,8.0,7.0,6.0,21.0);
INSERT INTO "club_rank" VALUES(3.0,1,7.0,4.0,2.0,13.0);
INSERT INTO "club_rank" VALUES(4.0,4,4.0,2.0,6.0,12.0);
INSERT INTO "club_rank" VALUES(5.0,5,3.0,3.0,0.0,6.0);
INSERT INTO "club_rank" VALUES(6.0,6,2.0,1.0,0.0,3.0);
CREATE TABLE IF NOT EXISTS "competition" (
"Competition_ID" int,
"Year" real,
"Competition_type" text,
"Country" text,
PRIMARY KEY ("Competition_ID")
);
INSERT INTO "competition" VALUES(1,2006.0,'Friendly','Italy');
INSERT INTO "competition" VALUES(2,2006.0,'Friendly','Spain');
INSERT INTO "competition" VALUES(3,2006.0,'Friendly','Australia');
INSERT INTO "competition" VALUES(4,2006.0,'Friendly','Russia');
INSERT INTO "competition" VALUES(5,2007.0,'Friendly','Russia');
INSERT INTO "competition" VALUES(6,2007.0,'Friendly','Australia');
INSERT INTO "competition" VALUES(7,2007.0,'Tournament','Russia');
INSERT INTO "competition" VALUES(8,2007.0,'Tournament','Slovenia');
INSERT INTO "competition" VALUES(9,2007.0,'Tournament','Slovenia');
INSERT INTO "competition" VALUES(10,2007.0,'Friendly','Italy');
INSERT INTO "competition" VALUES(11,2007.0,'Friendly','Ireland');
CREATE TABLE IF NOT EXISTS "competition_result" (
"Competition_ID" int,
"Club_ID_1" int,
"Club_ID_2" int,
"Score" text,
PRIMARY KEY ("Competition_ID","Club_ID_1","Club_ID_2"),
FOREIGN KEY (Club_ID_1) REFERENCES club(Club_ID),
FOREIGN KEY (Club_ID_2) REFERENCES club(Club_ID),
FOREIGN KEY (Competition_ID) REFERENCES competition(Competition_ID)
);
INSERT INTO "competition_result" VALUES(1,1,2,'11:10');
INSERT INTO "competition_result" VALUES(2,3,2,'25:2');
INSERT INTO "competition_result" VALUES(10,4,2,'13:10');
INSERT INTO "competition_result" VALUES(4,1,2,'12:9');
INSERT INTO "competition_result" VALUES(5,1,4,'10:3');
INSERT INTO "competition_result" VALUES(6,1,6,'10:11');
CREATE TABLE IF NOT EXISTS "player" (
"Player_ID" int,
"name" text,
"Position" text,
"Club_ID" int,
"Apps" real,
"Tries" real,
"Goals" text,
"Points" real,
PRIMARY KEY ("Player_ID"),
FOREIGN KEY (Club_ID) REFERENCES club(Club_ID)
);
INSERT INTO "player" VALUES(1,'Michael Platt','Full Back',1,20.0,5.0,'0',20.0);
INSERT INTO "player" VALUES(2,'Dave Halley','Right Wing',2,23.0,9.0,'0',36.0);
INSERT INTO "player" VALUES(3,'James Evans','Right Centre',1,30.0,9.0,'0',36.0);
INSERT INTO "player" VALUES(4,'Tame Tupou','Left Wing',2,10.0,3.0,'0',12.0);
INSERT INTO "player" VALUES(5,'Iestyn Harris','Stand Off',4,27.0,3.0,'50/60',110.0);
INSERT INTO "player" VALUES(6,'Paul Deacon (c)','Scrum Half',4,20.0,3.0,'90/106',188.0);
INSERT INTO "player" VALUES(7,'Joe Vagana','Prop',5,19.0,1.0,'0/1',4.0);
INSERT INTO "player" VALUES(8,'Terry Newton','Hooker',5,26.0,9.0,'0',36.0);
INSERT INTO "player" VALUES(9,'Andy Lynch','Prop',2,29.0,5.0,'0',20.0);
INSERT INTO "player" VALUES(10,'David Solomona','Second Row',2,24.0,5.0,'0',20.0);
INSERT INTO "player" VALUES(11,'Glenn Morrison (vc)','Second Row',2,14.0,6.0,'0',24.0);
INSERT INTO "player" VALUES(12,'Jamie Langley (vc)','Loose Forward',2,28.0,2.0,'0',8.0);
INSERT INTO "player" VALUES(13,'Chris Feather','Prop',3,13.0,1.0,'0',4.0);
INSERT INTO "player" VALUES(14,'Matt Cook','Second Row',4,17.0,4.0,'0',16.0);
INSERT INTO "player" VALUES(15,'Sam Burgess','Loose Forward',4,23.0,8.0,'0',32.0);
COMMIT;
