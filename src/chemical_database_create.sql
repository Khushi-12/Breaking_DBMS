DROP DATABASE IF EXISTS Chemical_database;
CREATE DATABASE Chemical_database;
USE Chemical_database;

-- Entities

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
    phone CHAR(10) NOT NULL,
    insurance_name VARCHAR(30),
    FOREIGN KEY (insurance_name) REFERENCES insurance_company(name)
	ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO customer VALUES 
(123456789, 'Katniss', 'Everdeen', 'Jay St', 123, 'District 12', 'Panem', 12345, '2002-11-11', 'keverdeen12@gmail.com', 1111111111,'Blue Cross Blue Shield'),
(112345678, 'Peeta', 'Mellark', 'Baker St', 454, 'District 12', 'Panem', 12345, '2001-06-03', 'pmellark44@gmail.com', 2222222222,'Health Net'),
(111234567, 'Coriolanus', 'Snow', 'Presidental Rd', 52, 'Capitol', 'Panem', 94582, '1957-01-27', 'coriosnow@gmail.com', 3333333333,'Health Net'),
(111123456, 'Primrose', 'Everdeen', 'Jay St', 123, 'District 12', 'Panem', 12345, '2007-05-17', 'primdeen11@gmail.com', 1111111212,'Harvard Pilgrim Health Care'),
(111112345, 'Lucy-Gray', 'Baird', 'Covey Rd', 100, 'District 12', 'Panem', 12345, '1957-09-21', 'lgraybaird@gmail.com', 4444444444,'Centene Corporation'),
(111111234, 'Finnick', 'Odair', 'Sugar St', 2, 'District 4', 'Panem', 44444, '1995-02-19', 'finnodair@gmail.com', 5555555555,'Aetna'),
(111111123, 'Effie', 'Trinket', 'Mahogany Dr', 12, 'Capitol', 'Panem', 94582, '1986-12-31', 'etrinket2020@gmail.com', 6666666666, 'Cigna'),
(111111112, 'Haymitch', 'Abernathy', 'Sunrise St', 75, 'District 12', 'Panem', 12345, '1989-08-14', 'hayaber@gmail.com', 7777777777,'Health Net'),
(111111111, 'Tigris', 'Snow', 'Presidental Rd', 52, 'Capitol', 'Panem', 94582, '1954-04-02', 'tigrissnow@gmail.com', 8888888888,'EmblemHealth'),
(234567891, 'Johanna', 'Mason', 'Spear Dr', 290, 'District 7', 'Panem', 37104, '1997-11-06', 'jomason@gmail.com', 9999999999,'EmblemHealth'),
(223456789, 'Gale', 'Hawthorne', 'Hunter Dr', 111, 'District 12', 'Panem', 12345, '2000-12-15', 'galehawthorne53@gmail.com', 1112221111,'Humana'),
(222345678, 'Caesar', 'Flickerman', 'Lucky Rd', 939, 'Capitol', 'Panem', 94582, '1973-09-02', 'caesarflickerman@gmail.com', 1113331111,'Blue Cross Blue Shield'),
(222234567, 'Plutarch', 'Heavensbee', 'Director Cr', 372, 'Capitol', 'Panem', 94582, '1977-10-10', 'pheavensbee@gmail.com', 1114441111,'Independence Blue Cross'),
(222223456, 'Lucretius', 'Flickerman', 'Lucky Rd', 939, 'Capitol', 'Panem', 94582, '1931-10-02', 'lflickerman@gmail.com', 111555111,'Cigna'),
(222222345, 'Kristen', 'Lee', 'Leek Rd', 484, 'Mahopac', 'New York', 48294, '2002-08-11', 'lee.kri@northeastern.edu', 7163414340,'CareFirst BlueCross BlueShield'),
(222222234, 'Alana', 'Baldari', 'Nitrile Dr', 391, 'Long Island', 'New York', 18492, '2001-01-28', 'ajbald@gmail.com', 7819592378,'Blue Cross Blue Shield'),
(222222223, 'Laurie', 'King', 'Cross Dr', 131, 'Worcester', 'Massachusetts', 01610, '1970-05-27', 'lking@gmail.com', 8681932849,'Oscar Health'),
(222222293, 'Jeremy', 'Rosenholtz', 'Delicate St', 9, 'Winchester', 'Massachusetts', 82014, '1955-10-17', 'jrosenholtz@gmail.com', 8198320392,'Anthem Blue Cross'),
(333333333, 'Adelle', 'Feeley', 'Swift Dr', 45, 'Worcester', 'Massachusetts', 01610, '2002-08-27', 'adellefeeley@gmail.com', 7819292378,'Oscar Health'), 
(323232323, 'Seneca', 'Crane', 'Maker St', 45, 'Capitol', 'Panem', 94582, '1990-03-03', 'scrane@gmail.com', 7189297823,'Independence Blue Cross');


