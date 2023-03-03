
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
 **********************************************************************/


-- TODO: add insert statements

INSERT INTO customer VALUES (1, "Samuel", "Sovi", "samsovi123@gmail.com");
INSERT INTO customer VALUES (2, "Daniel", "Rodricks", "danrodricks123@gmail.com");

INSERT INTO price_plan VALUES ("standard plan", 2, 10, 3);
INSERT INTO price_plan VALUES ("plan premium plus", 5, 20, 1);

INSERT INTO vehicle_type VALUES (12, "e-scooter", "Segway", "Ninebot", "ES4", "Lime-S ES4", 17.2, 30.4, 20.3);
INSERT INTO vehicle_type VALUES (14, "e-bike", "Bike", "Samson", "SLX", "NJS Samson", 17.2, 30.4, 20.3);

INSERT INTO allowed_plan VALUES (12, "standard plan");
INSERT INTO allowed_plan VALUES (12, "plan premium plus");
INSERT INTO allowed_plan VALUES (14, "plan premium plus");

INSERT INTO default_plan VALUES (12, "standard plan");
INSERT INTO default_plan VALUES (14, "plan premium plus");

INSERT INTO vehicle VALUES (1, 12, True, False, False, -45.135, -42.135, 20.4, 12.5);
INSERT INTO vehicle VALUES (2, 14, True, True, False, -80.135, 100.1354, 73.2, 30.4);

INSERT INTO trip VALUES(100, 1, 1, "standard plan", "2022-01-05 01:02:03", "2022-01-06 01:02:04", -45.135, -42.135, -45.134, -42.146);
INSERT INTO trip VALUES(101, 1, 1, "plan premium plus", "2022-01-07 10:05:33", "2022-01-08 11:20:04", -45.135, -43.175, -40.134, -42.946);

INSERT INTO trip VALUES(102, 2, 1, "plan premium plus", "2021-07-05 01:02:03", "2021-07-06 08:04:03", -80.135, -95.135, -80.134, -95.146);
INSERT INTO trip VALUES(103, 2, 2, "plan premium plus", "2022-08-06 07:04:03", "2022-09-05 01:02:04", -81.135, -95.135, -82.134, -96.146);



-- TODO: add select statements (to print tables)
\! echo 'customer:';
SELECT * FROM customer;
\! echo 'price_plan:';
SELECT * FROM price_plan;
\! echo 'vehicle_type:';
SELECT * FROM vehicle_type;
\! echo 'allowed_plan:';
SELECT * FROM allowed_plan;
\! echo 'default_plan:';
SELECT * FROM default_plan;
\! echo 'vehicle:';
SELECT * FROM vehicle;
\! echo 'trip:';
SELECT * FROM trip;

-- "Breaking" foreign key constraints:

-- 3 Foreign Key Breaks:
-- INSERT INTO default_plan VALUES(14, "standard plan");
-- Note: vehicle_type 14 does not have standard plan as an allowed plan

-- INSERT INTO vehicle VALUES (3, 13, True, False, False, -45.135, -42.135, 20.4, 12.5);
-- Note: vehicle_type 13 does not exist

-- INSERT INTO trip VALUES(109, 3, 1, "standard plan", "2022-01-05 01:02:03", "2022-01-06 01:02:04", -45.135, -42.135, -45.134, -42.146);
-- Note: customer 3 does not yet exist


-- 2 Domain Constraints:
-- INSERT INTO vehicle_type VALUES (15, "e-car", "Bike", "Samson", "SLX", "NJS Samson", 17.2, 30.4, 20.3);
-- Note: vehicle_types can only have form factor "e-scooter" or "e-bike" (not "e-car")

-- INSERT INTO vehicle VALUES (1, 12, True, False, False, -45.135, -42.135, 101, 12.5);
-- Note: vehicle can only have a fuel percent between 0 and 100 inclusive (not 101)
