BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Authors (
  authID INTEGER,
  lname TEXT,
  fname TEXT,
  PRIMARY KEY (authID)
);
INSERT INTO "Authors" VALUES(50,'Gibbons','Jeremy');
INSERT INTO "Authors" VALUES(51,'Hinze','Ralf');
INSERT INTO "Authors" VALUES(52,'James','Daniel W. H.');
INSERT INTO "Authors" VALUES(53,'Shivers','Olin');
INSERT INTO "Authors" VALUES(54,'Turon','Aaron');
INSERT INTO "Authors" VALUES(55,'Ahmed','Amal');
INSERT INTO "Authors" VALUES(56,'Blume','Matthias');
INSERT INTO "Authors" VALUES(57,'Ohori','Atsushi');
INSERT INTO "Authors" VALUES(58,'Ueno','Katsuhiro');
INSERT INTO "Authors" VALUES(59,'Pouillard','Nicolas');
INSERT INTO "Authors" VALUES(60,'Weirich','Stephanie');
INSERT INTO "Authors" VALUES(61,'Yorgey','Brent');
INSERT INTO "Authors" VALUES(62,'Sheard','Tim');
CREATE TABLE IF NOT EXISTS Authorship (
  authID INTEGER,
  instID INTEGER,
  paperID INTEGER,
  authOrder INTEGER,
  PRIMARY KEY (authID, instID, paperID),
  FOREIGN KEY (authID) REFERENCES Authors (authID),
  FOREIGN KEY (instID) REFERENCES Inst (instID),
  FOREIGN KEY (paperID) REFERENCES Papers (paperID)
);
INSERT INTO "Authorship" VALUES(50,1000,200,1);
INSERT INTO "Authorship" VALUES(51,1000,200,2);
INSERT INTO "Authorship" VALUES(51,1000,201,1);
INSERT INTO "Authorship" VALUES(52,1000,201,2);
INSERT INTO "Authorship" VALUES(53,1010,202,1);
INSERT INTO "Authorship" VALUES(54,1010,202,2);
INSERT INTO "Authorship" VALUES(55,1020,203,1);
INSERT INTO "Authorship" VALUES(56,1030,203,2);
INSERT INTO "Authorship" VALUES(57,1040,204,1);
INSERT INTO "Authorship" VALUES(58,1040,204,2);
INSERT INTO "Authorship" VALUES(59,1070,205,1);
INSERT INTO "Authorship" VALUES(60,1050,206,1);
INSERT INTO "Authorship" VALUES(61,1050,206,2);
INSERT INTO "Authorship" VALUES(62,1060,206,3);
CREATE TABLE IF NOT EXISTS Inst (
  instID INTEGER,
  name TEXT,
  country TEXT, -- the home country of the institution (this is obviously an impoverished model)
  PRIMARY KEY (instID)
);
INSERT INTO "Inst" VALUES(1000,'University of Oxford','UK');
INSERT INTO "Inst" VALUES(1010,'Northeastern University','USA');
INSERT INTO "Inst" VALUES(1020,'Indiana University','USA');
INSERT INTO "Inst" VALUES(1030,'Google','USA');
INSERT INTO "Inst" VALUES(1040,'Tohoku University','Japan');
INSERT INTO "Inst" VALUES(1050,'University of Pennsylvania','USA');
INSERT INTO "Inst" VALUES(1060,'Portland State University','Japan');
INSERT INTO "Inst" VALUES(1070,'INRIA','France');
CREATE TABLE IF NOT EXISTS Papers (
  paperID INTEGER,
  title TEXT,
  PRIMARY KEY (paperID)
);
INSERT INTO "Papers" VALUES(200,'Just do it: Simple Monadic Equational Reasoning');
INSERT INTO "Papers" VALUES(201,'Proving the Unique Fixed-Point Principle Correct: An Adventure with Category Theory');
INSERT INTO "Papers" VALUES(202,'Functional Pearl: Modular Rollback through Control Logging');
INSERT INTO "Papers" VALUES(203,'An Equivalence-Preserving CPS Translation via Multi-Language Semantics');
INSERT INTO "Papers" VALUES(204,'Making Standard ML a Practical Database Programming Language');
INSERT INTO "Papers" VALUES(205,'Nameless, Painless');
INSERT INTO "Papers" VALUES(206,'Binders Unbound');
COMMIT;
