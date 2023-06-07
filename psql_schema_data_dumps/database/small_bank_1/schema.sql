CREATE TABLE ACCOUNTS (
    custid      BIGINT      NOT NULL PRIMARY KEY,
    name        VARCHAR(64) NOT NULL
);
CREATE TABLE SAVINGS (
    custid      BIGINT      NOT NULL PRIMARY KEY,
    balance        FLOAT       NOT NULL,
    FOREIGN KEY (custid) REFERENCES ACCOUNTS (custid)
);
CREATE TABLE CHECKING (
    custid      BIGINT      NOT NULL PRIMARY KEY,
    balance        FLOAT       NOT NULL,
    FOREIGN KEY (custid) REFERENCES ACCOUNTS (custid)
);
