CREATE TABLE IF NOT EXISTS "continents" ( 
	"ContId" INTEGER PRIMARY KEY, 
	"Continent" TEXT 
);
CREATE TABLE IF NOT EXISTS "countries" (
	"CountryId" INTEGER PRIMARY KEY, 
	"CountryName" TEXT, 
	"Continent" INTEGER,
	FOREIGN KEY (Continent) REFERENCES continents(ContId)
);
CREATE TABLE IF NOT EXISTS "car_makers" ( 
	"Id" INTEGER PRIMARY KEY, 
	"Maker" TEXT, 
	"FullName" TEXT, 
	"Country" TEXT,
	FOREIGN KEY (Country) REFERENCES countries(CountryId)
);
CREATE TABLE IF NOT EXISTS "model_list" ( 
	"ModelId" INTEGER PRIMARY KEY, 
	"Maker" INTEGER, 
	"Model" TEXT UNIQUE,
	FOREIGN KEY (Maker) REFERENCES car_makers (Id)

);
CREATE TABLE IF NOT EXISTS "car_names" ( 
	"MakeId" INTEGER PRIMARY KEY, 
	"Model" TEXT, 
	"Make" TEXT,
	FOREIGN KEY (Model) REFERENCES model_list (Model)
);
CREATE TABLE IF NOT EXISTS "cars_data" (
	"Id" INTEGER PRIMARY KEY, 
	"MPG" TEXT, 
	"Cylinders" INTEGER, 
	"Edispl" REAL, 
	"Horsepower" TEXT, 
	"Weight" INTEGER, 
	"Accelerate" REAL, 
	"Year" INTEGER,
	FOREIGN KEY (Id) REFERENCES car_names (MakeId)
);
