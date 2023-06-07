BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "machine" (
"Machine_ID" int,
"Making_Year" int,
"Class" text,
"Team" text,
"Machine_series" text,
"value_points" real,
"quality_rank" int,
PRIMARY KEY ("Machine_ID")
);
INSERT INTO "machine" VALUES(1,1991,'125cc','Hero Sports TS- Honda','RS125',105.0,2);
INSERT INTO "machine" VALUES(2,1992,'125cc','Marlboro Pileri - Honda','RS125',57.0,1);
INSERT INTO "machine" VALUES(3,1993,'125cc','Marlboro Pileri - Honda','RS125',129.0,4);
INSERT INTO "machine" VALUES(4,1994,'125cc','Givi Racing- Honda','RS125',194.0,5);
INSERT INTO "machine" VALUES(5,1995,'125cc','Givi Racing- Honda','RS125',65.0,3);
INSERT INTO "machine" VALUES(6,1996,'125cc','Honda','RS125',126.0,7);
INSERT INTO "machine" VALUES(7,1997,'125cc','Honda','RS125',238.0,8);
INSERT INTO "machine" VALUES(8,1998,'125cc','Team Givi- Honda LCR','RS125',62.0,13);
INSERT INTO "machine" VALUES(9,1999,'125cc','Team Givi- Honda LCR','RS125',171.0,11);
CREATE TABLE IF NOT EXISTS "repair" (
"repair_ID" int,
"name" text,
"Launch_Date" text,
"Notes" text,
PRIMARY KEY ("repair_ID")
);
INSERT INTO "repair" VALUES(1,'Discoverer','21 Jan 2009','repair Failed. Failed to achieve orbit');
INSERT INTO "repair" VALUES(2,'Discoverer 1','28 Feb 2009','First object in polar orbit');
INSERT INTO "repair" VALUES(3,'Discoverer 3','03 Jun 2009','repair failed. Failed to achieve orbit');
INSERT INTO "repair" VALUES(4,'OPS 3236','13 Jun 2014','First object in polar orbit');
INSERT INTO "repair" VALUES(5,'OPS 3467','24 Mar 2014','repair failed. Guidance system failed. No orbit.');
INSERT INTO "repair" VALUES(6,'OPS 3754','19 Jun 2014','Out-of-focus area on some film.');
INSERT INTO "repair" VALUES(7,'OPS 3491','10 Jun 2014','Cameras operated satisfactorily');
INSERT INTO "repair" VALUES(8,'OPS 3042','05 Aug 2014','Cameras operated successfully.');
INSERT INTO "repair" VALUES(9,'OPS 3360','18 Nov 2014','Cameras operated successfully.');
CREATE TABLE IF NOT EXISTS "repair_assignment" (
"technician_id" int,
"repair_ID" int,
"Machine_ID" int,
PRIMARY Key ("technician_id","repair_ID","Machine_ID"),
FOREIGN KEY (technician_id) REFERENCES technician(technician_id),
FOREIGN KEY (repair_ID) REFERENCES repair(repair_ID),
FOREIGN KEY (Machine_ID) REFERENCES machine(Machine_ID)
);
INSERT INTO "repair_assignment" VALUES(1,1,1);
INSERT INTO "repair_assignment" VALUES(2,2,2);
INSERT INTO "repair_assignment" VALUES(3,3,3);
INSERT INTO "repair_assignment" VALUES(1,4,7);
INSERT INTO "repair_assignment" VALUES(1,5,6);
INSERT INTO "repair_assignment" VALUES(1,2,3);
INSERT INTO "repair_assignment" VALUES(1,8,7);
INSERT INTO "repair_assignment" VALUES(5,5,2);
INSERT INTO "repair_assignment" VALUES(7,2,4);
CREATE TABLE IF NOT EXISTS "technician" (
"technician_id" real,
"Name" text,
"Team" text,
"Starting_Year" real,
"Age" int,
PRIMARY Key ("technician_id")
);
INSERT INTO "technician" VALUES(1.0,'Joe Sewell','NYY',2012.0,37);
INSERT INTO "technician" VALUES(2.0,'John Brown','NYY',2013.0,36);
INSERT INTO "technician" VALUES(3.0,'Tony Sewell','CLE',2005.0,43);
INSERT INTO "technician" VALUES(4.0,'Mark Sewell','CLE',2009.0,28);
INSERT INTO "technician" VALUES(5.0,'Charlie Hollocher','CHC',2002.0,35);
INSERT INTO "technician" VALUES(6.0,'Lou Boudreau','CLE',2016.0,32);
INSERT INTO "technician" VALUES(7.0,'Eddie Collins','CWS',2005.0,45);
INSERT INTO "technician" VALUES(8.0,'Joe Cochrane','CLE',2006.0,46);
INSERT INTO "technician" VALUES(9.0,'Eddie Collins','CWS',2003.0,47);
INSERT INTO "technician" VALUES(10.0,'Mickey Cochrane','PHA',2009.0,38);
COMMIT;
