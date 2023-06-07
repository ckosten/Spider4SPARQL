BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "gymnast" (
"Gymnast_ID" int,
"Floor_Exercise_Points" real,
"Pommel_Horse_Points" real,
"Rings_Points" real,
"Vault_Points" real,
"Parallel_Bars_Points" real,
"Horizontal_Bar_Points" real,
"Total_Points" real,
PRIMARY KEY ("Gymnast_ID"),
FOREIGN KEY ("Gymnast_ID") REFERENCES "people"("People_ID")
);
INSERT INTO "gymnast" VALUES(1,9.725,9.737,9.512,9.575,9.762,9.75,58.061);
INSERT INTO "gymnast" VALUES(2,9.7,9.625,9.625,9.65,9.587,9.737,57.924);
INSERT INTO "gymnast" VALUES(4,8.987,9.75,9.75,9.65,9.787,9.725,57.649);
INSERT INTO "gymnast" VALUES(6,9.762,9.325,9.475,9.762,9.562,9.55,57.436);
INSERT INTO "gymnast" VALUES(7,9.687,9.675,9.3,9.537,9.725,9.5,57.424);
INSERT INTO "gymnast" VALUES(8,9.65,9.712,9.487,9.637,9.5,9.412,57.398);
INSERT INTO "gymnast" VALUES(10,9.412,9.525,9.712,9.55,9.625,9.55,57.374);
CREATE TABLE IF NOT EXISTS "people" (
"People_ID" int,
"Name" text,
"Age" real,
"Height" real,
"Hometown" text,
PRIMARY KEY ("People_ID")
);
INSERT INTO "people" VALUES(1,'Paul Hamm',24.0,1.71,'Santo Domingo');
INSERT INTO "people" VALUES(2,'Lorraine Súarez Carmona',21.0,1.75,'Bonao');
INSERT INTO "people" VALUES(3,'Ashley Pérez Cabrera',19.0,1.7,'Miami');
INSERT INTO "people" VALUES(4,'Elizabeth Quiñónez Aroyo',20.0,1.71,'Santo Domingo');
INSERT INTO "people" VALUES(5,'Eve Tatiana Cruz Oviedo',19.0,1.72,'Santo Domingo');
INSERT INTO "people" VALUES(6,'Nadia Caba Rodríguez',22.0,1.79,'Santo Domingo');
INSERT INTO "people" VALUES(7,'Clary Sermina Delgado Cid',21.0,1.75,'Santiago de los Caballeros');
INSERT INTO "people" VALUES(8,'Marina Castro Medina',20.0,1.76,'Santo Domingo');
INSERT INTO "people" VALUES(9,'Rosa Clarissa Ortíz Melo',23.0,1.81,'La Romana');
INSERT INTO "people" VALUES(10,'Endis de los Santos Álvarez',24.0,1.72,'Los Alcarrizos');
COMMIT;
