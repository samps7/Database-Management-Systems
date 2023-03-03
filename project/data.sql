/**********************************************************************
 * NAME: Samuel Sovi
 * CLASS: CPSC 321 Section 1
 * DATE: 11/22/22
 * HOMEWORK: project part 4 (tables)
 * DESCRIPTION: Creating data for my project
 *
 * ADDITIONAL NOTE:
 *      Useful commands
 *      1) mysql -p -h cps-database
 *      2) use ssovi_DB;
 *      3) show tables;
 *      4) exit
 **********************************************************************/

-- distributor insertions:
INSERT INTO distributor VALUES (0, "target");
INSERT INTO distributor VALUES (1, "walmart");
INSERT INTO distributor VALUES (2, "wendy's");
INSERT INTO distributor VALUES (3, "taco bell");
INSERT INTO distributor VALUES (4, "staples");
INSERT INTO distributor VALUES (5, "walgreens");
INSERT INTO distributor VALUES (6, "mcdonalds");
INSERT INTO distributor VALUES (7, "costco");
INSERT INTO distributor VALUES (8, "better goods");
INSERT INTO distributor VALUES (9, "yosama");
INSERT INTO distributor VALUES (10, "bogawa");
INSERT INTO distributor VALUES (11, "diddly doo");
INSERT INTO distributor VALUES (12, "lucky");
INSERT INTO distributor VALUES (13, "safeway");
INSERT INTO distributor VALUES (14, "rosaria's");
INSERT INTO distributor VALUES (15, "trader joe's");
INSERT INTO distributor VALUES (16, "asics");
INSERT INTO distributor VALUES (17, "nike");
INSERT INTO distributor VALUES (18, "adidas");
INSERT INTO distributor VALUES (19, "kohl's");
INSERT INTO distributor VALUES (20, "best buy");
INSERT INTO distributor VALUES (21, "blockbuster");
INSERT INTO distributor VALUES (22, "spheremaker");
INSERT INTO distributor VALUES (23, "cubewrecker");
INSERT INTO distributor VALUES (24, "petco");
INSERT INTO distributor VALUES (25, "patelco apparel");
INSERT INTO distributor VALUES (26, "forever21");
INSERT INTO distributor VALUES (27, "liandry's");
INSERT INTO distributor VALUES (28, "morello");
INSERT INTO distributor VALUES (29, "cash'n'carry");


-- manufacturer insertions:
INSERT INTO manufacturer VALUES (0, "ikea");
INSERT INTO manufacturer VALUES (1, "nintendo");
INSERT INTO manufacturer VALUES (2, "sony");
INSERT INTO manufacturer VALUES (3, "microsoft");
INSERT INTO manufacturer VALUES (4, "valve");
INSERT INTO manufacturer VALUES (5, "ticonderoga");
INSERT INTO manufacturer VALUES (6, "apple");
INSERT INTO manufacturer VALUES (7, "google");
INSERT INTO manufacturer VALUES (8, "figma");
INSERT INTO manufacturer VALUES (9, "crunchyroll");
INSERT INTO manufacturer VALUES (10, "manufacturer bros");
INSERT INTO manufacturer VALUES (11, "staplers");
INSERT INTO manufacturer VALUES (12, "drepods");
INSERT INTO manufacturer VALUES (13, "garchomp");
INSERT INTO manufacturer VALUES (14, "itsy");
INSERT INTO manufacturer VALUES (15, "develop");
INSERT INTO manufacturer VALUES (16, "venture");
INSERT INTO manufacturer VALUES (17, "products CEO");
INSERT INTO manufacturer VALUES (18, "motors corp");
INSERT INTO manufacturer VALUES (19, "KLA Corp");
INSERT INTO manufacturer VALUES (20, "Buildaholic");
INSERT INTO manufacturer VALUES (21, "Advanced Motors");
INSERT INTO manufacturer VALUES (22, "Major Mfrs");
INSERT INTO manufacturer VALUES (23, "Brother");
INSERT INTO manufacturer VALUES (24, "Brown");
INSERT INTO manufacturer VALUES (25, "Samsung");
INSERT INTO manufacturer VALUES (26, "Samsang");
INSERT INTO manufacturer VALUES (27, "Samsunk");
INSERT INTO manufacturer VALUES (28, "Volvo");
INSERT INTO manufacturer VALUES (29, "Yurka");



