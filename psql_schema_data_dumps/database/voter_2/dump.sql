BEGIN TRANSACTION;
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
CREATE TABLE IF NOT EXISTS Voting_record (
       StuID    	INTEGER,
       Registration_Date		VARCHAR(12),
       Election_Cycle		VARCHAR(12),
       President_Vote		INTEGER,
       Vice_President_Vote		INTEGER,
       Secretary_Vote		INTEGER,
       Treasurer_Vote		INTEGER,
       Class_President_Vote		INTEGER,
       Class_Senator_Vote		INTEGER,
       FOREIGN KEY(StuID) REFERENCES Student(StuID), 
       FOREIGN KEY(President_Vote) REFERENCES Student(StuID),
       FOREIGN KEY(Vice_President_Vote) REFERENCES Student(StuID),
       FOREIGN KEY(Secretary_Vote) REFERENCES Student(StuID),
       FOREIGN KEY(Treasurer_Vote) REFERENCES Student(StuID),
       FOREIGN KEY(Class_President_Vote) REFERENCES Student(StuID),
       FOREIGN KEY(Class_Senator_Vote) REFERENCES Student(StuID)
);
INSERT INTO "Voting_record" VALUES(1001,'08/30/2015','Spring',1004,1007,1010,1035,1001,1028);
INSERT INTO "Voting_record" VALUES(1002,'08/30/2014','Spring',1014,1007,1020,1025,1021,1028);
INSERT INTO "Voting_record" VALUES(1003,'08/30/2013','Spring',1004,1017,1030,1035,1031,1028);
INSERT INTO "Voting_record" VALUES(1004,'08/30/2013','Spring',1024,1017,1020,1035,1011,1028);
INSERT INTO "Voting_record" VALUES(1005,'08/30/2012','Spring',1024,1017,1010,1035,1021,1028);
INSERT INTO "Voting_record" VALUES(1001,'08/30/2015','Fall',1004,1007,1010,1035,1021,1028);
INSERT INTO "Voting_record" VALUES(1002,'08/30/2014','Fall',1004,1007,1020,1035,1021,1028);
INSERT INTO "Voting_record" VALUES(1003,'08/30/2013','Fall',1004,1017,1020,1035,1031,1028);
INSERT INTO "Voting_record" VALUES(1004,'08/30/2013','Fall',1024,1017,1020,1035,1011,1018);
INSERT INTO "Voting_record" VALUES(1005,'08/30/2012','Fall',1024,1017,1010,1035,1021,1028);
COMMIT;
