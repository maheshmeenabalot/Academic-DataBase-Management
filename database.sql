----- Creating Database named College-----
CREATE DATABASE College;
USE College;

DROP TABLE IF EXISTS Faculty;
-- Create the student table with personal data
CREATE TABLE IF NOT EXISTS  Faculty (
	Faculty_ID INT PRIMARY KEY NOT NULL,
	Faculty_Name VARCHAR(50) NOT NULL UNIQUE,
	Faculty_Email VARCHAR(50) NOT NULL,
    School VARCHAR(50) NOT NULL
);

INSERT INTO Faculty (Faculty_ID, Faculty_Name, Faculty_Email, School) VALUES
('180101', 'Dr. Clint', 'clint@iitgoa.ac.in', 'SMCS'),
('180102', 'Dr. Rahul', 'rahul@iitgoa.ac.in','SMCS' ),
('180201', 'Dr. Ram',	'ram@iitgoa.ac.in' ,'SES'),
('190101', 'Dr. Rajeev', 'rajeev@iitgoa.ac.in','SMCS'),
('190102', 'Dr. Shiv', 'shiv@iitgoa.ac.in', 'SMCS'),
('180301', 'Dr. Priya', 'priya@iitgoa.ac.in', 'SMS'),
('210301', 'Dr. Arindam', 'arindam@iitgoa.ac.in', 'SMS' ),
('200401', 'Dr. Sunil Paul' ,'sunil@iitgoa.ac.in','SHSS');

DROP DATABASE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    role ENUM('student', 'instructor', 'admin') NOT NULL DEFAULT 'student'
);

-- Insert data into the users table with roles
INSERT INTO users (username, password_hash, email, role) VALUES
('2003120', 'mahesh', 'user1@iitgoa.ac.in', 'student'),
('2003306', 'aryan', 'user2@iitgoa.ac.in', 'student'),
('2003319', 'rajesh', 'user3@iitgoa.ac.in', 'student'),
('rahul@iitgoa.ac.in', 'profrahul', 'rahul@iitgoa.ac.in', 'instructor'),
('satya@iitgoa.ac.in', 'profsatya', 'satya@iitgoa.ac.in', 'instructor'),
('client@iitgoa.ac.in', 'profclient', 'client@iitgoa.ac.in', 'instructor'),
('admin1', 'admin1pw', 'admin1@iitgoa.ac.in', 'admin'),
('admin2', 'admin2pw', 'admin2@iitgoa.ac.in', 'admin'),
('admin3', 'admin3pw', 'admin3@iitgoa.ac.in', 'admin');

----- Creating a table to store student details within the database-----
DROP TABLE IF EXISTS student_profile;

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
('2206311', 'Ethan', 'ME', 2022, 'Male', 'ethan.22063@iitgoa.ac.in', 9.10, '123 Elm St, Hamlet', 'Sophia Ethan', 'David Ethan', '9876543990', '/photos/ethan.jpg', 'O-'),
('2306312', 'Emily', 'ME', 2023, 'Female', 'emily.23063@iitgoa.ac.in', 8.65, '456 Pine St, County', 'Nancy Emily', 'Michael Emily', '9876544000', '/photos/emily4.jpg', 'AB-'),
('2006313', 'Mia', 'ME', 2020, 'Female', 'mia.20063@iitgoa.ac.in', 9.50, '789 Oak St, City', 'Sophia Mia', 'David Mia', '9876544010', '/photos/mia2.jpg', 'A+'),
('2106314', 'William', 'ME', 2021, 'Male', 'william.21063@iitgoa.ac.in', 8.20, '234 Elm St, Village', 'Catherine William', 'Martin William', '9876544020', '/photos/william5.jpg', 'B-'),
('2206315', 'Grace', 'ME', 2022, 'Female', 'grace.22063@iitgoa.ac.in', 9.35, '567 Cedar St, Hamlet', 'Linda Grace', 'Christopher Grace', '9876544030', '/photos/grace2.jpg', 'O-'),
('2306316', 'Liam', 'ME', 2023, 'Male', 'liam.23063@iitgoa.ac.in', 7.30, '890 Pine St, County', 'Karen Liam', 'Matthew Liam', '9876544040', '/photos/liam2.jpg', 'AB-');

