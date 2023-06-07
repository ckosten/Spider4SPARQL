BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS aircraft(
	aid number(9,0) primary key,
	name varchar2(30),
	distance number(6,0));
INSERT INTO "aircraft" VALUES(1,'Boeing 747-400',8430);
INSERT INTO "aircraft" VALUES(2,'Boeing 737-800',3383);
INSERT INTO "aircraft" VALUES(3,'Airbus A340-300',7120);
INSERT INTO "aircraft" VALUES(4,'British Aerospace Jetstream 41',1502);
INSERT INTO "aircraft" VALUES(5,'Embraer ERJ-145',1530);
INSERT INTO "aircraft" VALUES(6,'SAAB 340',2128);
INSERT INTO "aircraft" VALUES(7,'Piper Archer III',520);
INSERT INTO "aircraft" VALUES(8,'Tupolev 154',4103);
INSERT INTO "aircraft" VALUES(16,'Schwitzer 2-33',30);
INSERT INTO "aircraft" VALUES(9,'Lockheed L1011',6900);
INSERT INTO "aircraft" VALUES(10,'Boeing 757-300',4010);
INSERT INTO "aircraft" VALUES(11,'Boeing 777-300',6441);
INSERT INTO "aircraft" VALUES(12,'Boeing 767-400ER',6475);
INSERT INTO "aircraft" VALUES(13,'Airbus A320',2605);
INSERT INTO "aircraft" VALUES(14,'Airbus A319',1805);
INSERT INTO "aircraft" VALUES(15,'Boeing 727',1504);
CREATE TABLE IF NOT EXISTS certificate(
	eid number(9,0),
	aid number(9,0),
	primary key(eid,aid),
	foreign key("eid") references employee("eid"),
	foreign key("aid") references aircraft("aid"));
INSERT INTO "certificate" VALUES(11564812,2);
INSERT INTO "certificate" VALUES(11564812,10);
INSERT INTO "certificate" VALUES(90873519,6);
INSERT INTO "certificate" VALUES(141582651,2);
INSERT INTO "certificate" VALUES(141582651,10);
INSERT INTO "certificate" VALUES(141582651,12);
INSERT INTO "certificate" VALUES(142519864,1);
INSERT INTO "certificate" VALUES(142519864,2);
INSERT INTO "certificate" VALUES(142519864,3);
INSERT INTO "certificate" VALUES(142519864,7);
INSERT INTO "certificate" VALUES(142519864,10);
INSERT INTO "certificate" VALUES(142519864,11);
INSERT INTO "certificate" VALUES(142519864,12);
INSERT INTO "certificate" VALUES(142519864,13);
INSERT INTO "certificate" VALUES(159542516,5);
INSERT INTO "certificate" VALUES(159542516,7);
INSERT INTO "certificate" VALUES(242518965,2);
INSERT INTO "certificate" VALUES(242518965,10);
INSERT INTO "certificate" VALUES(269734834,1);
INSERT INTO "certificate" VALUES(269734834,2);
INSERT INTO "certificate" VALUES(269734834,3);
INSERT INTO "certificate" VALUES(269734834,4);
INSERT INTO "certificate" VALUES(269734834,5);
INSERT INTO "certificate" VALUES(269734834,6);
INSERT INTO "certificate" VALUES(269734834,7);
INSERT INTO "certificate" VALUES(269734834,8);
INSERT INTO "certificate" VALUES(269734834,9);
INSERT INTO "certificate" VALUES(269734834,10);
INSERT INTO "certificate" VALUES(269734834,11);
INSERT INTO "certificate" VALUES(269734834,12);
INSERT INTO "certificate" VALUES(269734834,13);
INSERT INTO "certificate" VALUES(269734834,14);
INSERT INTO "certificate" VALUES(269734834,15);
INSERT INTO "certificate" VALUES(274878974,10);
INSERT INTO "certificate" VALUES(274878974,12);
INSERT INTO "certificate" VALUES(310454876,8);
INSERT INTO "certificate" VALUES(310454876,9);
INSERT INTO "certificate" VALUES(355548984,8);
INSERT INTO "certificate" VALUES(355548984,9);
INSERT INTO "certificate" VALUES(356187925,6);
INSERT INTO "certificate" VALUES(390487451,3);
INSERT INTO "certificate" VALUES(390487451,13);
INSERT INTO "certificate" VALUES(390487451,14);
INSERT INTO "certificate" VALUES(548977562,7);
INSERT INTO "certificate" VALUES(550156548,1);
INSERT INTO "certificate" VALUES(550156548,12);
INSERT INTO "certificate" VALUES(552455318,2);
INSERT INTO "certificate" VALUES(552455318,7);
INSERT INTO "certificate" VALUES(552455318,14);
INSERT INTO "certificate" VALUES(556784565,2);
INSERT INTO "certificate" VALUES(556784565,3);
INSERT INTO "certificate" VALUES(556784565,5);
INSERT INTO "certificate" VALUES(567354612,1);
INSERT INTO "certificate" VALUES(567354612,2);
INSERT INTO "certificate" VALUES(567354612,3);
INSERT INTO "certificate" VALUES(567354612,4);
INSERT INTO "certificate" VALUES(567354612,5);
INSERT INTO "certificate" VALUES(567354612,7);
INSERT INTO "certificate" VALUES(567354612,9);
INSERT INTO "certificate" VALUES(567354612,10);
INSERT INTO "certificate" VALUES(567354612,11);
INSERT INTO "certificate" VALUES(567354612,12);
INSERT INTO "certificate" VALUES(567354612,15);
INSERT INTO "certificate" VALUES(573284895,3);
INSERT INTO "certificate" VALUES(573284895,4);
INSERT INTO "certificate" VALUES(573284895,5);
INSERT INTO "certificate" VALUES(574489456,6);
INSERT INTO "certificate" VALUES(574489456,8);
INSERT INTO "certificate" VALUES(574489457,7);
CREATE TABLE IF NOT EXISTS employee(
	eid number(9,0) primary key,
	name varchar2(30),
	salary number(10,2));
