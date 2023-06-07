BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS bank (
branch_ID int PRIMARY KEY,
bname varchar(20),
no_of_customers int,
city varchar(10),
state varchar(20));
INSERT INTO "bank" VALUES(1,'morningside',203,'New York City','New York');
INSERT INTO "bank" VALUES(2,'downtown',123,'Salt Lake City','Utah');
INSERT INTO "bank" VALUES(3,'broadway',453,'New York City','New York');
INSERT INTO "bank" VALUES(4,'high',367,'Austin','Texas');
CREATE TABLE IF NOT EXISTS customer (
cust_ID varchar(3) PRIMARY KEY,
cust_name varchar(20),
acc_type char(1),
acc_bal int,
no_of_loans int,
credit_score int,
branch_ID int,
state varchar(20),
FOREIGN KEY(branch_ID) REFERENCES bank(branch_ID));
INSERT INTO "customer" VALUES('1','Mary','saving',2000,2,30,2,'Utah');
INSERT INTO "customer" VALUES('2','Jack','checking',1000,1,20,1,'Texas');
INSERT INTO "customer" VALUES('3','Owen','saving',800000,0,210,3,'New York');
CREATE TABLE IF NOT EXISTS loan (
loan_ID varchar(3) PRIMARY KEY,
loan_type varchar(15),
cust_ID varchar(3),
branch_ID varchar(3),
amount int,
FOREIGN KEY(branch_ID) REFERENCES bank(branch_ID),
FOREIGN KEY(Cust_ID) REFERENCES customer(Cust_ID));
INSERT INTO "loan" VALUES('1','Mortgages','1','1',2050);
INSERT INTO "loan" VALUES('2','Auto','1','2',3000);
INSERT INTO "loan" VALUES('3','Business','3','3',5000);
COMMIT;
