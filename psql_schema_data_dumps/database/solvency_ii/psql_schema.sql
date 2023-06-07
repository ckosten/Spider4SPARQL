
     
     
     create table if not exists addresses (
     address_id integer not null ,
     address_details varchar(255),
     primary key (address_id),
     unique (address_id)
     );
     create table if not exists locations (
     location_id integer not null ,
     other_details varchar(255),
     primary key (location_id)
     );
     create table if not exists products (
     product_id integer not null,
     product_type_code char(15),
     product_name varchar(255),
     product_price decimal(20,4),
     primary key (product_id),
     unique (product_id)
     );
     create table if not exists parties (
     party_id integer not null,
     party_details varchar(255),
     primary key (party_id)
     );
     create table if not exists assets (
     asset_id integer not null ,
     other_details varchar(255),
     primary key (asset_id)
     );
     create table if not exists channels (
     channel_id integer not null ,
     other_details varchar(255),
     primary key (channel_id)
     );
     create table if not exists finances (
     finance_id integer not null ,
     other_details varchar(255),
     primary key (finance_id)
     );
     
     create table if not exists events (
     event_id integer not null ,
     address_id integer,
     channel_id integer not null,
     event_type_code char(15),
     finance_id integer not null,
     location_id integer not null,
     primary key (event_id),
     unique (event_id),
     foreign key (location_id) references locations (location_id),
     foreign key (address_id) references addresses (address_id),
     foreign key (finance_id) references finances (finance_id)
     );
     
     create table if not exists products_in_events (
     product_in_event_id integer not null,
     event_id integer not null,
     product_id integer not null,
     primary key (product_in_event_id),
     foreign key (event_id) references events (event_id),
     foreign key (product_id) references products (product_id)
     );
     
     
     create table if not exists parties_in_events (
     party_id integer not null,
     event_id integer not null,
     role_code char(15),
     primary key (party_id, event_id),
     foreign key (party_id) references parties (party_id),
     foreign key (event_id) references events (event_id)
     );
     
     create table if not exists agreements (
     document_id integer not null ,
     event_id integer not null,
     primary key (document_id),
     foreign key (event_id) references events (event_id)
     );
     
     create table if not exists assets_in_events (
     asset_id integer not null,
     event_id integer not null,
     primary key (asset_id, event_id),
     foreign key (event_id) references events (event_id),
     foreign key (event_id) references events (event_id)
     );
     
     
