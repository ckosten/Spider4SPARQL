create table if not exists person (
       name varchar(20) primary key,
       age integer,
       city text,
       gender text,
       job text
     );
     
     create table if not exists personfriend (
       name varchar(20),
       friend varchar(20),
       year integer,
       foreign key (name) references person(name),
       foreign key (friend) references person(name)
     );
     
      insert into person values ('dan',26,'chicago','female','student');
     