----- Creating a table to store student details within the database-----
DROP TABLE IF EXISTS student;
CREATE TABLE IF NOT EXISTS student (
  Student_ID INT PRIMARY KEY NOT NULL,
  Student_Name varchar(50) NOT NULL,
  Branch varchar(50) NOT NULL,
  Batch INT NOT NULL,
  Gender varchar(10) NOT NULL,
  Email varchar(50) NOT NULL,
  CGPA FLOAT(4),
  Faculty_Advisor varchar(50) NOT NULL,
  FOREIGN KEY (Faculty_Advisor) REFERENCES Faculty(Faculty_Name));

----- Inserting data into student table-----
INSERT INTO student (Student_ID, Student_Name, Branch, Batch, Gender, Email, CGPA, Faculty_Advisor) VALUES
('2003120', 'Mahesh', 'CSE', '2020', 'Male', 'mahesh.meena.20031@iitgoa.ac.in', 8.75,'Dr. Clint'),
('2003306', 'Aryan', 'MNC', '2020',	'Male', 'aryan.olkha.20033@iitgoa.ac.in', 7.50, 'Dr. Rajeev'),
('2003319', 'Rajesh', 'MNC', '2020', 'Male', 'rajesh.meena.20033@iitgoa.ac.in', 9.92, 'Dr. Rajeev'),
('2004220', 'Mesh', 'EE', '2020', 'Female', 'mesh.meena.20042@iitgoa.ac.in', 5.44, 'Dr. Ram'),
('2006319', 'Anil',	'EE', '2020', 'Male',	'anil.20063@iitgoa.ac.in', 9.45, 'Dr. Arindam'),
('2103116', 'Ryan',	'CSE',	'2021',	'Male',	'ryan.khan.21031@iitgoa.ac.in', 6.49, 'Dr. Rahul'), 
('2104214', 'Mitu', 'ME', '2021', 'Female', 'mitu.20042@iitgoa.ac.in', 3.98, 'Dr. Arindam'),
('2003121', 'Omkar', 'CSE', '2020', 'Male', 'Omkar.Lodekar.20031@iitgoa.ac.in', 9.98, 'Dr. Clint'),
('2003101', 'John', 'CSE', '2020', 'Male', 'john.20031@iitgoa.ac.in', 8.75, 'Dr. Clint'),
('2103102', 'Alice', 'CSE', '2021', 'Female', 'alice.21031@iitgoa.ac.in', 7.50, 'Dr. Clint'),
('2203103', 'Bob', 'CSE', '2022', 'Male', 'bob.22031@iitgoa.ac.in', 9.92, 'Dr. Clint'),
('2303104', 'Emily', 'CSE', '2023', 'Female', 'emily.23031@iitgoa.ac.in', 6.44, 'Dr. Clint'),
('2003105', 'David', 'CSE', '2020', 'Male', 'david.20031@iitgoa.ac.in', 7.25, 'Dr. Clint'),
('2103106', 'Sophie', 'CSE', '2021', 'Female', 'sophie.21031@iitgoa.ac.in', 8.30, 'Dr. Clint'),
('2203107', 'Michael', 'CSE', '2022', 'Male', 'michael.22031@iitgoa.ac.in', 8.60, 'Dr. Clint'),
('2303108', 'Olivia', 'CSE', '2023', 'Female', 'olivia.23031@iitgoa.ac.in', 9.15, 'Dr. Clint'),
('2003109', 'George', 'CSE', '2020', 'Male', 'george.20031@iitgoa.ac.in', 7.90, 'Dr. Rahul'),
('2103110', 'Sophia', 'CSE', '2021', 'Female', 'sophia.21031@iitgoa.ac.in', 8.75, 'Dr. Rahul'),
('2203111', 'William', 'CSE', '2022', 'Male', 'william.22031@iitgoa.ac.in', 9.30, 'Dr. Rahul'),
('2303112', 'Isabella', 'CSE', '2023', 'Female', 'isabella.23031@iitgoa.ac.in', 7.80, 'Dr. Rahul'),
('2003113', 'James', 'CSE', '2020', 'Male', 'james.20031@iitgoa.ac.in', 8.20, 'Dr. Rahul'),
('2103114', 'Ava', 'CSE', '2021', 'Female', 'ava.21031@iitgoa.ac.in', 9.10, 'Dr. Rahul'),
('2203115', 'Henry', 'CSE', '2022', 'Male', 'henry.22031@iitgoa.ac.in', 8.90, 'Dr. Rahul'),
('2303116', 'Charlotte', 'CSE', '2023', 'Female', 'charlotte.23031@iitgoa.ac.in', 8.40, 'Dr. Rahul'),
('2003117', 'Daniel', 'CSE', '2020', 'Male', 'daniel.20031@iitgoa.ac.in', 9.50, 'Dr. Rahul'),
('2103118', 'Amelia', 'CSE', '2021', 'Female', 'amelia.21031@iitgoa.ac.in', 7.70, 'Dr. Rahul'),
('2203119', 'Alexander', 'CSE', '2022', 'Male', 'alexander.22031@iitgoa.ac.in', 8.85, 'Dr. Rahul'),
('2303120', 'Ella', 'CSE', '2023', 'Female', 'ella.23031@iitgoa.ac.in', 9.20, 'Dr. Rahul'),
('2003301', 'Emma', 'MNC', '2020', 'Female', 'emma.20033@iitgoa.ac.in', 9.20, 'Dr. Rajeev'),
('2103302', 'George', 'MNC', '2021', 'Male', 'george.21033@iitgoa.ac.in', 8.80, 'Dr. Rajeev'),
('2203303', 'Sophia', 'MNC', '2022', 'Female', 'sophia.22033@iitgoa.ac.in', 7.98, 'Dr. Rajeev'),
('2303304', 'Michael', 'MNC', '2023', 'Male', 'michael.23033@iitgoa.ac.in', 5.60, 'Dr. Rajeev'),
('2003305', 'Olivia', 'MNC', '2020', 'Female', 'olivia.20033@iitgoa.ac.in', 6.75, 'Dr. Rajeev'),
('2103306', 'Liam', 'MNC', '2021', 'Male', 'liam.21033@iitgoa.ac.in', 8.30, 'Dr. Rajeev'),
('2203307', 'Emily', 'MNC', '2022', 'Female', 'emily.22033@iitgoa.ac.in', 9.05, 'Dr. Rajeev'),
('2303308', 'Ethan', 'MNC', '2023', 'Male', 'ethan.23033@iitgoa.ac.in', 7.40, 'Dr. Rajeev'),
('2003309', 'Ava', 'MNC', '2020', 'Female', 'ava.20033@iitgoa.ac.in', 8.90, 'Dr. Rajeev'),
('2103310', 'Logan', 'MNC', '2021', 'Male', 'logan.21033@iitgoa.ac.in', 7.85, 'Dr. Rajeev'),
('2203311', 'Isabella', 'MNC', '2022', 'Female', 'isabella.22033@iitgoa.ac.in', 8.20, 'Dr. Shiv'),
('2303312', 'Jackson', 'MNC', '2023', 'Male', 'jackson.23033@iitgoa.ac.in', 9.60, 'Dr. Shiv'),
('2003313', 'Mia', 'MNC', '2020', 'Female', 'mia.20033@iitgoa.ac.in', 6.40, 'Dr. Shiv'),
('2103314', 'James', 'MNC', '2021', 'Male', 'james.21033@iitgoa.ac.in', 7.75, 'Dr. Shiv'),
('2203315', 'Sophia', 'MNC', '2022', 'Female', 'sophia.22033@iitgoa.ac.in', 8.80, 'Dr. Shiv'),
('2303316', 'Benjamin', 'MNC', '2023', 'Male', 'benjamin.23033@iitgoa.ac.in', 9.10, 'Dr. Shiv'),
('2003317', 'Charlotte', 'MNC', '2020', 'Female', 'charlotte.20033@iitgoa.ac.in', 7.20, 'Dr. Shiv'),
('2103318', 'William', 'MNC', '2021', 'Male', 'william.21033@iitgoa.ac.in', 8.50, 'Dr. Shiv'),
('2203319', 'Evelyn', 'MNC', '2022', 'Female', 'evelyn.22033@iitgoa.ac.in', 9.30, 'Dr. Shiv'),
('2303320', 'Daniel', 'MNC', '2023', 'Male', 'daniel.23033@iitgoa.ac.in', 6.95, 'Dr. Shiv'),
('2004201', 'James', 'EE', '2020', 'Male', 'james.20042@iitgoa.ac.in', 8.45, 'Dr. Ram'),
('2104202', 'Ava', 'EE', '2021', 'Female', 'ava.21042@iitgoa.ac.in', 9.60, 'Dr. Ram'),
('2204203', 'William', 'EE', '2022', 'Male', 'william.22042@iitgoa.ac.in', 8.30, 'Dr. Ram'),
('2304204', 'Isabella', 'EE', '2023', 'Female', 'isabella.23042@iitgoa.ac.in', 7.70, 'Dr. Ram'),
('2004205', 'Joseph', 'EE', '2020', 'Male', 'joseph.20042@iitgoa.ac.in', 9.85, 'Dr. Ram'),
('2104206', 'Charlotte', 'EE', '2021', 'Female', 'charlotte.21042@iitgoa.ac.in', 8.20, 'Dr. Ram'),
('2204207', 'Alexander', 'EE', '2022', 'Male', 'alexander.22042@iitgoa.ac.in', 9.40, 'Dr. Ram'),
('2304208', 'Emily', 'EE', '2023', 'Female', 'emily.23042@iitgoa.ac.in', 7.90, 'Dr. Ram'),
('2004209', 'Daniel', 'EE', '2020', 'Male', 'daniel.20042@iitgoa.ac.in', 8.75, 'Dr. Ram'),
('2104210', 'Sophie', 'EE', '2021', 'Female', 'sophie.21042@iitgoa.ac.in', 9.20, 'Dr. Ram'),
('2204211', 'Michael', 'EE', '2022', 'Male', 'michael.22042@iitgoa.ac.in', 8.60, 'Dr. Ram'),
('2304212', 'Olivia', 'EE', '2023', 'Female', 'olivia.23042@iitgoa.ac.in', 7.80, 'Dr. Ram'),
('2004213', 'Liam', 'EE', '2020', 'Male', 'liam.20042@iitgoa.ac.in', 9.30, 'Dr. Ram'),
('2104215', 'Ella', 'EE', '2021', 'Female', 'ella.21042@iitgoa.ac.in', 8.40, 'Dr. Ram'),
('2204215', 'Benjamin', 'EE', '2022', 'Male', 'benjamin.22042@iitgoa.ac.in', 9.70, 'Dr. Ram'),
('2304216', 'Mia', 'EE', '2023', 'Female', 'mia.23042@iitgoa.ac.in', 8.10, 'Dr. Ram'),
('2004217', 'Logan', 'EE', '2020', 'Male', 'logan.20042@iitgoa.ac.in', 9.50, 'Dr. Ram'),
('2104218', 'Sophia', 'EE', '2021', 'Female', 'sophia.21042@iitgoa.ac.in', 7.60, 'Dr. Ram'),
('2204219', 'Jacob', 'EE', '2022', 'Male', 'jacob.22042@iitgoa.ac.in', 8.85, 'Dr. Ram'),
('2304220', 'Grace', 'EE', '2023', 'Female', 'grace.23042@iitgoa.ac.in', 9.00, 'Dr. Ram'),
('2006301', 'Henry', 'ME', '2020', 'Male', 'henry.20063@iitgoa.ac.in', 7.20, 'Dr. Priya'),
('2106302', 'Amelia', 'ME', '2021', 'Female', 'amelia.21063@iitgoa.ac.in', 9.40, 'Dr. Priya'),
('2206303', 'Alexander', 'ME', '2022', 'Male', 'alexander.22063@iitgoa.ac.in', 8.10, 'Dr. Priya'),
('2306304', 'Charlotte', 'ME', '2023', 'Female', 'charlotte.23063@iitgoa.ac.in', 9.75, 'Dr. Priya'),
('2006305', 'Daniel', 'ME', '2020', 'Male', 'daniel.20063@iitgoa.ac.in', 6.88, 'Dr. Priya'),
('2106306', 'Sophie', 'ME', '2021', 'Female', 'sophie.21063@iitgoa.ac.in', 8.95, 'Dr. Priya'),
('2206307', 'Michael', 'ME', '2022', 'Male', 'michael.22063@iitgoa.ac.in', 7.55, 'Dr. Priya'),
('2306308', 'Olivia', 'ME', '2023', 'Female', 'olivia.23063@iitgoa.ac.in', 9.25, 'Dr. Priya'),
('2006309', 'Logan', 'ME', '2020', 'Male', 'logan.20063@iitgoa.ac.in', 8.40, 'Dr. Priya'),
('2106310', 'Isabella', 'ME', '2021', 'Female', 'isabella.21063@iitgoa.ac.in', 7.80, 'Dr. Priya'),
('2206311', 'Ethan', 'ME', '2022', 'Male', 'ethan.22063@iitgoa.ac.in', 9.10, 'Dr. Priya'),
('2306312', 'Emily', 'ME', '2023', 'Female', 'emily.23063@iitgoa.ac.in', 8.65, 'Dr. Priya'),
('2006313', 'Mia', 'ME', '2020', 'Female', 'mia.20063@iitgoa.ac.in', 9.50, 'Dr. Priya'),
('2106314', 'William', 'ME', '2021', 'Male', 'william.21063@iitgoa.ac.in', 8.20, 'Dr. Priya'),
('2206315', 'Grace', 'ME', '2022', 'Female', 'grace.22063@iitgoa.ac.in', 9.35, 'Dr. Priya'),
('2306316', 'Liam', 'ME', '2023', 'Male', 'liam.23063@iitgoa.ac.in', 7.30, 'Dr. Priya');

