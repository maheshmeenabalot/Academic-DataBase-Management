
DROP TABLE IF EXISTS users;

-- Create the users table with a role column
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  email VARCHAR(50) NOT NULL,
  role ENUM('student', 'instructor', 'admin') NOT NULL DEFAULT 'student' -- Add the role column
);

-- Insert data into the users table with roles
-- Insert data into the users table with roles
INSERT INTO users (username, password_hash, email, role) VALUES
('2003120', 'mahesh', 'user1@iitgoa.com', 'student'),
('2003306', 'aryan', 'user2@iitgoa.com', 'student'),
('2003319', 'rajesh', 'user3@iitgoa.com', 'student'),
('rahul', 'profrahul', 'rahul@iitgoa.com', 'instructor'),
('satya', 'profsatya', 'satya@iitgoa.com', 'instructor'),
('client', 'profclient', 'client@iitgoa.com', 'instructor'),
('admin1', 'admin1pw', 'admin1@iitgoa.com', 'admin'),
('admin2', 'admin2pw', 'admin2@iitgoa.com', 'admin'),
('admin3', 'admin3pw', 'admin3@iitgoa.com', 'admin');



----- Creating Database named College-----
DROP DATABASE IF EXISTS College;
CREATE DATABASE College;
USE College;

----- Creating a table to store student details within the database-----
DROP TABLE IF EXISTS student;

-- Create the student table with personal data
CREATE TABLE IF NOT EXISTS student (
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

INSERT INTO student (Student_ID, Student_Name, Branch, Batch, Gender, Email, CGPA, Address, Mother_Name, Father_Name, Father_Mobile, Photo, Blood_Group) VALUES
('2003120', 'Mahesh', 'CSE', 2020, 'Male', 'mahesh.meena.20031@iitgoa.ac.in', 8.75, '123 Main St, City', 'Sita Meena', 'Ramesh Meena', '9876543210', '/photos/mahesh.jpg', 'B+'),
('2003306', 'Aryan', 'MNC', 2020, 'Male', 'aryan.olkha.20033@iitgoa.ac.in', 7.50, '456 Park Ave, Town', 'Gita Olkha', 'Suresh Olkha', '8765432109', '/photos/aryan.jpg', 'A-'),
('2003319', 'Rajesh', 'MNC', 2020, 'Male', 'rajesh.meena.20033@iitgoa.ac.in', 9.92, '789 Elm St, Village', 'Laxmi Meena', 'Rajendra Meena', '7654321098', '', 'O+'),
('2004220', 'Mesh', 'EE', 2020, 'Female', 'mesh.meena.20042@iitgoa.ac.in', 5.44, '321 Pine St, Hamlet', 'Anita Meena', 'Sachin Meena', '6543210987', '/photos/mesh.jpg', 'AB-'),
('2006319', 'Anil', 'EE', 2020, 'Male', 'anil.20063@iitgoa.ac.in', 9.45, '567 Oak St, City', 'Sunita Anil', 'Rajesh Anil', '5432109876', '/photos/anil.jpg', 'O-'),
('2103116', 'Ryan', 'CSE', 2021, 'Male', 'ryan.khan.21031@iitgoa.ac.in', 6.49, '901 Maple St, Town', 'Reena Khan', 'Amit Khan', '4321098765', '/photos/ryan.jpg', 'B-'), 
('2104214', 'Mitu', 'ME', 2021, 'Female', 'mitu.20042@iitgoa.ac.in', 3.98, '234 Birch St, Village', 'Sita Mitu', 'Rakesh Mitu', '3210987654', '/photos/mitu.jpg', 'A+'),
('2003121', 'Omkar', 'CSE', 2020, 'Male', 'Omkar.Lodekar.20031@iitgoa.ac.in', 9.98, '876 Cedar St, City', 'Geeta Lodekar', 'Vikas Lodekar', '2109876543', '/photos/omkar.jpg', 'AB+'),
('2003101', 'John', 'CSE', 2020, 'Male', 'john.20031@iitgoa.ac.in', 8.75, '543 Elm St, Town', 'Mary John', 'Paul John', '1098765432', '/photos/john.jpg', 'B-');

----- Creating a table to store course details within the database-----
DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses (
  Course_Code varchar(50) PRIMARY KEY NOT NULL,
  School varchar(50) NOT NULL,
  Instructor_Name varchar(50) NOT NULL,
  Email varchar(50) NOT NULL);



DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses (
  Course_Code varchar(50) PRIMARY KEY NOT NULL,
  School varchar(50) NOT NULL,
  Instructor_Name varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  Department varchar(50),
  Semester varchar(50),
  Course_Type varchar(50));
  
INSERT INTO course_enrollment (Course_code, Student_ID) VALUES 
('CS101', '2103116'),
('CS101', '2003121'),
('CS441', '2003120'),
('CS441', '2003306'),
('CS441', '2003319'),
('CS441', '2003121'),
('EE102', '2004220');

----- Inserting data into courses table-----
INSERT INTO courses (Course_code, School, Instructor_Name, Email, Department, Semester, Course_Type) VALUES
('CS101', 'SMCS', 'Dr. Clint', 'clint@iitgoa.ac.in', 'CSE MnC', '1', 'Program Elective'),
('CS441', 'SMCS', 'Dr. Rahul', 'rahul@iitgoa.ac.in', 'CSE', '5', 'Program Elective'),
('EE102', 'SES', 'Dr. Ram',	'ram@iitgoa.ac.in', 'EE', '1', 'Program Elective'),
('MA101', 'SMCS', 'Dr. Rajeev', 'rajeev@iitgoa.ac.in', 'CSE MnC EE ME', '1', 'Program Elective'),
('MA308', 'SMCS', 'Dr. Shiv', 'shiv@iitgoa.ac.in', 'MnC', '3', 'Program Elective'),
('ME606', 'SMS', 'Dr. Priya', 'priya@iitgoa.ac.in', 'ME', '4', 'Program Elective'),
('ME609', 'SMS', 'Dr. Arindam', 'arindam@iitgoa.ac.in', 'CSE MnC EE ME', '2 4 6 8', 'Open Elective'),
('HS254', 'SHHS', 'Dr. Sunil', 'sunil@iitgoa.ac.in', 'CSE MnC EE ME', '5 7', 'Open Elective');

DROP TABLE IF EXISTS course_enrollment;
CREATE TABLE IF NOT EXISTS course_enrollment (
	Enrollment_ID INT AUTO_INCREMENT,
    Course_Code VARCHAR(50),
    Student_ID INT,
    FOREIGN KEY (Course_Code) REFERENCES courses(Course_Code),
    FOREIGN KEY (Student_ID) REFERENCES student(Student_ID),
    PRIMARY KEY (Enrollment_ID, Course_Code, Student_ID));
    
