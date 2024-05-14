----- Creating Database named College-----
create database College_DB;
use College_DB;

DROP Table IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    role ENUM('student', 'instructor', 'admin','placementCor') NOT NULL DEFAULT 'student'
);

INSERT INTO users (username, password_hash, email, role) VALUES
('placementcordinator@iitgoa.ac.in', 'placement', 'placementcordinator@iitgoa.ac.in', 'placementCor');

INSERT INTO users (username, password_hash, email, role) VALUES
('2003120', 'mahesh', 'mahesh.meena.20031@iitgoa.ac.in', 'student'),
('2003306', 'aryan', 'aryan.olkha.20033@iitgoa.ac.in', 'student'),
('2003319', 'rajesh', 'rajesh.meena.20033@iitgoa.ac.in', 'student'),
('2006319', 'Anil', 'anil.20063@iitgoa.ac.in', 'student'),
('2004214', 'Mitu',  'mitu.20042@iitgoa.ac.in', 'student'),
('2004221', 'Omkar', 'Omkar.Lodekar.20031@iitgoa.ac.in', 'student'),
('2103306', 'Liam', 'liam.21033@iitgoa.ac.in', 'student'),
('2103314', 'James', 'james.20042@iitgoa.ac.in', 'student'),
('2206311', 'Ethan','ethan.22063@iitgoa.ac.in', 'student'),
('2204203', 'William', 'william.22031@iitgoa.ac.in', 'student'),
('2304212', 'Olivia', 'olivia.23042@iitgoa.ac.in', 'student'),
('2304204', 'Isabella','isabella.23042@iitgoa.ac.in', 'student'),
('rahul@iitgoa.ac.in', 'profrahul', 'rahul@iitgoa.ac.in', 'instructor'),
('satya@iitgoa.ac.in', 'profsatya', 'satya@iitgoa.ac.in', 'instructor'),
('clint@iitgoa.ac.in', 'profclient', 'clint@iitgoa.ac.in', 'instructor'),
('rajeev@iitgoa.ac.in', 'profrajeev', 'rajeev@iitgoa.ac.in', 'instructor'),
('arindam@iitgoa.ac.in', 'profarindam', 'arindam@iitgoa.ac.in', 'instructor'),
('apeksha@iitgoa.ac.in', 'profapeksha', 'apeksha@iitgoa.ac.in', 'instructor'),
('shiv@iitgoa.ac.in', 'profshiv', 'shiv@iitgoa.ac.in', 'instructor'),
('nandakumar@iitgoa.ac.in', 'profnandakumar', 'nandakumar@iitgoa.ac.in', 'instructor'),
('apeksha@iitgoa.ac.in', 'proapeksha', 'apeksha@iitgoa.ac.in', 'instructor'),
('sreenath@iitgoa.ac.in', 'prosreenath', 'sreenath@iitgoa.ac.in', 'instructor'),
('admin1', 'admin1pw', 'admin1@iitgoa.ac.in', 'admin'),
('admin2', 'admin2pw', 'admin2@iitgoa.ac.in', 'admin'),
('admin3', 'admin3pw', 'admin3@iitgoa.ac.in', 'admin'),
('placementcordinator@iitgoa.ac.in', 'placement', 'placementcordinator@iitgoa.ac.in', 'placementCor');

DROP TABLE IF EXISTS Instructor;
Truncate table Instructor;

CREATE TABLE IF NOT EXISTS  Instructor (
	Instructor_ID INT PRIMARY KEY NOT NULL,
	Instructor_Name VARCHAR(50) NOT NULL UNIQUE,
	Instructor_Email VARCHAR(50) NOT NULL,
    School VARCHAR(50) NOT NULL
);

update Instructor set Instructor_Email='shiv@iitgoa.ac.in' where Instructor_ID='180227';

INSERT INTO Instructor (Instructor_ID, Instructor_Name, Instructor_Email  , School) VALUES
('160101', 'Dr. Rishikesh Narayan', 'rishikesh@iitgoa.ac.in', 'SCMS'),
('190102', 'Dr. Satyaprakash Ahirwar', 'satyaprakash@iitgoa.ac.in', 'SCMS'),
('170203', 'Dr. Kedar Joshi', 'kedar@iitgoa.ac.in', 'SCMS'),
('180204', 'Dr. Ashok Kumar Ummireddi', 'ashok@iitgoa.ac.in', 'SCMS'),
('180205', 'Dr. Clint P George', 'clint@iitgoa.ac.in', 'SMCS'),
('210206', 'Dr. Rahul C. S.', 'rahul@iitgoa.ac.in', 'SMCS'),
('200207', 'Dr. Arpita Korwar', 'arpita@iitgoa.ac.in', 'SMCS'),
('220208', 'Dr. Saurabh Trivedi', 'saurabh@iitgoa.ac.in', 'SMCS'),
('210209', 'Dr. Satyanath Bhat', 'satya@iitgoa.ac.in', 'SMCS'),
('210210', 'Dr. Amaldev manuel', 'amaldev@iitgoa.ac.in', 'SMCS'),
('220211', 'Dr. Shitala Prasad', 'shitala@iitgoa.ac.in', 'SMCS'),
('220212', 'Dr. Sudakshina Dutta', 'sudakshina@iitgoa.ac.in', 'SMCS'),
('200213', 'Dr. Divya Padmanabhan', 'divya@iitgoa.ac.in', 'SMCS'),
('200214', 'Dr. Sreejith AV', 'sreejith@iitgoa.ac.in', 'SMCS'),
('200215', 'Prof. Venkatesh Kamat', 'venkatesh@iitgoa.ac.in', 'SMCS'),
('220216', 'Dr. Sharad Sinha', 'sharad@iitgoa.ac.in', 'SMCS'),
('210217', 'Dr. Sujit Kumar Sahoo', 'sujitkumar@iitgoa.ac.in', 'SES'),
('180218', 'Dr. Sashidhar Sampatirao', 'sashidhar@iitgoa.ac.in', 'SES'),
('220219', 'Dr. Shakthi Prasad D', 'shakthi@iitgoa.ac.in', 'SES'),
('200220', 'Dr. Neelakandan R', 'neelakandan@iitgoa.ac.in', 'SES'),
('220221', 'Dr. Sunil Dutt', 'sunildutta@iitgoa.ac.in', 'SES'),
('210222', 'Dr. Nandakumar Nambath', 'nandakumar@iitgoa.ac.in', 'SES'),
('180223', 'Dr. Bidhan Pramanick', 'bidhan@iitgoa.ac.in', 'SES'),
('210224', 'Dr. Apeksha Madhukar', 'apeksha@iitgoa.ac.in', 'SES'),
('210225', 'Dr. Sheron Figarado', 'sheron@iitgoa.ac.in', 'SES'),
('190226', 'Dr. Sandip Haldar', 'sandip@iitgoa.ac.in', 'SCMS'),
('180227', 'Dr. Shiv Parsad', 'shiv@iitgoa.ac.in', 'SMCS'),
('190228', 'Dr. Rajeev Gupta', 'rajeev@iitgoa.ac.in', 'SMCS'),
('190229', 'Dr. Sandipan De', 'sandipan@iitgoa.ac.in', 'SMCS'),
('190230', 'Dr. Abhitosh Upadhyay', 'abhitosh@iitgoa.ac.in', 'SMCS'),
('180231', 'Dr. Saumya Bajpai', 'saumya@iitgoa.ac.in', 'SMCS'),
('210233', 'Dr Ponnulakshmi VK', 'ponnulakshmi@iitgoa.ac.in', 'SMS'),
('180234', 'Dr. Arindam Das', 'arindam@iitgoa.ac.in', 'SMS'),
('190235', 'Dr. Sudhakar Yogaraj', 'sudhakar@iitgoa.ac.in', 'SMS'),
('200236', 'Prof. Rajesh P. Gaonkar', 'rajesh@iitgoa.ac.in', 'SMS'),
('190237', 'Dr. Priyabrata Sahoo', 'priyabrata@iitgoa.ac.in', 'SMS'),
('190238', 'Dr. Thaseem Thajudeen', 'thaseem@iitgoa.ac.in', 'SMS'),
('190239', 'Dr. Ashish Bhateja', 'ashish@iitgoa.ac.in', 'SMS'),
('190240', 'Dr. Sreenath Balakrishnan', 'sreenath@iitgoa.ac.in', 'SMS'),
('190241', 'Dr. Abhishek Gupta', 'abhishek@iitgoa.ac.in', 'SMS'),
('200242', 'Dr. Santosh Kumar Das', 'santoshk@iitgoa.ac.in', 'SCMS');



DROP TABLE IF EXISTS student;
Truncate table student;

CREATE TABLE IF NOT EXISTS student (
  Student_ID INT PRIMARY KEY NOT NULL,
  Student_Name varchar(50) NOT NULL,
  Branch varchar(50) NOT NULL,
  Batch INT NOT NULL,
  Gender varchar(10) NOT NULL,
  Email varchar(50) NOT NULL,
  CGPA FLOAT(4),
  Faculty_Advisor varchar(50) NOT NULL,
  Instructor_ID INT NOT NULL,
  FOREIGN KEY (Faculty_Advisor) REFERENCES Instructor(Instructor_Name),
  FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID));
  
  
