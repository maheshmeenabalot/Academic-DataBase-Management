----- Creating Database named College-----
CREATE DATABASE College;
USE College;

----- Creating a table to store student details within the database-----
DROP TABLE IF EXISTS students;
CREATE TABLE IF NOT EXISTS students (
  Student_ID INT PRIMARY KEY NOT NULL,
  Student_Name varchar(50) NOT NULL,
  Branch varchar(50) NOT NULL,
  Batch INT NOT NULL,
  Gender varchar(10) NOT NULL,
  Email varchar(50) NOT NULL,
  CGPA FLOAT(4));

----- Creating a table to store course details within the database-----
DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses (
  Course_Code varchar(50) PRIMARY KEY NOT NULL,
  School varchar(50) NOT NULL,
  Instructor_Name varchar(50) NOT NULL,
  Email varchar(50) NOT NULL);

----- Inserting data into student table-----
INSERT INTO students (Student_ID, Student_Name, Branch, Batch, Gender, Email, CGPA) VALUES
('2003120', 'Mahesh', 'CSE', '2020', 'Male', 'mahesh.meena.20031@iitgoa.ac.in', 8.75),
('2003306', 'Aryan', 'MNC', '2020',	'Male', 'aryan.olkha.20033@iitgoa.ac.in', 7.50),
('2003319', 'Rajesh', 'MNC', '2020', 'Male', 'rajesh.meena.20033@iitgoa.ac.in', 9.92),
('2004220', 'Mesh', 'EE', '2020', 'Female', 'mesh.meena.20042@iitgoa.ac.in', 5.44),
('2006319', 'Anil',	'EE', '2020', 'Male',	'anil.20063@iitgoa.ac.in', 9.45),
('2103116', 'Ryan',	'CSE',	'2021',	'Male',	'ryan.khan.21031@iitgoa.ac.in', 6.49), 
('2104214', 'Mitu', 'ME', '2021', 'Female', 'mitu.20042@iitgoa.ac.in', 3.98),
('2003121', 'Omkar', 'CSE', '2020', 'Male', 'Omkar.Lodekar.20031@iitgoa.ac.in', 9.98);

----- Inserting data into courses table-----
INSERT INTO courses (Course_code, School, Instructor_Name, Email) VALUES
('CS101', 'SMCS', 'Dr. Clint', 'clint@iitgoa.ac.in'),
('CS441', 'SMCS', 'Dr. Rahul', 'rahul@iitgoa.ac.in'),
('EE102', 'SES', 'Dr. Ram',	'ram@iitgoa.ac.in'),
('MA101', 'SMCS', 'Dr. Rajeev', 'rajeev@iitgoa.ac.in'),
('MA308', 'SMCS', 'Dr. Shiv', 'shiv@iitgoa.ac.in'),
('ME606', 'SMS', 'Dr. Priya', 'priya@iitgoa.ac.in'),
('ME609', 'SMS', 'Dr. Arindam', 'arindam@iitgoa.ac.in');

DROP TABLE IF EXISTS course_enrollment;
CREATE TABLE IF NOT EXISTS course_enrollment (
	Enrollment_ID INT AUTO_INCREMENT,
    Course_Code VARCHAR(50),
    Student_ID INT,
    FOREIGN KEY (Course_Code) REFERENCES courses(Course_Code),
    FOREIGN KEY (Student_ID) REFERENCES students(Student_ID),
    PRIMARY KEY (Enrollment_ID, Course_Code, Student_ID));
    
INSERT INTO course_enrollment (Course_code, Student_ID) VALUES 
('CS101', '2103116'),
('CS101', '2003121'),
('CS441', '2003120'),
('CS441', '2003306'),
('CS441', '2003319'),
('CS441', '2003121'),
('EE102', '2004220');
