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

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    medicine VARCHAR(30) NOT NULL,
    delivery_date DATE NOT NULL,
    quantity INT NOT NULL
);

INSERT INTO orders (order_id, medicine, delivery_date, quantity) VALUES
(1, 'Paracetamol', '2024-12-01', 50),
(2, 'Ibuprofen', '2024-12-02', 30),
(3, 'Aspirin', '2024-12-03', 100),
(4, 'Amoxicillin', '2024-12-04', 25),
(5, 'Metformin', '2024-12-05', 40),
(6, 'Simvastatin', '2024-12-06', 15),
(7, 'Cetirizine', '2024-12-07', 60),
(8, 'Lisinopril', '2024-12-08', 35),
(9, 'Omeprazole', '2024-12-09', 50),
(10, 'Metoprolol', '2024-12-10', 20),
(11, 'Prednisone', '2024-12-11', 45),
(12, 'Doxycycline', '2024-12-12', 30),
(13, 'Losartan', '2024-12-13', 55),
(14, 'Hydrochlorothiazide', '2024-12-14', 70),
(15, 'Albuterol', '2024-12-15', 25),
(16, 'Gabapentin', '2024-12-16', 40),
(17, 'Fluoxetine', '2024-12-17', 20),
(18, 'Furosemide', '2024-12-18', 60),
(19, 'Clonazepam', '2024-12-19', 30),
(20, 'Loratadine', '2024-12-20', 50);

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


CREATE TABLE pharmacist(
	staff_id INT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    CONSTRAINT unique_pharmacist_name UNIQUE (first_name, last_name)
);

INSERT INTO pharmacist VALUES 
(1, 'Jules', 'Sylvester'),
(2, 'Edgar', 'Roman'),
(3, 'Louisa', 'Wetzel'),
(4, 'Gabby', 'Dipollito'),
(5, 'Nakul', 'Rao');

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
    CONSTRAINT unique_doctor_name UNIQUE (first_name, last_name)
);


INSERT INTO doctor VALUES 
('Natasha', 'Nicholas', 'Atrius Health', 'Hancock St', 1250, 'Quincy', 'Massachusetts', 02169, 'nicholas.n@northeastern.edu', '6173782799'),
('Shane', 'Holmes', 'Boston Medical Center', 'Massachusetts Ave', 801, 'Boston', 'Massachusetts', 02116, 'holmes.sha@northeastern.edu', '6173782789'),
('Khushi', 'Neema', 'Carbon Health', 'Boylston St', 399, 'Boston', 'Massachusetts', 02116, 'neemak@northeastern.edu', '8772419037'),
('Grace', 'Cerrato', 'Atrius Health', 'Hancock St', 1250, 'Quincy', 'Massachusetts', 02169, 'gcerr24@g.holycross.edu', '6173782799'),
('Kathleen', 'Durant', 'Boston Medical Center', 'Massachusetts Ave', 801, 'Boston', 'Massachusetts', 02116, 'k.durant@northeastern.edu', '3823824020');


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


CREATE TABLE chemical(
	scientific_name VARCHAR(30) PRIMARY KEY NOT NULL, -- check if this is valid for diagram
    common_name VARCHAR(30) NOT NULL,
    molecular_formula VARCHAR(30) NOT NULL,
    structure VARCHAR(30) NOT NULL,
    charge INT NOT NULL,
    solubility INT NOT NULL
);