INSERT INTO student (Student_ID, Student_Name, Branch, Batch, Gender, Email, CGPA, Faculty_Advisor, Instructor_ID) VALUES
('2003120', 'Mahesh', 'CSE', '2020', 'Male', 'mahesh.meena.20031@iitgoa.ac.in', 8.75, 'Dr. Satyanath Bhat', '210209'),
('2003306', 'Aryan', 'MNC', '2020', 'Male', 'aryan.olkha.20033@iitgoa.ac.in', 7.50, 'Dr. Rajeev Gupta', '190228'),
('2003319', 'Rajesh', 'MNC', '2020', 'Male', 'rajesh.meena.20033@iitgoa.ac.in', 9.92, 'Dr. Shiv Parsad', '180227'),
('2004220', 'Mesh', 'EE', '2020', 'Female', 'mesh.meena.20042@iitgoa.ac.in', 5.44, 'Dr. Rahul C. S.', '210206'),
('2006319', 'Anil', 'EE', '2020', 'Male', 'anil.20063@iitgoa.ac.in', 9.45, 'Dr. Rahul C. S.', '210206'),
('2103116', 'Ryan', 'CSE', '2021', 'Male', 'ryan.khan.21031@iitgoa.ac.in', 6.49, 'Dr. Rahul C. S.', '210206'),
('2104214', 'Mitu', 'ME', '2021', 'Female', 'mitu.20042@iitgoa.ac.in', 3.98, 'Dr. Rahul C. S.', '210206'),
('2003121', 'Omkar', 'CSE', '2020', 'Male', 'Omkar.Lodekar.20031@iitgoa.ac.in', 9.98, 'Dr. Rahul C. S.', '210206'),
('2003101', 'John', 'CSE', '2020', 'Male', 'john.20031@iitgoa.ac.in', 8.75, 'Dr. Rahul C. S.', '210206'),
('2103102', 'Alice', 'CSE', '2021', 'Female', 'alice.21031@iitgoa.ac.in', 7.50, 'Dr. Satyanath Bhat', '210209'),

('2203103', 'Bob', 'CSE', '2022', 'Male', 'bob.22031@iitgoa.ac.in', 9.92, 'Dr. Satyanath Bhat', '210209'),
('2303104', 'Emily', 'CSE', '2023', 'Female', 'emily.23031@iitgoa.ac.in', 6.44, 'Dr. Satyanath Bhat', '210209'),
('2003105', 'David', 'CSE', '2020', 'Male', 'david.20031@iitgoa.ac.in', 7.25, 'Dr. Satyanath Bhat', '210209'),
('2103106', 'Sophie', 'CSE', '2021', 'Female', 'sophie.21031@iitgoa.ac.in', 8.30, 'Dr. Satyanath Bhat', '210209'),
('2203107', 'Michael', 'CSE', '2022', 'Male', 'michael.22031@iitgoa.ac.in', 8.60, 'Dr. Satyanath Bhat', '210209'),
('2303108', 'Olivia', 'CSE', '2023', 'Female', 'olivia.23031@iitgoa.ac.in', 9.15, 'Dr. Satyanath Bhat', '210209'),
('2003109', 'George', 'CSE', '2020', 'Male', 'george.20031@iitgoa.ac.in', 7.90, 'Dr. Satyanath Bhat', '210209'),
('2103110', 'Sophia', 'CSE', '2021', 'Female', 'sophia.21031@iitgoa.ac.in', 8.75, 'Dr. Satyanath Bhat', '210209'),
('2203111', 'William', 'CSE', '2022', 'Male', 'william.22031@iitgoa.ac.in', 9.30, 'Dr. Satyanath Bhat', '210209'),
('2303112', 'Isabella', 'CSE', '2023', 'Female', 'isabella.23031@iitgoa.ac.in', 7.80, 'Dr. Clint P George', '180205'),

('2003113', 'James', 'CSE', '2020', 'Male', 'james.20031@iitgoa.ac.in', 8.20, 'Dr. Clint P George', '180205'),
('2103114', 'Ava', 'CSE', '2021', 'Female', 'ava.21031@iitgoa.ac.in', 9.10, 'Dr. Clint P George', '180205'),
('2203115', 'Henry', 'CSE', '2022', 'Male', 'henry.22031@iitgoa.ac.in', 8.90, 'Dr. Clint P George', '180205'),
('2303116', 'Charlotte', 'CSE', '2023', 'Female', 'charlotte.23031@iitgoa.ac.in', 8.40, 'Dr. Clint P George', '180205'),
('2003117', 'Daniel', 'CSE', '2020', 'Male', 'daniel.20031@iitgoa.ac.in', 9.50, 'Dr. Clint P George', '180205'),
('2103118', 'Amelia', 'CSE', '2021', 'Female', 'amelia.21031@iitgoa.ac.in', 7.70, 'Dr. Clint P George', '180205'),
('2203119', 'Alexander', 'CSE', '2022', 'Male', 'alexander.22031@iitgoa.ac.in', 8.85, 'Dr. Clint P George', '180205'),
('2303120', 'Ella', 'CSE', '2023', 'Female', 'ella.23031@iitgoa.ac.in', 9.20, 'Dr. Clint P George', '180205'),
('2003301', 'Emma', 'MNC', '2020', 'Female', 'emma.20033@iitgoa.ac.in', 9.20, 'Dr. Clint P George', '180205'),
('2103302', 'George', 'MNC', '2021', 'Male', 'george.21033@iitgoa.ac.in', 8.80, 'Dr. Rajeev Gupta', '190228'),

('2203303', 'Sophia', 'MNC', '2022', 'Female', 'sophia.22033@iitgoa.ac.in', 7.98, 'Dr. Rajeev Gupta', '190228'),
('2303304', 'Michael', 'MNC', '2023', 'Male', 'michael.23033@iitgoa.ac.in', 5.60, 'Dr. Rajeev Gupta', '190228'),
('2003305', 'Olivia', 'MNC', '2020', 'Female', 'olivia.20033@iitgoa.ac.in', 6.75, 'Dr. Rajeev Gupta', '190228'),
('2103306', 'Liam', 'MNC', '2021', 'Male', 'liam.21033@iitgoa.ac.in', 8.30, 'Dr. Rajeev Gupta', '190228'),
('2203307', 'Emily', 'MNC', '2022', 'Female', 'emily.22033@iitgoa.ac.in', 9.05, 'Dr. Rajeev Gupta', '190228'),
('2303308', 'Ethan', 'MNC', '2023', 'Male', 'ethan.23033@iitgoa.ac.in', 7.40, 'Dr. Rajeev Gupta', '190228'),
('2003309', 'Ava', 'MNC', '2020', 'Female', 'ava.20033@iitgoa.ac.in', 8.90, 'Dr. Rajeev Gupta', '190228'),
('2103310', 'Logan', 'MNC', '2021', 'Male', 'logan.21033@iitgoa.ac.in', 7.85, 'Dr. Rajeev Gupta', '190228'),
('2203311', 'Isabella', 'MNC', '2022', 'Female', 'isabella.22033@iitgoa.ac.in', 8.20, 'Dr. Arindam Das', '180234'),
('2303312', 'Jackson', 'MNC', '2023', 'Male', 'jackson.23033@iitgoa.ac.in', 9.60, 'Dr. Arindam Das', '180234'),
('2003313', 'Mia', 'MNC', '2020', 'Female', 'mia.20033@iitgoa.ac.in', 6.40, 'Dr. Arindam Das', '180234'),
('2103314', 'James', 'MNC', '2021', 'Male', 'james.21033@iitgoa.ac.in', 7.75, 'Dr. Arindam Das', '180234'),
('2203315', 'Sophia', 'MNC', '2022', 'Female', 'sophia.22033@iitgoa.ac.in', 8.80, 'Dr. Arindam Das', '180234'),
('2303316', 'Benjamin', 'MNC', '2023', 'Male', 'benjamin.23033@iitgoa.ac.in', 9.10, 'Dr. Arindam Das', '180234'),
('2003317', 'Charlotte', 'MNC', '2020', 'Female', 'charlotte.20033@iitgoa.ac.in', 7.20, 'Dr. Arindam Das', '180234'),
('2103318', 'William', 'MNC', '2021', 'Male', 'william.21033@iitgoa.ac.in', 8.50, 'Dr. Arindam Das', '180234'),
('2203319', 'Evelyn', 'MNC', '2022', 'Female', 'evelyn.22033@iitgoa.ac.in', 9.30, 'Dr. Arindam Das', '180234'),
('2303320', 'Daniel', 'MNC', '2023', 'Male', 'daniel.23033@iitgoa.ac.in', 6.95, 'Dr. Apeksha Madhukar', '210224'),
('2004201', 'James', 'EE', '2020', 'Male', 'james.20042@iitgoa.ac.in', 8.45, 'Dr. Apeksha Madhukar', '210224'),
('2104202', 'Ava', 'EE', '2021', 'Female', 'ava.21042@iitgoa.ac.in', 9.60, 'Dr. Apeksha Madhukar', '210224'),

