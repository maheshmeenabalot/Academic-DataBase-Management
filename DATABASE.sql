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
  Email varchar(50) NOT NULL,
  Department varchar(50),
  Semester varchar(50),
  Course_Type varchar(50));

----- Inserting data into student table-----
INSERT INTO students (Student_ID, Student_Name, Branch, Batch, Gender, Email, CGPA) VALUES
('2003120', 'Mahesh', 'CSE', '2020', 'Male', 'mahesh.meena.20031@iitgoa.ac.in', 8.75),
('2003306', 'Aryan', 'MNC', '2020',	'Male', 'aryan.olkha.20033@iitgoa.ac.in', 7.50),
('2003319', 'Rajesh', 'MNC', '2020', 'Male', 'rajesh.meena.20033@iitgoa.ac.in', 9.92),
('2004220', 'Mesh', 'EE', '2020', 'Female', 'mesh.meena.20042@iitgoa.ac.in', 5.44),
('2006319', 'Anil',	'EE', '2020', 'Male',	'anil.20063@iitgoa.ac.in', 9.45),
('2103116', 'Ryan',	'CSE',	'2021',	'Male',	'ryan.khan.21031@iitgoa.ac.in', 6.49), 
('2104214', 'Mitu', 'ME', '2021', 'Female', 'mitu.20042@iitgoa.ac.in', 3.98),
('2003121', 'Omkar', 'CSE', '2020', 'Male', 'Omkar.Lodekar.20031@iitgoa.ac.in', 9.98),
('2003101', 'John', 'CSE', '2020', 'Male', 'john.20031@iitgoa.ac.in', 8.75),
('2103102', 'Alice', 'CSE', '2021', 'Female', 'alice.21031@iitgoa.ac.in', 7.50),
('2203103', 'Bob', 'CSE', '2022', 'Male', 'bob.22031@iitgoa.ac.in', 9.92),
('2303104', 'Emily', 'CSE', '2023', 'Female', 'emily.23031@iitgoa.ac.in', 6.44),
('2003105', 'David', 'CSE', '2020', 'Male', 'david.20031@iitgoa.ac.in', 7.25),
('2103106', 'Sophie', 'CSE', '2021', 'Female', 'sophie.21031@iitgoa.ac.in', 8.30),
('2203107', 'Michael', 'CSE', '2022', 'Male', 'michael.22031@iitgoa.ac.in', 8.60),
('2303108', 'Olivia', 'CSE', '2023', 'Female', 'olivia.23031@iitgoa.ac.in', 9.15),
('2003109', 'George', 'CSE', '2020', 'Male', 'george.20031@iitgoa.ac.in', 7.90),
('2103110', 'Sophia', 'CSE', '2021', 'Female', 'sophia.21031@iitgoa.ac.in', 8.75),
('2203111', 'William', 'CSE', '2022', 'Male', 'william.22031@iitgoa.ac.in', 9.30),
('2303112', 'Isabella', 'CSE', '2023', 'Female', 'isabella.23031@iitgoa.ac.in', 7.80),
('2003113', 'James', 'CSE', '2020', 'Male', 'james.20031@iitgoa.ac.in', 8.20),
('2103114', 'Ava', 'CSE', '2021', 'Female', 'ava.21031@iitgoa.ac.in', 9.10),
('2203115', 'Henry', 'CSE', '2022', 'Male', 'henry.22031@iitgoa.ac.in', 8.90),
('2303116', 'Charlotte', 'CSE', '2023', 'Female', 'charlotte.23031@iitgoa.ac.in', 8.40),
('2003117', 'Daniel', 'CSE', '2020', 'Male', 'daniel.20031@iitgoa.ac.in', 9.50),
('2103118', 'Amelia', 'CSE', '2021', 'Female', 'amelia.21031@iitgoa.ac.in', 7.70),
('2203119', 'Alexander', 'CSE', '2022', 'Male', 'alexander.22031@iitgoa.ac.in', 8.85),
('2303120', 'Ella', 'CSE', '2023', 'Female', 'ella.23031@iitgoa.ac.in', 9.20),
('2003301', 'Emma', 'MNC', '2020', 'Female', 'emma.20033@iitgoa.ac.in', 9.20),
('2103302', 'George', 'MNC', '2021', 'Male', 'george.21033@iitgoa.ac.in', 8.80),
('2203303', 'Sophia', 'MNC', '2022', 'Female', 'sophia.22033@iitgoa.ac.in', 7.98),
('2303304', 'Michael', 'MNC', '2023', 'Male', 'michael.23033@iitgoa.ac.in', 5.60),
('2003305', 'Olivia', 'MNC', '2020', 'Female', 'olivia.20033@iitgoa.ac.in', 6.75),
('2103306', 'Liam', 'MNC', '2021', 'Male', 'liam.21033@iitgoa.ac.in', 8.30),
('2203307', 'Emily', 'MNC', '2022', 'Female', 'emily.22033@iitgoa.ac.in', 9.05),
('2303308', 'Ethan', 'MNC', '2023', 'Male', 'ethan.23033@iitgoa.ac.in', 7.40),
('2003309', 'Ava', 'MNC', '2020', 'Female', 'ava.20033@iitgoa.ac.in', 8.90),
('2103310', 'Logan', 'MNC', '2021', 'Male', 'logan.21033@iitgoa.ac.in', 7.85),
('2203311', 'Isabella', 'MNC', '2022', 'Female', 'isabella.22033@iitgoa.ac.in', 8.20),
('2303312', 'Jackson', 'MNC', '2023', 'Male', 'jackson.23033@iitgoa.ac.in', 9.60),
('2003313', 'Mia', 'MNC', '2020', 'Female', 'mia.20033@iitgoa.ac.in', 6.40),
('2103314', 'James', 'MNC', '2021', 'Male', 'james.21033@iitgoa.ac.in', 7.75),
('2203315', 'Sophia', 'MNC', '2022', 'Female', 'sophia.22033@iitgoa.ac.in', 8.80),
('2303316', 'Benjamin', 'MNC', '2023', 'Male', 'benjamin.23033@iitgoa.ac.in', 9.10),
('2003317', 'Charlotte', 'MNC', '2020', 'Female', 'charlotte.20033@iitgoa.ac.in', 7.20),
('2103318', 'William', 'MNC', '2021', 'Male', 'william.21033@iitgoa.ac.in', 8.50),
('2203319', 'Evelyn', 'MNC', '2022', 'Female', 'evelyn.22033@iitgoa.ac.in', 9.30),
('2303320', 'Daniel', 'MNC', '2023', 'Male', 'daniel.23033@iitgoa.ac.in', 6.95),
('2004201', 'James', 'EE', '2020', 'Male', 'james.20042@iitgoa.ac.in', 8.45),
('2104202', 'Ava', 'EE', '2021', 'Female', 'ava.21042@iitgoa.ac.in', 9.60),
('2204203', 'William', 'EE', '2022', 'Male', 'william.22042@iitgoa.ac.in', 8.30),
('2304204', 'Isabella', 'EE', '2023', 'Female', 'isabella.23042@iitgoa.ac.in', 7.70),
('2004205', 'Joseph', 'EE', '2020', 'Male', 'joseph.20042@iitgoa.ac.in', 9.85),
('2104206', 'Charlotte', 'EE', '2021', 'Female', 'charlotte.21042@iitgoa.ac.in', 8.20),
('2204207', 'Alexander', 'EE', '2022', 'Male', 'alexander.22042@iitgoa.ac.in', 9.40),
('2304208', 'Emily', 'EE', '2023', 'Female', 'emily.23042@iitgoa.ac.in', 7.90),
('2004209', 'Daniel', 'EE', '2020', 'Male', 'daniel.20042@iitgoa.ac.in', 8.75),
('2104210', 'Sophie', 'EE', '2021', 'Female', 'sophie.21042@iitgoa.ac.in', 9.20),
('2204211', 'Michael', 'EE', '2022', 'Male', 'michael.22042@iitgoa.ac.in', 8.60),
('2304212', 'Olivia', 'EE', '2023', 'Female', 'olivia.23042@iitgoa.ac.in', 7.80),
('2004213', 'Liam', 'EE', '2020', 'Male', 'liam.20042@iitgoa.ac.in', 9.30),
('2104215', 'Ella', 'EE', '2021', 'Female', 'ella.21042@iitgoa.ac.in', 8.40),
('2204215', 'Benjamin', 'EE', '2022', 'Male', 'benjamin.22042@iitgoa.ac.in', 9.70),
('2304216', 'Mia', 'EE', '2023', 'Female', 'mia.23042@iitgoa.ac.in', 8.10),
('2004217', 'Logan', 'EE', '2020', 'Male', 'logan.20042@iitgoa.ac.in', 9.50),
('2104218', 'Sophia', 'EE', '2021', 'Female', 'sophia.21042@iitgoa.ac.in', 7.60),
('2204219', 'Jacob', 'EE', '2022', 'Male', 'jacob.22042@iitgoa.ac.in', 8.85),
('2304220', 'Grace', 'EE', '2023', 'Female', 'grace.23042@iitgoa.ac.in', 9.00),
('2006301', 'Henry', 'ME', '2020', 'Male', 'henry.20063@iitgoa.ac.in', 7.20),
('2106302', 'Amelia', 'ME', '2021', 'Female', 'amelia.21063@iitgoa.ac.in', 9.40),
('2206303', 'Alexander', 'ME', '2022', 'Male', 'alexander.22063@iitgoa.ac.in', 8.10),
('2306304', 'Charlotte', 'ME', '2023', 'Female', 'charlotte.23063@iitgoa.ac.in', 9.75),
('2006305', 'Daniel', 'ME', '2020', 'Male', 'daniel.20063@iitgoa.ac.in', 6.88),
('2106306', 'Sophie', 'ME', '2021', 'Female', 'sophie.21063@iitgoa.ac.in', 8.95),
('2206307', 'Michael', 'ME', '2022', 'Male', 'michael.22063@iitgoa.ac.in', 7.55),
('2306308', 'Olivia', 'ME', '2023', 'Female', 'olivia.23063@iitgoa.ac.in', 9.25),
('2006309', 'Logan', 'ME', '2020', 'Male', 'logan.20063@iitgoa.ac.in', 8.40),
('2106310', 'Isabella', 'ME', '2021', 'Female', 'isabella.21063@iitgoa.ac.in', 7.80),
('2206311', 'Ethan', 'ME', '2022', 'Male', 'ethan.22063@iitgoa.ac.in', 9.10),
('2306312', 'Emily', 'ME', '2023', 'Female', 'emily.23063@iitgoa.ac.in', 8.65),
('2006313', 'Mia', 'ME', '2020', 'Female', 'mia.20063@iitgoa.ac.in', 9.50),
('2106314', 'William', 'ME', '2021', 'Male', 'william.21063@iitgoa.ac.in', 8.20),
('2206315', 'Grace', 'ME', '2022', 'Female', 'grace.22063@iitgoa.ac.in', 9.35),
('2306316', 'Liam', 'ME', '2023', 'Male', 'liam.23063@iitgoa.ac.in', 7.30),
('2006317', 'Ava', 'ME', '2020', 'Female', 'ava.20063@iitgoa.ac.in', 8.80),
('2106318', 'Benjamin', 'ME', '2021', 'Male', 'benjamin.21063@iitgoa.ac.in', 7.90),
('2206319', 'Emma', 'ME', '2022', 'Female', 'emma.22063@iitgoa.ac.in', 9.20),
('2306320', 'Jacob', 'ME', '2023', 'Male', 'jacob.23063@iitgoa.ac.in', 8.65);


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
    FOREIGN KEY (Student_ID) REFERENCES students(Student_ID),
    PRIMARY KEY (Enrollment_ID, Course_Code, Student_ID));
    
