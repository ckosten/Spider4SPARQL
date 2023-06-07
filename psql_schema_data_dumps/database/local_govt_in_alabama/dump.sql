BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Events (
Event_ID INTEGER NOT NULL,
Service_ID INTEGER NOT NULL,
Event_Details VARCHAR(255),
PRIMARY KEY (Event_ID),
FOREIGN KEY (Service_ID) REFERENCES Services (Service_ID)
);
INSERT INTO "Events" VALUES(3,5,'Success');
INSERT INTO "Events" VALUES(8,8,'Success');
INSERT INTO "Events" VALUES(13,8,'Fail');
INSERT INTO "Events" VALUES(16,2,'Fail');
INSERT INTO "Events" VALUES(17,5,'Fail');
INSERT INTO "Events" VALUES(38,6,'Fail');
INSERT INTO "Events" VALUES(40,6,'Fail');
INSERT INTO "Events" VALUES(43,8,'Fail');
INSERT INTO "Events" VALUES(48,8,'Fail');
INSERT INTO "Events" VALUES(57,5,'Success');
INSERT INTO "Events" VALUES(60,2,'Fail');
INSERT INTO "Events" VALUES(74,2,'Success');
INSERT INTO "Events" VALUES(80,5,'Success');
INSERT INTO "Events" VALUES(95,2,'Fail');
INSERT INTO "Events" VALUES(96,2,'Success');
CREATE TABLE IF NOT EXISTS Participants (
Participant_ID INTEGER NOT NULL,
Participant_Type_Code CHAR(15) NOT NULL,
Participant_Details VARCHAR(255),
PRIMARY KEY (Participant_ID)
);
INSERT INTO "Participants" VALUES(9,'Organizer','Karlee Batz');
INSERT INTO "Participants" VALUES(26,'Organizer','Vilma Schinner');
INSERT INTO "Participants" VALUES(28,'Organizer','Lupe Deckow');
INSERT INTO "Participants" VALUES(36,'Organizer','Kenyatta Kuhn');
INSERT INTO "Participants" VALUES(37,'Participant','Miss Kaci Lebsack');
INSERT INTO "Participants" VALUES(38,'Organizer','Macy Mayer DDS');
INSERT INTO "Participants" VALUES(60,'Participant','Dewitt Walter');
INSERT INTO "Participants" VALUES(63,'Participant','Prof. Michelle Maggio Jr.');
INSERT INTO "Participants" VALUES(64,'Participant','Dr. Jaydon Renner');
INSERT INTO "Participants" VALUES(66,'Participant','Justyn Lebsack');
INSERT INTO "Participants" VALUES(75,'Participant','Berniece Weimann');
INSERT INTO "Participants" VALUES(86,'Organizer','Neil Blick');
INSERT INTO "Participants" VALUES(90,'Participant','Dedrick Ebert');
INSERT INTO "Participants" VALUES(96,'Organizer','Miss Joyce Cremin');
INSERT INTO "Participants" VALUES(98,'Participant','Dr. Kris Deckow');
CREATE TABLE IF NOT EXISTS Participants_in_Events (
Event_ID INTEGER NOT NULL,
Participant_ID INTEGER NOT NULL,
PRIMARY KEY (Event_ID, Participant_ID),
FOREIGN KEY (Participant_ID) REFERENCES Participants (Participant_ID),
FOREIGN KEY (Event_ID) REFERENCES Events (Event_ID)
);
INSERT INTO "Participants_in_Events" VALUES(3,26);
INSERT INTO "Participants_in_Events" VALUES(3,66);
INSERT INTO "Participants_in_Events" VALUES(8,86);
INSERT INTO "Participants_in_Events" VALUES(13,64);
INSERT INTO "Participants_in_Events" VALUES(13,90);
INSERT INTO "Participants_in_Events" VALUES(16,60);
INSERT INTO "Participants_in_Events" VALUES(17,37);
INSERT INTO "Participants_in_Events" VALUES(17,66);
INSERT INTO "Participants_in_Events" VALUES(38,66);
INSERT INTO "Participants_in_Events" VALUES(40,37);
INSERT INTO "Participants_in_Events" VALUES(40,86);
INSERT INTO "Participants_in_Events" VALUES(57,90);
INSERT INTO "Participants_in_Events" VALUES(60,26);
INSERT INTO "Participants_in_Events" VALUES(80,36);
INSERT INTO "Participants_in_Events" VALUES(80,66);
INSERT INTO "Participants_in_Events" VALUES(80,96);
INSERT INTO "Participants_in_Events" VALUES(95,63);
INSERT INTO "Participants_in_Events" VALUES(96,90);
CREATE TABLE IF NOT EXISTS Services (
Service_ID INTEGER NOT NULL,
Service_Type_Code CHAR(15) NOT NULL,
PRIMARY KEY (Service_ID)
);
INSERT INTO "Services" VALUES(2,'Marriage');
INSERT INTO "Services" VALUES(5,'Death Proof');
INSERT INTO "Services" VALUES(6,'Birth Proof');
INSERT INTO "Services" VALUES(8,'Property Change');
COMMIT;
