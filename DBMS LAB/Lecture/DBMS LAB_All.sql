--04 May 2025---
--LAB 5------
------------------------

departments(id, name, location, hod, contact)
students(id, name, roll, phone, city, dob, dept_id)
teachers(id, name, designation, salary,city,  joining_date, dept_id)

CREATE TABLE departments(
id INT PRIMARY KEY, AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL UNIQUE,
 location VARCHAR(100),
 hod VARCHAR(100),
 contact VARCHAR(15) UNIQUE NOT NULL
 );
 
INSERT INTO departments(id, name, location, hod, contact)
VALUES(NULL, 'CSE', '4th floor', 'RHF', '098765433'),
(NULL, 'MATH', '2nd floor', 'SH','098765');

create TABLE students(
id INT PRIMARY KEY, AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL,
roll VARCHAR(50) UNIQUE NOT NULL,
 phone VARCHAR(15) UNIQUE NOT NULL, 
 city VARCHAR(100) NOT NULL,
 dob DATE NOT NULL, 
 dept_id INT,
 FOREIGN KEY(dept_id) REFERENCES departments(id)
 );

insert into students(id, name, roll, phone, city, dob, dept_id)
values(NULL, 'Alice', '20CSE001','098765','Dhaka','2020-10-10', 1);

create TABLE teachers(
id INT PRIMARY KEY, AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL UNIQUE,
 designation ENUM('Lecturer', 'AP', 'AsP', 'Prof'),
 salary DECIMAL(10,2) NOT NULL,
 city VARCHAR(100) NOT NULL, 
 joining_date DATE, 
 dept_id INT,
 FOREIGN KEY(dept_id) REFERENCES departments(id)
 );
 
 insert into teachers(id, name, designation, salary,city,  joining_date, dept_id)
 values(NULL, 'JUstin', 'Lecturer', 50000, 'Barishal', '2020-10-11', 1);
 
 
 --Data Science--
 ------------------------
 
 --Q1: Find the name, roll, and city of all students;
 
 --Q2: Find the name, roll, and city of all students who are from dhaka;
 
 --Q3: Find the name, city and cgpa of the students who got cgpa more than 3.5;
	SELECT name, city, cgpa from students WHERE cgpa>3.5;
 --Q4: Find the number of students whose cgpa less than 3.5;
	SELECT COUNT(id) from students WHERE cgpa<3.5;
	---find the MAX cgpa
	SELECT MAX(cgpa) from students
	
	--Aggregate function: MIN, MAX, COUNT, SUM, AVG
	
 --Q5: Show students list based on highest cgpa(return name, roll, cgpa);
	SELECT name, roll, cgpa from students order by cgpa DESC;  --ASC  DESC
	
 --Q6: Show the student list order by their city alphabetically (name, city, phone)
 
 ---Lecture 6-----
 ---18 May 25-----
 -----------------------------------
 teachers(id, name, designation, salary,city,  joining_date, dept_id)
 
 --ORDER BY, LIMIT,OFFSET--
---------------------------------- 
 --Q: find the name and designtaion of the teacher who get highest salary.
	SELECT name, designation FROM teachers
	ORDER BY salary DESC LIMIT 1;
	
	SELECT name, designation,salary FROM teachers
	ORDER BY salary DESC LIMIt 1 OFFSET 1;
	
	--Sub query----
	------------------
	SELECT name, designation FROM teachers
	WHERE salary=SELECT MAX(salary) FROm teachers;
	
--Q: find the name, designation, and salary of all teachers who are from 
--the same city of Trump;
--select city from teachers where name='Trump';

select name, designation, salary from teachers
where city IN (select city from teachers where name='Trump');

select name, designation, salary from teachers
where city IN ('Dhaka', 'Barishal', 'Rangpur');

--Q: find the info of those teachers who get more than the average salary.
SELECT * FROm teachers
WHERE salary>(SELECT AVG(salary) FROM teachers)

LIKE

Bari%al
Bari_al

select name, designation, salary from teachers

--Q: Find the number of teachers from each city.

select city, COUNT(id) AS No_of_teachers from teachers
GROUP By city;

city  No_of_teachers
 Dhaka  2
 barishal 2
 
 --Q: Find the number of teachers from each designation;
 
 
 ----Practice----
 ----------------------------
 
 --Q1: Find the name, roll, and city of the students who are from the same city of Charlie;
 --Q2: Find the name, roll and cgpa of the students who achieved more than average cgpa;
 --Q3: Show the number of students who achieved cgpa more than 3.5
 --Q4: Find the number of students from each department.
	SELECT d.name AS dept_name, COUNT(s.id) AS No_of_student
	FROM students AS s INNER JOIN departments AS d
	ON s.dept_id=d.id
	GROUP BY(s.dept_id);
 --Q5:  Find the name, designation and salary of those Lecturer who get more salary than the 
 --minimum salary of any assistant professor.
 
 22000-53000
 35000-65000
 
 
 --Lecture 7-----
 ----------------
 ---JOIN----------
 -----------------
 SELECT students.name, students.roll, departments.name
 FROM students INNER JOIN departments
 ON students.dept_id=departments.id;
 
 SELECT s.name AS Student_Name, s.roll AS Student_Roll, d.name AS Dept_Name
 FROM students AS s INNER JOIN departments AS d
 ON s.dept_id=d.id;
 
 CREATE VIEW student_info AS
 SELECT s.name AS Student_Name, s.roll AS Student_Roll, d.name AS Dept_Name
 FROM students AS s INNER JOIN departments AS d
 ON s.dept_id=d.id;
 
 
 --Q1: Show the student name, phone, and city who study in dept of CSE;
 --Q2: Find the number of students in dept of Math;
 --Q3: Find the info of all students who are from Barishal and study in CSE;
 --Q4: How many teachers work for CSE dept.
 --Q5: Find the list of professor who work for CSE dept;
 --Q6: Find the number of professors for each department;
 --Q7: Find the list of teachers who work for more than 5 years;
 SELECT * FROM teachers WHERE DATEDIFF(CURDATE(), joining_date)>5*365;