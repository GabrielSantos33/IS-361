 # IS 361 GABRIEL SANTOS 03/04/2020
 # My SCHEMA is called school.
 # Create the tablkes for the registration of students.
 # basic database and a basic report for a school.
 # The database need to record the student names and the courses each student is taking.
 # You should create and populate tables - using SQL exclusively - for Courses and Students. Each table should contain at least four or five rows.
 # students (studentId, First_Name , Last_Name, gender).
 # section (section_number, classroom).
 # course (courseID, courseDescription).
 # instructor (instructorId, First Name , Last Name, officeLocation).
 # enrollment (enroll_id, studentId, instructorId, courseID, section_number).
 
DROP TABLE IF EXISTS students;
CREATE TABLE students
( studentId int PRIMARY KEY,
  First_Name varchar(80) NOT NULL,
  Last_Name varchar(80) NOT NULL,
  gender varchar(2) NOT NULL,
  courseID int
 );
# insert records
INSERT INTO students ( studentId, First_Name, Last_Name, gender ) VALUES ( 1, 'Penelope', 'Lopez', 'F');
INSERT INTO students ( studentId, First_Name, Last_Name, gender ) VALUES ( 2, 'George', 'Clooney', 'M');
INSERT INTO students ( studentId, First_Name, Last_Name, gender ) VALUES ( 3, 'Michael', 'Madsen', 'M');
INSERT INTO students ( studentId, First_Name, Last_Name, gender ) VALUES ( 4, 'Uma', 'Thurman', 'M');
INSERT INTO students ( studentId, First_Name, Last_Name, gender ) VALUES ( 5, 'Bruce', 'Willis', 'M');

#creater table section
 
 DROP TABLE IF EXISTS section;
 CREATE TABLE section
( section_number int PRIMARY KEY,
  classroom varchar(80) NOT NULL
  );
  # insert records
INSERT INTO section ( section_number, classroom ) VALUES ( 1, 'IS');
INSERT INTO section ( section_number, classroom ) VALUES ( 2, 'COM');
INSERT INTO section ( section_number, classroom ) VALUES ( 3, 'ENG');
INSERT INTO section ( section_number, classroom ) VALUES ( 4, 'MATH');

 # create table course
 
 DROP TABLE IF EXISTS course;
 CREATE TABLE course
( courseID int PRIMARY KEY,
  courseDescription varchar(80) NOT NULL,
  instructorId varchar(80) NOT NULL
  );
  
    # insert records
INSERT INTO course ( courseID, courseDescription, instructorId ) VALUES ( 320, 'Systems Analysis and Design', 1);
INSERT INTO course ( courseID, courseDescription, instructorId ) VALUES ( 210, 'Software Application Programming I', 4);
INSERT INTO course ( courseID, courseDescription, instructorId ) VALUES ( 361, 'Database Architecture and Programming', 2);
INSERT INTO course ( courseID, courseDescription, instructorId ) VALUES ( 250, 'Computer Network Security', 3);


# create table instructor
DROP TABLE IF EXISTS instructor;
CREATE TABLE instructor
( instructorId int PRIMARY KEY,
  First_Name varchar(80) NOT NULL,
  Last_Name varchar(80) NOT NULL,
  officeLocation varchar(20) NOT NULL
 );
  # insert records
INSERT INTO instructor ( instructorId, First_Name, Last_Name, officeLocation ) VALUES ( 1, 'Carol', 'Huie', '301');
INSERT INTO instructor ( instructorId, First_Name, Last_Name, officeLocation ) VALUES ( 2, 'Charles', 'Pak', '302');
INSERT INTO instructor ( instructorId, First_Name, Last_Name, officeLocation ) VALUES ( 3, 'Francesco', 'Crocco', '303');
INSERT INTO instructor ( instructorId, First_Name, Last_Name, officeLocation ) VALUES ( 4, 'Javier', 'Guillen', '304');
INSERT INTO instructor ( instructorId, First_Name, Last_Name, officeLocation ) VALUES ( 5, 'Arthur', 'O\'Connor', '305');

# create table enrollment
DROP TABLE IF EXISTS enrollment;
CREATE TABLE enrollment
( enroll_id int PRIMARY KEY,
  studentId int NOT NULL,
  instructorId int NOT NULL,
  courseID int NOT NULL ,
  section_number int NOT NULL
 );

 # insert records
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 1, 1, 1, 320, 1);
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 2, 1, 2, 361, 1);
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 3, 1, 4, 210, 1);
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 4, 2, 1, 320, 1);
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 5, 2, 2, 361, 1);
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 6, 2, 3, 250, 1);
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 7, 3, 1, 320, 1);
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 8, 3, 2, 361, 1);
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 9, 4, 1, 320, 1);
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 10, 5, 1, 320, 1);
 INSERT INTO enrollment ( enroll_id, studentId, instructorId, courseID, section_number ) VALUES ( 11, 5, 2, 361, 1);
 

# Write a SQL Query that shows which students are taking which courses.

SELECT 
a.studentId As 'EMPID',
a.First_Name AS 'Name',
a.Last_Name AS 'Last Name',
b.courseID AS 'Course Description',
c.courseDescription
FROM students a
JOIN enrollment b ON a.studentId = b.studentId 
JOIN course c ON c.courseID = b.courseID
order by a.Last_Name;

# As I create more than three tables I can associate the intructor table in this query

SELECT 
a.studentId As 'EMPID',
a.First_Name AS 'First Name',
a.Last_Name AS 'Last Name',
b.courseID AS 'Course ID',
c.courseDescription AS 'Course Description',
d.instructorId,
d.First_Name AS 'Instructor First Name',
d.Last_Name AS 'Instructor Last Name'
FROM students a
JOIN enrollment b ON a.studentId = b.studentId 
JOIN course c ON c.courseID = b.courseID
JOIN instructor d ON b.instructorId = d.instructorId
order by a.Last_Name;
