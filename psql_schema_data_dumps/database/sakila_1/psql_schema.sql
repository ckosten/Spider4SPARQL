-- sakila sample database schema
     -- version 0.8
     
     -- copyright (c) 2006, mysql ab
     -- all rights reserved.
     
     -- redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
     
     --  * redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
     --  * redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
     --  * neither the name of mysql ab nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
     
     -- this software is provided by the copyright holders and contributors as is and any express or implied warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. in no event shall the copyright owner or contributors be liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including, but not limited to, procurement of substitute goods or services; loss of use, data, or profits; or business interruption) however caused and on any theory of liability, whether in contract, strict liability, or tort (including negligence or otherwise) arising in any way out of the use of this software, even if advised of the possibility of such damage.
     
     --
     -- table structure for table actor
     --
 
 create table if not exists language (
                                         language_id integer  not null,
                                         name char(20) not null,
                                         last_update timestamp not null default current_timestamp,
                                         primary key (language_id)
 );
     create table if not exists actor (
       actor_id smallint not null,
       first_name varchar(45) not null,
       last_name varchar(45) not null,
       last_update timestamp not null default current_timestamp,
       primary key  (actor_id)
     );
 
 create table if not exists category (
                                         category_id integer not null,
                                         name varchar(25) not null,
                                         last_update timestamp not null default current_timestamp,
                                         primary key  (category_id)
 );
 
 create table if not exists country (
                                        country_id smallint  not null,
                                        country varchar(50) not null,
                                        last_update timestamp not null default current_timestamp,
                                        primary key  (country_id)
 );
 
 create table if not exists city (
                                     city_id smallint  not null,
                                     city varchar(50) not null,
                                     country_id smallint  not null,
                                     last_update timestamp not null default current_timestamp,
                                     primary key  (city_id),
                                     foreign key (country_id) references country (country_id)
 );
 
 create table if not exists film_text (
                                          film_id smallint not null,
                                          title varchar(255) not null,
                                          description text,
                                          primary key  (film_id)
 );
 
 --
     -- table structure for table address
     --
     
     create table if not exists address (
       address_id smallint not null,
       address varchar(50) not null,
       address2 varchar(50) default null,
       district varchar(20) not null,
       city_id smallint not null,
       postal_code varchar(10) default null,
       phone varchar(20) not null,
       last_update timestamp not null default current_timestamp,
       primary key  (address_id),
       foreign key (city_id) references city (city_id)
     );
 
 create table if not exists staff (
                                      staff_id integer  not null,
                                      first_name varchar(45) not null,
                                      last_name varchar(45) not null,
                                      address_id smallint  not null,
                                      picture bytea default null,
                                      email varchar(50) default null,
                                      store_id integer  not null,
                                      active boolean not null default true,
                                      username varchar(16) not null,
                                      password varchar(40) default null,
                                      last_update timestamp not null default current_timestamp,
                                      primary key  (staff_id),
     --foreign key (store_id) references store (store_id),
                                      foreign key (address_id) references address (address_id)
 );
 
 create table if not exists store (
                                      store_id integer  not null,
                                      manager_staff_id integer  not null,
                                      address_id smallint  not null,
                                      last_update timestamp not null default current_timestamp,
                                      primary key  (store_id),
                                      foreign key (manager_staff_id) references staff (staff_id),
                                      foreign key (address_id) references address (address_id)
 );
     
     create table if not exists customer (
       customer_id smallint  not null,
       store_id integer  not null,
       first_name varchar(45) not null,
       last_name varchar(45) not null,
       email varchar(50) default null,
       address_id smallint  not null,
       active boolean not null default true,
       create_date timestamp not null,
       last_update timestamp default current_timestamp,
       primary key  (customer_id),
       foreign key (address_id) references address (address_id),
       foreign key (store_id) references store (store_id)
     );
     
     --
     -- table structure for table film
     --
     
     create table if not exists film (
       film_id smallint  not null,
       title varchar(255) not null,
       description text default null,
       release_year int default null,
       language_id integer  not null,
       original_language_id integer  default null,
       rental_duration integer  not null default 3,
       rental_rate decimal(4,2) not null default 4.99,
       length smallint  default null,
       replacement_cost decimal(5,2) not null default 19.99,
       rating text default 'g',
       special_features text default null,
       last_update timestamp not null default current_timestamp,
       primary key  (film_id),
       foreign key (language_id) references language (language_id),
       foreign key (original_language_id) references language (language_id)
     );
     
     --
     -- table structure for table film_actor
     --
     
     create table if not exists film_actor (
       actor_id smallint  not null,
       film_id smallint  not null,
       last_update timestamp not null default current_timestamp,
       primary key  (actor_id,film_id),
      foreign key (actor_id) references actor (actor_id),
       foreign key (film_id) references film (film_id)
     );
     
     --
     -- table structure for table film_category
     --
     
     create table if not exists film_category (
       film_id smallint  not null,
       category_id integer  not null,
       last_update timestamp not null default current_timestamp,
       primary key (film_id, category_id),
       foreign key (film_id) references film (film_id),
       foreign key (category_id) references category (category_id)
     );
 
     
     create table if not exists inventory (
       inventory_id integer  not null,
       film_id smallint  not null,
       store_id integer  not null,
       last_update timestamp not null default current_timestamp,
       primary key  (inventory_id),
       foreign key (store_id) references store (store_id),
       foreign key (film_id) references film (film_id)
     );
 create table if not exists rental (
                                       rental_id int not null,
                                       rental_date timestamp not null,
                                       inventory_id integer  not null,
                                       customer_id smallint  not null,
                                       return_date timestamp default null,
                                       staff_id integer  not null,
                                       last_update timestamp not null default current_timestamp,
                                       primary key (rental_id),
                                       foreign key (staff_id) references staff (staff_id),
                                       foreign key (inventory_id) references inventory (inventory_id),
                                       foreign key (customer_id) references customer (customer_id)
 );
 
 create table if not exists payment (
       payment_id smallint  not null,
       customer_id smallint  not null,
       staff_id integer  not null,
       rental_id int default null,
       amount decimal(5,2) not null,
       payment_date timestamp not null,
       last_update timestamp default current_timestamp,
       primary key  (payment_id),
       foreign key (rental_id) references rental (rental_id),
       foreign key (customer_id) references customer (customer_id),
       foreign key (staff_id) references staff (staff_id)
     );
 
     
 
 
     
 
     
 
     
     
     
     
     
     
     
     
     
     
     
     
