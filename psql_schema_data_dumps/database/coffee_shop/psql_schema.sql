
     create table if not exists shop (
     shop_id int,
     address text,
     num_of_staff text,
     score real,
     open_year text,
     primary key (shop_id)
     );
     
     
     
     
     
     create table if not exists member (
     member_id int,
     name text,
     membership_card text,
     age int,
     time_of_purchase int,
     level_of_membership int,
     address text,
     primary key (member_id)
     );
     
     
     
     create table if not exists happy_hour (
     hh_id int,
     shop_id int,
     month text,
     num_of_shaff_in_charge int,
     primary key (hh_id,shop_id,month),
     foreign key (shop_id) references shop(shop_id)
     );
     
     
     
     create table if not exists happy_hour_member (
     hh_id int,
     member_id int,
     total_amount real,
     primary key (hh_id,member_id),
     foreign key (member_id) references member(member_id)
     );
     
     
     
