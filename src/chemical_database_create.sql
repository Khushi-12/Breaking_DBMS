DROP DATABASE IF EXISTS Chemical_database;
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

-- test

INSERT INTO customer VALUES 
(123456789, 'Katniss', 'Everdeen', 'Jay St', 123, 'District 12', 'Panem', 12345, '2180-11-11', 'keverdeen12@gmail.com', 111-111-1111),
(112345678, 'Peeta', 'Mellark', 'Baker St', 454, 'District 12', 'Panem', 12345, '2179-06-03', 'pmellark44@gmail.com', 222-222-2222),
(111234567, 'Coriolanus', 'Snow', 'Presidental Rd', 52, 'Capitol', 'Panem', 94582, '2145-01-27', 'coriosnow@gmail.com', 333-333-3333),
(111123456, 'Primrose', 'Everdeen', 'Jay St', 123, 'District 12', 'Panem', 12345, '2185-05-17', 'primdeen11@gmail.com', 111-111-1212),
(111112345, 'Lucy Gray', 'Baird', 'Covey Rd', 100, 'District 12', 'Panem', 12345, '2145-09-21', 'lgraybaird@gmail.com', 444-444-4444),
(111111234, 'Finnick', 'Odair', 'Sugar St', 2, 'District 4', 'Panem', 44444, '2175-02-19', 'finnodair@gmail.com', 555-555-5555),
(111111123, 'Effie', 'Trinket', 'Mahogany Dr', 12, 'Capitol', 'Panem', 94582, '2157-12-31', 'etrinket2020@gmail.com', 666-666-6666),
(111111112, 'Haymitch', 'Abernathy', 'Sunrise St', 75, 'District 12', 'Panem', 12345, '2155-08-14', 'hayaber@gmail.com', 777-777-7777),
(111111111, 'Tigris', 'Snow', 'Presidental Rd', 52, 'Capitol', 'Panem', 94582, '2142-04-02', 'tigrissnow@gmail.com', 888-888-8888),
(234567891, 'Johanna', 'Mason', 'Spear Dr', 290, 'District 7', 'Panem', 37104, '2177-11-06', 'jomason@gmail.com', 999-999-9999),
(223456789, 'Gale', 'Hawthorne', 'Hunter Dr', 111, 'District 12', 'Panem', 12345, '2179-12-15', 'galehawthorne53@gmail.com', 111-222-1111),
(222345678, 'Caesar', 'Flickerman', 'Lucky Rd', 939, 'Capitol', 'Panem', 94582, '2151-09-02', 'caesarflickerman@gmail.com', 111-333-1111),
(222234567, 'Plutarch', 'Heavensbee', 'Director Cr', 372, 'Capitol', 'Panem', 94582, '2151--02', 'pheavensbee@gmail.com', 111-444-1111),
(222223456, 'Lucretius', 'Flickerman', 'Lucky Rd', 939, 'Capitol', 'Panem', 94582, '2151--02', 'lflickerman@gmail.com', 111-555-111),
(222222345, 'Kristen', 'Lee', 'Leek Rd', 484, 'Mahopac', 'New York', 48294, '2002-11-08', 'lee.kri@northeastern.edu', 716-341-4340),
(222222234, 'Alana', 'Baldari', 'Nitrile Dr', 391, 'Long Island', 'New York', 18492, '2001-01-28', 'ajbald@gmail.com', 917-568-3801‬),
(222222223, 'Laurie', 'King', 'Cross Dr', 131, 'Worcester', 'Massachusetts', 01610, '1970-05-27', 'lking@gmail.com', 868-193-2849),
(222222223, 'Jeremy', 'Rosenholtz', 'Delicate St', 9, 'Winchester', 'Massachusetts', 82014, '1955-10-17', 'jrosenholtz@gmail.com', 819-832-0392),
(333333333, 'Adelle', 'Feeley', 'Swift Dr', 45, 'Worcester', 'Massachusetts', 01610, '2002-08-27', 'adellefeeley@gmail.com', 518-779-3903‬),
(323232323, 'Seneca', 'Crane', 'Maker St', 45, 'Capitol', 'Panem', 94582, '2175-03-03', 'scrane@gmail.com', 111-666-1111‬)
;

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

