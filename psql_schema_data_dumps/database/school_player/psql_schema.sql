
     
     create table if not exists school (
     school_id int,
     school text,
     location text,
     enrollment real,
     founded real,
     denomination text,
     boys_or_girls text,
     day_or_boarding text,
     year_entered_competition real,
     school_colors text,
     primary key (school_id)
     );
     
     
     
     
     create table if not exists school_details (
     school_id int,
     nickname text,
     colors text,
     league text,
     class text,
     division text,
     primary key (school_id),
     foreign key (school_id) references school(school_id)
     );
     
     
     
     
     create table if not exists school_performance (
     school_id int,
     school_year text,
     class_a text,
     class_aa text,
     primary key (school_id,school_year),
     foreign key (school_id) references school(school_id)
     );
     
     
     
     create table if not exists player (
     player_id int,
     player text,
     team text,
     age int,
     position text,
     school_id int,
     primary key (player_id),
     foreign key (school_id) references school(school_id)
     );
     
