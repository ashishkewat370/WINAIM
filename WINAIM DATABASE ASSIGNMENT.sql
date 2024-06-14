use university_course_management;
-- Creating the 'students' table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    enrollment_date DATE
);

-- Creating the 'professors' table
CREATE TABLE professors (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);
-- Creating the 'courses' table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id)
);

-- Creating the 'enrollments' table
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(3, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (student_id, first_name, last_name, enrollment_date) VALUES
(101, 'Alice', 'Brown', '2024-01-15'),
(102, 'Bob', 'White', '2024-02-12'),
(103, 'Charlie', 'Black', '2024-03-10'),
(104, 'David', 'Green', '2024-04-08'),
(105, 'Eve', 'Blue', '2024-05-06'),
(106, 'Frank', 'Grey', '2024-06-04'),
(107, 'Grace', 'Yellow', '2024-07-02'),
(108, 'Hank', 'Pink', '2024-08-01'),
(109, 'Ivy', 'Silver', '2024-08-30'),
(110, 'Jack', 'Gold', '2024-09-28');


INSERT INTO professors (professor_id, first_name, last_name, department) VALUES
(201, 'John', 'Doe', 'Computer Science'),
(202, 'Jane', 'Smith', 'Mathematics'),
(203, 'Michael', 'Brown', 'Physics'),
(204, 'Nancy', 'Davis', 'Chemistry'),
(205, 'Oliver', 'Miller', 'Biology'),
(206, 'Patricia', 'Wilson', 'Literature'),
(207, 'Robert', 'Moore', 'Philosophy'),
(208, 'Susan', 'Taylor', 'History'),
(209, 'Thomas', 'Anderson', 'Economics'),
(210, 'Ursula', 'Jackson', 'Law');


INSERT INTO courses (course_id, course_name, professor_id) VALUES
(301, 'Introduction to Programming', 201),
(302, 'Data Structures', 201),
(303, 'Algorithms', 201),
(304, 'Operating Systems', 202),
(305, 'Database Systems', 202),
(306, 'Computer Networks', 203),
(307, 'Web Development', 204),
(308, 'Machine Learning', 205),
(309, 'Artificial Intelligence', 206),
(310, 'Software Engineering', 207);

INSERT INTO enrollments (enrollment_id, student_id, course_id, grade) VALUES
(401, 101, 301, 3.7),
(402, 102, 302, 2.9),
(403, 103, 303, 3.3),
(404, 104, 304, 3.0),
(405, 105, 305, 3.8),
(406, 106, 306, 2.5),
(407, 107, 307, 4.0),
(408, 108, 308, 3.6),
(409, 109, 309, 3.1),
(410, 110, 310, 3.9);

SELECT c.course_name,  COUNT(e.student_id) AS total_students
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name;


SELECT c.course_id, c.course_name
FROM courses c
JOIN professors p ON c.professor_id = p.professor_id
WHERE p.department = 'Computer Science';

INSERT INTO enrollments (enrollment_id, student_id, course_id, grade) VALUES
(431, 101, 306, 3.4),
(432, 101, 307, 3.8),
(435, 101, 308, 3.9),
(445, 102, 307, 3.1),
(464, 102, 308, 3.2),
(454, 102, 309, 3.3),
(457, 103, 310, 3.4),
(458, 103, 301, 3.5),
(436, 103, 302, 3.6),
(444, 104, 303, 3.7);



SELECT student_id, COUNT(course_id) AS courses_enrolled
FROM enrollments
GROUP BY student_id
HAVING COUNT(course_id) > 3;