('2204203', 'William', 'EE', '2022', 'Male', 'william.22042@iitgoa.ac.in', 8.30, 'Dr. Apeksha Madhukar', '210224'),
('2304204', 'Isabella', 'EE', '2023', 'Female', 'isabella.23042@iitgoa.ac.in', 7.70, 'Dr. Apeksha Madhukar', '210224'),
('2004205', 'Joseph', 'EE', '2020', 'Male', 'joseph.20042@iitgoa.ac.in', 9.85, 'Dr. Apeksha Madhukar', '210224'),
('2104206', 'Charlotte', 'EE', '2021', 'Female', 'charlotte.21042@iitgoa.ac.in', 8.20, 'Dr. Apeksha Madhukar', '210224'),
('2204207', 'Alexander', 'EE', '2022', 'Male', 'alexander.22042@iitgoa.ac.in', 9.40, 'Dr. Shiv Parsad', '180227'),
('2304208', 'Emily', 'EE', '2023', 'Female', 'emily.23042@iitgoa.ac.in', 7.90, 'Dr. Shiv Parsad', '180227'),
('2004209', 'Daniel', 'EE', '2020', 'Male', 'daniel.20042@iitgoa.ac.in', 8.75, 'Dr. Shiv Parsad', '180227'),
('2104210', 'Sophie', 'EE', '2021', 'Female', 'sophie.21042@iitgoa.ac.in', 9.20, 'Dr. Shiv Parsad', '180227'),
('2204211', 'Michael', 'EE', '2022', 'Male', 'michael.22042@iitgoa.ac.in', 8.60, 'Dr. Shiv Parsad', '180227'),
('2304212', 'Olivia', 'EE', '2023', 'Female', 'olivia.23042@iitgoa.ac.in', 7.80,'Dr. Sreenath Balakrishnan','190240'),

('2004213', 'Liam', 'EE', '2020', 'Male', 'liam.20042@iitgoa.ac.in', 9.30,'Dr. Sreenath Balakrishnan','190240'),
('2104215', 'Ella', 'EE', '2021', 'Female', 'ella.21042@iitgoa.ac.in', 8.40,'Dr. Sreenath Balakrishnan','190240'),
('2204215', 'Benjamin', 'EE', '2022', 'Male', 'benjamin.22042@iitgoa.ac.in', 9.70,'Dr. Sreenath Balakrishnan','190240'),
('2304216', 'Mia', 'EE', '2023', 'Female', 'mia.23042@iitgoa.ac.in', 8.10,'Dr. Sreenath Balakrishnan','190240'),
('2004217', 'Logan', 'EE', '2020', 'Male', 'logan.20042@iitgoa.ac.in', 9.50,'Dr. Sreenath Balakrishnan','190240'),
('2104218', 'Sophia', 'EE', '2021', 'Female', 'sophia.21042@iitgoa.ac.in', 7.60,'Dr. Sreenath Balakrishnan','190240'),
('2204219', 'Jacob', 'EE', '2022', 'Male', 'jacob.22042@iitgoa.ac.in', 8.85,'Dr. Sreenath Balakrishnan','190240'),
('2304220', 'Grace', 'EE', '2023', 'Female', 'grace.23042@iitgoa.ac.in', 9.00,'Dr. Sreenath Balakrishnan','190240'),
('2006301', 'Henry', 'ME', '2020', 'Male', 'henry.20063@iitgoa.ac.in', 7.20, 'Dr. Nandakumar Nambath','210222'),
('2106302', 'Amelia', 'ME', '2021', 'Female', 'amelia.21063@iitgoa.ac.in', 9.40, 'Dr. Nandakumar Nambath','210222'),
('2206303', 'Alexander', 'ME', '2022', 'Male', 'alexander.22063@iitgoa.ac.in', 8.10, 'Dr. Nandakumar Nambath','210222'),
('2306304', 'Charlotte', 'ME', '2023', 'Female', 'charlotte.23063@iitgoa.ac.in', 9.75, 'Dr. Nandakumar Nambath','210222'),
('2006305', 'Daniel', 'ME', '2020', 'Male', 'daniel.20063@iitgoa.ac.in', 6.88, 'Dr. Nandakumar Nambath','210222'),
('2106306', 'Sophie', 'ME', '2021', 'Female', 'sophie.21063@iitgoa.ac.in', 8.95, 'Dr. Nandakumar Nambath','210222'),
('2206307', 'Michael', 'ME', '2022', 'Male', 'michael.22063@iitgoa.ac.in', 7.55, 'Dr. Nandakumar Nambath','210222'),
('2306308', 'Olivia', 'ME', '2023', 'Female', 'olivia.23063@iitgoa.ac.in', 9.25, 'Dr. Nandakumar Nambath','210222'),
('2006309', 'Logan', 'ME', '2020', 'Male', 'logan.20063@iitgoa.ac.in', 8.40, 'Dr. Nandakumar Nambath','210222'),
('2106310', 'Isabella', 'ME', '2021', 'Female', 'isabella.21063@iitgoa.ac.in', 7.80, 'Dr. Nandakumar Nambath','210222'),
('2206311', 'Ethan', 'ME', '2022', 'Male', 'ethan.22063@iitgoa.ac.in', 9.10, 'Dr. Nandakumar Nambath','210222');


DROP TABLE IF EXISTS student_profile;
Truncate table student_profile;

-- Create the student table with personal data
CREATE TABLE IF NOT EXISTS student_profile (
  Student_ID INT PRIMARY KEY NOT NULL,
  Student_Name VARCHAR(50) NOT NULL,
  Branch VARCHAR(50) NOT NULL,
  Batch INT NOT NULL,
  Gender VARCHAR(10) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  CGPA FLOAT(4),
  Address VARCHAR(100),
  Mother_Name VARCHAR(50),
  Father_Name VARCHAR(50),
  Father_Mobile VARCHAR(15),
  Photo VARCHAR(255),
  Blood_Group VARCHAR(5)
);





