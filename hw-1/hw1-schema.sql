
/**********************************************************************
 * NAME: Samuel Sovi
 * CLASS: CPSC 321 Section 1
 * DATE: 9/22/22
 * HOMEWORK: hw1
 * DESCRIPTION: Implementing Tables and Schemas to practice creating 
 * relationships between tables using foreign keys
 *
 * ADDITIONAL NOTE:
 *      Useful commands
 *      1) mysql -p -h cps-database
 *      2) use ssovi_DB;
 *      3) show tables;
 *      4) exit
 *      5) source hw1-schema.sql
 **********************************************************************/


-- TODO: add drop table statements
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS vehicle;
DROP TABLE IF EXISTS default_plan;
DROP TABLE IF EXISTS allowed_plan;
DROP TABLE IF EXISTS vehicle_type;
DROP TABLE IF EXISTS price_plan;
DROP TABLE IF EXISTS customer;


-- TODO: add create table statements

-- customer table used to store customer info
CREATE TABLE customer (
    -- int refers to unique customer id
    c_id SMALLINT UNSIGNED NOT NULL,
    -- first name of customer
    first_name VARCHAR(20) NOT NULL,
    -- last name of customer
    last_name VARCHAR(20) NOT NULL,
    -- character string of user's email 
    email VARCHAR(50) NOT NULL, 
    PRIMARY KEY (c_id)
);

-- price_plan table used to store different price plans
CREATE TABLE price_plan (
    -- character limit since primary key
    plan_name VARCHAR(50) NOT NULL,
    -- int refers to number of cents
    price_per_min SMALLINT NOT NULL,
    -- int refers to number of cents
    unlock_price MEDIUMINT NOT NULL,
    -- refers to number of minutes since start
    rate_start_min MEDIUMINT NOT NULL, 
    PRIMARY KEY (plan_name)
);

-- vehicle_type table used to store different vehicle types
CREATE TABLE vehicle_type (
    -- unique id for each vehicle type
    vt_id SMALLINT UNSIGNED NOT NULL,
    -- form_factor is either e-scooter or e-bike
    form_factor VARCHAR(10) NOT NULL,
    -- make of the vehicle (e.g. "Segway")
    make VARCHAR(20) NOT NULL,
    -- model of the vehicle (e.g. "Ninebot")
    model VARCHAR(20) NOT NULL,
    -- trim level of the vehicle (e.g. "ES4")
    trim_level VARCHAR(20) NOT NULL,
    -- alternate name of the vehicle (e.g. "Lime-S ES4")
    alt_name VARCHAR(50),
    -- max speed of the vehicle in mph (e.g. 80.3)
    max_spd FLOAT(4,1),
    -- max range on a full charge in miles (e.g. 26.2)
    max_range FLOAT(5,1) NOT NULL,
    -- weight of vehicle in pounds (e.g. 60.3)
    weight SMALLINT UNSIGNED,
    PRIMARY KEY (vt_id),
    -- form factor must be "e-scooter" or "e-bike"
    CONSTRAINT valid_form_factor CHECK(form_factor = "e-scooter" OR form_factor = "e-bike")
);

CREATE TABLE allowed_plan(
    -- unique id for each vehicle type (from vehicle type)
    vt_id SMALLINT UNSIGNED NOT NULL,
    -- character limit since primary key (usues plan_name from price_plan)
    price_plan VARCHAR(50) NOT NULL,
    PRIMARY KEY (vt_id, price_plan),
    FOREIGN KEY (vt_id) REFERENCES vehicle_type (vt_id),
    FOREIGN KEY (price_plan) REFERENCES price_plan (plan_name)
);

