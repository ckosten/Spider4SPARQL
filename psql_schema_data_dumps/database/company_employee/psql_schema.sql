
     create table if not exists people (
         people_id int,
         age int,
         name text,
         nationality text,
         graduation_college text,
         primary key (people_id)
     );
     
     
     
     
     
     create table if not exists company (
         company_id real,
         name text,
         headquarters text,
         industry text,
         sales_in_billion real,
         profits_in_billion real,
         assets_in_billion real,
         market_value_in_billion real,
         primary key (company_id)
     );
     
     
     
     
     
     create table if not exists employment (
         company_id int,
         people_id int,
         year_working int,
         primary key (company_id,people_id),
         foreign key (company_id) references company(company_id),
         foreign key (people_id) references people(people_id)
     );
     
     