INSERT INTO student_profile (Student_ID, Student_Name, Branch, Batch, Gender, Email, CGPA, Address, Mother_Name, Father_Name, Father_Mobile, Photo, Blood_Group) 
VALUES 
('2003120', 'Mahesh', 'CSE', 2020, 'Male', 'mahesh.meena.20031@iitgoa.ac.in', 8.75, '123 Main St, City', 'Sita Meena', 'Ramesh Meena', '9876543210', '/photos/mahesh.jpg', 'B+'),
('2003306', 'Aryan', 'MNC', 2020, 'Male', 'aryan.olkha.20033@iitgoa.ac.in', 7.50, '456 Elm St, Town', 'Saroj Olkha', 'Arvind Olkha', '9876543220', '/photos/aryan.jpg', 'A-'),
('2003319', 'Rajesh', 'MNC', 2020, 'Male', 'rajesh.meena.20033@iitgoa.ac.in', 9.92, '789 Oak St, Village', 'Geeta Meena', 'Rajendra Meena', '9876543230', '/photos/rajesh.jpg', 'O+'),
('2004220', 'Mesh', 'EE', 2020, 'Female', 'mesh.meena.20042@iitgoa.ac.in', 5.44, '321 Pine St, County', 'Rani Mesh', 'Mohan Mesh', '9876543240', '/photos/mesh.jpg', 'AB-'),
('2006319', 'Anil', 'EE', 2020, 'Male', 'anil.20063@iitgoa.ac.in', 9.45, '234 Cedar St, Hamlet', 'Sunita Anil', 'Rakesh Anil', '9876543250', '/photos/anil.jpg', 'A+'),
('2103116', 'Ryan', 'CSE', 2021, 'Male', 'ryan.khan.21031@iitgoa.ac.in', 6.49, '567 Maple St, City', 'Reena Khan', 'Rahul Khan', '9876543260', '/photos/ryan.jpg', 'B-'),
('2104214', 'Mitu', 'ME', 2021, 'Female', 'mitu.20042@iitgoa.ac.in', 3.98, '890 Oak St, Town', 'Sarita Mitu', 'Raj Mitu', '9876543270', '/photos/mitu.jpg', 'O-'),
('2003121', 'Omkar', 'CSE', 2020, 'Male', 'Omkar.Lodekar.20031@iitgoa.ac.in', 9.98, '456 Elm St, City', 'Rina Lodekar', 'Ramesh Lodekar', '9876543280', '/photos/omkar.jpg', 'A+'),
('2003101', 'John', 'CSE', 2020, 'Male', 'john.20031@iitgoa.ac.in', 8.75, '123 Pine St, Village', 'Mary John', 'Robert John', '9876543290', '/photos/john.jpg', 'B+'),
('2103102', 'Alice', 'CSE', 2021, 'Female', 'alice.21031@iitgoa.ac.in', 7.50, '789 Cedar St, Hamlet', 'Cathy Alice', 'David Alice', '9876543300', '/photos/alice.jpg', 'A-'),
('2203103', 'Bob', 'CSE', 2022, 'Male', 'bob.22031@iitgoa.ac.in', 9.92, '567 Elm St, County', 'Lily Bob', 'William Bob', '9876543310', '/photos/bob.jpg', 'O+'),
('2303104', 'Emily', 'CSE', 2023, 'Female', 'emily.23031@iitgoa.ac.in', 6.44, '234 Oak St, Town', 'Sarah Emily', 'Michael Emily', '9876543320', '/photos/emily.jpg', 'AB-'),
('2003105', 'David', 'CSE', 2020, 'Male', 'david.20031@iitgoa.ac.in', 7.25, '890 Maple St, City', 'Jennifer David', 'Richard David', '9876543330', '/photos/david.jpg', 'A+'),
('2103106', 'Sophie', 'CSE', 2021, 'Female', 'sophie.21031@iitgoa.ac.in', 8.30, '123 Cedar St, Village', 'Nina Sophie', 'Stephen Sophie', '9876543340', '/photos/sophie.jpg', 'B-'),
('2203107', 'Michael', 'CSE', 2022, 'Male', 'michael.22031@iitgoa.ac.in', 8.60, '456 Pine St, Hamlet', 'Julia Michael', 'Joseph Michael', '9876543350', '/photos/michael.jpg', 'O-'),
('2303108', 'Olivia', 'CSE', 2023, 'Female', 'olivia.23031@iitgoa.ac.in', 9.15, '789 Cedar St, County', 'Linda Olivia', 'Daniel Olivia', '9876543360', '/photos/olivia.jpg', 'A+'),
('2003109', 'George', 'CSE', 2020, 'Male', 'george.20031@iitgoa.ac.in', 7.90, '234 Elm St, City', 'Hannah George', 'Sam George', '9876543370', '/photos/george.jpg', 'B+'),
('2103110', 'Sophia', 'CSE', 2021, 'Female', 'sophia.21031@iitgoa.ac.in', 8.75, '567 Pine St, Village', 'Grace Sophia', 'Peter Sophia', '9876543380', '/photos/sophia.jpg', 'A-'),
('2203111', 'William', 'CSE', 2022, 'Male', 'william.22031@iitgoa.ac.in', 9.30, '890 Oak St, Hamlet', 'Catherine William', 'Martin William', '9876543390', '/photos/william.jpg', 'O+'),
('2303112', 'Isabella', 'CSE', 2023, 'Female', 'isabella.23031@iitgoa.ac.in', 7.80, '123 Maple St, County', 'Rose Isabella', 'John Isabella', '9876543400', '/photos/isabella.jpg', 'AB-'),
('2003113', 'James', 'CSE', 2020, 'Male', 'james.20031@iitgoa.ac.in', 8.20, '456 Cedar St, City', 'Samantha James', 'Thomas James', '9876543410', '/photos/james.jpg', 'A+'),
('2103114', 'Ava', 'CSE', 2021, 'Female', 'ava.21031@iitgoa.ac.in', 9.10, '789 Elm St, Village', 'Julie Ava', 'George Ava', '9876543420', '/photos/ava.jpg', 'B-'),
('2203115', 'Henry', 'CSE', 2022, 'Male', 'henry.22031@iitgoa.ac.in', 8.90, '234 Pine St, Hamlet', 'Diana Henry', 'Edward Henry', '9876543430', '/photos/henry.jpg', 'O-'),
('2303116', 'Charlotte', 'CSE', 2023, 'Female', 'charlotte.23031@iitgoa.ac.in', 8.40, '567 Oak St, County', 'Laura Charlotte', 'Mark Charlotte', '9876543440', '/photos/charlotte.jpg', 'A+'),
('2003117', 'Daniel', 'CSE', 2020, 'Male', 'daniel.20031@iitgoa.ac.in', 9.50, '890 Cedar St, City', 'Patricia Daniel', 'Anthony Daniel', '9876543450', '/photos/daniel.jpg', 'B+'),
('2103118', 'Amelia', 'CSE', 2021, 'Female', 'amelia.21031@iitgoa.ac.in', 7.70, '123 Elm St, Village', 'Rachel Amelia', 'Nicholas Amelia', '9876543460', '/photos/amelia.jpg', 'A-'),
('2203119', 'Alexander', 'CSE', 2022, 'Male', 'alexander.22031@iitgoa.ac.in', 8.85, '456 Pine St, Hamlet', 'Deborah Alexander', 'Andrew Alexander', '9876543470', '/photos/alexander.jpg', 'O-'),
('2303120', 'Ella', 'CSE', 2023, 'Female', 'ella.23031@iitgoa.ac.in', 9.20, '789 Oak St, County', 'Lisa Ella', 'Charles Ella', '9876543480', '/photos/ella.jpg', 'AB+'),
('2003301', 'Emma', 'MNC', 2020, 'Female', 'emma.20033@iitgoa.ac.in', 9.20, '234 Cedar St, City', 'Anna Emma', 'Matthew Emma', '9876543490', '/photos/emma.jpg', 'B+'),
('2103302', 'George', 'MNC', 2021, 'Male', 'george.21033@iitgoa.ac.in', 8.80, '567 Elm St, Village', 'Lisa George', 'Patrick George', '9876543500', '/photos/george.jpg', 'A-'),
('2203303', 'Sophia', 'MNC', 2022, 'Female', 'sophia.22033@iitgoa.ac.in', 7.98, '890 Pine St, Hamlet', 'Christine Sophia', 'Kevin Sophia', '9876543510', '/photos/sophia2.jpg', 'O+'),
('2303304', 'Michael', 'MNC', 2023, 'Male', 'michael.23033@iitgoa.ac.in', 5.60, '123 Oak St, County', 'Julia Michael', 'Joseph Michael', '9876543520', '/photos/michael2.jpg', 'AB-'),
('2003305', 'Olivia', 'MNC', 2020, 'Female', 'olivia.20033@iitgoa.ac.in', 6.75, '456 Cedar St, City', 'Eva Olivia', 'Jonathan Olivia', '9876543530', '/photos/olivia2.jpg', 'A+'),
('2103306', 'Liam', 'MNC', 2021, 'Male', 'liam.21033@iitgoa.ac.in', 8.30, '789 Elm St, Village', 'Maria Liam', 'Christopher Liam', '9876543540', '/photos/liam.jpg', 'B-'),
('2203307', 'Emily', 'MNC', 2022, 'Female', 'emily.22033@iitgoa.ac.in', 9.05, '234 Pine St, Hamlet', 'Sophie Emily', 'David Emily', '9876543550', '/photos/emily2.jpg', 'A-'),
('2303308', 'Ethan', 'MNC', 2023, 'Male', 'ethan.23033@iitgoa.ac.in', 7.40, '567 Cedar St, City', 'Diana Ethan', 'Richard Ethan', '9876543560', '/photos/ethan.jpg', 'O+'),
('2003309', 'Ava', 'MNC', 2020, 'Female', 'ava.20033@iitgoa.ac.in', 8.90, '890 Elm St, Village', 'Laura Ava', 'Paul Ava', '9876543570', '/photos/ava2.jpg', 'AB-'),
('2103310', 'Logan', 'MNC', 2021, 'Male', 'logan.21033@iitgoa.ac.in', 7.85, '123 Oak St, Hamlet', 'Sophia Logan', 'Michael Logan', '9876543580', '/photos/logan.jpg', 'B+'),
('2203311', 'Isabella', 'MNC', 2022, 'Female', 'isabella.22033@iitgoa.ac.in', 8.20, '456 Cedar St, County', 'Alice Isabella', 'Steven Isabella', '9876543590', '/photos/isabella2.jpg', 'A-'),
('2303312', 'Jackson', 'MNC', 2023, 'Male', 'jackson.23033@iitgoa.ac.in', 9.60, '789 Elm St, Hamlet', 'Sarah Jackson', 'Daniel Jackson', '9876543600', '/photos/jackson.jpg', 'O-'),
('2003313', 'Mia', 'MNC', 2020, 'Female', 'mia.20033@iitgoa.ac.in', 6.40, '234 Pine St, City', 'Julia Mia', 'Robert Mia', '9876543610', '/photos/mia.jpg', 'A+'),
('2103314', 'James', 'MNC', 2021, 'Male', 'james.21033@iitgoa.ac.in', 7.75, '567 Cedar St, Village', 'Emma James', 'Thomas James', '9876543620', '/photos/james2.jpg', 'B-'),
('2203315', 'Sophia', 'MNC', 2022, 'Female', 'sophia.22033@iitgoa.ac.in', 8.80, '890 Elm St, Hamlet', 'Nancy Sophia', 'Samuel Sophia', '9876543630', '/photos/sophia3.jpg', 'O-'),
('2303316', 'Benjamin', 'MNC', 2023, 'Male', 'benjamin.23033@iitgoa.ac.in', 9.10, '123 Oak St, County', 'Susan Benjamin', 'Christopher Benjamin', '9876543640', '/photos/benjamin.jpg', 'AB-'),
('2003317', 'Charlotte', 'MNC', 2020, 'Female', 'charlotte.20033@iitgoa.ac.in', 7.20, '456 Cedar St, City', 'Karen Charlotte', 'Matthew Charlotte', '9876543650', '/photos/charlotte2.jpg', 'A+'),
('2103318', 'William', 'MNC', 2021, 'Male', 'william.21033@iitgoa.ac.in', 8.50, '789 Elm St, Village', 'Deborah William', 'Edward William', '9876543660', '/photos/william2.jpg', 'B-'),
('2203319', 'Evelyn', 'MNC', 2022, 'Female', 'evelyn.22033@iitgoa.ac.in', 9.30, '234 Pine St, Hamlet', 'Sandra Evelyn', 'Mark Evelyn', '9876543670', '/photos/evelyn.jpg', 'O-'),
('2303320', 'Daniel', 'MNC', 2023, 'Male', 'daniel.23033@iitgoa.ac.in', 6.95, '567 Cedar St, County', 'Christina Daniel', 'Paul Daniel', '9876543680', '/photos/daniel2.jpg', 'AB-'),
('2004201', 'James', 'EE', 2020, 'Male', 'james.20042@iitgoa.ac.in', 8.45, '890 Oak St, City', 'Samantha James', 'Thomas James', '9876543690', '/photos/james3.jpg', 'A+'),
('2104202', 'Ava', 'EE', 2021, 'Female', 'ava.21042@iitgoa.ac.in', 9.60, '123 Elm St, Village', 'Julie Ava', 'George Ava', '9876543700', '/photos/ava3.jpg', 'B-'),
('2204203', 'William', 'EE', 2022, 'Male', 'william.22042@iitgoa.ac.in', 8.30, '456 Cedar St, Hamlet', 'Deborah William', 'Andrew William', '9876543710', '/photos/william3.jpg', 'O-'),
('2304204', 'Isabella', 'EE', 2023, 'Female', 'isabella.23042@iitgoa.ac.in', 7.70, '789 Pine St, County', 'Rose Isabella', 'John Isabella', '9876543720', '/photos/isabella3.jpg', 'AB-'),
('2004205', 'Joseph', 'EE', 2020, 'Male', 'joseph.20042@iitgoa.ac.in', 9.85, '234 Oak St, City', 'Lisa Joseph', 'Charles Joseph', '9876543730', '/photos/joseph.jpg', 'A+'),
('2104206', 'Charlotte', 'EE', 2021, 'Female', 'charlotte.21042@iitgoa.ac.in', 8.20, '567 Elm St, Village', 'Jennifer Charlotte', 'Richard Charlotte', '9876543740', '/photos/charlotte3.jpg', 'B-'),
('2204207', 'Alexander', 'EE', 2022, 'Male', 'alexander.22042@iitgoa.ac.in', 9.40, '890 Pine St, Hamlet', 'Deborah Alexander', 'Andrew Alexander', '9876543750', '/photos/alexander2.jpg', 'O-'),
('2304208', 'Emily', 'EE', 2023, 'Female', 'emily.23042@iitgoa.ac.in', 7.90, '123 Cedar St, County', 'Sophie Emily', 'David Emily', '9876543760', '/photos/emily3.jpg', 'AB-'),
('2004209', 'Daniel', 'EE', 2020, 'Male', 'daniel.20042@iitgoa.ac.in', 8.75, '456 Oak St, City', 'Patricia Daniel', 'Anthony Daniel', '9876543770', '/photos/daniel3.jpg', 'A+'),
('2104210', 'Sophie', 'EE', 2021, 'Female', 'sophie.21042@iitgoa.ac.in', 9.20, '789 Elm St, Village', 'Nina Sophie', 'Stephen Sophie', '9876543780', '/photos/sophie4.jpg', 'B-'),
('2204211', 'Michael', 'EE', 2022, 'Male', 'michael.22042@iitgoa.ac.in', 8.60, '234 Pine St, Hamlet', 'Julia Michael', 'Joseph Michael', '9876543790', '/photos/michael3.jpg', 'O-'),
('2304212', 'Olivia', 'EE', 2023, 'Female', 'olivia.23042@iitgoa.ac.in', 7.80, '567 Cedar St, County', 'Linda Olivia', 'Daniel Olivia', '9876543800', '/photos/olivia3.jpg', 'AB-'),
('2004213', 'George', 'EE', 2020, 'Male', 'george.20042@iitgoa.ac.in', 8.90, '890 Elm St, City', 'Hannah George', 'Sam George', '9876543810', '/photos/george3.jpg', 'A+'),
('2204215', 'William', 'EE', 2022, 'Male', 'william.22042@iitgoa.ac.in', 9.30, '456 Pine St, Hamlet', 'Catherine William', 'Martin William', '9876543830', '/photos/william4.jpg', 'O-'),
('2304216', 'Isabella', 'EE', 2023, 'Female', 'isabella.23042@iitgoa.ac.in', 8.40, '789 Oak St, County', 'Rose Isabella', 'John Isabella', '9876543840', '/photos/isabella4.jpg', 'AB-'),
('2004217', 'Logan', 'EE', 2020, 'Male', 'logan.20042@iitgoa.ac.in', 9.50, '567 Oak St, City', 'Emma Logan', 'William Logan', '9876543850', '/photos/logan3.jpg', 'A+'),
('2104218', 'Sophia', 'EE', 2021, 'Female', 'sophia.21042@iitgoa.ac.in', 7.60, '890 Cedar St, Village', 'Jennifer Sophia', 'Richard Sophia', '9876543860', '/photos/sophia6.jpg', 'B-'),
('2204219', 'Jacob', 'EE', 2022, 'Male', 'jacob.22042@iitgoa.ac.in', 8.85, '123 Elm St, Hamlet', 'Lisa Jacob', 'David Jacob', '9876543870', '/photos/jacob2.jpg', 'O-'),
('2304220', 'Grace', 'EE', 2023, 'Female', 'grace.23042@iitgoa.ac.in', 9.00, '456 Pine St, County', 'Nancy Grace', 'Michael Grace', '9876543880', '/photos/grace.jpg', 'AB+'),
('2006301', 'Henry', 'ME', 2020, 'Male', 'henry.20063@iitgoa.ac.in', 7.20, '789 Oak St, City', 'Sophia Henry', 'David Henry', '9876543890', '/photos/henry2.jpg', 'A-'),
('2106302', 'Amelia', 'ME', 2021, 'Female', 'amelia.21063@iitgoa.ac.in', 9.40, '234 Elm St, Village', 'Jessica Amelia', 'Ryan Amelia', '9876543900', '/photos/amelia2.jpg', 'B+'),
('2206303', 'Alexander', 'ME', 2022, 'Male', 'alexander.22063@iitgoa.ac.in', 8.10, '567 Cedar St, Hamlet', 'Linda Alexander', 'Christopher Alexander', '9876543910', '/photos/alexander3.jpg', 'O+'),
('2306304', 'Charlotte', 'ME', 2023, 'Female', 'charlotte.23063@iitgoa.ac.in', 9.75, '890 Pine St, County', 'Karen Charlotte', 'Matthew Charlotte', '9876543920', '/photos/charlotte4.jpg', 'AB-'),
('2006305', 'Daniel', 'ME', 2020, 'Male', 'daniel.20063@iitgoa.ac.in', 6.88, '123 Oak St, City', 'Emily Daniel', 'Joseph Daniel', '9876543930', '/photos/daniel4.jpg', 'A+'),
('2106306', 'Sophie', 'ME', 2021, 'Female', 'sophie.21063@iitgoa.ac.in', 8.95, '456 Cedar St, Village', 'Anna Sophie', 'Michael Sophie', '9876543940', '/photos/sophie7.jpg', 'B-'),
('2206307', 'Michael', 'ME', 2022, 'Male', 'michael.22063@iitgoa.ac.in', 7.55, '789 Elm St, Hamlet', 'Deborah Michael', 'Andrew Michael', '9876543950', '/photos/michael4.jpg', 'O-'),
('2306308', 'Olivia', 'ME', 2023, 'Female', 'olivia.23063@iitgoa.ac.in', 9.25, '234 Pine St, County', 'Sophia Olivia', 'David Olivia', '9876543960', '/photos/olivia4.jpg', 'AB-'),
('2006309', 'Logan', 'ME', 2020, 'Male', 'logan.20063@iitgoa.ac.in', 8.40, '567 Oak St, City', 'Emma Logan', 'William Logan', '9876543970', '/photos/logan4.jpg', 'A+'),
('2106310', 'Isabella', 'ME', 2021, 'Female', 'isabella.21063@iitgoa.ac.in', 7.80, '890 Cedar St, Village', 'Grace Isabella', 'Peter Isabella', '9876543980', '/photos/isabella5.jpg', 'B-'),
('2206311', 'Ethan', 'ME', 2022, 'Male', 'ethan.22063@iitgoa.ac.in', 9.10, '123 Elm St, Hamlet', 'Sophia Ethan', 'David Ethan', '9876543990', '/photos/ethan.jpg', 'O-');

 DROP TABLE IF EXISTS courses;
 truncate table courses;
 