----- Creating a table to store course details within the database-----
DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses (
  Course_Code varchar(50) PRIMARY KEY NOT NULL,
  Credit int,
  School varchar(50) NOT NULL,
  Instructor_Name varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  Department varchar(50),
  Semester varchar(50),
  Course_Type varchar(50));
  
----- Inserting data into courses table-----
INSERT INTO courses (Course_code, School, Credit, Instructor_Name, Email, Department, Semester, Course_Type) VALUES
('CS101', 'SMCS', '3', 'Dr. Clint', 'clint@iitgoa.ac.in', 'CSE MnC', '1', 'Program Elective'),
('CS441', 'SMCS', '3','Dr. Rahul', 'rahul@iitgoa.ac.in', 'CSE', '5', 'Program Elective'),
('EE102', 'SES', '3','Dr. Ram',	'ram@iitgoa.ac.in', 'EE', '1', 'Program Elective'),
('MA101', 'SMCS', '3','Dr. Rajeev', 'rajeev@iitgoa.ac.in', 'CSE MnC EE ME', '1', 'Program Elective'),
('MA308', 'SMCS', '3','Dr. Shiv', 'shiv@iitgoa.ac.in', 'MnC', '3', 'Program Elective'),
('ME606', 'SMS', '3','Dr. Priya', 'priya@iitgoa.ac.in', 'ME', '4', 'Program Elective'),
('ME609', 'SMS', '3','Dr. Arindam', 'arindam@iitgoa.ac.in', 'CSE MnC EE ME', '2 4 6 8', 'Open Elective'),
('HS254', 'SHHS', '2','Dr. Sunil', 'sunil@iitgoa.ac.in', 'CSE MnC EE ME', '5 7', 'Open Elective');