CREATE TABLE default_plan(
    -- unique id for each vehicle type (from vehicle type)
    vt_id SMALLINT UNSIGNED NOT NULL,
    -- character limit since primary key (usues plan_name from price_plan)
    price_plan VARCHAR(50) NOT NULL,
    PRIMARY KEY (vt_id),
    FOREIGN KEY (vt_id, price_plan) REFERENCES allowed_plan (vt_id, price_plan)
    -- FOREIGN KEY (price_plan) REFERENCES allowed_plan (price_plan)
);

CREATE TABLE vehicle(
    -- each vehicle is assigned a vehicle id
    v_id SMALLINT UNSIGNED NOT NULL,
    -- unique id for each vehicle type (from vehicle type)
    vt_id SMALLINT UNSIGNED NOT NULL,
    -- (boolean) whether or not vehicle is in circulation
    in_circ BOOLEAN NOT NULL,
    -- (boolean) whether or not vehicle is reserved
    is_reserved BOOLEAN NOT NULL,
    -- (boolean) whether or not vehicle is disabled
    is_disabled BOOLEAN NOT NULL,
    -- latitude of the vehicle with domain: (-90.000000, 90.000000)
    lat DOUBLE(10,6) SIGNED NOT NULL,
    -- longitude of the vehicle with domain: (-180.000000, 180.000000)
    lon DOUBLE(10,6) SIGNED NOT NULL,
    -- current fuel percentage with domain: (0.0000, 100.00)
    curr_fuel_pct FLOAT(5,2) NOT NULL,
    -- current range of the vehicle left (in miles)
    cur_range FLOAT(5,1) NOT NULL,
    PRIMARY KEY (v_id),
    FOREIGN KEY (vt_id) REFERENCES vehicle_type (vt_id),
    CONSTRAINT valid_curr_fuel_pct CHECK(curr_fuel_pct <= 100 AND curr_fuel_pct >= 0),
    CONSTRAINT valid_lat CHECK(lat <= 90 AND lat >= -90),
    CONSTRAINT valid_lon CHECK(lon <= 180 AND lon >= -180)
);

CREATE TABLE trip(
    -- each trip is assigned a unique id
    t_id SMALLINT UNSIGNED NOT NULL,
    -- int refers to unique customer id
    c_id SMALLINT UNSIGNED NOT NULL,
    -- each vehicle is assigned a vehicle id
    v_id SMALLINT UNSIGNED NOT NULL,
    -- character limit since primary key (usues plan_name from price_plan)
    price_plan VARCHAR(50) NOT NULL,
    -- start datetime in format YYYY-MM-DD HH:MM:SS
    start_dtime DATETIME,
    -- end datetime in format YYYY-MM-DD HH:MM:SS
    end_dtime DATETIME,
    -- starting latitude of the trip with domain: (-90.000000, 90.000000)
    start_lat DOUBLE(10,6) SIGNED NOT NULL,
    -- starting longitude of the trip with domain: (-180.000000, 180.000000)
    start_lon DOUBLE(10,6) SIGNED NOT NULL,
    -- ending latitude of the trip with domain: (-90.000000, 90.000000)
    end_lat DOUBLE(10,6) SIGNED NOT NULL,
    -- ending longitude of the trip with domain: (-180.000000, 180.000000)
    end_lon DOUBLE(10,6) SIGNED NOT NULL,
    PRIMARY KEY (t_id),
    FOREIGN KEY (c_id) REFERENCES customer (c_id),
    FOREIGN KEY (v_id) REFERENCES vehicle (v_id),
    FOREIGN KEY (price_plan) REFERENCES price_plan (plan_name),
    CONSTRAINT valid_start_lat CHECK(start_lat <= 90 AND start_lat >= -90),
    CONSTRAINT valid_start_lon CHECK(start_lon <= 180 AND start_lon >= -180),
    CONSTRAINT valid_end_lat CHECK(end_lat <= 90 AND end_lat >= -90),
    CONSTRAINT valid_end_lon CHECK(end_lon <= 180 AND end_lon >= -180),
    CONSTRAINT valid_end_dtime CHECK(end_dtime > start_dtime)
);