INSERT INTO pharmacists VALUES 
(1, 'Jules', 'Sylvester'),
(2, 'Edgar', 'Roman'),
(3, 'Louisa', 'Wetzel'),
(4, 'Gabby', 'Dipollito'),
(5, 'Nakul', 'Rao');


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
INSERT INTO doctors VALUES 
('Natasha', 'Nicholas', 'Atrius Health', 'Hancock St', 1250, 'Quincy', 'Massachusetts', 02169, 'nicholas.n@northeastern.edu', 617-959-2378),
('Shane', 'Holmes', 'Boston Medical Center', 'Massachusetts Ave', 801, 'Boston', 'Massachusetts', 02116, 'holmes.sha@northeastern.edu', 401-573-0982‬),
('Khushi', 'Neema', 'Carbon Health', 'Boylston St', 399, 'Boston', 'Massachusetts', 02116, 'neemak@northeastern.edu', 201-687-8959‬),
('Grace', 'Cerrato', 'Massachusetts General Hospital' 'Fruit St', 55, 'Boston', 'Massachusetts', 02116, 'gcerr24@g.holycross.edu', 774-260-7096‬),
('Kathleen', 'Durant', 'Boston Medical Center', 'Massachusetts Ave', 801, 'Boston', 'Massachusetts', 02116, 'k.durant@northeastern.edu', 382-382-4020);


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
CREATE TABLE works_at ( -- pharmacist to pharmacy store
    staff_id INT NOT NULL,
    pharmacy_store_name VARCHAR(30) NOT NULL,
    pharmacy_address_street_name VARCHAR(30) NOT NULL,
    pharmacy_address_street_num INT NOT NULL,
    pharmacy_address_town VARCHAR(30) NOT NULL,
    pharmacy_address_state VARCHAR(30) NOT NULL,
    pharmacy_address_zipcode CHAR(5) NOT NULL,
    PRIMARY KEY (staff_id, pharmacy_store_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode),
    FOREIGN KEY (staff_id) REFERENCES pharmacist(staff_id),
     FOREIGN KEY (pharmacy_store_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode) 
        REFERENCES pharmacy_store(name, address_street_name, address_street_num, address_town, address_state, address_zipcode)
);

/*CREATE TABLE recieves ( -- for pharmacist and doctor to credentials
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    certification_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (first_name, last_name, certification_name),
    FOREIGN KEY (first_name, last_name) REFERENCES doctor(first_name, last_name),
    FOREIGN KEY (first_name, last_name) REFERENCES pharmacist(first_name, last_name),
    FOREIGN KEY (certification_name) REFERENCES certification(name)
);*/

CREATE TABLE in_network ( -- pharmacy store to insurance_company
    insurance_company_name VARCHAR(30) NOT NULL,
    pharmacy_store_name VARCHAR(30) NOT NULL,
    pharmacy_address_street_name VARCHAR(30) NOT NULL,
    pharmacy_address_street_num INT NOT NULL,
    pharmacy_address_town VARCHAR(30) NOT NULL,
    pharmacy_address_state VARCHAR(30) NOT NULL,
    pharmacy_address_zipcode CHAR(5) NOT NULL,
    PRIMARY KEY (insurance_company_name, pharmacy_store_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode),
    FOREIGN KEY (insurance_company_name) REFERENCES insurance_company(name),
    FOREIGN KEY (pharmacy_store_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode) 
        REFERENCES pharmacy_store(name, address_street_name, address_street_num, address_town, address_state, address_zipcode)
);

CREATE TABLE insured_by ( -- customer to insurance company
    insurance_id INT NOT NULL,
    company_name VARCHAR(30) NOT NULL,
    policy_number VARCHAR(30) NOT NULL, -- can this be randomly generated? idk
    PRIMARY KEY (insurance_id, company_name),
    FOREIGN KEY (insurance_id) REFERENCES customer(insurance_id),
    FOREIGN KEY (company_name) REFERENCES insurance_company(name)
);

CREATE TABLE covers ( -- medication to insurance company
    insurance_company_name VARCHAR(30) NOT NULL,
    medication_scientific_name VARCHAR(30) NOT NULL,
    medication_brand_name VARCHAR(30) NOT NULL,
    medication_dosage INT NOT NULL,
    PRIMARY KEY (insurance_company_name, medication_scientific_name, medication_brand_name, medication_dosage),
    FOREIGN KEY (insurance_company_name) REFERENCES insurance_company(name),
    FOREIGN KEY (medication_scientific_name, medication_brand_name, medication_dosage) 
        REFERENCES medication(scientific_name, brand_name, dosage)
);

CREATE TABLE contains ( -- order to medication, need diff name?
    order_id INT NOT NULL,
    medication_scientific_name VARCHAR(30) NOT NULL,
    medication_brand_name VARCHAR(30) NOT NULL,
    medication_dosage INT NOT NULL,
    PRIMARY KEY (order_id, medication_scientific_name, medication_brand_name, medication_dosage),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (medication_scientific_name, medication_brand_name, medication_dosage) REFERENCES medication(scientific_name, brand_name, dosage)
);

