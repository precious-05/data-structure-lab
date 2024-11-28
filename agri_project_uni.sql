CREATE DATABASE Agriculture;
SHOW databases;
USE Agriculture;


# Creating tables

/*        AUTO_INCREMENT is a feature in SQL that automatically assigns a unique value to a column whenever a new row is inserted. 
		It's commonly used for columns like ID or Primary Key to ensure each record has a unique identifier without manually entering it.
How It Works:
>       When you define a column with AUTO_INCREMENT, SQL starts assigning numbers, beginning from 1 by default.
>       Every new row gets the next number automatically.
>       Only one column per table can have AUTO_INCREMENT.
>       It works only on INTEGER or BIGINT types.
>       You can specify a starting value using AUTO_INCREMENT = value in the table definition */


CREATE TABLE  Fields
(
    FieldID INT AUTO_INCREMENT PRIMARY KEY,
    FieldName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Area FLOAT
);



CREATE TABLE  Crops
(
    CropID INT AUTO_INCREMENT PRIMARY KEY,
    CropName VARCHAR(100) NOT NULL,
    FieldID INT,
    PlantingDate DATE,
    FOREIGN KEY (FieldID) REFERENCES Fields(FieldID)       ON UPDATE CASCADE        ON DELETE CASCADE
);




/*  Foreign Key:

A column in one table that refers to the primary key in another table.
It ensures the data in the two tables is connected and consistent.
Example: In the Crops table, FieldID is a foreign key because it links each crop to a specific field in the Fields table.

REFERENCES Clause:
Specifies which table and column the foreign key is pointing to.
In this case, FieldID in the Crops table refers to FieldID in the Fields table.

ON DELETE CASCADE: Deletes rows in the child table if the corresponding row in the parent table is deleted.
ON UPDATE CASCADE: Updates the foreign key in the child table if the primary key in the parent table changes.
 */





CREATE TABLE  Farmers
(
 FarmerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Contact VARCHAR(15)
);


CREATE TABLE  SoilTypes
(
SoilTypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL,
    SuitableCrops VARCHAR(200)
);


CREATE TABLE  Fertilizers
(
FertilizerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type ENUM('Organic', 'Chemical') NOT NULL
);


CREATE TABLE  PestControl
(
 ControlID INT AUTO_INCREMENT PRIMARY KEY,
    PestName VARCHAR(100),
    FieldID INT,
    TreatmentDate DATE,
    FOREIGN KEY (FieldID) REFERENCES Fields(FieldID)         ON UPDATE CASCADE        ON DELETE CASCADE
);


CREATE TABLE  HarvestRecords
(
HarvestID INT AUTO_INCREMENT PRIMARY KEY,
    CropID INT,
    HarvestDate DATE,
    YieldAmount FLOAT,
    FOREIGN KEY (CropID) REFERENCES Crops(CropID)              ON UPDATE CASCADE        ON DELETE CASCADE
);


CREATE TABLE  WeatherLogs
(
 LogID INT AUTO_INCREMENT PRIMARY KEY,
    FieldID INT,
    Date DATE,
    Rainfall FLOAT,
    Temperature FLOAT,
    FOREIGN KEY (FieldID) REFERENCES Fields(FieldID)             ON UPDATE CASCADE        ON DELETE CASCADE
);


CREATE TABLE  Equipment
(
EquipmentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    UsagePurpose VARCHAR(200)
);


CREATE TABLE  Expenses
(
 ExpenseID INT AUTO_INCREMENT PRIMARY KEY,
    FieldID INT,
    ExpenseType VARCHAR(100),
    Amount FLOAT,
    Date DATE,
    FOREIGN KEY (FieldID) REFERENCES Fields(FieldID)                ON UPDATE CASCADE        ON DELETE CASCADE
);














INSERT INTO Fields (FieldName, Location, Area) VALUES
('North Field', 'Punjab', 25.5),
('East Orchard', 'Sindh', 18.2),
('Green Valley', 'Balochistan', 40.0),
('Sunrise Meadow', 'KPK', 15.8),
('River Bend', 'Punjab', 22.3),
('Golden Plains', 'Sindh', 30.5),
('Hilltop Farm', 'Balochistan', 12.9),
('Sunset Field', 'KPK', 28.4),
('Crystal Fields', 'Punjab', 35.6),
('South Farmland', 'Sindh', 19.7),
('Harvest Ridge', 'Balochistan', 42.1),
('Blue Horizon', 'KPK', 16.4),
('Silver Creek', 'Punjab', 20.0),
('Autumn Field', 'Sindh', 27.3),
('Spring Bloom', 'Balochistan', 14.2),
('Golden Harvest', 'Punjab', 31.2),
('Sunny Acres', 'Sindh', 23.5),
('Misty Highlands', 'Balochistan', 19.8),
('Fertile Plains', 'KPK', 26.7),
('Sunny Fields', 'Punjab', 29.9);



