-- Drop tables if they already exist (drop Enrollments first due to foreign key constraints)
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;

-- Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

-- Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert Students
INSERT INTO Students (student_id, name) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Rose');

-- Insert Courses
INSERT INTO Courses (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'Physics'),
(103, 'Literature');

-- Insert Enrollments
INSERT INTO Enrollments (enrollment_id, student_id, course_id) VALUES
(1, 1, 101),
(2, 1, 103),
(3, 2, 102),
(4, 3, 101),
(5, 3, 102);

-- Query: Get enrolled courses for a student
SELECT s.name AS student_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE s.name = 'Alice Johnson';
