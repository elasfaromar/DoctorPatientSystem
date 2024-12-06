DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Conditions;
DROP TABLE IF EXISTS Allergies;
DROP TABLE IF EXISTS Patient_Conditions;
DROP TABLE IF EXISTS Patient_Allergies;

-- Create the Patients table
CREATE TABLE Patients (
    PIN INTEGER PRIMARY KEY,            -- Unique Patient Identification Number
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    MiddleName TEXT,
    DateOfBirth DATE NOT NULL,
    Gender TEXT NOT NULL,
    Phone TEXT NOT NULL,
    Address TEXT NOT NULL
);

-- Create the Conditions table
CREATE TABLE Conditions (
    ConditionName TEXT PRIMARY KEY,     -- Unique condition name
    Description TEXT NOT NULL
);

-- Create the Allergies table
CREATE TABLE Allergies (
    AllergyName TEXT PRIMARY KEY       -- Unique allergy name
);

-- Create the Patient_Conditions table for the many-to-many relationship
CREATE TABLE Patient_Conditions (
    PIN INTEGER NOT NULL,               -- References Patients
    ConditionName TEXT NOT NULL,        -- References Conditions
    DateOfDiagnosis DATE NOT NULL,
    PRIMARY KEY (PIN, ConditionName),   -- Composite primary key
    FOREIGN KEY (PIN) REFERENCES Patients(PIN) ON DELETE CASCADE,
    FOREIGN KEY (ConditionName) REFERENCES Conditions(ConditionName) ON DELETE CASCADE
);

-- Create the Patient_Allergies table for the many-to-many relationship
CREATE TABLE Patient_Allergies (
    PIN INTEGER NOT NULL,               -- References Patients
    AllergyName TEXT NOT NULL,          -- References Allergies
    LastUpdated DATE NOT NULL,
    PRIMARY KEY (PIN, AllergyName),     -- Composite primary key
    FOREIGN KEY (PIN) REFERENCES Patients(PIN) ON DELETE CASCADE,
    FOREIGN KEY (AllergyName) REFERENCES Allergies(AllergyName) ON DELETE CASCADE
);

INSERT INTO Conditions (ConditionName, Description) VALUES
    ('Diabetes Type I', 'Condition where your body cannot make a hormone called insulin.'),
    ('Obsessive-compulsive disorder (OCD)', 'Uncontrollable and recurring thoughts (obsessions), engages in repetitive behaviors (compulsions), or both.'),
    ('Breast Cancer', 'Disease in which cells in the breast grow out of control.'),
    ('Leukemia', 'A group of blood cancers that usually begin in the bone marrow and produce high numbers of abnormal blood cells.'),
    ('Colitis', 'Inflammation in your colon, where digested food becomes poop.'),
    ('Mumps', 'A highly contagious viral disease caused by the mumps virus. Initial symptoms include fever, headache, malaise, muscle pain, and loss of appetite.'),
    ('Kidney Failure (ESRD)', 'Condition where kidneys are no longer able to filter and clean blood.'),
    ('Heart Failure', 'Occurs when the heart muscle doesn''t pump blood as well as it should.'),
    ('Hypertension', 'The pressure in your blood vessels is too high (140/90 mmHg or higher).'),
    ('Hepatitis C', 'Lesser known type of hepatitis virus that commonly causes cold-like symptoms and sometimes causes lower respiratory infection, especially in children under 2 years of age.'),
    ('Hepatocellular Carcinoma', 'The most common type of primary liver cancer, often associated with chronic liver diseases like cirrhosis caused by hepatitis B or hepatitis C infection.'),
    ('Coma', 'A deep state of prolonged unconsciousness where a person cannot be awakened, fails to respond normally to painful stimuli, and lacks a normal wake-sleep cycle.'),
    ('Stroke', 'A medical condition in which poor blood flow to a part of the brain causes cell death. Two main types: ischemic (lack of blood flow) and hemorrhagic (bleeding).'),
    ('Respiratory Failure', 'Results from inadequate gas exchange by the respiratory system, leading to low arterial oxygen, high carbon dioxide levels, or both.'),
    ('Lymphoma', 'A group of blood and lymph tumors that develop from lymphocytes, causing enlarged lymph nodes, fever, drenching sweats, unintended weight loss, itching, and constant fatigue.');