--product insertions:
INSERT INTO product VALUES (0, "switch", "game console", "2022-11-20", 0, 0);
INSERT INTO product VALUES (1, "light", "appliance", "2021-11-21", 0, 1);
INSERT INTO product VALUES (2, "bar", "consumable", "2020-10-25", 1, 0);
INSERT INTO product VALUES (3, "pod", "a thing", "2003-08-11", 5, 6);
INSERT INTO product VALUES (4, "earphone", "listening device", "2018-11-11", 5, 10);
INSERT INTO product VALUES (5, "charger", "charger", "2022-10-17", 29, 23);
INSERT INTO product VALUES (6, "station", "i have no clue", "2022-08-21", 15, 14);
INSERT INTO product VALUES (7, "car", "goes vroom", "2022-07-19", 12, 17);
INSERT INTO product VALUES (8, "rc car", "also goes vroom", "2022-05-21", 23, 0);
INSERT INTO product VALUES (9, "rc heli", "goes whirr", "2022-03-16", 13, 0);
INSERT INTO product VALUES (10, "rc truck", "goes vroom as well", "2022-01-21", 0, 14);
INSERT INTO product VALUES (11, "card", "it's a card", "2022-11-14", 0, 12);
INSERT INTO product VALUES (12, "postcard", "it's a card u write on", "2022-02-21", 0, 6);
INSERT INTO product VALUES (13, "laptop", "could be a game console", "2022-03-21", 2, 3);
INSERT INTO product VALUES (14, "slaptop", "don't slap please", "2022-06-22", 6, 5);
INSERT INTO product VALUES (15, "u-laptop", "iphone -> u-laptop?", "2022-11-24", 10, 10);
INSERT INTO product VALUES (16, "me-phone", "not even trying at this point...", "2022-07-25", 0, 5);
INSERT INTO product VALUES (17, "kangaroom", "jumpy mushroom", "2022-11-27", 0, 8);
INSERT INTO product VALUES (18, "mooshroom", "like in minecraft", "2022-08-29", 0, 19);
INSERT INTO product VALUES (19, "swotch", "off brand switch", "2022-02-15", 10, 0);
INSERT INTO product VALUES (20, "cool watch", "i hope it's cool", "2022-11-21", 0, 2);
INSERT INTO product VALUES (21, "wallpaper", "put it on ur wall", "2022-02-17", 10, 11);
INSERT INTO product VALUES (22, "tiles", "do what u want with it", "2022-11-21", 17, 28);
INSERT INTO product VALUES (23, "pinata", "hit it til it pops", "2022-05-20", 28, 17);
INSERT INTO product VALUES (24, "candy cane", "yum yum or decor?", "2022-11-14", 13, 10);
INSERT INTO product VALUES (25, "decorational candle", "what else is a candle?", "2022-09-10", 5, 4);
INSERT INTO product VALUES (26, "domino", "pizza?", "2022-11-07", 4, 3);
INSERT INTO product VALUES (27, "earphone light", "what?", "2022-10-05", 10, 20);
INSERT INTO product VALUES (28, "yoshi plushy", "very cool", "2022-11-04", 20, 20);
INSERT INTO product VALUES (29, "unused amiibo", "nfc cards are better", "2022-06-03", 17, 12);


