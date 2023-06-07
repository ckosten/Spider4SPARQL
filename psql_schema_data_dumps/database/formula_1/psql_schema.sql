create table if not exists circuits (
    circuitid integer primary key,
      circuitref text,
      name text,
      location text,
      country text,
      lat real,
      lng real,
      alt text,
      url text
    );
    create table if not exists races (
    raceid integer primary key,
      year integer,
      round integer,
      circuitid integer,
      name text,
      date text,
      time text,
      url text,
      foreign key (circuitid) references circuits(circuitid)
    );
    create table if not exists drivers (
    driverid integer primary key,
      driverref text,
      number text,
      code text,
      forename text,
      surname text,
      dob text,
      nationality text,
      url text
    );
    create table if not exists status (
    statusid integer primary key,
      status text
    );
    create table if not exists seasons (
    year integer primary key,
      url text
    );
    create table if not exists constructors (
    	constructorid integer primary key,
      constructorref text,
      name text,
      nationality text,
      url text
    );
    create table if not exists constructorstandings (
       constructorstandingsid integer primary key,
      raceid integer,
      constructorid integer,
      points real,
      position integer,
      positiontext text,
      wins integer,
      foreign key(constructorid) references constructors(constructorid),
      foreign key(raceid) references races(raceid)
    );
    create table if not exists results (
    resultid integer primary key,
      raceid integer,
      driverid integer,
      constructorid integer,
      number integer,
      grid integer,
      position text,
      positiontext text,
      positionorder integer,
      points real,
      laps text,
      time text,
      milliseconds text,
      fastestlap text,
      rank text,
      fastestlaptime text,
      fastestlapspeed text,
      statusid integer,
      foreign key(constructorid) references constructors(constructorid),
      foreign key(raceid) references races(raceid),
      foreign key (driverid) references drivers(driverid)
    );
    create table if not exists driverstandings (
    driverstandingsid integer primary key,
      raceid integer,
      driverid integer,
      points real,
      position integer,
      positiontext text,
      wins integer,
      foreign key(raceid) references races(raceid),
      foreign key (driverid) references drivers(driverid)
    );
    create table if not exists constructorresults (
    constructorresultsid integer primary key,
      raceid integer,
      constructorid integer,
      points real,
      status text,
      foreign key(constructorid) references constructors(constructorid),
      foreign key(raceid) references races(raceid)
    );
    create table if not exists qualifying (
    qualifyid integer primary key,
      raceid integer,
      driverid integer,
      constructorid integer,
      number integer,
      position integer,
      q1 text,
      q2 text,
      q3 text,
      foreign key(constructorid) references constructors(constructorid),
      foreign key(raceid) references races(raceid),
      foreign key (driverid) references drivers(driverid)
    );
    create table if not exists pitstops (
    raceid integer,
      driverid integer,
      stop integer,
      lap integer,
      time text,
      duration text,
      milliseconds integer,
      primary key (raceid, driverid, stop),
      foreign key(raceid) references races(raceid),
      foreign key (driverid) references drivers(driverid)
    );
    create table if not exists laptimes (
    raceid integer,
      driverid integer,
      lap integer,
      position integer,
      time text,
      milliseconds integer,
      primary key(raceid, driverid, lap),
      foreign key(raceid) references races(raceid),
      foreign key (driverid) references drivers(driverid)
    );
