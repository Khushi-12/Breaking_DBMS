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
(123456789, 'Katniss', 'Everdeen', 'Jay St', 123, 'District 12', 'Panem', 12345, '2180-11-11', 'keverdeen12@gmail.com', 1111111111),
(112345678, 'Peeta', 'Mellark', 'Baker St', 454, 'District 12', 'Panem', 12345, '2179-06-03', 'pmellark44@gmail.com', 2222222222),
(111234567, 'Coriolanus', 'Snow', 'Presidental Rd', 52, 'Capitol', 'Panem', 94582, '2145-01-27', 'coriosnow@gmail.com', 3333333333),
(111123456, 'Primrose', 'Everdeen', 'Jay St', 123, 'District 12', 'Panem', 12345, '2185-05-17', 'primdeen11@gmail.com', 1111111212),
(111112345, 'Lucy Gray', 'Baird', 'Covey Rd', 100, 'District 12', 'Panem', 12345, '2145-09-21', 'lgraybaird@gmail.com', 4444444444),
(111111234, 'Finnick', 'Odair', 'Sugar St', 2, 'District 4', 'Panem', 44444, '2175-02-19', 'finnodair@gmail.com', 5555555555),
(111111123, 'Effie', 'Trinket', 'Mahogany Dr', 12, 'Capitol', 'Panem', 94582, '2157-12-31', 'etrinket2020@gmail.com', 6666666666),
(111111112, 'Haymitch', 'Abernathy', 'Sunrise St', 75, 'District 12', 'Panem', 12345, '2155-08-14', 'hayaber@gmail.com', 7777777777),
(111111111, 'Tigris', 'Snow', 'Presidental Rd', 52, 'Capitol', 'Panem', 94582, '2142-04-02', 'tigrissnow@gmail.com', 8888888888),
(234567891, 'Johanna', 'Mason', 'Spear Dr', 290, 'District 7', 'Panem', 37104, '2177-11-06', 'jomason@gmail.com', 9999999999),
(223456789, 'Gale', 'Hawthorne', 'Hunter Dr', 111, 'District 12', 'Panem', 12345, '2179-12-15', 'galehawthorne53@gmail.com', 1112221111),
(222345678, 'Caesar', 'Flickerman', 'Lucky Rd', 939, 'Capitol', 'Panem', 94582, '2151-09-02', 'caesarflickerman@gmail.com', 1113331111),
(222234567, 'Plutarch', 'Heavensbee', 'Director Cr', 372, 'Capitol', 'Panem', 94582, '2143-10-10', 'pheavensbee@gmail.com', 1114441111),
(222223456, 'Lucretius', 'Flickerman', 'Lucky Rd', 939, 'Capitol', 'Panem', 94582, '2151-10-02', 'lflickerman@gmail.com', 111555111),
(222222345, 'Kristen', 'Lee', 'Leek Rd', 484, 'Mahopac', 'New York', 48294, '2002-11-08', 'lee.kri@northeastern.edu', 7163414340),
(222222234, 'Alana', 'Baldari', 'Nitrile Dr', 391, 'Long Island', 'New York', 18492, '2001-01-28', 'ajbald@gmail.com', 7819592378),
(222222223, 'Laurie', 'King', 'Cross Dr', 131, 'Worcester', 'Massachusetts', 01610, '1970-05-27', 'lking@gmail.com', 8681932849),
(222222293, 'Jeremy', 'Rosenholtz', 'Delicate St', 9, 'Winchester', 'Massachusetts', 82014, '1955-10-17', 'jrosenholtz@gmail.com', 8198320392),
(333333333, 'Adelle', 'Feeley', 'Swift Dr', 45, 'Worcester', 'Massachusetts', 01610, '2002-08-27', 'adellefeeley@gmail.com', 7819292378), 
(323232323, 'Seneca', 'Crane', 'Maker St', 45, 'Capitol', 'Panem', 94582, '2175-03-03', 'scrane@gmail.com', 7189297823);




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

INSERT INTO pharmacy_store (name, address_street_name, address_street_num, address_town, address_state, address_zipcode, phone_numer) VALUES
('Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701', '2175550123'),
('Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502', '4025559876'),
('Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001', '2125550321'),
('Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611', '3125554678'),
('Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202', '3035550987'),
('Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028', '3235558432');


CREATE TABLE pharmacist (
	staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    pharmacy_store_name VARCHAR(30) NOT NULL,
    pharmacy_address_street_name VARCHAR(30) NOT NULL,
    pharmacy_address_street_num INT NOT NULL,
    pharmacy_address_town VARCHAR(30) NOT NULL,
    pharmacy_address_state VARCHAR(30) NOT NULL,
    pharmacy_address_zipcode CHAR(5) NOT NULL,
    CONSTRAINT unique_pharmacist_name UNIQUE (first_name, last_name),
    FOREIGN KEY (pharmacy_store_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode) 
        REFERENCES pharmacy_store(name, address_street_name, address_street_num, address_town, address_state, address_zipcode)
    
);

