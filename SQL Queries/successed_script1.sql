CREATE TABLE tbl_Price(
priceRangeId INT PRIMARY KEY,
minPrice INT,
maxPrice INT
-- AverageCost INT(5)
);
COPY tbl_Price
FROM '/home/akbar/tbl_price.csv' DELIMITER ',' CSV HEADER;
--SInce there is a huge price range differences it wont be good to have average cost, so lets go with min and max cost fr a price range
--Learn the differences between varchar and Text
--Learn about schemas (What and types)


CREATE TABLE tbl_Rating(
aggregateId INT PRIMARY KEY,
ratingColor TEXT,
ratingText  TEXT
);
COPY tbl_Rating(aggregateId,ratingColor,ratingText)
FROM '/home/akbar/tbl_rating.csv' DELIMITER ',' CSV HEADER;



CREATE TABLE tbl_CountryCurrency(
countryCode INT PRIMARY KEY,
Currency TEXT
);
COPY tbl_CountryCurrency(countryCode,Currency)
FROM '/home/akbar/tbl_countrycurrency.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE tbl_CityCountry(
cityId SERIAL PRIMARY KEY,
cityName TEXT,
countryCode INT REFERENCES tbl_CountryCurrency(countryCode)
);
COPY tbl_CityCountry(cityName,countryCode)
FROM '/home/akbar/tbl_citycountry.csv' DELIMITER ',' CSV HEADER;



-- CREATE TABLE tbl_Address(
-- Id SERIAL PRIMARY KEY,
-- addressOf TEXT PRIMARY KEY,
-- cityName TEXT REFERENCES tbl_CountryCode(cityName)
-- );


CREATE TABLE tbl_Restaurent(
Restaurant_ID  SERIAL PRIMARY KEY,
Restaurant_Name  TEXT,
HasTable_Bookings  BOOLEAN NOT NULL,
HasOnline_Delivery  BOOLEAN NOT NULL,
IsDelivering_Now  BOOLEAN NOT NULL,
PriceRange  INT REFERENCES tbl_Price(priceRangeId),
aggregateId INT REFERENCES tbl_Rating(aggregateId),
AggregateRating  DECIMAL,
Votes INT,
Address TEXT,
Cuisines TEXT,
Longitude DECIMAL,
Latitude  DECIMAL
);
COPY tbl_Restaurent(Restaurant_ID,Restaurant_Name,HasTable_Bookings,HasOnline_Delivery,IsDelivering_Now,PriceRange,aggregateId,AggregateRating,Votes,Address,Cuisines,Longitude,Latitude)
FROM '/home/akbar/tbl_res2.csv' DELIMITER ',' CSV HEADER;


--Since there is no relation found between price range and average cost, rather than storing the entire details of the average cost; I
--have decided to give the min and max price associated with the restaurents having the same rating. (The min and max are manually feeded based on the excel sheet analysis)


-- Min Rating	Max Rating
-- 0	    0
-- 0.1	    2.49
-- 2.5	    3.49
-- 3.5	    3.99
-- 4	    4.49
-- 4.5	    5
