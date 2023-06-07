BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Friend(
	student_id int, 
	friend_id int,
	primary key (student_id,friend_id),
	foreign key(student_id) references Highschooler(ID),
	foreign key (friend_id) references Highschooler(ID)
);
INSERT INTO "Friend" VALUES(1510,1381);
INSERT INTO "Friend" VALUES(1510,1689);
INSERT INTO "Friend" VALUES(1689,1709);
INSERT INTO "Friend" VALUES(1381,1247);
INSERT INTO "Friend" VALUES(1709,1247);
INSERT INTO "Friend" VALUES(1689,1782);
INSERT INTO "Friend" VALUES(1782,1468);
INSERT INTO "Friend" VALUES(1782,1316);
INSERT INTO "Friend" VALUES(1782,1304);
INSERT INTO "Friend" VALUES(1468,1101);
INSERT INTO "Friend" VALUES(1468,1641);
INSERT INTO "Friend" VALUES(1101,1641);
INSERT INTO "Friend" VALUES(1247,1911);
INSERT INTO "Friend" VALUES(1247,1501);
INSERT INTO "Friend" VALUES(1911,1501);
INSERT INTO "Friend" VALUES(1501,1934);
INSERT INTO "Friend" VALUES(1316,1934);
INSERT INTO "Friend" VALUES(1934,1304);
INSERT INTO "Friend" VALUES(1304,1661);
INSERT INTO "Friend" VALUES(1661,1025);
CREATE TABLE IF NOT EXISTS Highschooler(
	ID int primary key, 
	name text, 
	grade int);
INSERT INTO "Highschooler" VALUES(1510,'Jordan',9);
INSERT INTO "Highschooler" VALUES(1689,'Gabriel',9);
INSERT INTO "Highschooler" VALUES(1381,'Tiffany',9);
INSERT INTO "Highschooler" VALUES(1709,'Cassandra',9);
INSERT INTO "Highschooler" VALUES(1101,'Haley',10);
INSERT INTO "Highschooler" VALUES(1782,'Andrew',10);
INSERT INTO "Highschooler" VALUES(1468,'Kris',10);
INSERT INTO "Highschooler" VALUES(1641,'Brittany',10);
INSERT INTO "Highschooler" VALUES(1247,'Alexis',11);
INSERT INTO "Highschooler" VALUES(1316,'Austin',11);
INSERT INTO "Highschooler" VALUES(1911,'Gabriel',11);
INSERT INTO "Highschooler" VALUES(1501,'Jessica',11);
INSERT INTO "Highschooler" VALUES(1304,'Jordan',12);
INSERT INTO "Highschooler" VALUES(1025,'John',12);
INSERT INTO "Highschooler" VALUES(1934,'Kyle',12);
INSERT INTO "Highschooler" VALUES(1661,'Logan',12);
CREATE TABLE IF NOT EXISTS Likes(
	student_id int, 
	liked_id int,
	primary key (student_id, liked_id),
        foreign key (liked_id) references Highschooler(ID),
        foreign key (student_id) references Highschooler(ID)
);
INSERT INTO "Likes" VALUES(1689,1709);
INSERT INTO "Likes" VALUES(1709,1689);
INSERT INTO "Likes" VALUES(1782,1709);
INSERT INTO "Likes" VALUES(1911,1247);
INSERT INTO "Likes" VALUES(1247,1468);
INSERT INTO "Likes" VALUES(1641,1468);
INSERT INTO "Likes" VALUES(1316,1304);
INSERT INTO "Likes" VALUES(1501,1934);
INSERT INTO "Likes" VALUES(1934,1501);
INSERT INTO "Likes" VALUES(1025,1101);
COMMIT;
