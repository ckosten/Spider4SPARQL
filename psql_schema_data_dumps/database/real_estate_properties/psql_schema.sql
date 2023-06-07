
    create table if not exists ref_feature_types (
    feature_type_code varchar(20) primary key,
    feature_type_name varchar(80)
    );
    create table if not exists ref_property_types (
    property_type_code varchar(20) primary key,
    property_type_description varchar(80)
    );
    
    create table if not exists other_available_features (
    feature_id integer primary key,
    feature_type_code varchar(20) not null,
    feature_name varchar(80),
    feature_description varchar(80),
    foreign key (feature_type_code ) references ref_feature_types(feature_type_code )
    );
    
    create table if not exists properties (
    property_id integer primary key,
    property_type_code varchar(20) not null,
    date_on_market timestamp,
    date_sold timestamp,
    property_name varchar(80),
    property_address varchar(255),
    room_count integer,
    vendor_requested_price decimal(19,4),
    buyer_offered_price decimal(19,4),
    agreed_selling_price decimal(19,4),
    apt_feature_1 varchar(255),
    apt_feature_2 varchar(255),
    apt_feature_3 varchar(255),
    fld_feature_1 varchar(255),
    fld_feature_2 varchar(255),
    fld_feature_3 varchar(255),
    hse_feature_1 varchar(255),
    hse_feature_2 varchar(255),
    hse_feature_3 varchar(255),
    oth_feature_1 varchar(255),
    oth_feature_2 varchar(255),
    oth_feature_3 varchar(255),
    shp_feature_1 varchar(255),
    shp_feature_2 varchar(255),
    shp_feature_3 varchar(255),
    other_property_details varchar(255),
    foreign key (property_type_code ) references ref_property_types(property_type_code )
    );
    
    create table if not exists other_property_features (
    property_id integer not null,
    feature_id integer not null,
    property_feature_description varchar(80),
    foreign key (feature_id ) references other_available_features(feature_id ),
    foreign key (property_id ) references properties(property_id )
    );
    
    
    
    
    
   