CREATE TABLE pharmacy_store(
	pharmacy_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
    address_street_name VARCHAR(30) NOT NULL,
    address_street_num INT NOT NULL,
    address_town VARCHAR(30) NOT NULL,
    address_state VARCHAR(30) NOT NULL,
    address_zipcode CHAR(5) NOT NULL,
    phone_number CHAR(10) NOT NULL
    -- PRIMARY KEY (name, address_street_name, address_street_num, address_town, address_state, address_zipcode)
);

INSERT INTO pharmacy_store (name, address_street_name, address_street_num, address_town, address_state, address_zipcode, phone_number) VALUES
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
    pharmacy_id INT NOT NULL,
    CONSTRAINT unique_pharmacist_name UNIQUE (first_name, last_name),
    FOREIGN KEY (pharmacy_id) 
        REFERENCES pharmacy_store(pharmacy_id) 
        ON DELETE CASCADE
);


INSERT INTO pharmacist (first_name, last_name, pharmacy_id) 
VALUES
('Jules', 'Sylvester', 1), 
('Edgar', 'Roman', 1),  
('Louisa', 'Wetzel', 2),  
('Gabby', 'Dipollito', 3),
('Nakul', 'Rao', 6);


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
    CONSTRAINT unique_doctor_name UNIQUE (first_name, last_name),
    PRIMARY KEY (first_name, last_name, specialty)
);

INSERT INTO doctor VALUES 
('Natasha', 'Nicholas', 'Atrius Health', 'Hancock St', 1250, 'Quincy', 'Massachusetts', 02169, 'nicholas.n@northeastern.edu', '6173782799', 'Pediatrics'),
('Shane', 'Holmes', 'Boston Medical Center', 'Massachusetts Ave', 801, 'Boston', 'Massachusetts', 02116, 'holmes.sha@northeastern.edu', '6173782789', 'Family Medicine'),
('Khushi', 'Neema', 'Carbon Health', 'Boylston St', 399, 'Boston', 'Massachusetts', 02116, 'neemak@northeastern.edu', '8772419037', 'Psychiatrist'),
('Grace', 'Cerrato', 'Atrius Health', 'Hancock St', 1250, 'Quincy', 'Massachusetts', 02169, 'gcerr24@g.holycross.edu', '6173782799', 'Neurology'),
('Kathleen', 'Durant', 'Boston Medical Center', 'Massachusetts Ave', 801, 'Boston', 'Massachusetts', 02116, 'k.durant@northeastern.edu', '3823824020', 'Family Medicine');


CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    delivery_date DATE NOT NULL,
    doctor_first_name varchar(30) NOT NULL,
    doctor_last_name varchar(30) not null,
    doctor_specialty varchar(30) not null,
    foreign key (doctor_first_name, doctor_last_name, doctor_specialty) references doctor(first_name, last_name, specialty)
    on update cascade on delete cascade
);

