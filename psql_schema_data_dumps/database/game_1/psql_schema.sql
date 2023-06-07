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
    
    create table if not exists video_games (
           gameid           integer primary key,
           gname            varchar(40),
           gtype            varchar(40)
    );
    
    create table if not exists plays_games (
           stuid                integer,
           gameid            integer,
           hours_played      integer,
           foreign key(gameid) references video_games(gameid),
           foreign key(stuid) references student(stuid)
    );
    
    create table if not exists sportsinfo (
      stuid integer,
      sportname varchar(32),
      hoursperweek integer,
      gamesplayed integer,
      onscholarship varchar(1),
      foreign key(stuid) references student(stuid)
    );
    
    
