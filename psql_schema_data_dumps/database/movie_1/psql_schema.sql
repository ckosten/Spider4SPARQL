-- dbext:type=sqlite:dbname=movie_rating.db
     
 
     /* create the schema for our tables */
     create table if not exists movie(
     	mid int primary key, 
     	title text, 
     	year int, 
     	director text
     );
     create table if not exists reviewer(
     	rid int primary key, 
     	name text);
     
     create table if not exists rating(
     	rid int, 
     	mid int, 
     	stars int, 
     	ratingdate date,
     	foreign key (mid) references movie(mid),
     	foreign key (rid) references reviewer(rid)
     );
     
     /* populate the tables with our data */