INSERT INTO pharmacist (first_name, last_name,pharmacy_store_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode) VALUES
('Jules', 'Sylvester','Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
('Edgar', 'Roman','Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
('Louisa', 'Wetzel','Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
('Gabby', 'Dipollito','Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
('Nakul', 'Rao','Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028');

-- Error Code: 1136. Column count doesn't match value count at row 1

CREATE TABLE illness(
	name VARCHAR(30) PRIMARY KEY NOT NULL, 
    severity INT NOT NULL,
    symptoms VARCHAR(128) NOT NULL,
    state VARCHAR(30) NOT NULL
);

INSERT INTO illness (name, severity, symptoms, state) VALUES
('Flu', 3, 'Fever, chills, fatigue', 'Active'),
('Common Cold', 2, 'Runny nose, cough, sore throat', 'Active'),
('Pneumonia', 5, 'Cough, difficulty breathing, chest pain', 'Critical'),
('Migraine', 4, 'Severe headache, nausea, light sensitivity', 'Active'),
('High Blood Pressure', 4, 'Headaches, dizziness, blurred vision', 'Chronic'),
('Asthma', 3, 'Shortness of breath, wheezing, coughing', 'Controlled'),
('Arthritis', 3, 'Joint pain, swelling, stiffness', 'Chronic'),
('Allergy', 2, 'Sneezing, itchy eyes, congestion', 'Active'),
('Diabetes', 4, 'Increased thirst, frequent urination, fatigue', 'Chronic'),
('Acid Reflux', 2, 'Heartburn, regurgitation, chest pain', 'Controlled'),
('Anxiety', 3, 'Nervousness, rapid heartbeat, restlessness', 'Active'),
('Infection', 5, 'Fever, chills, redness, swelling', 'Active'),
('Insomnia', 3, 'Difficulty falling asleep, fatigue', 'Active'),
('Severe Cough', 4, 'Persistent cough, difficulty breathing', 'Active');


CREATE TABLE doctor (
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    office_name VARCHAR(128) NOT NULL,
    office_address_street_name VARCHAR(30) NOT NULL,
    office_address_street_num VARCHAR(30) NOT NULL,
    office_address_town VARCHAR(30) NOT NULL,
    office_address_state VARCHAR(30) NOT NULL,
    office_address_zipcode CHAR(10) NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone CHAR(10) NOT NULL,
    specialty VARCHAR(30),
    CONSTRAINT unique_doctor_name UNIQUE (first_name, last_name, specialty)
);

INSERT INTO doctor VALUES 
('Natasha', 'Nicholas', 'Atrius Health', 'Hancock St', 1250, 'Quincy', 'Massachusetts', 02169, 'nicholas.n@northeastern.edu', '6173782799', 'Pediatrics'),
('Shane', 'Holmes', 'Boston Medical Center', 'Massachusetts Ave', 801, 'Boston', 'Massachusetts', 02116, 'holmes.sha@northeastern.edu', '6173782789', 'Family Medicine'),
('Khushi', 'Neema', 'Carbon Health', 'Boylston St', 399, 'Boston', 'Massachusetts', 02116, 'neemak@northeastern.edu', '8772419037', 'Psychiatrist'),
('Grace', 'Cerrato', 'Atrius Health', 'Hancock St', 1250, 'Quincy', 'Massachusetts', 02169, 'gcerr24@g.holycross.edu', '6173782799', 'Neurology'),
('Kathleen', 'Durant', 'Boston Medical Center', 'Massachusetts Ave', 801, 'Boston', 'Massachusetts', 02116, 'k.durant@northeastern.edu', '3823824020', 'Family Medicine');

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    medicine VARCHAR(30) NOT NULL,
    delivery_date DATE NOT NULL,
    doctor_first_name varchar(30) NOT NULL,
    doctor_last_name varchar(30) not null,
    doctor_specialty varchar(30) not null,
    foreign key (doctor_first_name, doctor_last_name, doctor_specialty) references doctor(first_name, last_name, specialty)
    on update cascade on delete cascade
);

INSERT INTO orders (order_id, medicine, delivery_date, doctor_first_name, doctor_last_name, doctor_specialty) VALUES
(1, 'Paracetamol', '2024-12-01','Khushi','Neema','Psychiatrist'),
(2, 'Ibuprofen', '2024-12-02','Grace', 'Cerrato','Neurology'),
(3, 'Aspirin', '2024-12-03','Natasha', 'Nicholas','Pediatrics'),
(4, 'Amoxicillin', '2024-12-04','Kathleen', 'Durant','Family Medicine'),
(5, 'Metformin', '2024-12-05','Natasha', 'Nicholas','Pediatrics'),
(6, 'Simvastatin', '2024-12-06','Khushi','Neema','Psychiatrist'),
(7, 'Cetirizine', '2024-12-07','Kathleen', 'Durant','Family Medicine'),
(8, 'Lisinopril', '2024-12-08','Shane','Holmes','Family Medicine'),
(9, 'Omeprazole', '2024-12-09','Kathleen', 'Durant','Family Medicine'),
(10, 'Metoprolol', '2024-12-10','Natasha', 'Nicholas','Pediatrics'),
(11, 'Prednisone', '2024-12-11','Kathleen', 'Durant','Family Medicine'),
(12, 'Doxycycline', '2024-12-12','Khushi','Neema','Psychiatrist'),
(13, 'Losartan', '2024-12-13','Khushi','Neema','Psychiatrist'),
(14, 'Hydrochlorothiazide', '2024-12-14','Shane','Holmes','Family Medicine'),
(15, 'Albuterol', '2024-12-15','Grace', 'Cerrato','Neurology'),
(16, 'Gabapentin', '2024-12-16','Shane','Holmes','Family Medicine'),
(17, 'Fluoxetine', '2024-12-17','Natasha', 'Nicholas','Pediatrics'),
(18, 'Furosemide', '2024-12-18','Shane','Holmes','Family Medicine'),
(19, 'Clonazepam', '2024-12-19','Kathleen', 'Durant','Family Medicine'),
(20, 'Loratadine', '2024-12-20','Natasha', 'Nicholas','Pediatrics'),
(21, 'Ciprofloxacin', '2024-12-21','Natasha', 'Nicholas','Pediatrics'),
(22, 'Atorvastatin', '2024-12-22','Grace', 'Cerrato','Neurology'),
(23, 'Hydroxychloroquine', '2024-12-23','Grace', 'Cerrato','Neurology'),
(24, 'Gabapentin', '2024-12-24','Shane','Holmes','Family Medicine'),
(25, 'Amlodipine', '2024-12-25','Natasha', 'Nicholas','Pediatrics'),
(26, 'Lansoprazole', '2024-12-26','Grace', 'Cerrato','Neurology'),
(27, 'Naproxen', '2024-12-27','Grace', 'Cerrato','Neurology'),
(28, 'Prazosin', '2024-12-28','Kathleen', 'Durant','Family Medicine'),
(29, 'Tamsulosin', '2024-12-29','Shane','Holmes','Family Medicine'),
(30, 'Clindamycin', '2024-12-30','Shane','Holmes','Family Medicine'),
(31, 'Chlorpheniramine', '2024-12-31','Khushi','Neema','Psychiatrist'),
(32, 'Metoclopramide', '2025-01-01','Khushi','Neema','Psychiatrist'),
(33, 'Alprazolam', '2025-01-02','Kathleen', 'Durant','Family Medicine'),
(34, 'Propranolol', '2025-01-03','Khushi','Neema','Psychiatrist'),
(35, 'Fentanyl', '2025-01-04','Kathleen', 'Durant','Family Medicine'),
(36, 'Diltiazem', '2025-01-05','Khushi','Neema','Psychiatrist'),
(37, 'Oxycodone', '2025-01-06','Shane','Holmes','Family Medicine'),
(38, 'Ethambutol', '2025-01-07','Natasha', 'Nicholas','Pediatrics'),
(39, 'Zolpidem', '2025-01-08','Shane','Holmes','Family Medicine'),
(40, 'Pregabalin', '2025-01-09','Kathleen', 'Durant','Family Medicine'),
(41, 'Diclofenac', '2025-01-10','Khushi','Neema','Psychiatrist'),
(42, 'Mupirocin', '2025-01-11','Shane','Holmes','Family Medicine'),
(43, 'Sildenafil', '2025-01-12','Natasha', 'Nicholas','Pediatrics');



CREATE TABLE certification(
	name VARCHAR(128) PRIMARY KEY NOT NULL,
    institution VARCHAR(128) NOT NULL,
    expiration_date DATE NOT NULL
);
-- Dummy values for pharmacist and doctor licenses
INSERT INTO certification (name, institution, expiration_date)
VALUES
('Pharmacist License', 'National Pharmacy Council', '2026-12-31'),
('Doctor License', 'Medical Licensing Authority', '2027-08-15'),
('Specialist Pharmacist Certification', 'Pharmacy Specialization Board', '2025-05-20'),
('General Practitioner License', 'State Medical Board', '2028-03-01'),
('Clinical Pharmacist Certification', 'International Pharmacy Council', '2026-07-01'),
('Pediatrician License', 'Board of Pediatric Medicine', '2027-11-12');




CREATE TABLE hazard(
	hazard_id INT PRIMARY KEY AUTO_INCREMENT,
	hazard_description VARCHAR(300) NOT NULL,
    safety_instruction VARCHAR(500)
);

-- Dummy values for the hazard table
INSERT INTO hazard (hazard_description, safety_instruction)
VALUES
('Highly flammable liquid and vapor.', 'Keep away from heat, sparks, open flames, and hot surfaces. Use explosion-proof equipment. Store in a cool, well-ventilated area.'),
('Causes severe skin burns and eye damage.', 'Wear protective gloves, goggles, and face shields. Wash thoroughly after handling. In case of contact, rinse immediately with plenty of water.'),
('May cause respiratory irritation.', 'Avoid breathing vapors or dust. Use with adequate ventilation. If inhaled, remove to fresh air and seek medical attention if symptoms persist.'),
('Toxic if swallowed.', 'Do not eat, drink, or smoke when using this product. Wash hands thoroughly after handling. If ingested, rinse mouth and seek immediate medical attention.'),
('Harmful if inhaled.', 'Use in a well-ventilated area or under a fume hood. Wear a respirator if necessary. Seek medical attention if breathing difficulty occurs.'),
('May cause cancer.', 'Avoid prolonged exposure. Wear appropriate personal protective equipment (PPE). Follow proper disposal protocols.'),
('May damage fertility or the unborn child.', 'Avoid exposure, especially during pregnancy. Use proper PPE and consult a supervisor before handling.'),
('May cause allergic skin reaction.', 'Avoid direct contact with skin. Wear protective gloves and wash exposed skin thoroughly. Use barrier creams if necessary.'),
('Harmful to aquatic life with long-lasting effects.', 'Avoid release to the environment. Dispose of contents/container in accordance with local regulations.'),
('Releases toxic gas when in contact with acids.', 'Avoid mixing with acidic materials. Store separately from acids in labeled containers.'),
('May cause drowsiness or dizziness.', 'Avoid operating machinery or driving after exposure. Use in well-ventilated areas.'),
('Explosive when dry.', 'Store under a protective liquid. Avoid friction, shock, and heat. Use non-sparking tools.'),
('Corrosive to metals.', 'Store in corrosion-resistant containers with a resistant inner liner. Keep away from metal objects.'),
('Oxidizing agent, may intensify fire.', 'Keep away from flammable and combustible materials. Store in a cool, dry place away from heat sources.'),
('Fatal if absorbed through the skin.', 'Wear chemical-resistant gloves and protective clothing. Avoid contact with skin at all costs. Seek immediate medical attention in case of exposure.'),
('Irritating to eyes and mucous membranes.', 'Wear safety goggles or face shields. Ensure adequate ventilation. Rinse eyes immediately if exposed and seek medical attention.'),
('Can cause frostbite.', 'Handle with insulated gloves. Avoid direct contact with skin. If frostbite occurs, immerse affected area in lukewarm water and seek medical attention.'),
('Emits toxic fumes when heated.', 'Avoid heating. Use in well-ventilated areas or under a fume hood. Store away from heat sources.'),
('Causes liver and kidney damage on prolonged exposure.', 'Minimize exposure duration. Use appropriate PPE and follow safety guidelines for handling hazardous materials.'),
('Carcinogenic in laboratory animals.', 'Limit exposure. Wear PPE including lab coats and gloves. Dispose of material according to safety regulations.');

CREATE TABLE classification(
	class_name VARCHAR(128) PRIMARY KEY NOT NULL,
    properties VARCHAR(128)
);

INSERT INTO classification (class_name, properties) VALUES -- this isnt rlly what i was thinking of but it technically works??
('Analgesic', 'Pain relief'),
('Antibiotic', 'Bactericidal'),
('Antidiabetic', 'Oral medication'),
('Cholesterol-lowering', 'Statin'),
('Antihistamine', 'Allergy relief'),
('Antihypertensive', 'ACE inhibitor'),
('Proton pump inhibitor', 'Gastroesophageal reflux'),
('Beta-blocker', 'Cardiovascular treatment'),
('Corticosteroid', 'Anti-inflammatory'),
('Diuretic', 'Thiazide'),
('Bronchodilator', 'Asthma relief'),
('Anticonvulsant', 'Neuropathic pain'),
('Antidepressant', 'Selective serotonin reuptake inhibitor'),
('Benzodiazepine', 'Anxiolytic');

CREATE TABLE chemical(
	scientific_name VARCHAR(30) PRIMARY KEY NOT NULL, -- check if this is valid for diagram
    common_name VARCHAR(30) NOT NULL,
    molecular_formula VARCHAR(30) NOT NULL,
    structure VARCHAR(30) NOT NULL,
    charge INT NOT NULL,
    solubility INT NOT NULL,
    classified_class_name VARCHAR(120),
    FOREIGN KEY (classified_class_name) REFERENCES classification(class_name)
    ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO chemical (scientific_name, common_name, molecular_formula, structure, charge, solubility,classified_class_name) VALUES
('Paracetamol', 'Acetaminophen', 'C8H9NO2', 'C6H4(OH)C(=O)NHCH3', 0, 2,'Analgesic'),
('Ibuprofen', 'Ibuprofen', 'C13H18O2', 'CH3(CH2)3COOCH2C6H4CH3', 0, 3,'Analgesic'),
('Aspirin', 'Acetylsalicylic acid', 'C9H8O4', 'CH3COOC6H4COOH', 0, 3,'Analgesic'),
('Amoxicillin', 'Amoxicillin', 'C16H19N3O5S', 'C6H4COOH-CH2-CO-NH', -1, 4,'Antibiotic'),
('Metformin', 'Metformin', 'C4H11N5', 'C(=N)NH2', 0, 5,'Antidiabetic'),
('Simvastatin', 'Simvastatin', 'C25H38O5', 'C6H4COOH-CH2-CO-NH', 0, 3,'Cholesterol-lowering'),
('Cetirizine', 'Cetirizine', 'C21H25ClN2O3', 'C6H4Cl-CH2-NH-COO', 0, 4,'Antihistamine'),
('Lisinopril', 'Lisinopril', 'C21H31N3O5', 'C6H5COOH-CH2-NH2', 0, 3,'Antihypertensive'),
('Omeprazole', 'Omeprazole', 'C17H19N3O3S', 'C6H4COOH-CH2-NH2', 0, 3,'Proton pump inhibitor'),
('Metoprolol', 'Metoprolol', 'C15H25NO3', 'C6H5C(=O)NH-C2H4', 0, 4,'Beta-blocker'),
('Prednisone', 'Prednisone', 'C21H26O5', 'C6H4COOH-C2H4', 0, 2,'Corticosteroid'),
('Doxycycline', 'Doxycycline', 'C22H24N2O8', 'C6H4OH-NH2-COOH', -1, 4,'Antibiotic'),
('Losartan', 'Losartan', 'C22H23ClN6O', 'C6H4COOH-NH-C6H4', 0, 3,'Antihypertensive'),
('Hydrochlorothiazide', 'Hydrochlorothiazide', 'C7H8ClN3O4S2', 'C6H4(OH)-C(=O)-NH2', -1, 3,'Diuretic'),
('Albuterol', 'Albuterol', 'C13H21NO3', 'C6H4Cl-CH2-NH-COOH', 1, 4,'Bronchodilator'),
('Gabapentin', 'Gabapentin', 'C9H17NO2', 'C8H5OH-CH2-NH2', 0, 5,'Anticonvulsant'),
('Fluoxetine', 'Fluoxetine', 'C17H18F3NO', 'C6H4COOH-CH2-NH2', 0, 3,'Antidepressant'),
('Furosemide', 'Furosemide', 'C12H11ClN2O5S', 'C6H4COOH-CH2-NH2', -1, 3,'Diuretic'),
('Clonazepam', 'Clonazepam', 'C15H10ClN3O3', 'C6H4COOH-CH2-C6H4', 0, 2,'Benzodiazepine'),
('Loratadine', 'Loratadine', 'C22H23ClN2O2', 'C6H4COOH-C2H4-NH2', 0, 3, 'Antihistamine');



CREATE TABLE medication(
	scientific_name VARCHAR(30) NOT NULL,
    common_name VARCHAR(30),
    brand_name VARCHAR(30),
    type VARCHAR(30) NOT NULL,
    warnings VARCHAR(128) NOT NULL,   -- Link to hazard
    contact VARCHAR(30),
    PRIMARY KEY (scientific_name, brand_name)
);

INSERT INTO medication (scientific_name, common_name, brand_name, type, warnings, contact)
VALUES
('Acetylsalicylic Acid', 'Aspirin', 'Bayer Aspirin', 'Tablet', 'May cause gastrointestinal bleeding.', 'Bayer HealthCare'),
('Paracetamol', 'Acetaminophen', 'Tylenol', 'Tablet', 'Overdose can cause liver damage.', 'Johnson & Johnson'),
('Ibuprofen', 'Advil', 'Advil', 'Capsule', 'May cause stomach irritation.', 'Pfizer'),
('Amoxicillin', 'Amoxil', 'Amoxil', 'Capsule', 'Allergic reactions may occur.', 'GlaxoSmithKline'),
('Metformin', 'Glucophage', 'Glucophage', 'Tablet', 'May cause lactic acidosis.', 'Merck'),
('Omeprazole', 'Prilosec', 'Prilosec', 'Capsule', 'Long-term use may cause vitamin deficiency.', 'AstraZeneca'),
('Clopidogrel', 'Plavix', 'Plavix', 'Tablet', 'Risk of excessive bleeding.', 'Sanofi'),
('Simvastatin', 'Zocor', 'Zocor', 'Tablet', 'May cause muscle pain or weakness.', 'Merck'),
('Ranitidine', 'Zantac', 'Zantac', 'Tablet', 'May increase risk of cancer.', 'Sanofi'),
('Warfarin', 'Coumadin', 'Coumadin', 'Tablet', 'Risk of severe bleeding.', 'Bristol-Myers Squibb'),
('Epinephrine', 'Adrenaline', 'EpiPen', 'Injection', 'May cause rapid heart rate.', 'Mylan'),
('Ketamine', 'Ketalar', 'Ketalar','Injection', 'May cause hallucinations.', 'Pfizer'),
('Dexamethasone', 'Decadron', 'Decadron', 'Tablet', 'May suppress immune response.', 'Merck'),
('Loratadine', 'Claritin', 'Claritin', 'Tablet', 'May cause drowsiness.', 'Bayer'),
('Methotrexate', 'Trexall', 'Trexall', 'Tablet', 'Toxic to liver and bone marrow.', 'Pfizer'),
('Atorvastatin', 'Lipitor', 'Lipitor', 'Tablet', 'May cause muscle breakdown.', 'Pfizer'),
('Folic Acid', 'Vitamin B9', 'Folacare', 'Tablet', 'May mask vitamin B12 deficiency.', 'Nature Made'),
('Ascorbic Acid', 'Vitamin C', 'C-1000', 'Tablet', 'Excessive intake may cause kidney stones.', 'Nature Made'),
('Sodium Bicarbonate', 'Baking Soda', 'Sodibic', 'Tablet', 'May cause metabolic alkalosis.', 'Generic Manufacturer'),
('Hydrochloric Acid', 'Muriatic Acid', 'Acidol', 'Solution', 'Corrosive; causes severe burns.', 'Generic Manufacturer');

CREATE TABLE prescription(
	val INT PRIMARY KEY AUTO_INCREMENT,
    dosage INT NOT NULL,
    expiration_date DATE,
	quantity INT NOT NULL,
    scientific_name VARCHAR(30) NOT NULL,
    brand_name VARCHAR(30),
    FOREIGN KEY (scientific_name, brand_name) REFERENCES medication (scientific_name, brand_name)
    ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO prescription (dosage, expiration_date, quantity, scientific_name, brand_name) VALUES
(500, '2190-12-31', 50, 'Metformin', 'Glucophage'),
(50, '2190-06-03', 30, 'Simvastatin', 'Zocor'),
(400, '2192-01-17', 100,'Simvastatin', 'Zocor'),
(3.5, '2191-10-27', 25, 'Folic Acid','Folacare'),
(3.5, '2191-10-27', 40, 'Loratadine', 'Claritin'),
(250, '2195-02-15', 15, 'Ascorbic Acid', 'C-1000'),
(100, '2193-11-10', 60,'Ketamine', 'Ketalar'),
(200, '2194-07-22', 35,'Ibuprofen', 'Advil'),
(5, '2193-08-14', 20, 'Ascorbic Acid', 'C-1000'),
(10, '2196-09-30', 45,'Ibuprofen', 'Advil'),
(750, '2192-05-19', 30,'Paracetamol','Tylenol'),
(125, '2194-04-18', 55,'Loratadine', 'Claritin'),
(600, '2197-01-05', 70,'Metformin', 'Glucophage'),
(50, '2193-01-29', 25,'Ketamine', 'Ketalar'),
(400, '2195-03-23', 20,'Ibuprofen', 'Advil');





CREATE TABLE uses(
	use_id INT PRIMARY KEY AUTO_INCREMENT,
    use_case VARCHAR(30) NOT NULL,
    body_part VARCHAR(30) NOT NULL
);

INSERT INTO uses (use_case, body_part)
VALUES
('Pain Relief', 'Head'),
('Pain Relief', 'Back'), 
('Allergy Relief', 'Nose'),
('Anti-Inflammatory', 'Joints'),
('Cold and Flu', 'Sinuses'), 
('Digestive Health', 'Stomach'), 
('Skin Irritation', 'Skin'), 
('Blood Pressure Control', 'Heart'), 
('Bone Strengthening', 'Bones'),
('Muscle Relaxant', 'Muscles'),
('Wound Healing', 'Skin'),
('Antibiotic', 'Lungs'),
('Cholesterol Control', 'Blood'),
('Hair Growth', 'Scalp'),
('Dental Care', 'Teeth'), 
('Antiseptic', 'Hands'),
('Immune Support', 'Immune System'),
('Nerve Pain Relief', 'Nerves')
;

CREATE TABLE insurance_company(
	name VARCHAR(30) PRIMARY KEY,
    contact VARCHAR(30)
);

INSERT INTO insurance_company (name, contact)
VALUES
('UnitedHealth Group', '1-800-328-5979'),
('Anthem Blue Cross', '1-800-331-1476'),
('Aetna', '1-855-372-8824'),
('Cigna', '1-800-997-1654'),
('Humana', '1-877-877-1051'),
('Kaiser Permanente', '1-800-464-4000'),
('Blue Shield of California', '1-888-256-3650'),
('Molina Healthcare', '1-888-665-4621'),
('Health Net', '1-800-522-0088'),
('WellCare Health Plans', '1-866-999-3945'),
('Centene Corporation', '1-800-392-2160'),
('Oscar Health', '1-855-672-2788'),
('United Healthcare of Texas', '1-800-357-0978'),
('Blue Cross Blue Shield', '1-888-630-2583'),
('CareFirst BlueCross BlueShield', '1-800-783-4582'),
('Harvard Pilgrim Health Care', '1-888-888-4742'),
('Highmark', '1-866-823-2573'),
('Independence Blue Cross', '1-800-275-2583'),
('EmblemHealth', '1-800-447-8255'),
('Medica', '1-800-936-6880');

-- Relationships
CREATE TABLE obtains_doctor ( -- doc, certification
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    certification_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (first_name, last_name, certification_name),
    FOREIGN KEY (first_name, last_name) 
        REFERENCES doctor(first_name, last_name) 
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (certification_name) 
        REFERENCES certification(name) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
INSERT INTO obtains_doctor (first_name, last_name, certification_name)
VALUES
('Natasha', 'Nicholas', 'Doctor License'),
('Shane', 'Holmes', 'General Practitioner License'),
('Khushi', 'Neema', 'Pediatrician License'),
('Grace', 'Cerrato', 'Doctor License'),
('Kathleen', 'Durant', 'General Practitioner License');


CREATE TABLE obtains_pharmacist ( -- pharm, certification
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    certification_name VARCHAR(120) NOT NULL,
    PRIMARY KEY (first_name, last_name, certification_name),
    FOREIGN KEY (first_name, last_name) 
        REFERENCES pharmacist(first_name, last_name) 
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (certification_name) 
        REFERENCES certification(name) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
    
-- Insert data into the obtains table with role
INSERT INTO obtains_pharmacist (first_name, last_name, certification_name)
VALUES
('Jules', 'Sylvester', 'Pharmacist License'),
('Edgar', 'Roman', 'Specialist Pharmacist Certification'),
('Louisa', 'Wetzel', 'Pharmacist License'),
('Gabby', 'Dipollito', 'Clinical Pharmacist Certification'),
('Nakul', 'Rao', 'Pharmacist License');



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

INSERT INTO in_network (insurance_company_name, pharmacy_store_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode)
VALUES
('UnitedHealth Group', 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
('UnitedHealth Group', 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
('Anthem Blue Cross', 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
('Anthem Blue Cross', 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028'),
('Aetna', 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202'),
('Aetna', 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
('Cigna', 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
('Cigna', 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028'),
('Humana', 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
('Humana', 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
('Centene Corporation', 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
('Centene Corporation', 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202'),
('Oscar Health', 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
('Oscar Health', 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
('Blue Cross Blue Shield', 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028'),
('Blue Cross Blue Shield', 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
('CareFirst BlueCross BlueShield', 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
('CareFirst BlueCross BlueShield', 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
('Harvard Pilgrim Health Care', 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202'),
('Harvard Pilgrim Health Care', 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028');

Select * from in_network
where pharmacy_store_name = 'Cedar Pharmacy';


CREATE TABLE insured_by ( -- customer to insurance company
    insurance_id INT NOT NULL,
    company_name VARCHAR(30) NOT NULL,
    policy_number VARCHAR(30) NOT NULL, -- can this be randomly generated? idk
    PRIMARY KEY (insurance_id, company_name),
    FOREIGN KEY (insurance_id) REFERENCES customer(insurance_id),
    FOREIGN KEY (company_name) REFERENCES insurance_company(name)
);

INSERT INTO insured_by (insurance_id, company_name, policy_number) 
VALUES 
(123456789, 'UnitedHealth Group', 'POLICY-1254'),
(112345678, 'Anthem Blue Cross', 'POLICY-8321'),
(111234567, 'Aetna', 'POLICY-9845'),
(111123456, 'Cigna', 'POLICY-2041'),
(111112345, 'Humana', 'POLICY-7412'),
(111111234, 'Kaiser Permanente', 'POLICY-5678'),
(111111123, 'Blue Shield of California', 'POLICY-4317'),
(111111112, 'Molina Healthcare', 'POLICY-9832'),
(111111111, 'Health Net', 'POLICY-3781'),
(234567891, 'WellCare Health Plans', 'POLICY-5923'),
(223456789, 'Centene Corporation', 'POLICY-6154'),
(222345678, 'Oscar Health', 'POLICY-2904'),
(222234567, 'United Healthcare of Texas', 'POLICY-8025'),
(222223456, 'Blue Cross Blue Shield', 'POLICY-6673'),
(222222345, 'CareFirst BlueCross BlueShield', 'POLICY-5409'),
(222222234, 'Harvard Pilgrim Health Care', 'POLICY-8576'),
(222222223, 'Highmark', 'POLICY-1102'),
(222222293, 'Independence Blue Cross', 'POLICY-3492'),
(333333333, 'EmblemHealth', 'POLICY-2265'),
(323232323, 'Medica', 'POLICY-4128');

-- Select * from insured_by;

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

INSERT INTO picks_up (customer_id, order_id, pharmacy_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode) 
VALUES
(123456789, 1, 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
(112345678, 2, 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
(111234567, 3, 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
(111123456, 4, 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
(111112345, 5, 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202'),
(111111234, 6, 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028'),
(111111123, 7, 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
(111111112, 8, 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
(111111111, 9, 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
(234567891, 10, 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
(223456789, 11, 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202'),
(222345678, 12, 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028'),
(222234567, 13, 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
(222223456, 14, 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
(222222345, 15, 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
(222222234, 16, 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
(222222223, 17, 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202'),
(222222293, 18, 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028'),
(333333333, 19, 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
(323232323, 20, 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
(222222223, 21, 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
(222234567, 22, 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
(222222234, 23, 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202'),
(223456789, 24, 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028'),
(111123456, 25, 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
(112345678, 26, 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
(111112345, 27, 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
(111112345, 28, 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
(222222223, 29, 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202'),
(222234567, 30, 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028'),
(111123456, 31, 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
(222222345, 32, 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
(234567891, 33, 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
(222222223, 34, 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
(112345678, 35, 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202'),
(111123456, 36, 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028'),
(111123456, 37, 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
(222222223, 38, 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
(234567891, 39, 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
(222345678, 40, 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
(112345678, 41, 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202'),
(222222234, 42, 'Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028'),
(111123456, 43, 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701');
;


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

INSERT INTO diagnoses (diagnosis_id, customer_insurance_id, doctor_first_name, doctor_last_name, illness_name, diagnosis_date)
VALUES
(1, 123456789, 'Natasha', 'Nicholas', 'Flu', '2024-01-15'),
(2, 112345678, 'Shane', 'Holmes', 'Common Cold', '2024-02-20'),
(3, 111234567, 'Khushi', 'Neema', 'Pneumonia', '2024-03-12'),
(4, 111123456, 'Grace', 'Cerrato', 'Migraine', '2024-04-10'),
(5, 111112345, 'Kathleen', 'Durant', 'High Blood Pressure', '2024-05-05'),
(6, 111111234, 'Natasha', 'Nicholas', 'Asthma', '2024-06-14'),
(7, 111111123, 'Shane', 'Holmes', 'Arthritis', '2024-07-19'),
(8, 111111112, 'Khushi', 'Neema', 'Allergy', '2024-08-11'),
(9, 111111111, 'Grace', 'Cerrato', 'Diabetes', '2024-09-23'),
(10, 234567891, 'Kathleen', 'Durant', 'Acid Reflux', '2024-10-15'),
(11, 223456789, 'Natasha', 'Nicholas', 'Anxiety', '2024-11-10'),
(12, 222345678, 'Shane', 'Holmes', 'Infection', '2024-01-05'),
(13, 222234567, 'Khushi', 'Neema', 'Insomnia', '2024-02-13'),
(14, 222223456, 'Grace', 'Cerrato', 'Severe Cough', '2024-03-21'),
(15, 222222345, 'Kathleen', 'Durant', 'Flu', '2024-04-02'),
(16, 222222234, 'Natasha', 'Nicholas', 'Common Cold', '2024-05-07'),
(17, 222222223, 'Shane', 'Holmes', 'Pneumonia', '2024-06-18'),
(18, 222222293, 'Khushi', 'Neema', 'Migraine', '2024-07-22'),
(19, 333333333, 'Grace', 'Cerrato', 'High Blood Pressure', '2024-08-29'),
(20, 323232323, 'Kathleen', 'Durant', 'Asthma', '2024-09-12');

CREATE TABLE contains ( -- order to prescription 
    order_id INT,              
    prescription_id INT,                         
    PRIMARY KEY (order_id, prescription_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE, 
    FOREIGN KEY (prescription_id) REFERENCES prescription(val) ON DELETE CASCADE 
); 

INSERT INTO contains (order_id, prescription_id) 
VALUES
(1, 10),
(1, 3),
(2, 5),
(2, 7),
(3, 6),
(3, 7),
(3, 13),
(4, 12),
(5, 15),
(5, 11),
(6, 2),
(6, 9),
(7, 3),
(7, 5),
(8, 9),
(8, 2),
(9, 6),
(9, 13),
(10, 8),
(10, 7),
(11, 13),
(11, 1),
(12, 15),
(12, 4),
(13, 14),
(13, 9),
(14, 4),
(14, 8),
(15, 11),
(16, 10),
(16, 3),
(17, 6),
(17, 12),
(18, 9),
(18, 7),
(19, 3),
(19, 15),
(20, 8),
(20, 5),
(21, 13),
(21, 2),
(22, 15),
(22, 10),
(23, 2),
(23, 5),
(24, 8),
(24, 1),
(25, 15),
(25, 3),
(26, 7),
(26, 12),
(27, 4),
(27, 13),
(28, 14),
(28, 9),
(29, 1),
(29, 5),
(30, 11),
(31, 6),
(31, 10),
(32, 3),
(32, 7),
(33, 15),
(33, 2),
(34, 14),
(34, 8),
(35, 9),
(35, 12),
(36, 7),
(36, 5),
(37, 2),
(37, 13),
(38, 12),
(39, 1),
(39, 3),
(40, 14),
(41, 6),
(42, 4),
(43, 13),
(43, 7);

CREATE TABLE sells ( -- pharmacy store to medication
    pharmacy_name VARCHAR(30),          
    pharmacy_address_street_name VARCHAR(30), 
    pharmacy_address_street_num INT,  
    pharmacy_address_town VARCHAR(30),   
    pharmacy_address_state VARCHAR(30), 
    pharmacy_address_zipcode CHAR(5),  
    medication_scientific_name VARCHAR(30),
    medication_brand_name VARCHAR(30), 
    quantity INT NOT NULL,         
    PRIMARY KEY (pharmacy_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode, medication_scientific_name, medication_brand_name), -- Composite primary key
    FOREIGN KEY (pharmacy_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode) 
        REFERENCES pharmacy_store(name, address_street_name, address_street_num, address_town, address_state, address_zipcode) 
        ON DELETE CASCADE,       
    FOREIGN KEY (medication_scientific_name, medication_brand_name) 
        REFERENCES medication(scientific_name, brand_name) 
        ON DELETE CASCADE            
);

INSERT INTO sells (pharmacy_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode, medication_scientific_name, medication_brand_name, quantity)
VALUES
('Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701', 'Acetylsalicylic Acid', 'Bayer Aspirin', 100),
('Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701', 'Paracetamol', 'Tylenol', 200),
('Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502', 'Ibuprofen', 'Advil', 150),
('Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001', 'Amoxicillin', 'Amoxil', 120),
('Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001', 'Metformin', 'Glucophage', 80),
('Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611', 'Omeprazole', 'Prilosec', 90),
('Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611', 'Simvastatin', 'Zocor', 60),
('Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202', 'Clopidogrel', 'Plavix', 150),
('Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202', 'Ranitidine', 'Zantac', 75),
('Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028', 'Warfarin', 'Coumadin', 130),
('Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028', 'Epinephrine', 'EpiPen', 50),
('Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701', 'Ketamine', 'Ketalar', 30),
('Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502', 'Dexamethasone', 'Decadron', 110),
('Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001', 'Loratadine', 'Claritin', 200),
('Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611', 'Methotrexate', 'Trexall', 40),
('Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202', 'Atorvastatin', 'Lipitor', 90),
('Sunset Pharmacy', 'Sunset Blvd', 2134, 'Los Angeles', 'California', '90028', 'Folic Acid', 'Folacare', 150);


CREATE TABLE covers ( -- insurance to medication
    scientific_name VARCHAR(30),        
    brand_name VARCHAR(30),         
    insurance_company_name VARCHAR(30),   
    PRIMARY KEY (scientific_name, brand_name, insurance_company_name), 
    FOREIGN KEY (scientific_name, brand_name) 
        REFERENCES medication(scientific_name, brand_name) 
        ON DELETE CASCADE,  
    FOREIGN KEY (insurance_company_name) 
        REFERENCES insurance_company(name) 
        ON DELETE CASCADE 
);

INSERT INTO covers (scientific_name, brand_name, insurance_company_name)
VALUES
('Acetylsalicylic Acid', 'Bayer Aspirin', 'UnitedHealth Group'),
('Paracetamol', 'Tylenol', 'Anthem Blue Cross'),
('Ibuprofen', 'Advil', 'Aetna'),
('Amoxicillin', 'Amoxil', 'Cigna'),
('Metformin', 'Glucophage', 'Humana'),
('Omeprazole', 'Prilosec', 'Kaiser Permanente'),
('Clopidogrel', 'Plavix', 'Blue Shield of California'),
('Simvastatin', 'Zocor', 'Molina Healthcare'),
('Ranitidine', 'Zantac', 'Health Net'),
('Warfarin', 'Coumadin', 'WellCare Health Plans'),
('Epinephrine', 'EpiPen', 'Centene Corporation'),
('Ketamine', 'Ketalar', 'Oscar Health'),
('Dexamethasone', 'Decadron', 'United Healthcare of Texas'),
('Loratadine', 'Claritin', 'Blue Cross Blue Shield'),
('Methotrexate', 'Trexall', 'CareFirst BlueCross BlueShield'),
('Atorvastatin', 'Lipitor', 'Harvard Pilgrim Health Care'),
('Folic Acid', 'Folacare', 'Highmark'),
('Ascorbic Acid', 'C-1000', 'Independence Blue Cross'),
('Sodium Bicarbonate', 'Sodibic', 'EmblemHealth'),
('Hydrochloric Acid', 'Acidol', 'Medica');


CREATE TABLE composed_of ( -- medication to chemical
    scientific_name VARCHAR(30), 
    brand_name VARCHAR(30), 
    chemical_scientific_name VARCHAR(30), 
    PRIMARY KEY (scientific_name, brand_name, chemical_scientific_name),
    FOREIGN KEY (scientific_name, brand_name) 
        REFERENCES medication(scientific_name, brand_name) 
        ON DELETE CASCADE,     
    FOREIGN KEY (chemical_scientific_name) 
        REFERENCES chemical(scientific_name) 
        ON DELETE CASCADE    
);
INSERT INTO composed_of (scientific_name, brand_name, chemical_scientific_name)
VALUES
('Acetylsalicylic Acid', 'Bayer Aspirin', 'Aspirin'),
('Paracetamol', 'Tylenol', 'Paracetamol'),
('Ibuprofen', 'Advil', 'Ibuprofen'),
('Amoxicillin', 'Amoxil', 'Amoxicillin'),
('Metformin', 'Glucophage', 'Metformin'),
('Omeprazole', 'Prilosec', 'Omeprazole'),
('Clopidogrel', 'Plavix', 'Cetirizine'),
('Simvastatin', 'Zocor', 'Simvastatin'),
('Ranitidine', 'Zantac', 'Omeprazole'),
('Warfarin', 'Coumadin', 'Cetirizine'),
('Epinephrine', 'EpiPen', 'Paracetamol'),
('Ketamine', 'Ketalar', 'Cetirizine'),
('Dexamethasone', 'Decadron', 'Simvastatin'),
('Loratadine', 'Claritin', 'Loratadine'),
('Methotrexate', 'Trexall', 'Ibuprofen'),
('Atorvastatin', 'Lipitor', 'Simvastatin'),
('Folic Acid', 'Folacare', 'Loratadine'),
('Ascorbic Acid', 'C-1000', 'Simvastatin'),
('Sodium Bicarbonate', 'Sodibic', 'Simvastatin'),
('Hydrochloric Acid', 'Acidol', 'Aspirin')
;



CREATE TABLE used_for ( -- medication to uses
    scientific_name VARCHAR(30),             
    brand_name VARCHAR(30),         
    use_id INT,               
    PRIMARY KEY (scientific_name, brand_name, use_id), 
    FOREIGN KEY (scientific_name, brand_name) 
        REFERENCES medication(scientific_name, brand_name)
        ON DELETE CASCADE,          
    FOREIGN KEY (use_id) 
        REFERENCES uses(use_id)
        ON DELETE CASCADE            
);

INSERT INTO used_for (scientific_name, brand_name, use_id)
VALUES
('Acetylsalicylic Acid', 'Bayer Aspirin', 1),
('Acetylsalicylic Acid', 'Bayer Aspirin', 2),
('Acetylsalicylic Acid', 'Bayer Aspirin', 3),
('Paracetamol', 'Tylenol', 4),
('Paracetamol', 'Tylenol', 5),
('Paracetamol', 'Tylenol', 6),
('Ibuprofen', 'Advil', 7),
('Ibuprofen', 'Advil', 8),
('Amoxicillin', 'Amoxil', 9),
('Omeprazole', 'Prilosec', 10),
('Simvastatin', 'Zocor', 11),
('Ranitidine', 'Zantac', 12),
('Ranitidine', 'Zantac', 13),
('Warfarin', 'Coumadin', 14),
('Epinephrine', 'EpiPen', 15),
('Ketamine', 'Ketalar', 16),
('Dexamethasone', 'Decadron', 17),
('Dexamethasone', 'Decadron', 18),
('Loratadine', 'Claritin', 4),
('Loratadine', 'Claritin', 5),
('Atorvastatin', 'Lipitor', 6),
('Folic Acid', 'Folacare', 10),
('Ascorbic Acid', 'C-1000', 18),
('Sodium Bicarbonate', 'Sodibic', 14),
('Hydrochloric Acid', 'Acidol', 16)
;







CREATE TABLE hazardous ( -- chemical to hazard
    scientific_name VARCHAR(30),
    hazard_id INT,
    PRIMARY KEY (scientific_name, hazard_id),
    FOREIGN KEY (scientific_name) 
        REFERENCES chemical(scientific_name) 
        ON DELETE CASCADE,
    FOREIGN KEY (hazard_id) 
        REFERENCES hazard(hazard_id) 
        ON DELETE CASCADE
);

INSERT INTO hazardous (scientific_name, hazard_id)
VALUES
('Paracetamol', 1),  
('Ibuprofen', 11), 
('Aspirin', 3),     
('Amoxicillin', 5),  
('Metformin', 11),  
('Simvastatin', 11), 
('Cetirizine', 8),  
('Lisinopril', 3),  
('Omeprazole', 11),  
('Metoprolol', 11),  
('Prednisone', 3),   
('Doxycycline', 1),  
('Losartan', 3),    
('Hydrochlorothiazide', 11), 
('Albuterol', 11),  
('Gabapentin', 11),  
('Fluoxetine', 11),  
('Furosemide', 11),  
('Clonazepam', 11), 
('Loratadine', 8);  