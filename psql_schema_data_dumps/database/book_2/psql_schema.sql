
   create table if not exists book (
                                       book_id int,
                                       title text,
                                       issues real,
                                       writer text,
                                       primary key (book_id)
       );
    create table if not exists publication (
    publication_id int,
    book_id int,
    publisher text,
    publication_date text,
    price real,
    primary key (publication_id),
    foreign key (book_id) references book(book_id)
    );
   
    
    
    
    
