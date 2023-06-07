BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "market" (
"Market_ID" int,
"District" text,
"Num_of_employees" int,
"Num_of_shops" real,
"Ranking" int,
PRIMARY KEY ("Market_ID")
);
INSERT INTO "market" VALUES(1,'Alberta',1966,40.0,1);
INSERT INTO "market" VALUES(2,'British Columbia',1965,49.0,21);
INSERT INTO "market" VALUES(3,'New Brunswick',1978,10.0,4);
INSERT INTO "market" VALUES(4,'Nova Scotia',1968,32.0,5);
INSERT INTO "market" VALUES(5,'Ontario',1958,54.0,3);
INSERT INTO "market" VALUES(6,'Quebec',1958,54.0,8);
CREATE TABLE IF NOT EXISTS "phone" (
"Name" text,
"Phone_ID" int,
"Memory_in_G" int,
"Carrier" text,
"Price" real,
PRIMARY KEY ("Phone_ID")
);
INSERT INTO "phone" VALUES('IPhone 5s',1,32,'Sprint',320.0);
INSERT INTO "phone" VALUES('IPhone 6',5,128,'Sprint',480.0);
INSERT INTO "phone" VALUES('IPhone 6s',2,128,'TMobile',699.0);
INSERT INTO "phone" VALUES('IPhone 7',4,16,'TMobile',899.0);
INSERT INTO "phone" VALUES('IPhone X',3,64,'TMobile',1000.0);
CREATE TABLE IF NOT EXISTS "phone_market" (
"Market_ID" int,
"Phone_ID" text,
"Num_of_stock" int,
PRIMARY KEY ("Market_ID","Phone_ID"),
FOREIGN KEY ("Market_ID") REFERENCES market("Market_ID"),
FOREIGN KEY ("Phone_ID") REFERENCES phone("Phone_ID")
);
INSERT INTO "phone_market" VALUES(1,'1',2232);
INSERT INTO "phone_market" VALUES(2,'2',4324);
INSERT INTO "phone_market" VALUES(1,'4',874);
INSERT INTO "phone_market" VALUES(5,'1',682);
INSERT INTO "phone_market" VALUES(2,'3',908);
INSERT INTO "phone_market" VALUES(6,'3',1632);
COMMIT;
