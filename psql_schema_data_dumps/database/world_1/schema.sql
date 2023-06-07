CREATE TABLE `city` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Name` char(35) NOT NULL DEFAULT ''
,  `CountryCode` char(3) NOT NULL DEFAULT ''
,  `District` char(20) NOT NULL DEFAULT ''
,  `Population` integer NOT NULL DEFAULT '0'
,  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`Code`)
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE `country` (
  `Code` char(3) NOT NULL DEFAULT ''
,  `Name` char(52) NOT NULL DEFAULT ''
,  `Continent` text  NOT NULL DEFAULT 'Asia'
,  `Region` char(26) NOT NULL DEFAULT ''
,  `SurfaceArea` float(10,2) NOT NULL DEFAULT '0.00'
,  `IndepYear` integer DEFAULT NULL
,  `Population` integer NOT NULL DEFAULT '0'
,  `LifeExpectancy` float(3,1) DEFAULT NULL
,  `GNP` float(10,2) DEFAULT NULL
,  `GNPOld` float(10,2) DEFAULT NULL
,  `LocalName` char(45) NOT NULL DEFAULT ''
,  `GovernmentForm` char(45) NOT NULL DEFAULT ''
,  `HeadOfState` char(60) DEFAULT NULL
,  `Capital` integer DEFAULT NULL
,  `Code2` char(2) NOT NULL DEFAULT ''
,  PRIMARY KEY (`Code`)
);
CREATE TABLE `countrylanguage` (
  `CountryCode` char(3) NOT NULL DEFAULT ''
,  `Language` char(30) NOT NULL DEFAULT ''
,  `IsOfficial` text  NOT NULL DEFAULT 'F'
,  `Percentage` float(4,1) NOT NULL DEFAULT '0.0'
,  PRIMARY KEY (`CountryCode`,`Language`)
,  CONSTRAINT `countryLanguage_ibfk_1` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`Code`)
);
CREATE INDEX "idx_countrylanguage_CountryCode" ON "countrylanguage" (`CountryCode`);
CREATE INDEX "idx_city_CountryCode" ON "city" (`CountryCode`);
