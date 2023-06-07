create table if not exists country (
                                        code char(3) not null default ''
     ,  name char(52) not null default ''
     ,  continent text  not null default 'asia'
     ,  region char(26) not null default ''
     ,  surfacearea real not null default '0.00'
     ,  indepyear integer default null
     ,  population integer not null default '0'
     ,  lifeexpectancy real default null
     ,  gnp real default null
     ,  gnpold real default null
     ,  localname char(45) not null default ''
     ,  governmentform char(45) not null default ''
     ,  headofstate char(60) default null
     ,  capital integer default null
     ,  code2 char(2) not null default ''
     ,  primary key (code)
 );
 create table if not exists city (
       id serial primary key
     ,  name char(35) not null default ''
     ,  countrycode char(3) not null default ''
     ,  district char(20) not null default ''
     ,  population integer not null default '0'
     ,  constraint city_ibfk_1 foreign key (countrycode) references country (code)
     );
 
     create table if not exists countrylanguage (
       countrycode char(3) not null default ''
     ,  language char(30) not null default ''
     ,  isofficial text  not null default 'f'
     ,  percentage real not null default '0.0'
     ,  primary key (countrycode,language)
     ,  constraint countrylanguage_ibfk_1 foreign key (countrycode) references country (code)
     );
     create index if not exists idx_countrylanguage_countrycode on countrylanguage (countrycode);
     create index if not exists idx_city_countrycode on city (countrycode);