INSERT INTO Allergies (AllergyName) VALUES
    ('Amoxicillin'),
    ('Sulfonamide'),
    ('Penicillin'),
    ('Aspirin'),
    ('Ibuprofen'),
    ('Naproxen'),
    ('Cephalosporin'),
    ('Codeine'),
    ('Erythromycin'),
    ('Clindamycin'),
    ('Tetracycline'),
    ('Vancomycin'),
    ('Morphine'),
    ('Hydrocodone'),
    ('Oxycodone'),
    ('Doxycycline'),
    ('Azithromycin'),
    ('Ciprofloxacin'),
    ('Metronidazole'),
    ('Trimethoprim'),
    ('Sulfamethoxazole'),
    ('Ceftriaxone'),
    ('Cefazolin'),
    ('Cefepime'),
    ('Cefuroxime'),
    ('Cefixime'),
    ('Cefotaxime'),
    ('Levofloxacin'),
    ('Moxifloxacin'),
    ('Ofloxacin'),
    ('Gemifloxacin'),
    ('Delafloxacin'),
    ('Besifloxacin'),
    ('Gatifloxacin'),
    ('Sparfloxacin'),
    ('Sitafloxacin'),
    ('Enoxacin'),
    ('Norfloxacin'),
    ('Lomefloxacin'),
    ('Pefloxacin'),
    ('Rufloxacin'),
    ('Temafloxacin'),
    ('Tosufloxacin'),
    ('Grepafloxacin'),
    ('Clinafloxacin'),
    ('Balofloxacin'),
    ('Prulifloxacin'),
    ('Nemonoxacin'),
    ('Finafloxacin'),
    ('Zabofloxacin'),
    ('Difloxacin'),
    ('Garenoxacin');


INSERT INTO Patients (FirstName, MiddleName, LastName, DateOfBirth, Gender, Phone, Address) VALUES
    ('John', 'Doe', 'Smith', '1990-01-01', 'Male', '123-456-7890', '123 Main St'),
    ('Jane', 'Doe', 'Johnson', '1985-05-15', 'Female', '234-567-8901', '456 Elm St'),
    ('Alice', 'Marie', 'Williams', '1978-11-23', 'Female', '345-678-9012', '789 Oak St'),
    ('Bob', 'Andrew', 'Brown', '1965-07-30', 'Male', '456-789-0123', '101 Pine St'),
    ('Charlie', 'David', 'Davis', '2000-03-15', 'Male', '567-890-1234', '202 Maple St'),
    ('Emily', 'Grace', 'Miller', '1992-02-14', 'Female', '678-901-2345', '303 Birch St'),
    ('Daniel', 'James', 'Wilson', '1988-08-22', 'Male', '789-012-3456', '404 Cedar St'),
    ('Sophia', 'Rose', 'Moore', '1995-12-05', 'Female', '890-123-4567', '505 Spruce St'),
    ('Michael', 'John', 'Taylor', '1975-03-10', 'Male', '901-234-5678', '606 Fir St'),
    ('Olivia', 'Anne', 'Anderson', '1982-06-18', 'Female', '012-345-6789', '707 Ash St'),
    ('William', 'Henry', 'Thomas', '1998-09-25', 'Male', '123-456-7891', '808 Willow St'),
    ('Ava', 'Lynn', 'Jackson', '1987-11-30', 'Female', '234-567-8902', '909 Poplar St'),
    ('James', 'Robert', 'White', '1993-04-12', 'Male', '345-678-9013', '1010 Redwood St'),
    ('Isabella', 'Marie', 'Harris', '1980-07-19', 'Female', '456-789-0124', '1111 Cypress St'),
    ('Joseph', NULL, 'Jackson', '1981-07-30', 'Male', '456-789-0123', '1111 Cypress St'),
    ('Benjamin', 'David', 'Martin', '1991-10-28', 'Male', '567-890-1235', '1212 Sequoia St'),
    ('Mia', 'Elizabeth', 'Thompson', '1984-01-07', 'Female', '678-901-2346', '1313 Magnolia St'),
    ('Alexander', 'Joseph', 'Garcia', '1996-05-16', 'Male', '789-012-3457', '1414 Palm St'),
    ('Charlotte', 'Grace', 'Martinez', '1979-08-23', 'Female', '890-123-4568', '1515 Olive St'),
    ('Ethan', 'Michael', 'Robinson', '1986-12-02', 'Male', '901-234-5679', '1616 Maple St'),
    ('Amelia', 'Rose', 'Clark', '1994-03-21', 'Female', '012-345-6780', '1717 Birch St'),
    ('Lucas', 'James', 'Rodriguez', '1977-06-30', 'Male', '123-456-7892', '1818 Cedar St'),
    ('Harper', 'Anne', 'Lewis', '1989-09-09', 'Female', '234-567-8903', '1919 Spruce St'),
    ('Mason', 'John', 'Lee', '1997-11-18', 'Male', '345-678-9014', '2020 Fir St'),
    ('Evelyn', 'Marie', 'Walker', '1981-02-27', 'Female', '456-789-0125', '2121 Ash St'),
    ('Evelyn', 'Samantha', 'Walker', '1951-02-02', 'Female', '613-502-4251', '21 First Ave'),
    ('Logan', 'David', 'Hall', '1990-05-06', 'Male', '567-890-1236', '2222 Willow St');