INSERT INTO chemical (scientific_name, common_name, molecular_formula, structure, charge, solubility) VALUES
('Paracetamol', 'Acetaminophen', 'C8H9NO2', 'C6H4(OH)C(=O)NHCH3', 0, 2),
('Ibuprofen', 'Ibuprofen', 'C13H18O2', 'CH3(CH2)3COOCH2C6H4CH3', 0, 3),
('Aspirin', 'Acetylsalicylic acid', 'C9H8O4', 'CH3COOC6H4COOH', 0, 3),
('Amoxicillin', 'Amoxicillin', 'C16H19N3O5S', 'C6H4COOH-CH2-CO-NH', -1, 4),
('Metformin', 'Metformin', 'C4H11N5', 'C(=N)NH2', 0, 5),
('Simvastatin', 'Simvastatin', 'C25H38O5', 'C6H4COOH-CH2-CO-NH', 0, 3),
('Cetirizine', 'Cetirizine', 'C21H25ClN2O3', 'C6H4Cl-CH2-NH-COO', 0, 4),
('Lisinopril', 'Lisinopril', 'C21H31N3O5', 'C6H5COOH-CH2-NH2', 0, 3),
('Omeprazole', 'Omeprazole', 'C17H19N3O3S', 'C6H4COOH-CH2-NH2', 0, 3),
('Metoprolol', 'Metoprolol', 'C15H25NO3', 'C6H5C(=O)NH-C2H4', 0, 4),
('Prednisone', 'Prednisone', 'C21H26O5', 'C6H4COOH-C2H4', 0, 2),
('Doxycycline', 'Doxycycline', 'C22H24N2O8', 'C6H4OH-NH2-COOH', -1, 4),
('Losartan', 'Losartan', 'C22H23ClN6O', 'C6H4COOH-NH-C6H4', 0, 3),
('Hydrochlorothiazide', 'Hydrochlorothiazide', 'C7H8ClN3O4S2', 'C6H4(OH)-C(=O)-NH2', -1, 3),
('Albuterol', 'Albuterol', 'C13H21NO3', 'C6H4Cl-CH2-NH-COOH', 1, 4),
('Gabapentin', 'Gabapentin', 'C9H17NO2', 'C8H5OH-CH2-NH2', 0, 5),
('Fluoxetine', 'Fluoxetine', 'C17H18F3NO', 'C6H4COOH-CH2-NH2', 0, 3),
('Furosemide', 'Furosemide', 'C12H11ClN2O5S', 'C6H4COOH-CH2-NH2', -1, 3),
('Clonazepam', 'Clonazepam', 'C15H10ClN3O3', 'C6H4COOH-CH2-C6H4', 0, 2),
('Loratadine', 'Loratadine', 'C22H23ClN2O2', 'C6H4COOH-C2H4-NH2', 0, 3);


