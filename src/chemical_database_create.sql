
DROP DATABASE Chemical_database;
CREATE DATABASE Chemical_database;
USE Chemical_database;


-- Entities

CREATE TABLE customer(
	insurance_id INT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    address_street_name VARCHAR(30) NOT NULL,
    address_street_num INT NOT NULL,
    address_town VARCHAR(30) NOT NULL,
    address_state VARCHAR(30) NOT NULL,
    address_zipcode CHAR(5) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone CHAR(10) NOT NULL
);


CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    medicine VARCHAR(30) NOT NULL,
    delivery_date DATE NOT NULL,
    quantity INT NOT NULL
);


CREATE TABLE pharmacy_store(
	name VARCHAR(30) NOT NULL,
    address_street_name VARCHAR(30) NOT NULL,
    address_street_num INT NOT NULL,
    address_town VARCHAR(30) NOT NULL,
    address_state VARCHAR(30) NOT NULL,
    address_zipcode CHAR(5) NOT NULL,
    phone_numer CHAR(10) NOT NULL,
    PRIMARY KEY (name, address_street_name, address_street_num, address_town, address_state, address_zipcode)
);


CREATE TABLE pharmacist(
	staff_id INT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL
);


CREATE TABLE illness(
	name VARCHAR(30) NOT NULL, 
    severity INT NOT NULL,
    symptoms VARCHAR(30) NOT NULL,
    state VARCHAR(30) NOT NULL
);

CREATE TABLE doctor(
	first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    office_name VARCHAR(30) NOT NULL,
    office_address_street_name VARCHAR(30) NOT NULL,
    office_address_street_num VARCHAR(30) NOT NULL,
    office_address_town VARCHAR(30) NOT NULL,
    office_address_state VARCHAR(30) NOT NULL,
    office_address_zipcode CHAR(10) NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone CHAR(10) NOT NULL
);


CREATE TABLE certification(
	name VARCHAR(30) PRIMARY KEY NOT NULL,
    institution VARCHAR(30) NOT NULL,
    expiration_date DATE NOT NULL
);


CREATE TABLE chemical(
	scientific_name VARCHAR(30) NOT NULL,
    common_name VARCHAR(30) NOT NULL,
    moleculatar_formula VARCHAR(30) NOT NULL,
    structure VARCHAR(30) NOT NULL,
    charge INT NOT NULL,
    solubility INT NOT NULL
);


CREATE TABLE hazard(
	hazard_description VARCHAR(300) NOT NULL,
    safety_instruction VARCHAR(500)
);


CREATE TABLE classification(
	class_name VARCHAR(30) NOT NULL,
    properties VARCHAR(30)
);


CREATE TABLE medication(
	scientific_name VARCHAR(30) NOT NULL,
    common_name VARCHAR(30),
    brand_name VARCHAR(30),
    dosage INT NOT NULL,
    type VARCHAR(30) NOT NULL,
    expiration_date DATE,
    warnings VARCHAR(30) NOT NULL,   -- Link to hazard
    contact VARCHAR(30),
    ingredients VARCHAR(30),  -- Link to chemicals 
    PRIMARY KEY (scientific_name, brand_name, dosage)
);

CREATE TABLE uses(
	use_id INT PRIMARY KEY,
    use_case VARCHAR(30) NOT NULL,
    body_part VARCHAR(30) NOT NULL
);

CREATE TABLE insurance_company(
	name VARCHAR(30) PRIMARY KEY,
    contact VARCHAR(30)
);


-- Relationships
CREATE TABLE works_at( -- pharmacist to pharmacy store
);

CREATE TABLE has( -- for pharmacist and doctor to credentials
);

CREATE TABLE in_network( -- pharmacy store to insurance_company
);

CREATE TABLE insured_by( -- customer to insurance company
);

CREATE TABLE covers( -- customer to insurance company
);

CREATE TABLE contains( -- order to medication
);

CREATE TABLE sells( -- pharmacy store to medication
);

CREATE TABLE perscribes( -- doctor to medication
);

CREATE TABLE composed_of( -- medication to chemcial
);

CREATE TABLE med_usage( -- medication to use; think of diff name for this since we cant use has
);

CREATE TABLE classified_as( -- chemical to classification
);

CREATE TABLE contains( -- chemical to hazard; need to change name?  not sure
);

CREATE TABLE sells( -- pharmacy store to medication
);

CREATE TABLE places( -- doctor to order
);

CREATE TABLE picks_up( -- customer, pharmacy, order
);

CREATE TABLE diagnoses( -- customer, illness, doctor
);