INSERT INTO orders (order_id, delivery_date, doctor_first_name, doctor_last_name, doctor_specialty) VALUES
(1, '2024-12-01','Khushi','Neema','Psychiatrist'),
(2, '2024-12-02','Grace', 'Cerrato','Neurology'),
(3, '2024-12-03','Natasha', 'Nicholas','Pediatrics'),
(4, '2024-12-04','Kathleen', 'Durant','Family Medicine'),
(5,  '2024-12-05','Natasha', 'Nicholas','Pediatrics'),
(6,  '2024-12-06','Khushi','Neema','Psychiatrist'),
(7,  '2024-12-07','Kathleen', 'Durant','Family Medicine'),
(8,  '2024-12-08','Shane','Holmes','Family Medicine'),
(9,  '2024-12-09','Kathleen', 'Durant','Family Medicine'),
(10,  '2024-12-10','Natasha', 'Nicholas','Pediatrics'),
(11,  '2024-12-11','Kathleen', 'Durant','Family Medicine'),
(12, '2024-12-12','Khushi','Neema','Psychiatrist'),
(13, '2024-12-13','Khushi','Neema','Psychiatrist'),
(14,'2024-12-14','Shane','Holmes','Family Medicine'),
(15,'2024-12-15','Grace', 'Cerrato','Neurology'),
(16, '2024-12-16','Shane','Holmes','Family Medicine'),
(17, '2024-12-17','Natasha', 'Nicholas','Pediatrics'),
(18, '2024-12-18','Shane','Holmes','Family Medicine'),
(19, '2024-12-19','Kathleen', 'Durant','Family Medicine'),
(20, '2024-12-20','Natasha', 'Nicholas','Pediatrics'),
(21, '2024-12-21','Natasha', 'Nicholas','Pediatrics'),
(22, '2024-12-22','Grace', 'Cerrato','Neurology'),
(23, '2024-12-23','Grace', 'Cerrato','Neurology'),
(24, '2024-12-24','Shane','Holmes','Family Medicine'),
(25, '2024-12-25','Natasha', 'Nicholas','Pediatrics'),
(26, '2024-12-26','Grace', 'Cerrato','Neurology'),
(27, '2024-12-27','Grace', 'Cerrato','Neurology'),
(28, '2024-12-28','Kathleen', 'Durant','Family Medicine'),
(29, '2024-12-29','Shane','Holmes','Family Medicine'),
(30, '2024-12-30','Shane','Holmes','Family Medicine'),
(31, '2024-12-31','Khushi','Neema','Psychiatrist'),
(32, '2025-01-01','Khushi','Neema','Psychiatrist'),
(33, '2025-01-02','Kathleen', 'Durant','Family Medicine'),
(34, '2025-01-03','Khushi','Neema','Psychiatrist'),
(35, '2025-01-04','Kathleen', 'Durant','Family Medicine'),
(36, '2025-01-05','Khushi','Neema','Psychiatrist'),
(37, '2025-01-06','Shane','Holmes','Family Medicine'),
(38, '2025-01-07','Natasha', 'Nicholas','Pediatrics'),
(39, '2025-01-08','Shane','Holmes','Family Medicine'),
(40, '2025-01-09','Kathleen', 'Durant','Family Medicine'),
(41, '2025-01-10','Khushi','Neema','Psychiatrist'),
(42, '2025-01-11','Shane','Holmes','Family Medicine'),
(43, '2025-01-12','Natasha', 'Nicholas','Pediatrics');


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
(500, '2027-12-31', 50, 'Metformin', 'Glucophage'),
(50, '2026-06-03', 30, 'Simvastatin', 'Zocor'),
(400, '2025-01-17', 100,'Simvastatin', 'Zocor'),
(3.5, '2025-10-27', 25, 'Folic Acid','Folacare'),
(3.5, '2026-10-27', 40, 'Loratadine', 'Claritin'),
(250, '2026-02-15', 15, 'Ascorbic Acid', 'C-1000'),
(100, '2025-11-10', 60,'Ketamine', 'Ketalar'),
(200, '2024-07-22', 35,'Ibuprofen', 'Advil'),
(5, '2024-08-14', 20, 'Ascorbic Acid', 'C-1000'),
(10, '2025-09-30', 45,'Ibuprofen', 'Advil'),
(750, '2026-05-19', 30,'Paracetamol','Tylenol'),
(125, '2028-04-18', 55,'Loratadine', 'Claritin'),
(600, '2027-01-05', 70,'Metformin', 'Glucophage'),
(50, '2027-01-29', 25,'Ketamine', 'Ketalar'),
(400, '2028-03-23', 20,'Ibuprofen', 'Advil');


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
('Nerve Pain Relief', 'Nerves');






