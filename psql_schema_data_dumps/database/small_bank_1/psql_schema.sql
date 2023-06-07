create table if not exists accounts (
         custid      bigint      not null primary key,
         name        varchar(64) not null
     );
     create table if not exists savings (
         custid      bigint      not null primary key,
         balance        float       not null,
         foreign key (custid) references accounts (custid)
     );
     create table if not exists checking (
         custid      bigint      not null primary key,
         balance        float       not null,
         foreign key (custid) references accounts (custid)
     );
