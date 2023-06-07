create table if not exists student (
            stuid        integer primary key,
            lname        varchar(12),
            fname        varchar(12),
            age      integer,
            sex      varchar(1),
            major        integer,
            advisor      integer,
            city_code    varchar(3)
     );
    
    create table if not exists restaurant (
           resid       integer primary key,
           resname     varchar(100),
           address     varchar(100),
           rating integer
    );
   
   create table if not exists restaurant_type (
                                    restypeid            integer primary key,
                                    restypename          varchar(40),
                                    restypedescription   varchar(100)
   );
    
    create table if not exists type_of_restaurant (
           resid       integer,
           restypeid   integer,
           foreign key(resid) references restaurant(resid),
           foreign key(restypeid) references restaurant_type(restypeid)
    );
   
    
    create table if not exists visits_restaurant (
           stuid      integer,
           resid      integer,
           time       timestamp,
           spent      float,
           foreign key(stuid) references student(stuid),
           foreign key(resid) references restaurant(resid)
    );
    
    