CREATE TABLE IF NOT EXISTS courses (
  Course_Code varchar(50) PRIMARY KEY NOT NULL,
  Credit int,
  School varchar(50) NOT NULL,
  Instructor_Name varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  Department varchar(50),
  Semester varchar(50),
  Course_Type varchar(50),
  Prerequisites varchar(50));
  
 
 -- for prerequistes
 
 INSERT INTO courses (Course_code, School, Credit, Instructor_Name, Email, Department, Semester, Course_Type,Prerequisites) VALUES
('CH102','SCMS',2,'Dr. Rishikesh Narayan','rishikesh@iitgoa.ac.in','CSE MNC EE ME','1','Institute Core Theory',NULL),
('CM603','SCMS',3,'Dr. Satyaprakash Ahirwar','satyaprakash@iitgoa.ac.in','CSE MNC EE ME','7','Open Elective',NULL),
('CM608','SCMS',3,'Dr. Kedar Joshi','kedar@iitgoa.ac.in','CSE MNC EE ME','8','Open Elective',NULL),
('CM610','SCMS',3,'Dr. Ashok Kumar Ummireddi','ashok@iitgoa.ac.in','CSE MNC EE ME','6 8','Open Elective',NULL),
('CS101','SMCS',4,'Dr. Clint P George','clint@iitgoa.ac.in','CSE MNC EE ME','1','Institute Core Theory',NULL),
('CS210','SMCS',4,'Dr. Rahul C. S.','rahul@iitgoa.ac.in','CSE','3','Program Core Theory+Lab',NULL),
('CS220','SMCS',4,'Dr. Arpita Korwar','arpita@iitgoa.ac.in','CSE MNC','3','Program Core Theory+Lab',NULL),
('CS221','SMCS',3,'Dr. Saurabh Trivedi','saurabh@iitgoa.ac.in','CSE MNC','3','Program Core Theory',NULL),
('CS230','SMCS',3,'Dr. Satyanath Bhat','satya@iitgoa.ac.in','CSE MNC','3','Program Core Theory',NULL),
('CS300','SMCS',4,'Dr. Amaldev manuel','amaldev@iitgoa.ac.in','CSE','5','Program Core Theory+Lab',NULL),
('CS301','SMCS',4,'Dr. Shitala Prasad','shitala@iitgoa.ac.in','CSE','5','Program Core Theory+Lab',NULL),
('CS302','SMCS',3,'Dr. Sudakshina Dutta','sudakshina@iitgoa.ac.in','CSE','5','Program Core Theory',NULL),
('CS303','SMCS',4,'Dr. Divya Padmanabhan','divya@iitgoa.ac.in','CSE','5','Program Core Theory+Lab',NULL),
('CS311','SMCS',4,'Dr. Sreejith AV','sreejith@iitgoa.ac.in','CSE','6','Program Core Theory + Lab',NULL),
('CS321','SMCS',3,'Dr. Amaldev Manuel','amaldev@iitgoa.ac.in','CSE MNC','6','Program Core Theory','CS221 MA204'),
('CS331','SMCS',4,'Dr. Satyanath Bhat','satya@iitgoa.ac.in','CSE MNC','6','Program Core Theory + Lab','CS230'),
('CS410','SMCS',3,'Dr. Rahul C S','rahul@iitgoa.ac.in','CSE MNC','7 8','BTP',NULL),
('CS411','SMCS',3,'Dr. Rahul C S','rahul@iitgoa.ac.in','CSE MNC','7 8','BTP',NULL),
('CS420','SMCS',12,'Dr. Rahul C S','rahul@iitgoa.ac.in','CSE','7','Internship',NULL),
('CS425','SMCS',3,'Dr. Arpita Korwar','arpita@iitgoa.ac.in','CSE MNC','6 8','Program Elective','CS101 CS220 CS222'),
('CS431','SMCS',3,'Dr. Divya Padmanabhan','divya@iitgoa.ac.in','CSE MNC EE ME','8','Open Elective',NULL),
('CS435','SMCS',3,'Dr. Shitala Prasad','shitala@iitgoa.ac.in','CSE MNC','8','Program Elective','CS330 CS331'),
('CS524','SMCS',3,'Prof. Venkatesh Kamat','venkatesh@iitgoa.ac.in','CSE','7','Program Elective',NULL),
('CS528','SMCS',3,'Dr. Sudakshina Dutta','sudakshina@iitgoa.ac.in','CSE MNC','8','Program Elective',NULL),
('CS540','SMCS',3,'Dr. Sharad Sinha','sharad@iitgoa.ac.in','CSE MNC','7','Program Elective',NULL),
('EE201','SES',3,'Dr. Sujit Kumar Sahoo','sujitkumar@iitgoa.ac.in','CSE MNC ME','3','Open Elective',NULL),

