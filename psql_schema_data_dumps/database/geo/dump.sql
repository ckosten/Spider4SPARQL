BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS border_info (
  state_name text
,  border text
,  PRIMARY KEY (border,state_name)
,  FOREIGN KEY(state_name) REFERENCES state(state_name)
,  FOREIGN KEY(border) REFERENCES state(state_name)
);
CREATE TABLE IF NOT EXISTS city (
  city_name text
,  population integer DEFAULT NULL
,  country_name varchar(3) NOT NULL DEFAULT ''
,  state_name text
,  PRIMARY KEY (city_name,state_name)
,  FOREIGN KEY(state_name) REFERENCES state(state_name)
);
CREATE TABLE IF NOT EXISTS highlow (
  state_name text
,  highest_elevation text
,  lowest_point text
,  highest_point text
,  lowest_elevation text
,  PRIMARY KEY (state_name)
,  FOREIGN KEY(state_name) REFERENCES state(state_name)
);
CREATE TABLE IF NOT EXISTS lake (
  lake_name text
,  area double DEFAULT NULL
,  country_name varchar(3) NOT NULL DEFAULT ''
,  state_name text
);
CREATE TABLE IF NOT EXISTS mountain (
  mountain_name text
,  mountain_altitude integer DEFAULT NULL
,  country_name varchar(3) NOT NULL DEFAULT ''
,  state_name text
,  PRIMARY KEY (mountain_name, state_name)
,  FOREIGN KEY(state_name) REFERENCES state(state_name)
);
CREATE TABLE IF NOT EXISTS river (
  river_name text
,  length integer DEFAULT NULL
,  country_name varchar(3) NOT NULL DEFAULT ''
,  traverse text
,  PRIMARY KEY (river_name)
,  FOREIGN KEY(traverse) REFERENCES state(state_name)
);
CREATE TABLE IF NOT EXISTS state (
  state_name text
,  population integer DEFAULT NULL
,  area double DEFAULT NULL
,  country_name varchar(3) NOT NULL DEFAULT ''
,  capital text
,  density double DEFAULT NULL
,  PRIMARY KEY (state_name)
);
COMMIT;