INSERT INTO Crops (CropName, FieldID, PlantingDate) VALUES
('Wheat', 1, '2023-01-10'),
('Corn', 2, '2023-02-15'),
('Rice', 3, '2023-03-20'),
('Barley', 4, '2023-01-25'),
('Sugarcane', 5, '2023-04-05'),
('Potatoes', 6, '2023-03-10'),
('Tomatoes', 7, '2023-05-15'),
('Cotton', 8, '2023-01-30'),
('Onions', 9, '2023-03-25'),
('Garlic', 10, '2023-04-10'),
('Peas', 11, '2023-02-20'),
('Carrots', 12, '2023-03-05'),
('Chilies', 13, '2023-05-10'),
('Mangoes', 14, '2023-01-15'),
('Bananas', 15, '2023-03-20'),
('Strawberries', 16, '2023-04-01'),
('Apples', 17, '2023-02-10'),
('Grapes', 18, '2023-03-15'),
('Oranges', 19, '2023-01-20'),
('Pineapples', 20, '2023-04-15');



INSERT INTO Farmers (Name, Contact) VALUES
('Ali Khan', '03001234567'),
('Sara Malik', '03121234567'),
('Ahmed Raza', '03231234567'),
('Fatima Noor', '03341234567'),
('Hassan Tariq', '03451234567'),
('Zara Ali', '03061234567'),
('Kamran Javed', '03171234567'),
('Sana Sheikh', '03281234567'),
('Farooq Ahmed', '03391234567'),
('Nida Khan', '03401234567'),
('Hamza Aftab', '03011234567'),
('Amna Tariq', '03121234567'),
('Usman Iqbal', '03231234567'),
('Ayesha Abbas', '03341234567'),
('Saad Latif', '03451234567'),
('Hina Aslam', '03061234567'),
('Bilal Akram', '03171234567'),
('Nimra Fatima', '03281234567'),
('Owais Khan', '03391234567'),
('Mariam Yousaf', '03401234567');



INSERT INTO SoilTypes (TypeName, SuitableCrops) VALUES
('Loam', 'Wheat, Corn, Vegetables'),
('Clay', 'Rice, Sugarcane'),
('Sandy', 'Cotton, Barley'),
('Silt', 'Potatoes, Carrots'),
('Peaty', 'Tomatoes, Strawberries'),
('Saline', 'Onions, Garlic'),
('Alluvial', 'Bananas, Mangoes'),
('Black', 'Cotton, Grapes'),
('Red', 'Apples, Oranges'),
('Mountain', 'Chilies, Peas'),
('Loamy Sand', 'Peanuts, Melons'),
('Heavy Clay', 'Rice, Sugarcane'),
('Moderately Sandy', 'Corn, Tomatoes'),
('Chalky', 'Barley, Grapes'),
('Acidic Soil', 'Blueberries, Tea'),
('Rich Loam', 'Strawberries, Carrots'),
('Dry Loam', 'Chickpeas, Lentils'),
('Wet Clay', 'Rice, Sugarcane'),
('Dense Soil', 'Vegetables, Mangoes'),
('Loose Loam', 'Wheat, Corn');





INSERT INTO Fertilizers (Name, Type) VALUES
('Nitrogen Fertilizer', 'Chemical'),
('Phosphorus Fertilizer', 'Chemical'),
('Potassium Fertilizer', 'Chemical'),
('Urea', 'Chemical'),
('Compost', 'Organic'),
('Cow Manure', 'Organic'),
('Bone Meal', 'Organic'),
('Fish Meal', 'Organic'),
('Chicken Manure', 'Organic'),
('Humic Acid', 'Organic'),
('Superphosphate', 'Chemical'),
('Ammonium Nitrate', 'Chemical'),
('Magnesium Sulfate', 'Chemical'),
('Blood Meal', 'Organic'),
('Green Manure', 'Organic'),
('Dolomite Lime', 'Organic'),
('Calcium Nitrate', 'Chemical'),
('Iron Sulfate', 'Chemical'),
('Magnesium Fertilizer', 'Chemical'),
('Alfalfa Meal', 'Organic');


INSERT INTO PestControl (PestName, FieldID, TreatmentDate) VALUES
('Aphids', 1, '2023-03-01'),
('Caterpillars', 2, '2023-03-05'),
('Weevils', 3, '2023-04-10'),
('Whiteflies', 4, '2023-04-15'),
('Mealybugs', 5, '2023-05-20'),
('Thrips', 6, '2023-06-01'),
('Fungus Gnats', 7, '2023-07-15'),
('Spider Mites', 8, '2023-08-10'),
('Leaf Hoppers', 9, '2023-09-05'),
('Root Maggots', 10, '2023-10-20'),
('Slugs', 11, '2023-11-10'),
('Snails', 12, '2023-12-15'),
('Scale Insects', 13, '2024-01-25'),
('Cabbage Worms', 14, '2024-02-05'),
('Tarnished Plant Bugs', 15, '2024-03-10'),
('Cutworms', 16, '2024-03-15'),
('Leafminers', 17, '2024-04-05'),
('Flea Beetles', 18, '2024-05-01'),
('Colorado Potato Beetle', 19, '2024-06-10'),
('Corn Borers', 20, '2024-07-01');


