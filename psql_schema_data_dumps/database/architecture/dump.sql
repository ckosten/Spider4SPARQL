BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "architect" (
"id" text,
"name" text,
"nationality" text,
"gender" text,
primary key("id")
);
INSERT INTO "architect" VALUES('1','Frank Lloyd Wright','American','male');
INSERT INTO "architect" VALUES('2','Frank Gehry','Canadian','male');
INSERT INTO "architect" VALUES('3','Zaha Hadid','Iraqi, British','female');
INSERT INTO "architect" VALUES('4','Mies Van Der Rohe','German, American','male');
INSERT INTO "architect" VALUES('5','Le Corbusier','Swiss, French','male');
CREATE TABLE IF NOT EXISTS "bridge" (
"architect_id" int,
"id" int,
"name" text,
"location" text,
"length_meters" real,
"length_feet" real,
primary key("id"),
foreign key ("architect_id" ) references architect("id")
);
INSERT INTO "bridge" VALUES(1,1,'Xian Ren Qiao (Fairy Bridge)','Guangxi , China',121.0,400.0);
INSERT INTO "bridge" VALUES(2,2,'Landscape Arch','Arches National Park , Utah , USA',88.0,290.0);
INSERT INTO "bridge" VALUES(3,3,'Kolob Arch','Zion National Park , Utah , USA',87.0,287.0);
INSERT INTO "bridge" VALUES(4,4,'Aloba Arch','Ennedi Plateau , Chad',76.0,250.0);
INSERT INTO "bridge" VALUES(5,5,'Morning Glory Natural Bridge','Negro Bill Canyon , Utah , USA',74.0,243.0);
INSERT INTO "bridge" VALUES(5,6,'Rainbow Bridge','Glen Canyon National Recreation Area , Utah , USA',71.0,234.0);
INSERT INTO "bridge" VALUES(4,7,'Gaotun Natural Bridge','Guizhou , China',70.0,230.0);
INSERT INTO "bridge" VALUES(3,8,'Sipapu Natural Bridge','Natural Bridges National Monument , Utah , USA',69.0,225.0);
INSERT INTO "bridge" VALUES(2,9,'Stevens Arch','Escalante Canyon , Utah , USA',67.0,220.0);
INSERT INTO "bridge" VALUES(1,10,'Shipton''s Arch','Xinjiang , China',65.0,212.0);
INSERT INTO "bridge" VALUES(1,11,'Jiangzhou Arch','Guangxi , China',65.0,212.0);
INSERT INTO "bridge" VALUES(1,12,'Hazarchishma Natural Bridge','Bamiyan Province , Afghanistan',64.2,210.6);
INSERT INTO "bridge" VALUES(2,13,'Outlaw Arch','Dinosaur National Monument , Colorado , USA',63.0,206.0);
INSERT INTO "bridge" VALUES(2,14,'Snake Bridge','Sanostee , New Mexico , USA',62.0,204.0);
INSERT INTO "bridge" VALUES(5,15,'Wrather Arch','Wrather Canyon , Arizona , USA',75.0,246.0);
CREATE TABLE IF NOT EXISTS "mill" (
"architect_id" int,
"id" int,
"location" text,
"name" text,
"type" text,
"built_year" int,
"notes" text,
primary key ("id"),
foreign key ("architect_id" ) references architect("id")
);
INSERT INTO "mill" VALUES(1,1,'Coswarem','Le Vieux Molen','Grondzeiler',1840,'Molenechos (Dutch)');
INSERT INTO "mill" VALUES(1,2,'Donceel','Moulin Bertrand','Grondzeiler',1890,'Molenechos (Dutch)');
INSERT INTO "mill" VALUES(2,3,'Fexhe-le-haut-Clocher','Moulin de Fexhe','Grondzeiler',1843,'Molenechos (Dutch)');
INSERT INTO "mill" VALUES(3,4,'Momalle','Moulin de Momalle','Bergmolen',1850,'Molenechos (Dutch)');
INSERT INTO "mill" VALUES(4,5,'Othée','Moulin du Château','Grondzeiler',1856,'Molenechos (Dutch)');
INSERT INTO "mill" VALUES(4,6,'Pousset','Moulin de Pousset','Grondzeiler',1819,'Molenechos (Dutch)');
COMMIT;
