BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Person (
  name varchar(20) PRIMARY KEY,
  age INTEGER,
  city TEXT,
  gender TEXT,
  job TEXT
);
INSERT INTO "Person" VALUES('Alice',25,'new york city','female','student');
INSERT INTO "Person" VALUES('Bob',35,'salt lake city','male','engineer');
INSERT INTO "Person" VALUES('Zach',45,'austin','male','doctor');
INSERT INTO "Person" VALUES('Dan',26,'chicago','female','student');
CREATE TABLE IF NOT EXISTS PersonFriend (
  name varchar(20),
  friend varchar(20),
  year INTEGER,
  FOREIGN KEY (name) REFERENCES Person(name),
  FOREIGN KEY (friend) REFERENCES Person(name)
);
INSERT INTO "PersonFriend" VALUES('Alice','Bob',10);
INSERT INTO "PersonFriend" VALUES('Zach','Dan',12);
INSERT INTO "PersonFriend" VALUES('Bob','Zach',5);
INSERT INTO "PersonFriend" VALUES('Zach','Alice',6);
COMMIT;
