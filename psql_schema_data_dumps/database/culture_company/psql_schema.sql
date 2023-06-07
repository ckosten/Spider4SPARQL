
     create table if not exists book_club (
     book_club_id int,
     year int,
     author_or_editor text,
     book_title text,
     publisher text,
     category text,
     result text,
     primary key (book_club_id)
     );
     
     
     
     create table if not exists movie (
     movie_id int,
     title text,
     year int,
     director text,
     budget_million real,
     gross_worldwide int,
     primary key(movie_id)
     );
     
     
     
     
     create table if not exists culture_company (
     company_name text,
     type text,
     incorporated_in text,
     group_equity_shareholding real,
     book_club_id int,
     movie_id int,
     primary key(company_name),
     foreign key (book_club_id) references book_club(book_club_id),
     foreign key (movie_id) references movie(movie_id)
     );
     
     
