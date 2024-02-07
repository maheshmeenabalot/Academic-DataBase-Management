----- Creating Database named College-----
CREATE DATABASE College;
USE College;

----- Creating a table to store student details within the database-----
CREATE TABLE IF NOT EXISTS student (
  Student_ID INT PRIMARY KEY NOT NULL,
  Student_Name varchar(50) NOT NULL,
  Branch varchar(50) NOT NULL,
  Batch INT NOT NULL,
  Gender varchar(10) NOT NULL,
  Email varchar(50) NOT NULL);

----- Creating a table to store course details within the database-----
CREATE TABLE IF NOT EXISTS courses (
  Course_Code varchar(50) PRIMARY KEY NOT NULL,
  School varchar(50) NOT NULL,
  Instructor_Name varchar(50) NOT NULL,
  Email varchar(50) NOT NULL);

----- Inserting data into student table-----
INSERT INTO student (Student_ID, Student_Name, Branch, Batch, Gender, Email) VALUES
('2003120',	'Mahesh', 'CSE', '2020', 'Male', 'mahesh.meena.20031@iitgoa.ac.in'),
('2003306',	'Aryan', 'MNC', '2020',	'Male', 'aryan.olkha.20033@iitgoa.ac.in'),
('2003319',	'Rajesh', 'MNC', '2020', 'Male', 'rajesh.meena.20033@iitgoa.ac.in'),
('2004220', 'Mesh', 'EE', '2020', 'Male', 'mesh.meena.20042@iitgoa.ac.in'),
('2006319',	'Jesh',	'ME', '2020', 'Female',	'jesh.ena.20063@iitgoa.ac.in'),
('2103116',	'Ryan',	'CSE',	'2021',	'Male',	'ryan.khan.21031@iitgoa.ac.in'), 
('2104214', 'Mitu', 'EE', '2021', 'Female', 'mitu.20042@iitgoa.ac.in');

----- Inserting data into courses table-----

INSERT INTO courses (Course_code, School, Instructor_Name, Email) VALUES
('CS101', 'SMCS', 'Dr. Clint', 'clint@iitgoa.ac.in'),
('CS441', 'SMCS', 'Dr. Rahul', 'rahul@iitgoa.ac.in'),
('EE102', 'SES', 'Dr. Ram',	'ram@iitgoa.ac.in'),
('MA101', 'SMCS', 'Dr. Rajeev', 'rajeev@iitgoa.ac.in'),
('MA308', 'SMCS', 'Dr. Shiv', 'shiv@iitgoa.ac.in'),
('ME606', 'SMS', 'Dr. Priya', 'priya@iitgoa.ac.in'),
('ME609', 'SMS', 'Dr. Arindam', 'arindam@iitgoa.ac.in');