('EE211','SES',4,'Dr. Sashidhar Sampatirao','sashidhar@iitgoa.ac.in','EE','4','Program Core Theory+Lab','EE102'),
('EE221','SES',3,'Dr. Sujit Kumar Sahoo','sujikumar@iitgoa.ac.in','EE','4','Program Core Theory',NULL),
('EE222','SES',3,'Dr. Shakthi Prasad D','shakthi@iitgoa.ac.in','EE','3','Program Core Theory',NULL),
('EE223','SES',3,'Dr. Neelakandan R','neelakandan@iitgoa.ac.in','EE','4','Program Core Theory',NULL),
('EE231','SES',4,'Dr. Sunil Dutt','sunildutta@iitgoa.ac.in','EE','3','Program Core Theory+Lab',NULL),
('EE232','SES',4,'Dr. Nandakumar Nambath','nandakumar@iitgoa.ac.in','EE','3','Program Core Theory+Lab',NULL),
('EE233','SES',4,'Dr. Bidhan Pramanick','bidhan@iitgoa.ac.in','EE','4','Program Core Theory+Lab','EE101'),
('EE312','SES',3,'Dr. Apeksha Madhukar','apeksha@iitgoa.ac.in','EE','6','Program Core Theory',NULL),
('EE331','SES',4,'Dr. Sunil Dutt','sunikdutt@iitgoa.ac.in','EE','6','Program Core Theory + Lab','EE232'),
('EE441','SES',6,'Dr. Apeksha Madhukar','apeksha@iitgoa.ac.in','EE','7','BTP',NULL),
('EE442','SES',12,'Dr. Apeksha Madhukar','apeksha@iitgoa.ac.in','EE','7','Intership',NULL),
('EE443','SES',3,'Dr. Sunil Dutt','sunildutt@iitgoa.ac.in','EE','8','BTP',NULL),
('EE610','SES',3,'Dr. Sashidhar','sashidhar@iitgoa.ac.in','EE','7','Program Elective',NULL),
('EE611','SES',3,'Dr. Sashidhar Sampathirao','sashidhar@iitgoa.ac.in','EE','7','Program Elective',NULL),
('EE612','SES',3,'Dr. Shakthi Prasad D','shakthi@iitgoa.ac.in','EE','6 8','Program Elective',NULL),
('EE613','SES',3,'Dr. Sheron Figarado','sheron@iitgoa.ac.in','EE','6 8','Program Elective',NULL),
('EE615','SES',3,'Dr. Sashidhar Sampathirao','sashidhar@iitgoa.ac.in','EE','6 8','Program Elective',NULL),
('EE631','SES',3,'Dr. Bidhan Pramanick','bidhan@iitgoa.ac.in','CSE MNC EE ME','7','Open Elective',NULL),
('EE632','SES',3,'Dr. Nandakumar Nambath','nandakumar@iitgoa.ac.in','EE','6 8','Program Elective',NULL),
('EE640','SES',3,'Dr. Apeksha Madhukar','apeksha@iitgoa.ac.in','EE','7','Program Elective',NULL),
('HS101','HSSS',3,'Dr. Sabiha Hashami','sabiha@iitgoa.ac.in','CSE MNC EE ME','1','Institute Core Theory',NULL),
('HS221','HSSS',3,'Dr. Sunil Paul','sunil@iitgoa.ac.in','CSE MNC EE ME','3','Open Elective',NULL),
('HS253','HSSS',3,'Mr. Gautam Nima','gautam@iitgoa.ac.in','CSE MNC EE ME','3 5 7','Open Elective',NULL),
('HS301','SHHHS',3,'Dr. Sunil Paul','sunil@iitgoa.ac.in','CSE MNC EE ME','6','Open Elective',NULL),
('HS311','HSSS',3,'Dr. Sabiha Hashami','sabiha@iitgoa.ac.in','CSE MNC EE ME','5','Open Elective',NULL),
('HS321','HSSS',3,'Mr. Vipin Chaudhary','vipin@iitgoa.ac.in','CSE MNC EE ME','5','Open Elective',NULL),
('HS421','SMCS',3,'Dr. Sunil Paul','sunil@iitgoa.ac.in','CSE MNC EE ME','8','Open Elective',NULL),
('ID605','SCMS',3,'Dr. Sandip Haldar','sandip@iitgoa.ac.in','CSE MNC EE ME','5 7','Open Elective',NULL),
('MA101','SMCS',4,'Dr. Shiv Parsad','shiv@iitgoa.ac.in','CSE MNC EE ME','1','Institute Core Theory',NULL),
('MA201','SMCS',4,'Dr. Rajeev Gupta','rajeev@iitgoa.ac.in','CSE EE ME','3 5 2007','Open Elective',NULL),
('MA202','SMCS',4,'Dr. Shiv Parsad','shiv@iitgoa.ac.in','MNC','4','Program Core Theory',NULL),
('MA203','SMCS',4,'Dr. Rajeev Gupta','rajeev@iitgoa.ac.in','MNC ME','4','Institute Core Theory',NULL),
('MA205','SMCS',4,'Dr. Sandipan De','sandipan@iitgoa.ac.in','MNC','4','Program Core Theory',NULL),
('MA306','SMCS',3,'Dr. Abhitosh Upadhyay','abhitosh@iitgoa.ac.in','MNC','6','Program Core Theory',NULL),
('MA353','SMCS',3,'Dr. Saurabh Trivedi','saurabh@iitgoa.ac.in','CSE MNC EE ME','6 8','Open Elective',NULL),
('MA400','SMCS',12,'Dr. Shiv Parsad','shiv@iitgoa.ac.in','MNC','7','Intership',NULL),
('MA451','SMCS',6,'Dr. Sandipan De','sandipan@iitgoa.ac.in','MNC','7','BTP',NULL),
('MA523','SMCS',3,'Dr. Saumya Bajpai','saumya@iitgoa.ac.in','MNC','3','Program Elective',NULL),
('MA524','SMCS',3,'Dr. Sandipan De','sandipan@iitgoa.ac.in','MNC','8','Program Elective','MA305 MA306'),
('ME200','SMS',3,'Dr Ponnulakshmi VK','ponnulakshmi@iitgoa.ac.in','ME','3','Program Core Theory',NULL),
('ME201','SMS',4,'Dr. Arindam Das','arindam@iitgoa.ac.in','ME','3','Program Core Theory+Lab',NULL),
('ME210','SMS',4,'Dr. Sudhakar Yogaraj','sudhakar@iitgoa.ac.in','ME','3','Program Core Theory',NULL),
('ME211','SMS',2,'Dr. Sandip Haldar','sandip@iitgoa.ac.in','ME','3','Program Core Lab',NULL),
('ME212','SMS',2,'Prof. Rajesh P. Gaonkar','rajesh@iitgoa.ac.in','ME','4','Program Core Theory+Lab',NULL),
('ME220','SMS',3,'Dr. Priyabrata Sahoo','priyabrata@iitgoa.ac.in','ME','4','Program Core Theory',NULL),
('ME221','SMS',2,'Dr. Anirudha Ambekar','anirudha@iitgoa.ac.in','ME','4','Program Core Theory+Lab',NULL),
('ME222','SMS',3,'Dr. Satyaprakash Ahirwar','satyaprakash@iitgoa.ac.in','ME','4','Program Core Theory',NULL),
('ME301','SMS',4,'Dr. Thaseem Thajudeen','thaseem@iitgoa.ac.in','ME','6','Program Core Theory + Lab',NULL),
('ME311','SMS',4,'Dr. Ashish Bhateja','ashish@iitgoa.ac.in','ME','6','Program Core Theory + Lab',NULL),
('ME322','SMS',3,'Prof. Rajesh P Gaonkar','rajeshpg@iitgoa.ac.in','ME','6','Program Core Theory',NULL),
('ME323','SMS',2,'Dr. Arindam Das','arindam@iitgoa.ac.in','ME','6','Program Core Lab',NULL),
('ME430','SMS',12,'Dr. Sreenath Balakrishnan','sreenath@iitgoa.ac.in','ME','7','Intership',NULL),
('ME431','SMS',6,'Dr. Sudhakar Yogaraj','sudhakar@iitgoa.ac.in','ME','7','BTP',NULL),
('ME432','SMS',3,'Dr. Ponnulakshmi V K','ponnulakshmi@iitgoa.ac.in','ME','8','Program Core Theory',NULL),
('ME604','SMS',3,'Dr. Thasem Thajudeen','thasem@iitgoa.ac.in','ME','7','Program Elective',NULL),
('ME605','SMS',3,'Dr. Ponnulakshmi VK','ponnulakshi@iitgoa.ac.in','ME','6','Program Elective',NULL),
('ME606','SMS',3,'Dr. Priyabrata Sahoo','priyabrata@iitgoa.ac.in','ME','8','Program Elective',NULL),
('ME608','SMS',3,'Dr. Anirudha Ambekar','anirudh@iitgoa.ac.in','ME','6 8','Program Elective',NULL),
('ME609','SMCS',3,'Dr. Arindam Das','arindam@iitgoa.ac.in','CSE MNC EE ME','6 8','Open Elective',NULL),
('ME610','SMS',3,'Dr. Sandip Haldar','sandip@iitgoa.ac.in','ME','7','Program Elective',NULL),
('ME613','SMS',3,'Dr. Harpreet Singh','harpreet@iitgoa.ac.in','ME','7','Program Elective',NULL),
('ME615','SMS',3,'Dr. Sandip Haldar','sandip@iitgoa.ac.in','ME','6','Program Elective',NULL),
('ME619','SMS',3,'Dr. Arindam Das','arindam@iitgoa.ac.in','ME','6','Program Elective',NULL),
('ME622','SMS',3,'Dr. Ashish Bhateja','ashish@iitgoa.ac.in','ME','7','Program Elective',NULL),
('ME626','SMS',3,'Dr, Sreenath Balakrishnan','sreenath@iitgoa.ac.in','ME','8','Program Elective',NULL),
('ME627','SMS',3,'Dr. Abhishek Gupta','abhishek@iitgoa.ac.in','ME','6','Program Elective','MA101 MA103'),
('MA102','SMCS',2,'Dr. Kalpesh Haria','kalpesh@iitgoa.ac.in','CSE MNC EE ME',2,'Institute Core Theory',NULL),
('MA103','SMCS',2,'Dr. Lok Pati Tripathi','lokpati@iitgoa.ac.in','CSE MNC EE ME',2,'Institute Core Theory',NULL),
('PH102','SCMS',3,'Dr. Santosh Kumar','santosh@iitgoa.ac.in','CSE MNC EE ME',2,'Institute Core Theory',NULL),
('PH103','SCMS',2,'Dr. Vaibhav Wasnik','vaibhav@iitgoa.ac.in','CSE MNC EE ME',2,'Institute Core Lab',NULL),
('BIO101','SCMS',3,'Dr. Sreenath Balakrishnan','sreenath@iitgoa.ac.in','CSE MNC EE ME',2,'Institute Core Theory',NULL),
('CS102','SCMS',3,'Dr. Clint P George','clint@iitgoa.ac.in','CSE MNC',2,'Institute Core Theory + Lab',NULL),
('EE102','SES',3,'Dr. Shakthi Prasad D','shakthi@iitgoa.ac.in','EE',2,'Institute Core Theory',NULL),
('ME110','SMS',3,'Dr. Harpreet Singh','harpreet@iitgoa.ac.in','ME',2,'Institute Core Theory',NULL),
('CS100','SCMS',1,'Prof. Venkatesh Kamat','venktesh@iitgoa.ac.in','CSE',1,'Program Core',NULL),
('EE100','SES',1,'Dr. Sashidhar Sampatirao','sashishar@iitgoa.ac.in','EE',1,'Program Core',NULL),
('ME100','SMS',1,'Dr. Rudra Narayan Roy','rudra@iitgoa.ac.in','ME',1,'Program Core',NULL),
('MC100','SCMS',1,'Dr. Rajeev Gupta','rajeev@iitgoa.ac.in','MNC',1,'Program Core',NULL),
('PH101','SCMS',3,'Dr. Santosh Kumar Das','santoshk@iitgoa.ac.in','CSE MNC EE ME','1','Institute Core Theory',NULL),
('CS211', 'SMCS', 4, 'Dr. Sharad Sinha', 'sharad@iitgoa.ac.in', 'CSE', '4', 'Program Core Theory + Lab', 'CS210'),
('CS212', 'SMCS', 4, 'Dr. Neha Karanjkar', 'neha@iitgoa.ac.in', 'CSE', '4', 'Program Core Theory + Lab', NULL),
('CS222', 'SMCS', 4, 'Dr. Rahul C S', 'rahul@iitgoa.ac.in', 'CSE MNC', '4', 'Program Core Theory + Lab', 'CS220'),
('CS440', 'SMCS', 3, 'Prof. Venkatesh Kamat', 'venkatesh@iitgoa.ac.in', 'CSE MNC EE ME', '2 4 6 8', 'Open Elective', 'CS101');




