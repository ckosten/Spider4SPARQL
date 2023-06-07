BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS AssignedTo (
  Scientist int not null,
  Project char(4) not null,
  Primary Key (Scientist, Project),
  Foreign Key (Scientist) references Scientists (SSN),
  Foreign Key (Project) references Projects (Code)
);
INSERT INTO "AssignedTo" VALUES(123234877,'AeH1');
INSERT INTO "AssignedTo" VALUES(152934485,'AeH3');
INSERT INTO "AssignedTo" VALUES(222364883,'Ast3');
INSERT INTO "AssignedTo" VALUES(326587417,'Ast3');
INSERT INTO "AssignedTo" VALUES(332154719,'Bte1');
INSERT INTO "AssignedTo" VALUES(546523478,'Che1');
INSERT INTO "AssignedTo" VALUES(631231482,'Ast3');
INSERT INTO "AssignedTo" VALUES(654873219,'Che1');
INSERT INTO "AssignedTo" VALUES(745685214,'AeH3');
INSERT INTO "AssignedTo" VALUES(845657245,'Ast1');
INSERT INTO "AssignedTo" VALUES(845657246,'Ast2');
INSERT INTO "AssignedTo" VALUES(332569843,'AeH4');
CREATE TABLE IF NOT EXISTS Projects (
  Code Char(4),
  Name Char(50) not null,
  Hours int,
  Primary Key (Code)
);
INSERT INTO "Projects" VALUES('AeH1','Winds: Studying Bernoullis Principle',156);
INSERT INTO "Projects" VALUES('AeH2','Aerodynamics and Bridge Design',189);
INSERT INTO "Projects" VALUES('AeH3','Aerodynamics and Gas Mileage',256);
INSERT INTO "Projects" VALUES('AeH4','Aerodynamics and Ice Hockey',789);
INSERT INTO "Projects" VALUES('AeH5','Aerodynamics of a Football',98);
INSERT INTO "Projects" VALUES('AeH6','Aerodynamics of Air Hockey',89);
INSERT INTO "Projects" VALUES('Ast1','A Matter of Time',112);
INSERT INTO "Projects" VALUES('Ast2','A Puzzling Parallax',299);
INSERT INTO "Projects" VALUES('Ast3','Build Your Own Telescope',6546);
INSERT INTO "Projects" VALUES('Bte1','Juicy: Extracting Apple Juice with Pectinase',321);
INSERT INTO "Projects" VALUES('Bte2','A Magnetic Primer Designer',9684);
INSERT INTO "Projects" VALUES('Bte3','Bacterial Transformation Efficiency',321);
INSERT INTO "Projects" VALUES('Che1','A Silver-Cleaning Battery',545);
INSERT INTO "Projects" VALUES('Che2','A Soluble Separation Solution',778);
CREATE TABLE IF NOT EXISTS Scientists (
  SSN int,
  Name Char(30) not null,
  Primary Key (SSN)
);
INSERT INTO "Scientists" VALUES(123234877,'Michael Rogers');
INSERT INTO "Scientists" VALUES(152934485,'Anand Manikutty');
INSERT INTO "Scientists" VALUES(222364883,'Carol Smith');
INSERT INTO "Scientists" VALUES(326587417,'Joe Stevens');
INSERT INTO "Scientists" VALUES(332154719,'Mary-Anne Foster');
INSERT INTO "Scientists" VALUES(332569843,'George ODonnell');
INSERT INTO "Scientists" VALUES(546523478,'John Doe');
INSERT INTO "Scientists" VALUES(631231482,'David Smith');
INSERT INTO "Scientists" VALUES(654873219,'Zacary Efron');
INSERT INTO "Scientists" VALUES(745685214,'Eric Goldsmith');
INSERT INTO "Scientists" VALUES(845657245,'Elizabeth Doe');
INSERT INTO "Scientists" VALUES(845657246,'Kumar Swamy');
COMMIT;