-- buyer insertions:
INSERT INTO buyer VALUES (0, "John Doe");
INSERT INTO buyer VALUES (1, "John Rick");
INSERT INTO buyer VALUES (2, "John Moe");
INSERT INTO buyer VALUES (3, "Steve Doe");
INSERT INTO buyer VALUES (4, "Steven Joe");
INSERT INTO buyer VALUES (5, "Joe House");
INSERT INTO buyer VALUES (6, "Jose Sandy");
INSERT INTO buyer VALUES (7, "Sam Soviet");
INSERT INTO buyer VALUES (8, "Miguel Doe");
INSERT INTO buyer VALUES (9, "Damian Donahoe");
INSERT INTO buyer VALUES (10, "Sara Waker");
INSERT INTO buyer VALUES (11, "Hannah Miat");
INSERT INTO buyer VALUES (12, "Maria Manifesto");
INSERT INTO buyer VALUES (13, "Henry Salagaer");
INSERT INTO buyer VALUES (14, "Darren Montoya");
INSERT INTO buyer VALUES (15, "Andres Doe");
INSERT INTO buyer VALUES (16, "Leo Dio");
INSERT INTO buyer VALUES (17, "Leonardo Deo");
INSERT INTO buyer VALUES (18, "Johhny Super");
INSERT INTO buyer VALUES (19, "Lucas D'Silva");
INSERT INTO buyer VALUES (20, "Jason Born");
INSERT INTO buyer VALUES (21, "Miller Sov");
INSERT INTO buyer VALUES (22, "Bea Nguyen");
INSERT INTO buyer VALUES (23, "Genvieve Vu");
INSERT INTO buyer VALUES (24, "Sierra Reagan");
INSERT INTO buyer VALUES (25, "Eleanor Regan");
INSERT INTO buyer VALUES (26, "Christian Rodricks");
INSERT INTO buyer VALUES (27, "Kevin Kller");
INSERT INTO buyer VALUES (28, "Jon Davidson");
INSERT INTO buyer VALUES (29, "Joel Marison");


-- purchase insertions:
INSERT INTO purchase VALUES (0,0,1,10);
INSERT INTO purchase VALUES (1,1,1,12);
INSERT INTO purchase VALUES (2,0,3,0);
INSERT INTO purchase VALUES (3,3,4,1);
INSERT INTO purchase VALUES (4,14,9,4);
INSERT INTO purchase VALUES (5,17,7,5);
INSERT INTO purchase VALUES (6,20,6,12);
INSERT INTO purchase VALUES (7,17,5,17);
INSERT INTO purchase VALUES (8,29,19,20);
INSERT INTO purchase VALUES (9,26,16,10);
INSERT INTO purchase VALUES (10,14,14,10);
INSERT INTO purchase VALUES (11,0,12,10);
INSERT INTO purchase VALUES (12,13,14,20);
INSERT INTO purchase VALUES (13,0,12,20);
INSERT INTO purchase VALUES (14,12,0,19);
INSERT INTO purchase VALUES (15,0,1,29);
INSERT INTO purchase VALUES (16,15,10,10);
INSERT INTO purchase VALUES (17,0,13,10);
INSERT INTO purchase VALUES (18,17,0,10);
INSERT INTO purchase VALUES (19,0,15,10);
INSERT INTO purchase VALUES (20,29,0,20);
INSERT INTO purchase VALUES (21,0,12,20);
INSERT INTO purchase VALUES (22,26,0,20);
INSERT INTO purchase VALUES (23,0,16,20);
INSERT INTO purchase VALUES (24,25,17,16);
INSERT INTO purchase VALUES (25,0,19,15);
INSERT INTO purchase VALUES (26,14,0,14);
INSERT INTO purchase VALUES (27,0,12,26);
INSERT INTO purchase VALUES (28,15,0,22);
INSERT INTO purchase VALUES (29,18,21,10);

