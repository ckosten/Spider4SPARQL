create table if not exists rooms ( 
     	roomid text primary key,
     	roomname text, 
     	beds integer, 
     	bedtype text, 
     	maxoccupancy integer, 
     	baseprice integer, 
     	decor text
     
     );
     create table if not exists reservations ( 
     	code integer primary key, 
     	room text, 
     	checkin text, 
     	checkout text, 
     	rate real, 
     	lastname text, 
     	firstname text, 
     	adults integer, 
     	kids integer,
     	foreign key (room) references rooms(roomid)
     );
