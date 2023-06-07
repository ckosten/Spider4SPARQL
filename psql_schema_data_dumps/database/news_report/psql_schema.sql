
     
     create table if not exists event (
         event_id int,
         date text,
         venue text,
         name text,
         event_attendance int,
         primary key (event_id)
     );
     
     create table if not exists journalist (
         journalist_id int,
         name text,
         nationality text,
         age text,
         years_working int,
         primary key (journalist_id)
     );
     
     
     
     
     
     
     create table if not exists news_report (
         journalist_id int,
         event_id int,
         work_type text,
         primary key (journalist_id,event_id),
         foreign key (journalist_id) references journalist(journalist_id),
         foreign key (event_id) references event(event_id)
     );
     
     
