BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Dorm (
       dormid		INTEGER,
       dorm_name	VARCHAR(20),
       student_capacity	INTEGER,
       gender			VARCHAR(1)
);
INSERT INTO "Dorm" VALUES(100,'Smith Hall',85,'X');
INSERT INTO "Dorm" VALUES(110,'Bud Jones Hall',116,'M');
INSERT INTO "Dorm" VALUES(140,'Fawlty Towers',355,'X');
INSERT INTO "Dorm" VALUES(160,'Dorm-plex 2000',400,'X');
INSERT INTO "Dorm" VALUES(109,'Anonymous Donor Hall',128,'F');
INSERT INTO "Dorm" VALUES(117,'University Hovels',40,'X');
INSERT INTO "Dorm" VALUES(104,'Grad Student Asylum',256,'X');
CREATE TABLE IF NOT EXISTS Dorm_amenity (
       amenid			INTEGER,
       amenity_name		VARCHAR(25)
);
INSERT INTO "Dorm_amenity" VALUES(900,'TV Lounge');
INSERT INTO "Dorm_amenity" VALUES(901,'Study Room');
INSERT INTO "Dorm_amenity" VALUES(902,'Pub in Basement');
INSERT INTO "Dorm_amenity" VALUES(903,'Carpeted Rooms');
INSERT INTO "Dorm_amenity" VALUES(904,'4 Walls');
INSERT INTO "Dorm_amenity" VALUES(930,'Roof');
INSERT INTO "Dorm_amenity" VALUES(931,'Ethernet Ports');
INSERT INTO "Dorm_amenity" VALUES(932,'Air Conditioning');
INSERT INTO "Dorm_amenity" VALUES(922,'Heat');
INSERT INTO "Dorm_amenity" VALUES(950,'Working Fireplaces');
INSERT INTO "Dorm_amenity" VALUES(955,'Kitchen in Every Room');
INSERT INTO "Dorm_amenity" VALUES(909,'Allows Pets');
CREATE TABLE IF NOT EXISTS Has_amenity (
       dormid			INTEGER,
       amenid				INTEGER,
	FOREIGN KEY (dormid) REFERENCES Dorm(dormid),
	FOREIGN KEY (amenid) REFERENCES Dorm_amenity(amenid)
);
INSERT INTO "Has_amenity" VALUES(109,900);
INSERT INTO "Has_amenity" VALUES(109,901);
INSERT INTO "Has_amenity" VALUES(109,903);
INSERT INTO "Has_amenity" VALUES(109,904);
INSERT INTO "Has_amenity" VALUES(109,930);
INSERT INTO "Has_amenity" VALUES(109,931);
INSERT INTO "Has_amenity" VALUES(109,932);
INSERT INTO "Has_amenity" VALUES(109,922);
INSERT INTO "Has_amenity" VALUES(104,901);
INSERT INTO "Has_amenity" VALUES(104,904);
INSERT INTO "Has_amenity" VALUES(104,930);
INSERT INTO "Has_amenity" VALUES(160,900);
INSERT INTO "Has_amenity" VALUES(160,901);
INSERT INTO "Has_amenity" VALUES(160,902);
INSERT INTO "Has_amenity" VALUES(160,903);
INSERT INTO "Has_amenity" VALUES(160,931);
INSERT INTO "Has_amenity" VALUES(160,904);
INSERT INTO "Has_amenity" VALUES(160,930);
INSERT INTO "Has_amenity" VALUES(160,922);
INSERT INTO "Has_amenity" VALUES(160,932);
INSERT INTO "Has_amenity" VALUES(160,950);
INSERT INTO "Has_amenity" VALUES(160,955);
INSERT INTO "Has_amenity" VALUES(160,909);
INSERT INTO "Has_amenity" VALUES(100,901);
INSERT INTO "Has_amenity" VALUES(100,903);
INSERT INTO "Has_amenity" VALUES(100,904);
INSERT INTO "Has_amenity" VALUES(100,930);
INSERT INTO "Has_amenity" VALUES(100,922);
INSERT INTO "Has_amenity" VALUES(117,930);
INSERT INTO "Has_amenity" VALUES(110,901);
INSERT INTO "Has_amenity" VALUES(110,903);
INSERT INTO "Has_amenity" VALUES(110,904);
INSERT INTO "Has_amenity" VALUES(110,930);
INSERT INTO "Has_amenity" VALUES(110,922);
INSERT INTO "Has_amenity" VALUES(140,909);
INSERT INTO "Has_amenity" VALUES(140,900);
INSERT INTO "Has_amenity" VALUES(140,902);
INSERT INTO "Has_amenity" VALUES(140,904);
INSERT INTO "Has_amenity" VALUES(140,930);
INSERT INTO "Has_amenity" VALUES(140,932);
CREATE TABLE IF NOT EXISTS Lives_in (
       stuid 	      INTEGER,
       dormid		INTEGER,
       room_number	INTEGER,
	FOREIGN KEY (stuid) REFERENCES Student(StuID),
        FOREIGN KEY (dormid) REFERENCES Dorm(dormid)
);
INSERT INTO "Lives_in" VALUES(1001,109,105);
INSERT INTO "Lives_in" VALUES(1002,100,112);
INSERT INTO "Lives_in" VALUES(1003,100,124);
INSERT INTO "Lives_in" VALUES(1004,140,215);
INSERT INTO "Lives_in" VALUES(1005,160,333);
INSERT INTO "Lives_in" VALUES(1007,140,113);
INSERT INTO "Lives_in" VALUES(1008,160,334);
INSERT INTO "Lives_in" VALUES(1009,140,332);
INSERT INTO "Lives_in" VALUES(1010,160,443);
INSERT INTO "Lives_in" VALUES(1011,140,102);
INSERT INTO "Lives_in" VALUES(1012,160,333);
INSERT INTO "Lives_in" VALUES(1014,104,211);
INSERT INTO "Lives_in" VALUES(1015,160,443);
INSERT INTO "Lives_in" VALUES(1016,140,301);
INSERT INTO "Lives_in" VALUES(1017,140,319);
INSERT INTO "Lives_in" VALUES(1018,140,225);
INSERT INTO "Lives_in" VALUES(1020,160,405);
INSERT INTO "Lives_in" VALUES(1021,160,405);
INSERT INTO "Lives_in" VALUES(1022,100,153);
INSERT INTO "Lives_in" VALUES(1023,160,317);
INSERT INTO "Lives_in" VALUES(1024,100,151);
INSERT INTO "Lives_in" VALUES(1025,160,317);
INSERT INTO "Lives_in" VALUES(1027,140,208);
INSERT INTO "Lives_in" VALUES(1028,110,48);
INSERT INTO "Lives_in" VALUES(1029,140,418);
INSERT INTO "Lives_in" VALUES(1030,109,211);
INSERT INTO "Lives_in" VALUES(1031,100,112);
INSERT INTO "Lives_in" VALUES(1032,109,105);
INSERT INTO "Lives_in" VALUES(1033,117,3);
INSERT INTO "Lives_in" VALUES(1034,160,105);
INSERT INTO "Lives_in" VALUES(1035,100,124);
CREATE TABLE IF NOT EXISTS Student (
        StuID        INTEGER PRIMARY KEY,
        LName        VARCHAR(12),
        Fname        VARCHAR(12),
        Age      INTEGER,
        Sex      VARCHAR(1),
        Major        INTEGER,
        Advisor      INTEGER,
        city_code    VARCHAR(3)
 );