CREATE TABLE sells ( -- pharmacy store to medication
    pharmacy_store_name VARCHAR(30) NOT NULL,
    pharmacy_address_street_name VARCHAR(30) NOT NULL,
    pharmacy_address_street_num INT NOT NULL,
    pharmacy_address_town VARCHAR(30) NOT NULL,
    pharmacy_address_state VARCHAR(30) NOT NULL,
    pharmacy_address_zipcode CHAR(5) NOT NULL,
    medication_scientific_name VARCHAR(30) NOT NULL,
    medication_brand_name VARCHAR(30) NOT NULL,
    medication_dosage INT NOT NULL,
    PRIMARY KEY (pharmacy_store_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town,
				pharmacy_address_state, pharmacy_address_zipcode, medication_scientific_name, medication_brand_name, medication_dosage),
    FOREIGN KEY (pharmacy_store_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town,
				pharmacy_address_state, pharmacy_address_zipcode) 
        REFERENCES pharmacy_store(name, address_street_name, address_street_num, 
                                  address_town, address_state, address_zipcode),
    FOREIGN KEY (medication_scientific_name, medication_brand_name, medication_dosage) 
        REFERENCES medication(scientific_name, brand_name, dosage)
);

/*CREATE TABLE prescribes ( -- doctor to medication
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    medication_scientific_name VARCHAR(30) NOT NULL,
    medication_brand_name VARCHAR(30) NOT NULL,
    medication_dosage INT NOT NULL,
    PRIMARY KEY (first_name, last_name, medication_scientific_name, medication_brand_name, medication_dosage),
    FOREIGN KEY (first_name, last_name) REFERENCES doctor(first_name, last_name),
    FOREIGN KEY (medication_scientific_name, medication_brand_name, medication_dosage) REFERENCES medication(scientific_name, brand_name, dosage)
);*/


/*CREATE TABLE composed_of ( -- medication to chemcial
    medication_scientific_name VARCHAR(30) NOT NULL,
    medication_brand_name VARCHAR(30) NOT NULL,
    medication_dosage INT NOT NULL,
    chemical_scientific_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (medication_scientific_name, medication_brand_name, medication_dosage, chemical_scientific_name),
    FOREIGN KEY (medication_scientific_name, medication_brand_name, medication_dosage) 
        REFERENCES medication(scientific_name, brand_name, dosage),
    FOREIGN KEY (chemical_scientific_name) 
        REFERENCES chemical(scientific_name)
);*/

CREATE TABLE has ( -- medication to use, need diff name?
    use_id INT NOT NULL,
    medication_scientific_name VARCHAR(30) NOT NULL,
    medication_brand_name VARCHAR(30) NOT NULL,
    medication_dosage INT NOT NULL,
    PRIMARY KEY (use_id, medication_scientific_name, medication_brand_name, medication_dosage),
    FOREIGN KEY (use_id) REFERENCES uses(use_id),
    FOREIGN KEY (medication_scientific_name, medication_brand_name, medication_dosage) REFERENCES medication(scientific_name, brand_name, dosage)
);

/*CREATE TABLE classified_as ( -- chemical to classification
    class_name VARCHAR(30) NOT NULL,
    scientific_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (class_name, scientific_name),
    FOREIGN KEY (class_name) REFERENCES classification(class_name),
    FOREIGN KEY (scientific_name) REFERENCES chemical(scientific_name)
);*/


/*CREATE TABLE contains (-- chemical to hazard; need to change name?  not sure
    hazard_description VARCHAR(300) NOT NULL,
    chemical_scientific_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (hazard_description, scientific_name),
    FOREIGN KEY (hazard_description) REFERENCES hazard(hazard_description),
    FOREIGN KEY (chemical_scientific_name) REFERENCES chemical(scientific_name)
);*/

/*CREATE TABLE places ( -- doctor to order
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    order_id INT NOT NULL,
    PRIMARY KEY (first_name, last_name, order_id),
    FOREIGN KEY (first_name, last_name) REFERENCES doctor(first_name, last_name),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);*/

CREATE TABLE picks_up ( -- customer, pharmacy, order
    customer_id INT NOT NULL,
    order_id INT NOT NULL,
    pharmacy_name VARCHAR(30) NOT NULL,
    pharmacy_address_street_name VARCHAR(30) NOT NULL,
    pharmacy_address_street_num INT NOT NULL,
    pharmacy_address_town VARCHAR(30) NOT NULL,
    pharmacy_address_state VARCHAR(30) NOT NULL,
    pharmacy_address_zipcode CHAR(5) NOT NULL,
    PRIMARY KEY (customer_id, order_id, pharmacy_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode),
    FOREIGN KEY (customer_id) REFERENCES customer(insurance_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (pharmacy_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode)
        REFERENCES pharmacy_store(name, address_street_name, address_street_num, address_town, address_state, address_zipcode)
);

/*CREATE TABLE diagnoses ( -- customer, illness, doctor
    diagnosis_id INT PRIMARY KEY,
    customer_insurance_id INT NOT NULL,
    doctor_first_name VARCHAR(30) NOT NULL,
    doctor_last_name VARCHAR(30) NOT NULL,
    illness_name VARCHAR(30) NOT NULL,
    diagnosis_date DATE NOT NULL,
    FOREIGN KEY (customer_insurance_id) REFERENCES customer(insurance_id),
    FOREIGN KEY (doctor_first_name, doctor_last_name) REFERENCES doctor(first_name, last_name),
    FOREIGN KEY (illness_name) REFERENCES illness(name)
);*/

