BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Movie(
	mID int primary key, 
	title text, 
	year int, 
	director text
);
INSERT INTO "Movie" VALUES(101,'Gone with the Wind',1939,'Victor Fleming');
INSERT INTO "Movie" VALUES(102,'Star Wars',1977,'George Lucas');
INSERT INTO "Movie" VALUES(103,'The Sound of Music',1965,'Robert Wise');
INSERT INTO "Movie" VALUES(104,'E.T.',1982,'Steven Spielberg');
INSERT INTO "Movie" VALUES(105,'Titanic',1997,'James Cameron');
INSERT INTO "Movie" VALUES(106,'Snow White',1937,NULL);
INSERT INTO "Movie" VALUES(107,'Avatar',2009,'James Cameron');
INSERT INTO "Movie" VALUES(108,'Raiders of the Lost Ark',1981,'Steven Spielberg');
CREATE TABLE IF NOT EXISTS Rating(
	rID int, 
	mID int, 
	stars int, 
	ratingDate date,
	FOREIGN KEY (mID) references Movie(mID),
	FOREIGN KEY (rID) references Reviewer(rID)
);
INSERT INTO "Rating" VALUES(201,101,2,'2011-01-22');
INSERT INTO "Rating" VALUES(201,101,4,'2011-01-27');
INSERT INTO "Rating" VALUES(202,106,4,NULL);
INSERT INTO "Rating" VALUES(203,103,2,'2011-01-20');
INSERT INTO "Rating" VALUES(203,108,4,'2011-01-12');
INSERT INTO "Rating" VALUES(203,108,2,'2011-01-30');
INSERT INTO "Rating" VALUES(204,101,3,'2011-01-09');
INSERT INTO "Rating" VALUES(205,103,3,'2011-01-27');
INSERT INTO "Rating" VALUES(205,104,2,'2011-01-22');
INSERT INTO "Rating" VALUES(205,108,4,NULL);
INSERT INTO "Rating" VALUES(206,107,3,'2011-01-15');
INSERT INTO "Rating" VALUES(206,106,5,'2011-01-19');
INSERT INTO "Rating" VALUES(207,107,5,'2011-01-20');
INSERT INTO "Rating" VALUES(208,104,3,'2011-01-02');
CREATE TABLE IF NOT EXISTS Reviewer(
	rID int primary key, 
	name text);
INSERT INTO "Reviewer" VALUES(201,'Sarah Martinez');
INSERT INTO "Reviewer" VALUES(202,'Daniel Lewis');
INSERT INTO "Reviewer" VALUES(203,'Brittany Harris');
INSERT INTO "Reviewer" VALUES(204,'Mike Anderson');
INSERT INTO "Reviewer" VALUES(205,'Chris Jackson');
INSERT INTO "Reviewer" VALUES(206,'Elizabeth Thomas');
INSERT INTO "Reviewer" VALUES(207,'James Cameron');
INSERT INTO "Reviewer" VALUES(208,'Ashley White');
COMMIT;
