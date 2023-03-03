/**********************************************************************
 * NAME: Samuel Sovi
 * CLASS: CPSC 321 Section 1
 * DATE: 11/22/22
 * HOMEWORK: project part 4 (tables)
 * DESCRIPTION: Creating Tables for my project
 *
 * ADDITIONAL NOTE:
 *      Useful commands
 *      1) mysql -p -h cps-database
 *      2) use ssovi_DB;
 *      3) show tables;
 *      4) exit
 **********************************************************************/


DROP TABLE IF EXISTS distrib_rating;
DROP TABLE IF EXISTS product_rating;
DROP TABLE IF EXISTS purchase;
DROP TABLE IF EXISTS buyer;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS manufacturer;
DROP TABLE IF EXISTS distributor;

CREATE TABLE distributor (
    distrib_id SMALLINT UNSIGNED NOT NULL,
    distrib_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(distrib_id)
);

CREATE TABLE manufacturer (
    mfr_id SMALLINT UNSIGNED NOT NULL,
    mfr_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(mfr_id)
);

CREATE TABLE product (
    product_id SMALLINT UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    date_listed DATE NOT NULL,
    distrib_id SMALLINT UNSIGNED NOT NULL,
    mfr_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(product_id),
    FOREIGN KEY (distrib_id) REFERENCES distributor(distrib_id),
    FOREIGN KEY(mfr_id) REFERENCES manufacturer(mfr_id)
);

CREATE TABLE buyer (
    buyer_id SMALLINT UNSIGNED NOT NULL,
    buyer_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(buyer_id)
);

CREATE TABLE purchase (
    transaction_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    distrib_id SMALLINT UNSIGNED NOT NULL,
    product_id SMALLINT UNSIGNED NOT NULL,
    buyer_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(transaction_id),
    FOREIGN KEY (distrib_id) REFERENCES distributor(distrib_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id),
    FOREIGN KEY (buyer_id) REFERENCES buyer(buyer_id)
);

CREATE TABLE product_rating(
    buyer_id SMALLINT UNSIGNED NOT NULL,
    product_id SMALLINT UNSIGNED NOT NULL,
    date DATE NOT NULL,
    star_rating SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(buyer_id, product_id, date),
    FOREIGN KEY (buyer_id) REFERENCES buyer(buyer_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    CONSTRAINT valid_rating CHECK(star_rating >= 1 AND star_rating <= 5)
);

CREATE TABLE distrib_rating(
    buyer_id SMALLINT UNSIGNED NOT NULL,
    distrib_id SMALLINT UNSIGNED NOT NULL,
    date DATE NOT NULL,
    star_rating SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(buyer_id, distrib_id, date),
    FOREIGN KEY (buyer_id) REFERENCES buyer(buyer_id),
    FOREIGN KEY (distrib_id) REFERENCES distributor(distrib_id),
    CONSTRAINT valid_rating CHECK(star_rating >= 1 AND star_rating <= 5)
);