-- Relationships
drop table if exists obtains_doctor;
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
('Kathleen', 'Durant', 'General Practitioner License'),
('Kathleen', 'Durant', 'Doctor License');


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
    pharmacy_id INT NOT NULL,
    PRIMARY KEY (insurance_company_name, pharmacy_id),
    FOREIGN KEY (insurance_company_name) REFERENCES insurance_company(name),
    FOREIGN KEY (pharmacy_id) 
        REFERENCES pharmacy_store(pharmacy_id) ON UPDATE CASCADE
);

INSERT INTO in_network (insurance_company_name, pharmacy_id)
VALUES
    ('UnitedHealth Group', 1),
    ('UnitedHealth Group', 2),
    ('Anthem Blue Cross', 3),
    ('Anthem Blue Cross', 4),
    ('Aetna', 5),
    ('Aetna', 6),
    ('Cigna', 1),
    ('Cigna', 4),
    ('Humana', 2),
    ('Humana', 3),
    ('Centene Corporation', 6),
    ('Centene Corporation', 5),
    ('Oscar Health', 3),
    ('Oscar Health', 2),
    ('Blue Cross Blue Shield', 4),
    ('Blue Cross Blue Shield', 6),
    ('CareFirst BlueCross BlueShield', 1),
    ('CareFirst BlueCross BlueShield', 3),
    ('Harvard Pilgrim Health Care', 5),
    ('Harvard Pilgrim Health Care', 4);


