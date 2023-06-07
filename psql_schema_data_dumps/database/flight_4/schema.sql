CREATE TABLE routes (
   rid integer PRIMARY KEY,
   dst_apid integer,              -- Id of destination airport
   dst_ap varchar(4),             -- 3-letter (IATA) or 4-letter (ICAO) code of the destination airport
   src_apid bigint,               -- Id of source airport
   src_ap varchar(4),             -- 3-letter (IATA) or 4-letter (ICAO) code of the source airport
   alid bigint,                   -- Id of airline
   airline varchar(4),            -- 2-letter (IATA) or 3-letter (ICAO) code of the airline
   codeshare text,                -- "Y" if this flight is a codeshare (that is, not operated by 
                                  -- Airline, but another carrier), empty otherwise
   FOREIGN KEY(dst_apid) REFERENCES airports(apid),
   FOREIGN KEY(src_apid) REFERENCES airports(apid),
   FOREIGN KEY(alid)     REFERENCES airlines(alid)
);
CREATE TABLE airports (
   apid integer PRIMARY KEY,      -- Id of the airport
   name text NOT NULL,            -- Name of airport
   city text,                     -- Main city served by airport
   country text,                  -- Country or territory where airport is located
   x real,                        -- Latitude of airport: Decimal degrees, usually to six
                                  -- significant digits. Negative is South, positive is North
   y real,                        -- Longitude of airport: Decimal degrees, usually to six 
                                  -- significant digits. Negative is West, positive is East
   elevation bigint,              -- Altitude of airport measured in feets
   iata character varchar(3),     -- 3-letter IATA code. empty or null if not assigned/unknown
   icao character varchar(4)      -- 4-letter ICAO code. empty or null if not assigned
   
);
CREATE TABLE airlines (
   alid integer PRIMARY KEY,      -- Id of the airline
   name text,                     -- Name of the airline
   iata varchar(2),               -- 2-letter IATA code. empty or null if not assigned/unknown 
   icao varchar(3),               -- 3-letter ICAO code. empty or null if not assigned
   callsign text,                 -- Airline callsign
   country text,                  -- Country or territory where airline is incorporated
   active varchar(2)              -- "Y" if the airline is or has until recently been operational,
);