INSERT INTO Patient_Conditions (PIN, ConditionName, DateOfDiagnosis) VALUES
    (1, 'Diabetes Type I', '2000-01-01'),
    (1, 'Obsessive-compulsive disorder (OCD)', '2005-05-15'),
    (2, 'Breast Cancer', '2010-11-23'),
    (2, 'Leukemia', '2015-07-30'),
    (3, 'Colitis', '2020-03-15'),
    (3, 'Mumps', '2023-12-31'),
    (4, 'Kidney Failure (ESRD)', '2023-11-30'),
    (4, 'Heart Failure', '2023-10-15'),
    (5, 'Hypertension', '2023-09-25'),
    (5, 'Hepatitis C', '2023-08-14'),
    (6, 'Hepatocellular Carcinoma', '2023-07-20'),
    (6, 'Coma', '2023-06-30'),
    (7, 'Stroke', '2023-05-18'),
    (7, 'Respiratory Failure', '2023-04-12'),
    (8, 'Lymphoma', '2023-03-10'),
    (8, 'Diabetes Type I', '2023-02-28'),
    (9, 'Obsessive-compulsive disorder (OCD)', '2023-01-15'),
    (9, 'Breast Cancer', '2022-12-01'),
    (10, 'Leukemia', '2022-11-01'),
    (10, 'Colitis', '2022-10-05'),
    (11, 'Mumps', '2022-09-20'),
    (11, 'Kidney Failure (ESRD)', '2022-08-10'),
    (12, 'Heart Failure', '2022-07-15'),
    (12, 'Hypertension', '2022-06-10'),
    (13, 'Hepatitis C', '2022-05-05'),
    (13, 'Hepatocellular Carcinoma', '2022-04-01');

INSERT INTO Patient_Allergies (PIN, AllergyName, LastUpdated) VALUES
    (1, 'Amoxicillin', '2000-01-01'),
    (1, 'Sulfonamide', '2005-05-15'),
    (2, 'Penicillin', '2010-11-23'),
    (2, 'Aspirin', '2015-07-15'),
    (3, 'Ibuprofen', '2020-03-15'),
    (3, 'Naproxen', '2023-11-30'),
    (3, 'Cephalosporin', '2023-10-25'),
    (5, 'Codeine', '2023-09-15'),
    (5, 'Erythromycin', '2023-08-10'),
    (5, 'Clindamycin', '2023-07-01'),
    (6, 'Tetracycline', '2023-06-15'),
    (6, 'Vancomycin', '2023-05-20'),
    (7, 'Morphine', '2023-04-18'),
    (8, 'Oxycodone', '2023-02-15'),
    (8, 'Doxycycline', '2023-01-20'),
    (9, 'Azithromycin', '2022-12-15'),
    (9, 'Ciprofloxacin', '2022-11-30'),
    (10, 'Metronidazole', '2022-10-10'),
    (10, 'Trimethoprim', '2022-09-01'),
    (11, 'Ceftriaxone', '2022-07-10'),
    (12, 'Cefazolin', '2022-06-20'),
    (12, 'Cefepime', '2022-05-15'),
    (13, 'Cefixime', '2022-03-05'),
    (17, 'Sulfamethoxazole', '2022-08-15'),
    (18, 'Cefuroxime', '2022-04-10'),
    (19, 'Amoxicillin', '2010-07-11'),
    (20, 'Amoxicillin', '2023-12-31'),
    (22, 'Hydrocodone', '2023-03-12');