INSERT INTO "employee" VALUES(242518965,'James Smith',120433);
INSERT INTO "employee" VALUES(141582651,'Mary Johnson',178345);
INSERT INTO "employee" VALUES(11564812,'John Williams',153972);
INSERT INTO "employee" VALUES(567354612,'Lisa Walker',256481);
INSERT INTO "employee" VALUES(552455318,'Larry West',101745);
INSERT INTO "employee" VALUES(550156548,'Karen Scott',205187);
INSERT INTO "employee" VALUES(390487451,'Lawrence Sperry',212156);
INSERT INTO "employee" VALUES(274878974,'Michael Miller',99890);
INSERT INTO "employee" VALUES(254099823,'Patricia Jones',24450);
INSERT INTO "employee" VALUES(356187925,'Robert Brown',44740);
INSERT INTO "employee" VALUES(355548984,'Angela Martinez',212156);
INSERT INTO "employee" VALUES(310454876,'Joseph Thompson',212156);
INSERT INTO "employee" VALUES(489456522,'Linda Davis',27984);
INSERT INTO "employee" VALUES(489221823,'Richard Jackson',23980);
INSERT INTO "employee" VALUES(548977562,'William Ward',84476);
INSERT INTO "employee" VALUES(310454877,'Chad Stewart',33546);
INSERT INTO "employee" VALUES(142519864,'Betty Adams',227489);
INSERT INTO "employee" VALUES(269734834,'George Wright',289950);
INSERT INTO "employee" VALUES(287321212,'Michael Miller',48090);
INSERT INTO "employee" VALUES(552455348,'Dorthy Lewis',152013);
INSERT INTO "employee" VALUES(248965255,'Barbara Wilson',43723);
INSERT INTO "employee" VALUES(159542516,'William Moore',48250);
INSERT INTO "employee" VALUES(348121549,'Haywood Kelly',32899);
INSERT INTO "employee" VALUES(90873519,'Elizabeth Taylor',32021);
INSERT INTO "employee" VALUES(486512566,'David Anderson',43001);
INSERT INTO "employee" VALUES(619023588,'Jennifer Thomas',54921);
INSERT INTO "employee" VALUES(15645489,'Donald King',18050);
INSERT INTO "employee" VALUES(556784565,'Mark Young',205187);
INSERT INTO "employee" VALUES(573284895,'Eric Cooper',114323);
INSERT INTO "employee" VALUES(574489456,'William Jones',105743);
INSERT INTO "employee" VALUES(574489457,'Milo Brooks',20);
CREATE TABLE IF NOT EXISTS flight(
	flno number(4,0) primary key,
	origin varchar2(20),
	destination varchar2(20),
	distance number(6,0),
	departure_date date,
	arrival_date date,
	price number(7,2),
    aid number(9,0),
    foreign key("aid") references aircraft("aid"));
INSERT INTO "flight" VALUES(99,'Los Angeles','Washington D.C.',2308,'04/12/2005 09:30','04/12/2005 09:40',235.98,1);
INSERT INTO "flight" VALUES(13,'Los Angeles','Chicago',1749,'04/12/2005 08:45','04/12/2005 08:45',220.98,3);
INSERT INTO "flight" VALUES(346,'Los Angeles','Dallas',1251,'04/12/2005 11:50','04/12/2005 07:05',182,2);
INSERT INTO "flight" VALUES(387,'Los Angeles','Boston',2606,'04/12/2005 07:03','04/12/2005 05:03',261.56,6);
INSERT INTO "flight" VALUES(7,'Los Angeles','Sydney',7487,'04/12/2005 05:30','04/12/2005 11:10',278.56,3);
INSERT INTO "flight" VALUES(2,'Los Angeles','Tokyo',5478,'04/12/2005 06:30','04/12/2005 03:55',780.99,9);
INSERT INTO "flight" VALUES(33,'Los Angeles','Honolulu',2551,'04/12/2005 09:15','04/12/2005 11:15',375.23,7);
INSERT INTO "flight" VALUES(34,'Los Angeles','Honolulu',2551,'04/12/2005 12:45','04/12/2005 03:18',425.98,5);
INSERT INTO "flight" VALUES(76,'Chicago','Los Angeles',1749,'04/12/2005 08:32','04/12/2005 10:03',220.98,9);
INSERT INTO "flight" VALUES(68,'Chicago','New York',802,'04/12/2005 09:00','04/12/2005 12:02',202.45,10);
COMMIT;
