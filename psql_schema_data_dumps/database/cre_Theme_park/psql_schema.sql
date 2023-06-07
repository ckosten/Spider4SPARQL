create table if not exists ref_hotel_star_ratings (
     star_rating_code char(15) not null,
     star_rating_description varchar(80),
     primary key (star_rating_code),
     unique (star_rating_code)
     );
     
     
     create table if not exists locations (
     location_id integer not null,
     location_name varchar(255),
     address varchar(255),
     other_details varchar(255),
     primary key (location_id)
     );
     
     
     create table if not exists ref_attraction_types (
     attraction_type_code char(15) not null,
     attraction_type_description varchar(255),
     primary key (attraction_type_code),
     unique (attraction_type_code)
     );
     
     
     
     create table if not exists visitors (
     tourist_id integer not null,
     tourist_details varchar(255),
     primary key (tourist_id),
     unique (tourist_id)
     );
     
     
     
     create table if not exists features (
     feature_id integer not null,
     feature_details varchar(255),
     primary key (feature_id)
     );
     
     
     
     create table if not exists hotels (
     hotel_id integer not null,
     star_rating_code char(15) not null,
     pets_allowed_yn char(1),
     price_range real,
     other_hotel_details varchar(255),
     primary key (hotel_id),
     foreign key (star_rating_code) references ref_hotel_star_ratings (star_rating_code)
     );
     
     
     
     create table if not exists tourist_attractions (
     tourist_attraction_id integer not null,
     attraction_type_code char(15) not null,
     location_id integer not null,
     how_to_get_there varchar(255),
     name varchar(255),
     description varchar(255),
     opening_hours varchar(255),
     other_details varchar(255),
     primary key (tourist_attraction_id),
     foreign key (location_id) references locations (location_id),
     foreign key (attraction_type_code) references ref_attraction_types (attraction_type_code)
     );
     
     
     
     
     create table if not exists street_markets (
     market_id integer not null,
     market_details varchar(255),
     primary key (market_id),
     foreign key (market_id) references tourist_attractions (tourist_attraction_id)
     );
     create table if not exists shops (
     shop_id integer not null,
     shop_details varchar(255),
     primary key (shop_id),
     foreign key (shop_id) references tourist_attractions (tourist_attraction_id)
     );
     create table if not exists museums (
     museum_id integer not null,
     museum_details varchar(255),
     primary key (museum_id),
     foreign key (museum_id) references tourist_attractions (tourist_attraction_id)
     );
     create table if not exists royal_family (
     royal_family_id integer not null,
     royal_family_details varchar(255),
     primary key (royal_family_id),
     foreign key (royal_family_id) references tourist_attractions (tourist_attraction_id)
     );
     create table if not exists theme_parks (
     theme_park_id integer not null,
     theme_park_details varchar(255),
     primary key (theme_park_id),
     foreign key (theme_park_id) references tourist_attractions (tourist_attraction_id)
     );
     
     
     
     
     
     
     
     
     
     create table if not exists visits (
     visit_id integer not null,
     tourist_attraction_id integer not null,
     tourist_id integer not null,
     visit_date timestamp not null,
     visit_details varchar(40) not null,
     primary key (visit_id),
     foreign key (tourist_attraction_id) references tourist_attractions (tourist_attraction_id),
     foreign key (tourist_id) references visitors (tourist_id)
     );
     
     
     
     
     
     create table if not exists photos (
     photo_id integer not null,
     tourist_attraction_id integer not null,
     name varchar(255),
     description varchar(255),
     filename varchar(255),
     other_details varchar(255),
     primary key (photo_id),
     foreign key (tourist_attraction_id) references tourist_attractions (tourist_attraction_id)
     );
     
     
     create table if not exists staff (
     staff_id integer not null,
     tourist_attraction_id integer not null,
     name varchar(40),
     other_details varchar(255),
     primary key (staff_id),
     foreign key (tourist_attraction_id) references tourist_attractions (tourist_attraction_id)
     );
     
     
     
     
     
     
     create table if not exists tourist_attraction_features (
     tourist_attraction_id integer not null,
     feature_id integer not null,
     primary key (tourist_attraction_id, feature_id),
     foreign key (tourist_attraction_id) references tourist_attractions (tourist_attraction_id),
     foreign key (feature_id) references features (feature_id)
     );
