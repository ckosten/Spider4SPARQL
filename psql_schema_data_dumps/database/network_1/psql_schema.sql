-- dbext:type=sqlite:dbname=social.db
    
    /* delete the tables if they already exist */
   
    
    /* create the schema for our tables */
    create table if not exists highschooler(
    	id int primary key, 
    	name text, 
    	grade int);
    create table if not exists friend(
    	student_id int, 
    	friend_id int,
    	primary key (student_id,friend_id),
    	foreign key(student_id) references highschooler(id),
    	foreign key (friend_id) references highschooler(id)
    );
    create table if not exists likes(
    	student_id int, 
    	liked_id int,
    	primary key (student_id, liked_id),
            foreign key (liked_id) references highschooler(id),
            foreign key (student_id) references highschooler(id)
    );
    
    /* populate the tables with our data */
