
/**********************************************************************
 * NAME: Samuel Sovi
 * CLASS: CPSC 321 Section 1
 * DATE: 10/11/22
 * HOMEWORK: hw2
 * DESCRIPTION: Implementing Tables and Schemas to practice creating 
 * relationships between tables using foreign keys and using JOINs
 *
 * ADDITIONAL NOTE:
 *      Useful commands
 *      1) mysql -p -h cps-database
 *      2) use ssovi_DB;
 *      3) show tables;
 *      4) exit
 **********************************************************************/


-- TODO: add drop table statements
DROP TABLE IF EXISTS border;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS province;
DROP TABLE IF EXISTS country;


-- TODO: add create table statements

-- country table used to store countries
CREATE TABLE country (
    -- country code is a unique small code for each country
    country_code VARCHAR(5) NOT NULL,
    -- country name
    country_name VARCHAR(60) NOT NULL,
    -- gdp of a given country
    gdp INT NOT NULL,
    -- inflation value of a country
    inflation FLOAT(8,2) NOT NULL,
    PRIMARY KEY (country_code)
);

CREATE TABLE province (
    -- province name
    province_name VARCHAR(60) NOT NULL,
    -- country code is a unique small code for each country
    country_code VARCHAR(5) NOT NULL,
    -- area of the province in km^2
    area INT NOT NULL,
    PRIMARY KEY (province_name, country_code),
    FOREIGN KEY (country_code) REFERENCES country (country_code)
);

CREATE TABLE city (
    -- name of the city
    city_name VARCHAR(60) NOT NULL,
    -- name of the province/state the city is in
    province_name VARCHAR(60) NOT NULL,
    -- country code of the country that the city is in
    country_code VARCHAR(5) NOT NULL,
    -- population of the city
    population INT NOT NULL,
    PRIMARY KEY (city_name, province_name, country_code),
    FOREIGN KEY (country_code) REFERENCES country (country_code),
    FOREIGN KEY (province_name) REFERENCES province (province_name)
);

CREATE TABLE border (
    -- first country of the two sharing a border with each other
    country_code_1 VARCHAR(5) NOT NULL,
    -- second country of the two sharing a border with each other
    country_code_2 VARCHAR(5) NOT NULL,
    -- length of the shared border between both countries
    border_length INT NOT NULL,
    PRIMARY KEY (country_code_1, country_code_2),
    FOREIGN KEY (country_code_1) REFERENCES country (country_code),
    FOREIGN KEY (country_code_1) REFERENCES country (country_code),
    -- note, country 1 has to be > country 2 (to preserve unique borders)
    -- this makes it so example: US, CN and CN, US cannot be different borders
    CONSTRAINT unique_code CHECK (country_code_1 > country_code_2)
);


-- TODO: add insert statements

-- Countries

INSERT INTO country VALUES ("US", "Fake United States", 46900, 3.8);
INSERT INTO country VALUES ("JP", "Fake Japan", 20456, 4.5);
INSERT INTO country VALUES ("CN", "Fake China", 60800, 2.4);

-- Provinces: 

INSERT INTO province VALUES ("Californio", "US", 40000);
INSERT INTO province VALUES ("New Pork", "US", 2000);
INSERT INTO province VALUES ("Areazona", "US", 27000);

INSERT INTO province VALUES ("Brokyo", "JP", 7000);
INSERT INTO province VALUES ("Keeoto", "JP", 3000);
INSERT INTO province VALUES ("Saporofessor", "JP", 13000);

INSERT INTO province VALUES ("Hongey Kong", "CN", 17000);
INSERT INTO province VALUES ("Beifeng", "CN", 26000);
INSERT INTO province VALUES ("Shangfry", "CN", 62000);

-- US cities:

INSERT INTO city VALUES ("Sant Jose", "Californio", "US", 5);
INSERT INTO city VALUES ("Sant Franciscbro", "Californio", "US", 25000);
INSERT INTO city VALUES ("Los Pantalones", "Californio", "US", 150);

INSERT INTO city VALUES ("Judon", "New Pork", "US", 210293);
INSERT INTO city VALUES ("Rilas", "New Pork", "US", 29183);
INSERT INTO city VALUES ("Pagos", "New Pork", "US", 203);

INSERT INTO city VALUES ("Poit", "Areazona", "US", 293);
INSERT INTO city VALUES ("Canta", "Areazona", "US", 283);
INSERT INTO city VALUES ("Crey", "Areazona", "US", 22103);

-- JP cities

INSERT INTO city VALUES ("Yashiori", "Brokyo", "JP", 1500);
INSERT INTO city VALUES ("Kuro", "Brokyo", "JP", 17203);
INSERT INTO city VALUES ("Shinipachi", "Brokyo", "JP", 132);

INSERT INTO city VALUES ("Chungye", "Keeoto", "JP", 128);
INSERT INTO city VALUES ("Yami", "Keeoto", "JP", 123092);
INSERT INTO city VALUES ("Hirigata", "Keeoto", "JP", 2183);

INSERT INTO city VALUES ("Tachiban", "Saporofessor", "JP", 2);
INSERT INTO city VALUES ("Hanamata", "Saporofessor", "JP", 1230);
INSERT INTO city VALUES ("Akihama", "Saporofessor", "JP", 12302);

-- CN cities

INSERT INTO city VALUES ("Qingcheng", "Hongey Kong", "CN", 1500);
INSERT INTO city VALUES ("Chungye", "Hongey Kong", "CN", 128);
INSERT INTO city VALUES ("Seopo", "Hongey Kong", "CN", 12392);

INSERT INTO city VALUES ("Irelia", "Beifeng", "CN", 21382);
INSERT INTO city VALUES ("Qiyana", "Beifeng", "CN", 493);
INSERT INTO city VALUES ("Yuumi", "Beifeng", "CN", 10802);

INSERT INTO city VALUES ("Qiling", "Shangfry", "CN", 1284);
INSERT INTO city VALUES ("Ningguang", "Shangfry", "CN", 9432);
INSERT INTO city VALUES ("Wangsheng", "Shangfry", "CN", 502834);

-- borders

INSERT INTO border VALUES ("US", "CN", 12303);
INSERT INTO border VALUES ("JP", "CN", 1234);
-- Note that the CN after JP was intentionally made this way to test Problems 9 and 10 in part 2
-- The opposite order will also work if the CONSTRAINT in border is switched :)








