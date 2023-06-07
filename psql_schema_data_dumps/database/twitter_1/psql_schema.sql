create table if not exists user_profiles (
                                              uid int not null,
                                              name varchar(255) default null,
                                              email varchar(255) default null,
                                              partitionid int default null,
                                              followers int default null, primary key (uid));
 create table if not exists follows (
       f1 int not null,
       f2 int not null,
       primary key (f1,f2),
       foreign key (f1) references user_profiles(uid),
       foreign key (f2) references user_profiles(uid)
     
     );
     create table if not exists tweets (
       id bigint not null,
       uid int not null,
       text char(140) not null,
       createdate timestamp default current_timestamp,
       primary key (id),
       foreign key (uid) references user_profiles(uid)
     );
 