CREATE TABLE insured_by ( 
    insurance_id INT NOT NULL,
    company_name VARCHAR(30) NOT NULL,
    policy_number VARCHAR(30) NOT NULL,  -- Policy number can be randomly generated, more on that later
    PRIMARY KEY (insurance_id, company_name),
    FOREIGN KEY (insurance_id) REFERENCES customer(insurance_id) ON DELETE CASCADE ON UPDATE CASCADE,
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
    pharmacy_id INT NOT NULL,
    PRIMARY KEY (customer_id, order_id, pharmacy_id),
    FOREIGN KEY (customer_id) REFERENCES customer(insurance_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacy_store(pharmacy_id) ON UPDATE CASCADE
);

INSERT INTO picks_up (customer_id, order_id, pharmacy_id)
VALUES
(123456789, 1, 1),
(112345678, 2, 2), 
(111234567, 3, 3),
(111123456, 4, 4), 
(111112345, 5, 5),
(111111234, 6, 6),
(111111123, 7, 1), 
(111111112, 8, 2),
(111111111, 9, 3),
(234567891, 10, 4),
(223456789, 11, 5),
(222345678, 12, 6),
(222234567, 13, 1),
(222223456, 14, 2),
(222222345, 15, 3),
(222222234, 16, 4),
(222222223, 17, 5),
(222222293, 18, 6),
(333333333, 19, 1),
(323232323, 20, 2),
(222222223, 21, 3),
(222234567, 22, 4),
(222222234, 23, 5),
(223456789, 24, 6),
(111123456, 25, 1),
(112345678, 26, 2),
(111112345, 27, 3),
(111112345, 28, 4),
(222222223, 29, 5),
(222234567, 30, 6),
(111123456, 31, 1),
(222222345, 32, 2),
(234567891, 33, 3),
(222222223, 34, 4), 
(112345678, 35, 5), 
(111123456, 36, 6), 
(111123456, 37, 1), 
(222222223, 38, 2), 
(234567891, 39, 3), 
(222345678, 40, 4), 
(112345678, 41, 5),
(222222234, 42, 6), 
(111123456, 43, 1);



CREATE TABLE diagnoses ( -- customer, illness, doctor
    diagnosis_id INT PRIMARY KEY,
    customer_insurance_id INT NOT NULL,
    doctor_first_name VARCHAR(30) NOT NULL,
    doctor_last_name VARCHAR(30) NOT NULL,
    illness_name VARCHAR(30) NOT NULL,
    diagnosis_date DATE NOT NULL,
    FOREIGN KEY (customer_insurance_id) REFERENCES customer(insurance_id) ON DELETE CASCADE,
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
    pharmacy_id INT NOT NULL,  
    medication_scientific_name VARCHAR(30),
    medication_brand_name VARCHAR(30), 
    quantity INT NOT NULL,         
    PRIMARY KEY (pharmacy_id, medication_scientific_name, medication_brand_name), -- Composite primary key
    FOREIGN KEY (pharmacy_id) 
        REFERENCES pharmacy_store(pharmacy_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,       
    FOREIGN KEY (medication_scientific_name, medication_brand_name) 
        REFERENCES medication(scientific_name, brand_name) 
        ON DELETE CASCADE            
);

INSERT INTO sells (pharmacy_id, medication_scientific_name, medication_brand_name, quantity)
VALUES
(1, 'Acetylsalicylic Acid', 'Bayer Aspirin', 100),
(1, 'Paracetamol', 'Tylenol', 200),
(2, 'Ibuprofen', 'Advil', 150),
(3, 'Amoxicillin', 'Amoxil', 120),
(3, 'Metformin', 'Glucophage', 80),
(4, 'Omeprazole', 'Prilosec', 90),
(4, 'Simvastatin', 'Zocor', 60),
(5, 'Clopidogrel', 'Plavix', 150),
(5, 'Ranitidine', 'Zantac', 75),
(6, 'Warfarin', 'Coumadin', 130),
(6, 'Epinephrine', 'EpiPen', 50),
(1, 'Ketamine', 'Ketalar', 30),
(2, 'Dexamethasone', 'Decadron', 110),
(3, 'Loratadine', 'Claritin', 200),
(4, 'Methotrexate', 'Trexall', 40),
(5, 'Atorvastatin', 'Lipitor', 90),
(6, 'Folic Acid', 'Folacare', 150);


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
('Hydrochloric Acid', 'Acidol', 'Aspirin'),
('Ranitidine', 'Zantac', 'Simvastatin'),
('Warfarin', 'Coumadin', 'Ibuprofen'),
('Epinephrine', 'EpiPen', 'Metformin'),
('Atorvastatin', 'Lipitor', 'Paracetamol'),
('Folic Acid', 'Folacare', 'Metformin'),
('Ascorbic Acid', 'C-1000', 'Cetirizine'),
('Epinephrine', 'EpiPen', 'Loratadine'),
('Ketamine', 'Ketalar', 'Loratadine')
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
('Hydrochloric Acid', 'Acidol', 16);


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
('Loratadine', 8),
('Doxycycline', 2),
('Albuterol', 4),  
('Gabapentin', 3),  
('Fluoxetine', 7), 
('Simvastatin', 7), 
('Cetirizine', 10),
('Omeprazole', 1),  
('Metoprolol', 2)
;  


DROP TRIGGER IF EXISTS delete_customer_and_associated_data;
DELIMITER $$

CREATE TRIGGER delete_customer_and_associated_data
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    -- Delete from contains where orders are associated
    DELETE contains
    FROM contains
    JOIN picks_up ON contains.order_id = picks_up.order_id
    WHERE picks_up.customer_id = OLD.insurance_id;
    
    -- Delete related orders
    DELETE orders
    FROM orders
    JOIN picks_up ON orders.order_id = picks_up.order_id
    WHERE picks_up.customer_id = OLD.insurance_id;

    -- Delete from picks_up where customer_id matches
    DELETE FROM picks_up
    WHERE customer_id = OLD.insurance_id;
    
    -- Delete from diagnoses where customer_insurance_id matches
    DELETE FROM diagnoses
    WHERE customer_insurance_id = OLD.insurance_id;

    -- If there are other associated tables, include similar DELETE statements here
END$$

DELIMITER ;



use chemical_database;

DROP PROCEDURE IF EXISTS GetCustomerInfo;

DELIMITER $$

CREATE PROCEDURE GetCustomerInfo(
    IN p_first_name VARCHAR(255),
    IN p_last_name VARCHAR(255)
)
BEGIN
    SELECT cu.*, ic.contact
    FROM chemical_database.customer cu
    JOIN chemical_database.insurance_company ic 
        ON cu.insurance_name = ic.name
    WHERE cu.first_name = p_first_name
      AND cu.last_name = p_last_name;
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS GetCustomerOrdersCDash;
DELIMITER $$

CREATE PROCEDURE GetCustomerOrdersCDash(
    IN p_first_name VARCHAR(255),
    IN p_last_name VARCHAR(255)
)
BEGIN
    SELECT o.*, 
           ps.name AS pharmacy_name, 
           d.first_name AS doctor_first_name, 
           d.last_name AS doctor_last_name
    FROM orders o
    JOIN picks_up pi ON o.order_id = pi.order_id
    JOIN customer cu ON pi.customer_id = cu.insurance_id
    JOIN pharmacy_store ps ON ps.pharmacy_id = pi.pharmacy_id
    JOIN doctor d ON o.doctor_first_name = d.first_name 
                 AND o.doctor_last_name = d.last_name
    WHERE cu.first_name = p_first_name 
      AND cu.last_name = p_last_name;
END$$

DELIMITER ;



DROP PROCEDURE IF EXISTS GetPrescriptionDetails;
DELIMITER $$

CREATE PROCEDURE GetPrescriptionDetails(
    IN p_order_id INT
)
BEGIN
    SELECT pre.*, 
           med.brand_name, 
           med.scientific_name
    FROM prescription pre
    JOIN contains con ON pre.val = con.prescription_id
    JOIN medication med ON pre.scientific_name = med.scientific_name
    WHERE con.order_id = p_order_id;
END$$

DELIMITER ;


DROP PROCEDURE IF EXISTS GetCustomerOrdersMain;
DELIMITER $$

CREATE PROCEDURE GetCustomerOrdersMain(
    IN p_first_name VARCHAR(255),
    IN p_last_name VARCHAR(255)
)
BEGIN
    SELECT o.*, 
           ps.name AS pharmacy_name
    FROM orders o
    JOIN picks_up pi ON o.order_id = pi.order_id
    JOIN customer cu ON pi.customer_id = cu.insurance_id
    JOIN pharmacy_store ps ON ps.pharmacy_id = pi.pharmacy_id
    WHERE cu.first_name = p_first_name 
      AND cu.last_name = p_last_name;
END$$

DELIMITER ;


DROP PROCEDURE IF EXISTS GetDoctorDetails;
DELIMITER $$

CREATE PROCEDURE GetDoctorDetails(
    IN p_first_name VARCHAR(255),
    IN p_last_name VARCHAR(255)
)
BEGIN
    SELECT 
        do.first_name,
        do.last_name,
        do.email,
        do.phone,
        do.specialty,
        do.office_name,
        do.office_address_street_name,
        do.office_address_street_num,
        do.office_address_town,
        do.office_address_state,
        do.office_address_zipcode,
        c.name,
        c.institution,
        c.expiration_date
    FROM chemical_database.doctor do
    JOIN obtains_doctor ON do.first_name = obtains_doctor.first_name
        AND do.last_name = obtains_doctor.last_name
    JOIN certification c ON obtains_doctor.certification_name = c.name
    WHERE do.first_name = p_first_name AND do.last_name = p_last_name;
END $$



DROP PROCEDURE IF EXISTS GetMedicationDetails;
DELIMITER $$

CREATE PROCEDURE GetMedicationDetails(
    IN p_med_id VARCHAR(255)
)
BEGIN
    SELECT DISTINCT
        *       -- Select all columns from medication
	-- Select specific columns from uses
    FROM
        medication med
    JOIN
        used_for uf ON med.scientific_name = uf.scientific_name
    JOIN
        uses u ON uf.use_id = u.use_id
    WHERE
        med.scientific_name = p_med_id;
END$$

DELIMITER ;

