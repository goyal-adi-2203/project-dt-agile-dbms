create database edupulse;
use edupulse;
drop database edupulse;
-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS edupulse_2;
USE edupulse_2;

-- Create the 'users' table
CREATE TABLE IF NOT EXISTS users (
    user_id VARCHAR(10) PRIMARY KEY,
    password VARCHAR(256) NOT NULL,
    usertype VARCHAR(10) NOT NULL
);
insert into users values ('a02','a02@edu','Admin');
delete from users;
-- Create the 'admin' table
CREATE TABLE IF NOT EXISTS admin (
    admin_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone_no VARCHAR(15) NOT NULL,
    flat_no VARCHAR(255),
    colony VARCHAR(255),
    district VARCHAR(255),
    pin_code INT,
    FOREIGN KEY (admin_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
insert into admin values('a01', 'Aditya', 'Goyal', 'goyaladitya2212@gmail.com', '8269164751', '106', 'Rajkamal Tower, Navlakha', 'Indore', 452001);
insert into admin values('a02', 'Aditya', 'Bajpai', 'aditya110902@gmail.com', '9109601206', '65', 'Rukmani Nagar, Chhota bangarda Road', 'Indore', 452005);
delete from admin where admin_id='a02';
delete from users where user_id='t003';
select * from admin;
select * from teachers;
-- Create the 'teachers' table
CREATE TABLE IF NOT EXISTS teachers (
    teacher_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone_no VARCHAR(15) NOT NULL,
    flat_no VARCHAR(255),
    gender VARCHAR(10) NOT NULL,
    colony VARCHAR(255),
    district VARCHAR(255),
    state VARCHAR(50) NOT NULL,
    class_teacher_flag INT DEFAULT 0, 
    FOREIGN KEY (teacher_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
update users set user_id="t01", password="t01@edu" WHERE usertype="Teacher";
select * from users;
select * from students;
select * from teaches;
select * from marks;
delete from teachers;
delete from users where user_id="s00002";
delete  from teaches;

INSERT INTO teachers (teacher_id, first_name, last_name, email, phone_no, flat_no, gender, colony, district, state,  class_teacher_flag)
VALUES
    ('t001', 'Rajesh', 'Kumar', 'rajesh.kumar@example.com', '+91 12345 67890', 'Flat 101', 'Male', 'Shivaji Nagar', 'Delhi', 'Delhi', 4),
    ('t002', 'Priya', 'Sharma', 'priya.sharma@example.com', '+91 98765 43210', 'Apt 202', 'Female', 'Malviya Nagar', 'Mumbai', 'Maharashtra',  0),
    ('t003', 'Amit', 'Singh', 'amit.singh@example.com', '+91 55555 55555', 'Suite 303', 'Male', 'Rajwada', 'Bhopal', 'Madhya Pradesh', 0);

-- Create the 'classes' table
CREATE TABLE IF NOT EXISTS classes (
    class_id INT NOT NULL,
    class_name VARCHAR(30) NOT NULL,
    total_students INT DEFAULT 0,
    PRIMARY KEY(class_id,class_name)
);
drop table classes;
select * from classes;
INSERT INTO classes (class_id, class_name)
VALUES (1, 'I'),
       (2, 'II'),
       (3, 'III'),
       (4, 'IV'),
       (5, 'V'),
       (6, 'VI'),
       (7, 'VII'),
       (8, 'VIII');

-- Create the 'students' table
CREATE TABLE IF NOT EXISTS students (
    student_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    flat_no VARCHAR(255),
    colony VARCHAR(255),
    district VARCHAR(255),
    class_id INT NOT NULL,
    state VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    result_percent DECIMAL(5, 2),
    result_status VARCHAR(10),
    tot_atten_percent DECIMAL(5, 2) DEFAULT 0.00,
    FOREIGN KEY (student_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (class_id) REFERENCES classes(class_id) ON DELETE CASCADE ON UPDATE CASCADE
);
select * from students;
delete from teaches;
select * from parents;
delete from users where user_id='t004';
select * from teachers;
delete from users;
insert into users values ('t01','t01@edu','Teacher');
select * from marks;
drop table marks;
select * from teaches;

INSERT INTO users (user_id, password, usertype) VALUES
    ('a01', 'a01@edu', 'Admin'),
    ('t001', 't001@edu', 'Teacher'),
    ('s001', 's001@edu', 'Student'),
    ('s002', 's002@edu', 'Student'),
    ('s003', 's003@edu', 'Student'),
    ('s004', 's004@edu', 'Student'),
    ('s005', 's005@edu', 'Student');
    
    INSERT INTO students (student_id, first_name, last_name,  flat_no, colony, district, class_id, state, gender, result_percent, result_status, tot_atten_percent)
VALUES
    ('s001', 'Aditya', 'Goyal',  'Flat 501', 'Vallabh Nagar', 'Indore', 4, 'Madhya Pradesh', 'Male', 0, '', 0),
    ('s002', 'Aditi', 'Solanki', 'Flat 502', 'Shivaji Nagar', 'Indore', 4, 'Madhya Pradesh', 'Female', 0, '', 0),
    ('s003', 'Aditya', 'Bajpai', 'Flat 503', 'Malviya Nagar', 'Indore', 4, 'Madhya Pradesh', 'Male', 0, '', 0),
    ('s004', 'Adeesh', 'Jain', 'Flat 504', 'Mhow Naka', 'Indore',  5, 'Madhya Pradesh','Female', 0, '', 0),
    ('s005', 'Anishiddh', 'Suryawanshi',  'Flat 505', 'Geeta Bhawan', 'Indore',  6, 'Madhya Pradesh','Male', 0, '', 0)
;
update students set class_id = '5' where student_id = 's004';
update students set class_id = '6' where student_id = 's005';

insert into users(user_id, password, usertype)
values ('t002', 't002@edu', 'Teacher'),
		('t003', 't003@edu', 'Teacher');
-- Create the 'parents' table
CREATE TABLE IF NOT EXISTS parents (
    student_id VARCHAR(10) NOT NULL PRIMARY KEY,
    Father_name VARCHAR(30) NOT NULL,
    Mother_name VARCHAR(30) NOT NULL,
    phone_no VARCHAR(15) NOT NULL,
    email_id VARCHAR(30) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create the 'subjects' table
CREATE TABLE IF NOT EXISTS subjects (
    subject_name VARCHAR(50) NOT NULL,
    class_id INT NOT NULL,
    PRIMARY KEY (subject_name,class_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id) ON DELETE CASCADE ON UPDATE CASCADE
);
select* from subjects;
drop table subjects;
INSERT INTO subjects (class_id, subject_name)
VALUES (1, 'Maths'),
       (1, 'Science'),
       (1, 'Hindi'),
       (1, 'English'),
       (1, 'Social'),
       (2, 'Maths'),
       (2, 'Science'),
       (2, 'Hindi'),
       (2, 'English'),
       (2, 'Social'),
       (3, 'Maths'),
       (3, 'Science'),
       (3, 'Hindi'),
       (3, 'English'),
       (3, 'Social'),
       (4, 'Maths'),
       (4, 'Science'),
       (4, 'Hindi'),
       (4, 'English'),
       (4, 'Social'),
       (5, 'Maths'),
       (5, 'Science'),
       (5, 'Hindi'),
       (5, 'English'),
       (5, 'Social'),
       (6, 'Maths'),
       (6, 'Science'),
       (6, 'Hindi'),
       (6, 'English'),
       (6, 'Social'),
       (7, 'Maths'),
       (7, 'Science'),
       (7, 'Hindi'),
       (7, 'English'),
       (7, 'Social'),
       (8, 'Maths'),
       (8, 'Science'),
       (8, 'Hindi'),
       (8, 'English'),
       (8, 'Social');
select subject_name from subjects where class_id=4;

delete from teachers where teacher_id="";
-- Create the 'teaches' table
CREATE TABLE IF NOT EXISTS teaches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id VARCHAR(10) NOT NULL,
    class_id INT NOT NULL,
    subject_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (class_id) REFERENCES classes(class_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subject_name) REFERENCES subjects(subject_name) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into teaches(teacher_id, class_id, subject_name) 
values ('t001', '4', 'English'),
		('t001', '5', 'English'),
        ('t001', '6', 'English'),
        ('t002', '4', 'Social'),
        ('t002', '6', 'Social'),
        ('t003', '4', 'Hindi'),
        ('t003','5','Hindi'),
        ('t003', '6', 'Hindi');

select * from students;
-- Create the 'leaves' table
CREATE TABLE IF NOT EXISTS leaves (
    id INT PRIMARY KEY,
    student_id VARCHAR(10) NOT NULL,
    date_asked DATE NOT NULL,
    date_from DATE NOT NULL,
    date_to DATE NOT NULL,
    reason VARCHAR(255) NOT NULL,
    FOREIGN KEY (student_name) REFERENCES students(student_name) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create the 'marks' table
CREATE TABLE IF NOT EXISTS marks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id VARCHAR(10) NOT NULL,
    class_id INT NOT NULL,
    subject_name VARCHAR(50) NOT NULL,
    MST1 int DEFAULT 0,
    MST2 int DEFAULT 0,
    half_yearly int DEFAULT 0,
    MST3 int DEFAULT 0,
    MST4 int DEFAULT 0,
    annual int DEFAULT 0,
    percent int DEFAULT 0,
    grade char(5) DEFAULT 'C',
    remark char(10) DEFAULT 'PASS',
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subject_name) REFERENCES subjects(subject_name) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO marks (student_id, class_id, subject_name, MST1, MST2) VALUES
    ('s001', '4', 'Maths', 20, 20),
    ('s001', '4', 'Science', 20, 20),
    ('s001', '4', 'Hindi', 20, 20),
    ('s001', '4', 'English', 20, 20),
    ('s001', '4', 'Social', 20, 20),
    
    ('s002', '4', 'Maths', 15, 12),
	('s002', '4', 'Science', 15, 12),
	('s002', '4', 'Hindi', 15, 12),
	('s002', '4', 'English', 15, 12),
	('s002', '4', 'Social', 15, 12),
    
	('s003', '4', 'Maths', 15, 18),
	('s003', '4', 'Science', 15, 18),
	('s003', '4', 'Hindi', 15, 18),
	('s003', '4', 'English', 15, 18),
	('s003', '4', 'Social', 15, 18),
    
	('s004', '5', 'Maths', 18, 16),
	('s004', '5', 'Science', 18, 16),
	('s004', '5', 'Hindi', 18, 16),
	('s004', '5', 'English', 18, 16),
	('s004', '5', 'Social', 18, 16),
    
	('s005', '6', 'Maths', 20, 12),
	('s005', '6', 'Science', 20, 12),
	('s005', '6', 'Hindi', 20, 12),
	('s005', '6', 'English', 20, 12),
	('s005', '6', 'Social', 20, 12);

-- Create the 'attendance' table
CREATE TABLE IF NOT EXISTS attendance (
    attendance_id INT PRIMARY KEY,
    student_id VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    flag INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE ON UPDATE CASCADE
);
insert into attendance(student_id, date, flag)
values 	('s001', '2023-09-22', '0'),
		('s001', '2023-09-23', '0'),
		('s001', '2023-09-24', '0'),
        
		('s002', '2023-09-22', '0'),
        ('s002', '2023-09-23', '1'),
        ('s002', '2023-09-24', '0'),
        
        ('s003', '2023-09-22', '0'),
        ('s003', '2023-09-23', '0'),
        ('s003', '2023-09-24', '0');
select * from attendance;
-- Create the 'announcements' table
CREATE TABLE IF NOT EXISTS announcements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(10),
    date DATE NOT NULL,
    content VARCHAR(2048),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL ON UPDATE CASCADE
);
drop table marks;



-- Create a trigger to handle user deletions and set user_id to NULL in announcements
DELIMITER $$
CREATE TRIGGER `user_delete` BEFORE DELETE ON `users`
  FOR EACH ROW BEGIN
    UPDATE `announcements` SET `user_id` = NULL WHERE `user_id` = OLD.`user_id`;
  END $$
DELIMITER ;



