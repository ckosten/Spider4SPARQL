
    create table if not exists discount_coupons (
    coupon_id integer primary key,
    date_issued timestamp,
    coupon_amount decimal(19,4)
    );
    
    
    create table if not exists customers (
    customer_id integer primary key,
    coupon_id integer not null,
    good_or_bad_customer varchar(4),
    first_name varchar(80),
    last_name varchar(80),
    gender_mf varchar(1),
    date_became_customer timestamp,
    date_last_hire timestamp,
    foreign key (coupon_id ) references discount_coupons(coupon_id )
    );
    
    
    create table if not exists bookings (
    booking_id integer primary key ,
    customer_id integer not null,
    booking_status_code varchar(10) not null,
    returned_damaged_yn varchar(40),
    booking_start_date timestamp,
    booking_end_date timestamp,
    count_hired varchar(40),
    amount_payable decimal(19,4),
    amount_of_discount decimal(19,4),
    amount_outstanding decimal(19,4),
    amount_of_refund decimal(19,4),
    foreign key (customer_id ) references customers(customer_id )
    );
    
    
    
    
    create table if not exists products_for_hire (
    product_id integer primary key,
    product_type_code varchar(15) not null,
    daily_hire_cost decimal(19,4),
    product_name varchar(80),
    product_description varchar(255)
    );
    
    
    
    create table if not exists payments (
    payment_id integer primary key,
    booking_id integer,
    customer_id integer not null,
    payment_type_code varchar(15) not null,
    amount_paid_in_full_yn varchar(1),
    payment_date timestamp,
    amount_due decimal(19,4),
    amount_paid decimal(19,4),
    foreign key (booking_id ) references bookings(booking_id ),
    foreign key (customer_id ) references customers(customer_id )
    );
    
    
    create table if not exists products_booked (
    booking_id integer not null,
    product_id integer not null,
    returned_yn varchar(1),
    returned_late_yn varchar(1),
    booked_count integer,
    booked_amount float null,
    primary key (booking_id, product_id),
    foreign key (booking_id ) references bookings(booking_id ),
    foreign key (product_id ) references products_for_hire(product_id )
    );
    
    create table if not exists view_product_availability (
    product_id integer not null,
    booking_id integer not null,
    status_date timestamp primary key,
    available_yn varchar(1),
    foreign key (booking_id ) references bookings(booking_id ),
    foreign key (product_id ) references products_for_hire(product_id )
    );
