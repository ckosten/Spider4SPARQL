drop table if exists albums;
     
     drop table if exists artists;
     
     drop table if exists customers;
     
     drop table if exists employees;
     
     drop table if exists genres;
     
     drop table if exists invoices;
     
     drop table if exists invoice_lines;
     
     drop table if exists media_types;
     
     drop table if exists playlists;
     
     drop table if exists playlist_tracks;
     
     drop table if exists tracks;
     
     
     /*******************************************************************************
        create tables
     ********************************************************************************/
     create table if not exists artists
     (
         id serial primary key,
         name varchar(120)
     );
     
     create table if not exists albums
     (
         id serial primary key ,
         title varchar(160)  not null,
         artist_id integer  not null,
         foreign key (artist_id) references artists (id)
         on delete no action on update no action
     );
     
     create table if not exists employees
     (
         id serial primary key ,
         last_name varchar(20)  not null,
         first_name varchar(20)  not null,
         title varchar(30),
         reports_to integer,
         birth_date timestamp,
         hire_date timestamp,
         address varchar(70),
         city varchar(40),
         state varchar(40),
         country varchar(40),
         postal_code varchar(10),
         phone varchar(24),
         fax varchar(24),
         email varchar(60),
         foreign key (reports_to) references employees (id)
         on delete no action on update no action
     );
     
     create table if not exists customers
     (
         id serial primary key ,
         first_name varchar(40)  not null,
         last_name varchar(20)  not null,
         company varchar(80),
         address varchar(70),
         city varchar(40),
         state varchar(40),
         country varchar(40),
         postal_code varchar(10),
         phone varchar(24),
         fax varchar(24),
         email varchar(60)  not null,
         support_rep_id integer,
         foreign key (support_rep_id) references employees (id)
         on delete no action on update no action
     );
     
     create table if not exists genres
     (
         id serial primary key ,
         name varchar(120)
     );
     
     create table if not exists invoices
     (
         id serial primary key ,
         customer_id integer  not null,
         invoice_date timestamp  not null,
         billing_address varchar(70),
         billing_city varchar(40),
         billing_state varchar(40),
         billing_country varchar(40),
         billing_postal_code varchar(10),
         total numeric(10,2)  not null,
         foreign key (customer_id) references customers (id)
         on delete no action on update no action
     );
     
     create table if not exists media_types
     (
         id serial primary key,
         name varchar(120)
     );
     
     create table if not exists tracks
     (
         id serial primary key,
         name varchar(200)  not null,
         album_id integer,
         media_type_id integer  not null,
         genre_id integer,
         composer varchar(220),
         milliseconds integer  not null,
         bytes integer,
         unit_price numeric(10,2)  not null,
         foreign key (album_id) references albums (id)
         on delete no action on update no action,
         foreign key (genre_id) references genres (id)
         on delete no action on update no action,
         foreign key (media_type_id) references media_types (id)
         on delete no action on update no action
     );
     
     create table if not exists invoice_lines
     (
         id serial primary key,
         invoice_id integer  not null,
         track_id integer  not null,
         unit_price numeric(10,2)  not null,
         quantity integer  not null,
         foreign key (invoice_id) references invoices (id)
         on delete no action on update no action,
         foreign key (track_id) references tracks (id)
         on delete no action on update no action
     );
     
     create table if not exists playlists
     (
         id serial primary key,
         name varchar(120)
     );
     
     create table if not exists playlist_tracks
     (
         playlist_id integer  not null,
         track_id integer  not null,
         constraint pk_playlisttrack primary key  (playlist_id, track_id),
         foreign key (playlist_id) references playlists (id)
         on delete no action on update no action,
         foreign key (track_id) references tracks (id)
         on delete no action on update no action
     );
     
     
     /*******************************************************************************
        create primary key unique indexes
     ********************************************************************************/
     create unique index index_album_on_id on albums(id);
     
     create unique index index_artist_on_id on artists(id);
     
     create unique index index_customer_on_id on customers(id);
     
     create unique index index_employee_on_id on employees(id);
     
     create unique index index_genre_on_id on genres(id);
     
     create unique index index_invoice_on_id on invoices(id);
     
     create unique index index_invoice_line_on_id on invoice_lines(id);
     
     create unique index index_media_type_on_id on media_types(id);
     
     create unique index index_playlist_on_id on playlists(id);
     
     create unique index index_playlist_track_on_id on playlist_tracks(playlist_id, track_id);
     
     create unique index index_track_on_id on tracks(id);
     
     
     /*******************************************************************************
        create foreign keys
     ********************************************************************************/
     create index index_album_on_artist_id on albums (artist_id);
     
     create index index_customers_on_support_rep_id on customers (support_rep_id);
     
     create index index_employees_on_reports_to on employees (reports_to);
     
     create index index_invoices_on_customer_id on invoices (customer_id);
     
     create index index_invoice_lines_on_invoice_id on invoice_lines (invoice_id);
     
     create index index_invoice_lines_on_track_id on invoice_lines (track_id);
     
     create index index_playlist_tracks_on_track_id on playlist_tracks (track_id);
     
     create index index_tracks_on_album_id on tracks (album_id);
     
     create index index_track_on_genre_id on tracks (genre_id);
     
     create index index_track_on_media_type_id on tracks (media_type_id);
     
     
     /*******************************************************************************
        populate tables
     ********************************************************************************/
     
     
     
     
     
     
     
     
     
     