DROP TABLE IF EXISTS course_enrollment;
truncate table course_enrollment;

CREATE TABLE IF NOT EXISTS course_enrollment (
    Enrollment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Course_Code VARCHAR(50),
    Student_ID INT,
    Semester INT,
    FOREIGN KEY (Course_Code) REFERENCES courses(Course_Code),
    FOREIGN KEY (Student_ID) REFERENCES student(Student_ID),
    UNIQUE (Course_Code, Student_ID) -- Ensuring no duplicates for course and student pair
);
INSERT INTO course_enrollment (Course_Code, Student_ID,Semester) VALUES 
('CH102',2003319,1),
('CS101',2003319,1),
('HS101',2003319,1),
('MA101',2003319,1),
('PH101',2003319,1),
-- ('MC100',2003319,1),
('CH102',2003306,1),
('CS101',2003306,1),
('HS101',2003306,1),
('MA101',2003306,1),
('PH101',2003306,1),
-- ('MC100',2003306,1),
('CH102',2003120,1),
('CS101',2003120,1),
('HS101',2003120,1),
('MA101',2003120,1),
('PH101',2003120,1),
('CS100',2003319,1),
('MA102',2003319,2),
('MA103',2003319,2),
('PH102',2003319,2),
('PH103',2003319,2),
('BIO101',2003319,2),
('CS102',2003319,2);

INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CH102', Student_ID, 1
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS101', Student_ID, 1
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'HS101', Student_ID, 1
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'PH101', Student_ID, 1
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'MA102', Student_ID, 2
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'MA103', Student_ID, 2
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'PH102', Student_ID, 2
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'BIO101', Student_ID, 2
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS102', Student_ID, 2
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

-- pROGRAM
-- CSE
 INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS100', Student_ID, 1
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);

 INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS210', Student_ID, 3
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS220', Student_ID, 3
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS221', Student_ID, 3
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS230', Student_ID, 3
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS211', Student_ID, 3
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS212', Student_ID, 3
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS222', Student_ID, 3
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);

-- MNC
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'MC100', Student_ID, 1
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);

INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS220', Student_ID, 3
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS221', Student_ID, 3
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS230', Student_ID, 3
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'MA523', Student_ID, 3
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'MA202', Student_ID, 4
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'MA203', Student_ID, 4
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'MA205', Student_ID, 4
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'CS222', Student_ID, 4
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);

-- EE
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'EE100', Student_ID, 1
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'EE201', Student_ID, 3
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'EE222', Student_ID, 3
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'EE231', Student_ID, 3
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'EE232', Student_ID, 3
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'EE211', Student_ID,4
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'EE221', Student_ID, 4
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'EE223', Student_ID, 4
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'EE233', Student_ID, 4
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);



-- ME
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'ME100', Student_ID, 1
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'ME200', Student_ID, 3
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'ME201', Student_ID, 3
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'ME210', Student_ID, 3
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'ME211', Student_ID, 3
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);


INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'MA205', Student_ID, 4
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);

-- CSE MNC EE
INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'EE201', Student_ID, 3
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120,2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320,2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216);
 
 --  ALL
 INSERT INTO course_enrollment (Course_Code, Student_ID, Semester)
SELECT 'HS221', Student_ID, 3
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

-- delete from course_enrollment where Course_Code='HS221';

select Registration_Status from Registration where Student_ID='2003121' and  Course_Code='CH102';

update Registration set Registration_Status='Pending' where Student_ID='2003121' and  Course_Code='CH102';

DROP TABLE IF EXISTS grades;
truncate table grades;
-- Create the grading table
CREATE TABLE IF NOT EXISTS grades (
    Grade_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT,
    Course_Code VARCHAR(50),
    Grade VARCHAR(3), -- Storing letter grades
    FOREIGN KEY (Student_ID) REFERENCES student(Student_ID),
    FOREIGN KEY (Course_Code) REFERENCES courses(Course_Code),
    UNIQUE (Student_ID, Course_Code) -- Unique constraint for one grade per course per student
);

INSERT INTO grades (Course_Code, Student_ID,Grade) VALUES 
('CH102',2003319,'A'),
('CS101',2003319,'A'),
('HS101',2003319,'A'),
('MA101',2003319,'B+'),
('PH101',2003319,'B+'),
('MC100',2003319,'B+'),
('CH102',2003306,'B+'),
('CS101',2003306,'B'),
('HS101',2003306,'B'),
('MA101',2003306,'B'),
('PH101',2003306,'B'),
('MC100',2003306,'B'),
('CH102',2003120,'B+'),
('CS101',2003120,'B+'),
('HS101',2003120,'B+'),
('MA101',2003120,'B+'),
('PH101',2003120,'B+'),
('CS100',2003319,'A+'),
('MA102',2003319,'A+'),
('MA103',2003319,'A+'),
('PH102',2003319,'A'),
('PH103',2003319,'A'),
('BIO101',2003319,'B'),
('CS102',2003319,'B');

INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CH102', Student_ID, 'B+'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS101', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'HS101', Student_ID, 'A+'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'PH101', Student_ID, 'B+'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'MA102', Student_ID, 'C'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'MA103', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'PH102', Student_ID, 'C'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'BIO101', Student_ID, 'A+'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS102', Student_ID, 'A'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

-- pROGRAM
-- CSE
 INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS100', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);

 INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS210', Student_ID, 'A'
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS220', Student_ID, 'A'
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS221', Student_ID, 'B+'
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS230', Student_ID, 'B+'
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS211', Student_ID, 'C'
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS212', Student_ID, 'C+'
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS222', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);

-- MNC
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'MC100', Student_ID, 'A+'
FROM student
WHERE Student_ID IN ( 2003306, 2003319,2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
-- 
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS220', Student_ID, 'B+'
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS221', Student_ID, 'A'
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS230', Student_ID, 'B+'
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'MA523', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'MA202', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'MA203', Student_ID, 'C+'
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'MA205', Student_ID, 'A'
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'CS222', Student_ID, 'B+'
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);

-- EE
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'EE100', Student_ID, 'A+'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'EE201', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'EE222', Student_ID, 'B+'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'EE231', Student_ID, 'A'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'EE232', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);

 --  fgfhghg
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'EE211', Student_ID,'B+'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'EE221', Student_ID, 'C+'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'EE223', Student_ID, 'B+'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'EE233', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);



-- ME
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'ME100', Student_ID, 'A+'
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'ME200', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'ME201', Student_ID, 'B'
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'ME210', Student_ID, 'C'
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'ME211', Student_ID, 'A'
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);





INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'MA205', Student_ID, 'C'
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);

 --  ALL
 INSERT INTO grades (Course_Code, Student_ID,Grade)
SELECT 'HS221', Student_ID, 'A'
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);


 -- INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status);



drop table if exists Registration; 

CREATE TABLE Registration (
  Student_ID INT NOT NULL,
  Course_Code VARCHAR(20) NOT NULL,
  Registration_Status ENUM('Pending', 'Approved', 'Rejected','Cancelled') NOT NULL DEFAULT 'Pending',
  Registration_Date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Instructor_ID INT NOT NULL,
  Instructor_Comments TEXT,
  Semester INT NOT NULL,
  FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
  FOREIGN KEY (Student_ID) REFERENCES student(Student_ID),
  FOREIGN KEY (Course_Code) REFERENCES courses(Course_Code));


select Registration_Status from Registration where Student_ID='2003120' and  Course_Code='BIO101';

INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CH102', Student_ID, 1, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS101', Student_ID, 1, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'HS101', Student_ID, 1, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'PH101', Student_ID, 1, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'MA102', Student_ID, 2, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'MA103', Student_ID, 2, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'PH102', Student_ID, 2, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

 -- dfghj 
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'BIO101', Student_ID, 2, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS102', Student_ID, 2, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);

-- pROGRAM
-- CSE
 INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS100', Student_ID, 1, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);

 INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS210', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS220', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS221', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS230', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS211', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS212', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS222', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120
);

-- MNC
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'MC100', Student_ID, 1, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);

INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS220', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS221', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS230', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'MA523', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'MA202', Student_ID, 4, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'MA203', Student_ID, 4, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'MA205', Student_ID, 4, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'CS222', Student_ID, 4, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320
);

-- EE
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'EE100', Student_ID, 1, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'EE201', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'EE222', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'EE231', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'EE232', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'EE211', Student_ID,4, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'EE221', Student_ID, 4, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'EE223', Student_ID, 4, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'EE233', Student_ID, 4, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216
);



-- ME
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'ME100', Student_ID, 1, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'ME200', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'ME201', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'ME210', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);



INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'ME211', Student_ID, 4, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);


INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'MA205', Student_ID, 4, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316
);

-- CSE MNC EE
INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'EE201', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2003120, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120,2003306, 2003319, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320,2004220, 2006319, 2103116, 2104214, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216);
 
 --  ALL
 INSERT INTO Registration (Course_Code, Student_ID,Semester,Registration_Status,Instructor_ID)
SELECT 'HS221', Student_ID, 3, 'Approved', Instructor_ID
FROM student
WHERE Student_ID IN (2004220, 2006319, 2103116, 2104214, 2003121, 2003101, 2103102, 2203103, 2303104, 2003105, 2103106, 2203107, 2303108, 2003109, 2103110, 2203111, 2303112, 2003113, 2103114, 2203115, 2303116, 2003117, 2103118, 2203119, 2303120, 2003301, 2103302, 2203303, 2303304, 2003305, 2103306, 2203307, 2303308, 2003309, 2103310, 2203311, 2303312, 2003313, 2103314, 2203315, 2303316, 2003317, 2103318, 2203319, 2303320, 2004201, 2104202, 2204203, 2304204, 2004205, 2104206, 2204207, 2304208, 2004209, 2104210, 2204211, 2304212, 2004213, 2104215, 2204215, 2304216, 2004217, 2104218, 2204219, 2304220, 2006301, 2106302, 2206303, 2306304, 2006305, 2106306, 2206307, 2306308, 2006309, 2106310, 2206311, 2306312, 2006313, 2106314, 2206315, 2306316);



CREATE TABLE registration_periods (
    semester INT PRIMARY KEY,
    open_date DATETIME,
    close_date DATETIME
);

