CREATE TABLE teachers (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    first_name varchar(25) NOT NULL,
    last_name varchar(50),
    school varchar(50) NOT NULL,
    hire_date date,
    salary numeric
    );
    
  INSERT INTO teachers (id,first_name, last_name, school, hire_date, salary)
    VALUES (1,'Janet', 'Smith', 'MIT', '2011-10-30', '36200'),
           (2,'Lee', 'Reynolds', 'MIT', '1993-05-22', '65000'),
           (3,'Samuel', 'Cole', 'Cambridge University', '2005-08-01', '43500'),
           (4,'Samantha', 'Bush', 'Cambridge University', '2011-10-30', '36200'),
           (5,'Betty', 'Diaz', 'Cambridge University', '2005-08-30', '43500'),
           (6,'Kathleen', 'Roush', 'MIT', '2010-10-22', '38500'),
           (7,'James', 'Diaz', 'Harvard University', '2003-07-18', '61000'),
           (8,'Zack', 'Smith', 'Harvard University', '2000-12-29', '55500'),
           (9,'Luis', 'Gonzales', 'Standford University', '2002-12-01', '50000'),
           (10,'Frank', 'Abbers', 'Standford University', '1999-01-30', '66000');
           
  INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
    VALUES ('Samuel', 'Abbers', 'Standford University', '2006-01-30', '32000'),
           ('Jessica', 'Abbers', 'Standford University', '2005-01-30', '33000'),
           ('Tom', 'Massi', 'Harvard University', '1999-09-09', '39500'),
           ('Esteban', 'Brown', 'MIT', '2007-01-30', '36000'),
           ('Carlos', 'Alonso', 'Standford University', '2001-01-30', '44000');
  
  CREATE TABLE courses (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name varchar(20),
    teachers_id INT,
    total_students INT
    );
   
   INSERT INTO courses (name, teachers_id, total_students)
    VALUES  ('Calculus', 2, 20),
            ('Physics', 2, 10),
            ('Calculus', 1, 30),
            ('Computer Science', 1, 20),
            ('Politic', 13, 15),
            ('Algebra', 2, 10),
            ('Algebra', 13, 30),
            ('Computer Science', 10, 35),
            ('Life Science', 11, 20),
            ('Chemistry', 9, 22),
            ('Chemistry', 8, 16),
            ('Calculus', 5, 19),
            ('Politic', 4, 17),
            ('Biology', 6, 22),
            ('Physics', 3, 29),
            ('Biology', 8, 28),
            ('Calculus', 12, 34),
            ('Physics', 13, 34),
            ('Biology', 14, 25),
            ('Calculus', 15, 20);
   
SELECT * FROM teachers
SELECT * FROM courses 

/* C1.1 */
SELECT first_name AS [First Name], 
       last_name AS [Last Name], 
       school AS [University], 
       MAX(salary) AS [Salary]       
FROM teachers 
GROUP BY school ORDER BY salary DESC
        
/* C1.2 */
SELECT first_name AS [First Name], 
       last_name AS [Last Name], 
       school AS [University], 
       MAX(salary) AS [Salary]       
FROM teachers WHERE school='Standford University'
        
/* C2.1 */
SELECT teachers.school AS [University], 
       courses.name as [Course], 
       teachers.first_name AS [First Name], 
       teachers.last_name AS [Last Name] 
FROM teachers JOIN courses ON teachers.id=courses.id 
order by University

/* C2.2 */
SELECT teachers.school AS [University], 
       COUNT(*) as [Numbers of Courses Offered]
FROM teachers JOIN courses ON teachers.id=courses.id 
GROUP BY teachers.school

/* C2.3 */
SELECT teachers.first_name AS [First Name], 
       teachers.last_name AS [Last Name], 
       IFNULL(SUM(courses.total_students),0) AS [Number of Students Enrolling]
FROM teachers left JOIN courses ON teachers.id=courses.teachers_id 
GROUP BY teachers.id

/* C2.4 */
SELECT teachers.first_name AS [First Name], 
       teachers.last_name AS [Last Name], 
       COUNT(courses.teachers_id) as [Number of Courses Taught]
FROM teachers LEFT JOIN courses ON teachers.id=courses.teachers_id 
GROUP BY teachers.id ORDER BY teachers.id
 
/* C3 */
SELECT courses.name as [Course],
       teachers.school as [University],
       courses.total_students as [Number of Students Enrolling],
       teachers.first_name as [First Name], 
       teachers.last_name AS [Last Name], 
       MAX(teachers.salary) AS [Salary],
       teachers.hire_date as [Date Joined] 
FROM teachers JOIN courses ON teachers.id=courses.teachers_id
GROUP BY courses.name ORDER BY courses.name