DROP TABLE IF EXISTS course_enrollment;
CREATE TABLE IF NOT EXISTS course_enrollment (
	Enrollment_ID INT AUTO_INCREMENT,
    Course_Code VARCHAR(50),
    Student_ID INT,
    FOREIGN KEY (Course_Code) REFERENCES courses(Course_Code),
    FOREIGN KEY (Student_ID) REFERENCES student(Student_ID),
    PRIMARY KEY (Enrollment_ID, Course_Code, Student_ID));
    
SELECT * FROM course_enrollment
ORDER BY Enrollment_ID;

INSERT INTO course_enrollment (Course_code, Student_ID) VALUES 
('CS101', '2103116'),
('CS101', '2003121'),
('CS441', '2003120'),
('CS441', '2003306'),
('CS441', '2003319'),
('CS441', '2003121'),
('EE102', '2004220');


-- Drop the grading table if it exists
DROP TABLE IF EXISTS grades;

-- Create the grading table
CREATE TABLE IF NOT EXISTS grades (
    Grade_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT,
    Course_Code VARCHAR(50),
    Grade VARCHAR(3), -- Storing letter grades
    FOREIGN KEY (Student_ID) REFERENCES student_profile(Student_ID),
    FOREIGN KEY (Course_Code) REFERENCES courses(Course_Code)
);

-- Insert sample letter grades into the grading table
INSERT INTO grades (Student_ID, Course_Code, Grade) VALUES
('2003120', 'CS101', 'A+'),
('2003306', 'CS101', 'A'),
('2003319', 'CS101', 'B+'),
('2003120', 'CS441', 'B'),
('2003306', 'CS441', 'A'),
('2003319', 'CS441', 'B+'),
('2003121', 'CS441', 'A+'),
('2004220', 'EE102', 'C'),
('2103116', 'CS101', 'A+'),
('2003121', 'CS101', 'A'),
('2003121', 'CS441', 'A+'),
('2003121', 'EE102', 'B');
    
