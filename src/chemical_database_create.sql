
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

CREATE TABLE recieves ( -- for pharmacist and doctor to credentials
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    certification_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (first_name, last_name, certification_name),
    FOREIGN KEY (first_name, last_name) REFERENCES doctor(first_name, last_name),
    FOREIGN KEY (first_name, last_name) REFERENCES pharmacist(first_name, last_name),
    FOREIGN KEY (certification_name) REFERENCES certification(name)
);

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

CREATE TABLE prescribes ( -- doctor to medication
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    medication_scientific_name VARCHAR(30) NOT NULL,
    medication_brand_name VARCHAR(30) NOT NULL,
    medication_dosage INT NOT NULL,
    PRIMARY KEY (first_name, last_name, medication_scientific_name, medication_brand_name, medication_dosage),
    FOREIGN KEY (first_name, last_name) REFERENCES doctor(first_name, last_name),
    FOREIGN KEY (medication_scientific_name, medication_brand_name, medication_dosage) REFERENCES medication(scientific_name, brand_name, dosage)
);


CREATE TABLE composed_of ( -- medication to chemcial
    medication_scientific_name VARCHAR(30) NOT NULL,
    medication_brand_name VARCHAR(30) NOT NULL,
    medication_dosage INT NOT NULL,
    chemical_scientific_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (medication_scientific_name, medication_brand_name, medication_dosage, chemical_scientific_name),
    FOREIGN KEY (medication_scientific_name, medication_brand_name, medication_dosage) 
        REFERENCES medication(scientific_name, brand_name, dosage),
    FOREIGN KEY (chemical_scientific_name) 
        REFERENCES chemical(scientific_name)
);

CREATE TABLE has ( -- medication to use, need diff name?
    use_id INT NOT NULL,
    medication_scientific_name VARCHAR(30) NOT NULL,
    medication_brand_name VARCHAR(30) NOT NULL,
    medication_dosage INT NOT NULL,
    PRIMARY KEY (use_id, medication_scientific_name, medication_brand_name, medication_dosage),
    FOREIGN KEY (use_id) REFERENCES uses(use_id),
    FOREIGN KEY (medication_scientific_name, medication_brand_name, medication_dosage) REFERENCES medication(scientific_name, brand_name, dosage)
);

CREATE TABLE classified_as ( -- chemical to classification
    class_name VARCHAR(30) NOT NULL,
    scientific_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (class_name, scientific_name),
    FOREIGN KEY (class_name) REFERENCES classification(class_name),
    FOREIGN KEY (scientific_name) REFERENCES chemical(scientific_name)
);


CREATE TABLE contains (-- chemical to hazard; need to change name?  not sure
    hazard_description VARCHAR(300) NOT NULL,
    chemical_scientific_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (hazard_description, scientific_name),
    FOREIGN KEY (hazard_description) REFERENCES hazard(hazard_description),
    FOREIGN KEY (chemical_scientific_name) REFERENCES chemical(scientific_name)
);

CREATE TABLE places ( -- doctor to order
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    order_id INT NOT NULL,
    PRIMARY KEY (first_name, last_name, order_id),
    FOREIGN KEY (first_name, last_name) REFERENCES doctor(first_name, last_name),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

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

CREATE TABLE diagnoses ( -- customer, illness, doctor
    diagnosis_id INT PRIMARY KEY,
    customer_insurance_id INT NOT NULL,
    doctor_first_name VARCHAR(30) NOT NULL,
    doctor_last_name VARCHAR(30) NOT NULL,
    illness_name VARCHAR(30) NOT NULL,
    diagnosis_date DATE NOT NULL,
    FOREIGN KEY (customer_insurance_id) REFERENCES customer(insurance_id),
    FOREIGN KEY (doctor_first_name, doctor_last_name) REFERENCES doctor(first_name, last_name),
    FOREIGN KEY (illness_name) REFERENCES illness(name)
);