CREATE TABLE hazard(
	hazard_description VARCHAR(300) PRIMARY KEY NOT NULL,
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

CREATE TABLE prescription(
	val INT PRIMARY KEY AUTO_INCREMENT,
    dosage INT NOT NULL,
    expiration_date DATE
);

INSERT INTO prescription (dosage, expiration_date) VALUES
(500, '2190-12-31'),
(50, '2190-06-03'),
(400, '2192-01-17'),
(3.5, '2191-10-27'),
(3.5, '2191-10-27'),
(250, '2195-02-15'),
(100, '2193-11-10'),
(200, '2194-07-22'),
(5, '2193-08-14'),
(10, '2196-09-30'),
(750, '2192-05-19'),
(125, '2194-04-18'),
(600, '2197-01-05'),
(50, '2193-01-29'),
(400, '2195-03-23');

CREATE TABLE medication(
	scientific_name VARCHAR(30) NOT NULL,
    common_name VARCHAR(30),
    brand_name VARCHAR(30),
    type VARCHAR(30) NOT NULL,
    warnings VARCHAR(128) NOT NULL,   -- Link to hazard
    contact VARCHAR(30),
    ingredients VARCHAR(30),  -- Link to chemicals 
    PRIMARY KEY (scientific_name, brand_name)
);
-- Dummy values for the medication table
INSERT INTO medication (scientific_name, common_name, brand_name, type, warnings, contact, ingredients)
VALUES
('Acetylsalicylic Acid', 'Aspirin', 'Bayer Aspirin', 'Tablet', 'May cause gastrointestinal bleeding.', 'Bayer HealthCare', 'C9H8O4'),
('Paracetamol', 'Acetaminophen', 'Tylenol', 'Tablet', 'Overdose can cause liver damage.', 'Johnson & Johnson', 'C8H9NO2'),
('Ibuprofen', 'Advil', 'Advil', 'Capsule', 'May cause stomach irritation.', 'Pfizer', 'C13H18O2'),
('Amoxicillin', 'Amoxil', 'Amoxil', 'Capsule', 'Allergic reactions may occur.', 'GlaxoSmithKline', 'C16H19N3O5S'),
('Metformin', 'Glucophage', 'Glucophage', 'Tablet', 'May cause lactic acidosis.', 'Merck', 'C4H11N5'),
('Omeprazole', 'Prilosec', 'Prilosec', 'Capsule', 'Long-term use may cause vitamin deficiency.', 'AstraZeneca', 'C17H19N3O3S'),
('Clopidogrel', 'Plavix', 'Plavix', 'Tablet', 'Risk of excessive bleeding.', 'Sanofi', 'C16H16ClNO2S'),
('Simvastatin', 'Zocor', 'Zocor', 'Tablet', 'May cause muscle pain or weakness.', 'Merck', 'C25H38O5'),
('Ranitidine', 'Zantac', 'Zantac', 'Tablet', 'May increase risk of cancer.', 'Sanofi', 'C13H22N4O3S'),
('Warfarin', 'Coumadin', 'Coumadin', 'Tablet', 'Risk of severe bleeding.', 'Bristol-Myers Squibb', 'C19H16O4'),
('Epinephrine', 'Adrenaline', 'EpiPen', 'Injection', 'May cause rapid heart rate.', 'Mylan', 'C9H13NO3'),
('Ketamine', 'Ketalar', 'Ketalar','Injection', 'May cause hallucinations.', 'Pfizer', 'C13H16ClNO'),
('Dexamethasone', 'Decadron', 'Decadron', 'Tablet', 'May suppress immune response.', 'Merck', 'C22H29FO5'),
('Loratadine', 'Claritin', 'Claritin', 'Tablet', 'May cause drowsiness.', 'Bayer', 'C22H23ClN2O2'),
('Methotrexate', 'Trexall', 'Trexall', 'Tablet', 'Toxic to liver and bone marrow.', 'Pfizer', 'C20H22N8O5'),
('Atorvastatin', 'Lipitor', 'Lipitor', 'Tablet', 'May cause muscle breakdown.', 'Pfizer', 'C33H35FN2O5'),
('Folic Acid', 'Vitamin B9', 'Folacare', 'Tablet', 'May mask vitamin B12 deficiency.', 'Nature Made', 'C19H19N7O6'),
('Ascorbic Acid', 'Vitamin C', 'C-1000', 'Tablet', 'Excessive intake may cause kidney stones.', 'Nature Made', 'C6H8O6'),
('Sodium Bicarbonate', 'Baking Soda', 'Sodibic', 'Tablet', 'May cause metabolic alkalosis.', 'Generic Manufacturer', 'NaHCO3'),
('Hydrochloric Acid', 'Muriatic Acid', 'Acidol', 'Solution', 'Corrosive; causes severe burns.', 'Generic Manufacturer', 'HCl');

CREATE TABLE uses(
	use_id INT PRIMARY KEY,
    use_case VARCHAR(30) NOT NULL,
    body_part VARCHAR(30) NOT NULL
);
-- Dummy values for the uses table
INSERT INTO uses (use_id, use_case, body_part)
VALUES
(1, 'Pain Relief', 'Head'),
(2, 'Pain Relief', 'Back'),
(3, 'Allergy Relief', 'Nose'),
(4, 'Anti-Inflammatory', 'Joints'),
(5, 'Cold and Flu', 'Sinuses'),
(6, 'Digestive Health', 'Stomach'),
(7, 'Skin Irritation', 'Skin'),
(8, 'Blood Pressure Control', 'Heart'),
(9, 'Bone Strengthening', 'Bones'),
(10, 'Eye Drops', 'Eyes'),
(11, 'Muscle Relaxant', 'Muscles'),
(12, 'Wound Healing', 'Skin'),
(13, 'Antibiotic', 'Lungs'),
(14, 'Cholesterol Control', 'Blood'),
(15, 'Hair Growth', 'Scalp'),
(16, 'Dental Care', 'Teeth'),
(17, 'Antiseptic', 'Hands'),
(18, 'Immune Support', 'Immune System'),
(19, 'Joint Lubrication', 'Knees'),
(20, 'Nerve Pain Relief', 'Nerves');

CREATE TABLE insurance_company(
	name VARCHAR(30) PRIMARY KEY,
    contact VARCHAR(30)
);
-- Dummy values for the insurance_company table
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

INSERT INTO works_at (staff_id, pharmacy_store_name, pharmacy_address_street_name, pharmacy_address_street_num, pharmacy_address_town, pharmacy_address_state, pharmacy_address_zipcode)
VALUES
(1, 'Cedar Pharmacy', 'Main St', 123, 'Springfield', 'Illinois', '62701'),
(2, 'Pine Health Pharmacy', 'Oak Ave', 45, 'Lincoln', 'Nebraska', '68502'),
(3, 'Greenfield Drugs', 'Broadway', 101, 'New York', 'New York', '10001'),
(4, 'Maple Pharmacy', 'Fifth Ave', 550, 'Chicago', 'Illinois', '60611'),
(5, 'Riverbend Pharmacy', 'River Rd', 320, 'Denver', 'Colorado', '80202');


CREATE TABLE obtains (
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    certification_name VARCHAR(30) NOT NULL,
    role VARCHAR(20) NOT NULL,
    PRIMARY KEY (first_name, last_name, certification_name),
    FOREIGN KEY (first_name, last_name) 
        REFERENCES doctor(first_name, last_name) 
        ON DELETE CASCADE,
    FOREIGN KEY (first_name, last_name) 
        REFERENCES pharmacist(first_name, last_name) 
        ON DELETE CASCADE,
    FOREIGN KEY (certification_name) 
        REFERENCES certification(name) 
        ON DELETE CASCADE
);

/*
-- Insert data into the obtains table with role
INSERT INTO obtains (first_name, last_name, certification_name, role)
VALUES
('Natasha', 'Nicholas', 'Doctor License', 'doctor'),
('Shane', 'Holmes', 'General Practitioner License', 'doctor'),
('Khushi', 'Neema', 'Pediatrician License', 'doctor'),
('Grace', 'Cerrato', 'Doctor License', 'doctor'),
('Kathleen', 'Durant', 'General Practitioner License', 'doctor'),
('Jules', 'Sylvester', 'Pharmacist License', 'pharmacist'),
('Edgar', 'Roman', 'Specialist Pharmacist Certification', 'pharmacist'),
('Louisa', 'Wetzel', 'Pharmacist License', 'pharmacist'),
('Gabby', 'Dipollito', 'Clinical Pharmacist Certification', 'pharmacist'),
('Nakul', 'Rao', 'Pharmacist License', 'pharmacist');
*/

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

CREATE TABLE contains ( -- order to prescription
    order_id INT,              
    prescription_id INT,              
    quantity INT,                    
    PRIMARY KEY (order_id, prescription_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE, 
    FOREIGN KEY (prescription_id) REFERENCES prescription(val) ON DELETE CASCADE 
);

CREATE TABLE written_for ( -- prescription to medication
    prescription_val INT,              
    scientific_name VARCHAR(30),      
    brand_name VARCHAR(30),          
    quantity INT,                  
    PRIMARY KEY (prescription_val, scientific_name, brand_name),
    FOREIGN KEY (prescription_val) REFERENCES prescription(val) ON DELETE CASCADE,
    FOREIGN KEY (scientific_name, brand_name) REFERENCES medication(scientific_name, brand_name) ON DELETE CASCADE
);

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


CREATE TABLE classified_as ( -- chemical to classification
    scientific_name VARCHAR(30), 
    class_name VARCHAR(128),   
    PRIMARY KEY (scientific_name, class_name), 
    FOREIGN KEY (scientific_name) 
        REFERENCES chemical(scientific_name)  
        ON DELETE CASCADE,   
    FOREIGN KEY (class_name) 
        REFERENCES classification(class_name) 
        ON DELETE CASCADE  
);

CREATE TABLE hazardous ( -- chemical to hazard 
    scientific_name VARCHAR(30),
    hazard_description VARCHAR(300),   
    PRIMARY KEY (scientific_name, hazard_description),  
    FOREIGN KEY (scientific_name) 
        REFERENCES chemical(scientific_name) 
        ON DELETE CASCADE,    
    FOREIGN KEY (hazard_description) 
        REFERENCES hazard(hazard_description) 
        ON DELETE CASCADE        
);

SELECT * from works_at
where staff_id = 1;

SELECT * from obtains
where first_name = "grace";