INSERT INTO "Student" VALUES(1001,'Smith','Linda',18,'F',600,1121,'BAL');
INSERT INTO "Student" VALUES(1002,'Kim','Tracy',19,'F',600,7712,'HKG');
INSERT INTO "Student" VALUES(1003,'Jones','Shiela',21,'F',600,7792,'WAS');
INSERT INTO "Student" VALUES(1004,'Kumar','Dinesh',20,'M',600,8423,'CHI');
INSERT INTO "Student" VALUES(1005,'Gompers','Paul',26,'M',600,1121,'YYZ');
INSERT INTO "Student" VALUES(1006,'Schultz','Andy',18,'M',600,1148,'BAL');
INSERT INTO "Student" VALUES(1007,'Apap','Lisa',18,'F',600,8918,'PIT');
INSERT INTO "Student" VALUES(1008,'Nelson','Jandy',20,'F',600,9172,'BAL');
INSERT INTO "Student" VALUES(1009,'Tai','Eric',19,'M',600,2192,'YYZ');
INSERT INTO "Student" VALUES(1010,'Lee','Derek',17,'M',600,2192,'HOU');
INSERT INTO "Student" VALUES(1011,'Adams','David',22,'M',600,1148,'PHL');
INSERT INTO "Student" VALUES(1012,'Davis','Steven',20,'M',600,7723,'PIT');
INSERT INTO "Student" VALUES(1014,'Norris','Charles',18,'M',600,8741,'DAL');
INSERT INTO "Student" VALUES(1015,'Lee','Susan',16,'F',600,8721,'HKG');
INSERT INTO "Student" VALUES(1016,'Schwartz','Mark',17,'M',600,2192,'DET');
INSERT INTO "Student" VALUES(1017,'Wilson','Bruce',27,'M',600,1148,'LON');
INSERT INTO "Student" VALUES(1018,'Leighton','Michael',20,'M',600,1121,'PIT');
INSERT INTO "Student" VALUES(1019,'Pang','Arthur',18,'M',600,2192,'WAS');
INSERT INTO "Student" VALUES(1020,'Thornton','Ian',22,'M',520,7271,'NYC');
INSERT INTO "Student" VALUES(1021,'Andreou','George',19,'M',520,8722,'NYC');
INSERT INTO "Student" VALUES(1022,'Woods','Michael',17,'M',540,8722,'PHL');
INSERT INTO "Student" VALUES(1023,'Shieber','David',20,'M',520,8722,'NYC');
INSERT INTO "Student" VALUES(1024,'Prater','Stacy',18,'F',540,7271,'BAL');
INSERT INTO "Student" VALUES(1025,'Goldman','Mark',18,'M',520,7134,'PIT');
INSERT INTO "Student" VALUES(1026,'Pang','Eric',19,'M',520,7134,'HKG');
INSERT INTO "Student" VALUES(1027,'Brody','Paul',18,'M',520,8723,'LOS');
INSERT INTO "Student" VALUES(1028,'Rugh','Eric',20,'M',550,2311,'ROC');
INSERT INTO "Student" VALUES(1029,'Han','Jun',17,'M',100,2311,'PEK');
INSERT INTO "Student" VALUES(1030,'Cheng','Lisa',21,'F',550,2311,'SFO');
INSERT INTO "Student" VALUES(1031,'Smith','Sarah',20,'F',550,8772,'PHL');
INSERT INTO "Student" VALUES(1032,'Brown','Eric',20,'M',550,8772,'ATL');
INSERT INTO "Student" VALUES(1033,'Simms','William',18,'M',550,8772,'NAR');
INSERT INTO "Student" VALUES(1034,'Epp','Eric',18,'M',50,5718,'BOS');
INSERT INTO "Student" VALUES(1035,'Schmidt','Sarah',26,'F',50,5718,'WAS');
COMMIT;