-- product_rating insertions:
INSERT INTO product_rating VALUES (0,1, "2021-11-21", 1);
INSERT INTO product_rating VALUES (1,1, "2020-04-21", 2);
INSERT INTO product_rating VALUES (2,5, "2022-10-21", 4);
INSERT INTO product_rating VALUES (19,6, "2022-05-21", 5);
INSERT INTO product_rating VALUES (24,2, "2021-11-21", 5);
INSERT INTO product_rating VALUES (5,3, "2021-06-21", 5);
INSERT INTO product_rating VALUES (21,1, "2022-07-21", 5);
INSERT INTO product_rating VALUES (7,6, "2021-04-21", 5);
INSERT INTO product_rating VALUES (2,7, "2022-11-21", 2);
INSERT INTO product_rating VALUES (9,9, "2021-10-21", 3);
INSERT INTO product_rating VALUES (20,10, "2022-12-21", 1);
INSERT INTO product_rating VALUES (11,20, "2021-05-21", 1);
INSERT INTO product_rating VALUES (22,22, "2022-12-21", 3);
INSERT INTO product_rating VALUES (13,23, "2021-05-21", 4);
INSERT INTO product_rating VALUES (24,16, "2021-12-21", 2);
INSERT INTO product_rating VALUES (15,14, "2022-11-21", 4);
INSERT INTO product_rating VALUES (26,12, "2021-10-21", 5);
INSERT INTO product_rating VALUES (17,0, "2021-11-21", 1);
INSERT INTO product_rating VALUES (20,0, "2022-07-21", 2);
INSERT INTO product_rating VALUES (19,22, "2021-10-21", 3);
INSERT INTO product_rating VALUES (20,0, "2022-11-21", 2);
INSERT INTO product_rating VALUES (11,23, "2021-09-21", 5);
INSERT INTO product_rating VALUES (12,0, "2022-10-21", 4);
INSERT INTO product_rating VALUES (23,10, "2021-12-21", 2);
INSERT INTO product_rating VALUES (14,0, "2021-11-21", 1);
INSERT INTO product_rating VALUES (25,0, "2021-08-21", 2);
INSERT INTO product_rating VALUES (16,20, "2022-10-21", 5);
INSERT INTO product_rating VALUES (27,14, "2021-11-21", 5);
INSERT INTO product_rating VALUES (18,10, "2021-10-21", 4);
INSERT INTO product_rating VALUES (29,12, "2022-12-21", 5);


-- distrib_rating insertions:
INSERT INTO distrib_rating VALUES (15,14, "2022-11-21", 4);
INSERT INTO distrib_rating VALUES (26,12, "2021-10-21", 5);
INSERT INTO distrib_rating VALUES (17,0, "2021-11-21", 1);
INSERT INTO distrib_rating VALUES (20,0, "2022-07-21", 2);
INSERT INTO distrib_rating VALUES (19,22, "2021-10-21", 3);
INSERT INTO distrib_rating VALUES (20,0, "2022-11-21", 2);
INSERT INTO distrib_rating VALUES (11,23, "2021-09-21", 5);
INSERT INTO distrib_rating VALUES (12,0, "2022-10-21", 4);
INSERT INTO distrib_rating VALUES (23,10, "2021-12-21", 2);
INSERT INTO distrib_rating VALUES (14,0, "2021-11-21", 1);
INSERT INTO distrib_rating VALUES (25,0, "2021-08-21", 2);
INSERT INTO distrib_rating VALUES (16,20, "2022-10-21", 5);
INSERT INTO distrib_rating VALUES (27,14, "2021-11-21", 5);
INSERT INTO distrib_rating VALUES (18,10, "2021-10-21", 4);
INSERT INTO distrib_rating VALUES (29,12, "2022-12-21", 5);
INSERT INTO distrib_rating VALUES (0,1, "2021-11-21", 1);
INSERT INTO distrib_rating VALUES (1,1, "2020-04-21", 2);
INSERT INTO distrib_rating VALUES (2,5, "2022-10-21", 4);
INSERT INTO distrib_rating VALUES (19,6, "2022-05-21", 5);
INSERT INTO distrib_rating VALUES (24,2, "2021-11-21", 5);
INSERT INTO distrib_rating VALUES (5,3, "2021-06-21", 5);
INSERT INTO distrib_rating VALUES (21,1, "2022-07-21", 5);
INSERT INTO distrib_rating VALUES (7,6, "2021-04-21", 5);
INSERT INTO distrib_rating VALUES (2,7, "2022-11-21", 2);
INSERT INTO distrib_rating VALUES (9,9, "2021-10-21", 3);
INSERT INTO distrib_rating VALUES (20,10, "2022-12-21", 1);
INSERT INTO distrib_rating VALUES (11,20, "2021-05-21", 1);
INSERT INTO distrib_rating VALUES (22,22, "2022-12-21", 3);
INSERT INTO distrib_rating VALUES (13,23, "2021-05-21", 4);
INSERT INTO distrib_rating VALUES (24,16, "2021-12-21", 2);