INSERT INTO HarvestRecords (CropID, HarvestDate, YieldAmount) VALUES
(1, '2023-06-30', 1500.5),
(2, '2023-07-15', 2200.7),
(3, '2023-08-10', 1800.3),
(4, '2023-08-25', 1350.0),
(5, '2023-09-10', 3000.2),
(6, '2023-09-25', 950.1),
(7, '2023-10-05', 1200.4),
(8, '2023-10-20', 1400.5),
(9, '2023-11-01', 850.3),
(10, '2023-11-15', 1320.0),
(11, '2023-12-01', 1100.9),
(12, '2023-12-15', 1400.0),
(13, '2024-01-05', 1500.0),
(14, '2024-01-20', 1600.7),
(15, '2024-02-15', 1200.8),
(16, '2024-02-25', 1300.2),
(17, '2024-03-10', 1100.0),
(18, '2024-03-25', 1350.4),
(19, '2024-04-10', 1450.1),
(20, '2024-04-25', 1300.3);


INSERT INTO WeatherLogs (FieldID, Date, Rainfall, Temperature) VALUES
(1, '2023-03-01', 12.5, 25.6),
(2, '2023-03-05', 8.2, 27.1),
(3, '2023-04-10', 10.0, 29.4),
(4, '2023-04-15', 5.5, 26.8),
(5, '2023-05-20', 15.0, 30.2),
(6, '2023-06-01', 9.8, 32.1),
(7, '2023-07-15', 7.5, 33.0),
(8, '2023-08-10', 20.3, 34.5),
(9, '2023-09-05', 13.0, 28.7),
(10, '2023-10-20', 11.2, 26.3),
(11, '2023-11-10', 8.9, 25.0),
(12, '2023-12-15', 18.5, 24.4),
(13, '2024-01-25', 14.0, 22.7),
(14, '2024-02-05', 16.3, 23.9),
(15, '2024-03-10', 17.0, 26.1),
(16, '2024-03-15', 19.1, 27.4),
(17, '2024-04-05', 6.7, 28.0),
(18, '2024-05-01', 10.5, 29.8),
(19, '2024-06-10', 14.3, 30.9),
(20, '2024-07-01', 12.8, 32.0);





INSERT INTO Equipment (Name, UsagePurpose) VALUES 
('Ultrasound Machine', 'Medical Imaging'),
('ECG Monitor', 'Heart Rate Monitoring'),
('X-Ray Machine', 'Bone Fracture Diagnosis'),
('MRI Scanner', 'Detailed Imaging of Organs'),
('Defibrillator', 'Emergency Heart Resuscitation'),
('Ventilator', 'Assisted Breathing'),
('Blood Pressure Monitor', 'Blood Pressure Measurement'),
('Stethoscope', 'Listening to Heart and Lungs'),
('Oxygen Concentrator', 'Providing Oxygen Therapy'),
('Surgical Lights', 'Lighting During Surgery'),
('Anesthesia Machine', 'Delivering Anesthetic Gases'),
('Pulse Oximeter', 'Monitoring Blood Oxygen Levels'),
('Thermometer', 'Measuring Body Temperature'),
('Wheelchair', 'Patient Mobility'),
('Sterilizer', 'Equipment Sterilization'),
('Infusion Pump', 'Delivering Fluids/Medications'),
('Glucometer', 'Blood Sugar Monitoring'),
('Hospital Bed', 'Patient Accommodation'),
('CT Scanner', 'Cross-Sectional Imaging of Body'),
('Surgical Table', 'Support During Surgery');



INSERT INTO Expenses (FieldID, ExpenseType, Amount, Date) VALUES 
(1, 'Equipment Maintenance', 500.00, '2024-01-15'),
(2, 'Power Consumption', 200.00, '2024-02-10'),
(3, 'Staff Training', 300.00, '2024-03-05'),
(4, 'New Equipment Purchase', 1500.00, '2024-04-01'),
(5, 'Repair Costs', 400.00, '2024-05-12'),
(1, 'Cleaning Supplies', 250.00, '2024-06-20'),
(2, 'Licensing Fees', 600.00, '2024-07-15'),
(3, 'Insurance Premium', 1200.00, '2024-08-05'),
(4, 'Software Updates', 800.00, '2024-09-01'),
(5, 'Emergency Repairs', 700.00, '2024-10-10'),
(1, 'Consultant Fees', 900.00, '2024-11-18'),
(2, 'Spare Parts', 350.00, '2024-11-20'),
(3, 'Utility Costs', 150.00, '2024-11-21'),
(4, 'Medical Supplies', 450.00, '2024-11-22'),
(5, 'Training Programs', 550.00, '2024-11-23'),
(1, 'Research and Development', 1100.00, '2024-11-23'),
(2, 'Maintenance Contract', 950.00, '2024-11-23'),
(3, 'Miscellaneous Expenses', 300.00, '2024-11-23'),
(4, 'Waste Management', 400.00, '2024-11-23'),
(5, 'Security Upgrades', 700.00, '2024-11-23');












