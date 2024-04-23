USE College;

-- Create the student table with personal data
CREATE TABLE IF NOT EXISTS  instructor (

  Instructor_Name VARCHAR(50) NOT NULL,
  Instructor_Email VARCHAR(50) NOT NULL,
School VARCHAR(50) NOT NULL

);

INSERT INTO instructor (Instructor_Name, Instructor_Email, School) VALUES
('Dr. Clint', 'clint@iitgoa.ac.in', 'SMCS'),
('Dr. Rahul', 'rahul@iitgoa.ac.in','SMCS' ),
( 'Dr. Ram',	'ram@iitgoa.ac.in' ,'SES'),
('Dr. Rajeev', 'rajeev@iitgoa.ac.in','SMCS'),
( 'Dr. Shiv', 'shiv@iitgoa.ac.in', 'SMCS'),
('Dr. Priya', 'priya@iitgoa.ac.in', 'SMS'),
('Dr. Arindam', 'arindam@iitgoa.ac.in', 'SMS' );

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
('2003120', 'mahesh', 'user1@iitgoa.ac.in', 'student'),
('2003306', 'aryan', 'user2@iitgoa.ac.in', 'student'),
('2003319', 'rajesh', 'user3@iitgoa.ac.in', 'student'),
('rahul@iitgoa.ac.in', 'profrahul', 'rahul@iitgoa.ac.in', 'instructor'),
('satya@iitgoa.ac.in', 'profsatya', 'satya@iitgoa.ac.in', 'instructor'),
('client@iitgoa.ac.in', 'profclient', 'client@iitgoa.ac.in', 'instructor'),
('admin1', 'admin1pw', 'admin1@iitgoa.ac.in', 'admin'),
('admin2', 'admin2pw', 'admin2@iitgoa.ac.in', 'admin'),
('admin3', 'admin3pw', 'admin3@iitgoa.ac.in', 'admin');