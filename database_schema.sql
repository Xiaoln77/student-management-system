-- ==========================================
-- STUDENT MANAGEMENT SYSTEM DATABASE
-- Database: student_db
-- Author: Comiso, Piolo R.
-- Date: January 2026
-- ==========================================

-- Drop tables if they exist 
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

-- ==========================================
-- TABLE 1: STUDENTS
-- Stores student information
-- ==========================================
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    course VARCHAR(100) NOT NULL,
    year_level INT NOT NULL CHECK (year_level BETWEEN 1 AND 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_name (name),
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================
-- TABLE 2: COURSES
-- Stores available courses in the system
-- ==========================================
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(150) NOT NULL,
    department VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_course_code (course_code),
    INDEX idx_department (department)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================
-- TABLE 3: ENROLLMENTS
-- Junction table linking students to courses
-- Demonstrates many-to-many relationship
-- ==========================================
CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    status ENUM('Active', 'Completed', 'Dropped', 'Pending') DEFAULT 'Active',
    grade DECIMAL(3,2) DEFAULT NULL CHECK (grade >= 0 AND grade <= 5.0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Key Constraints
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Prevent duplicate enrollments
    UNIQUE KEY unique_enrollment (student_id, course_id),
    
    -- Indexes for performance
    INDEX idx_student (student_id),
    INDEX idx_course (course_id),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================
-- SAMPLE DATA
-- ==========================================

-- Insert Students
INSERT INTO students (name, email, course, year_level) VALUES
('Kent Agno', 'kent.agno@gmail.com', 'Computer Science', 3),
('Jaymarck Maniegos', 'jaymarck.maniegos@gmail.com', 'Information Technology', 2),
('Jaybee Jamolin', 'jaybee.jamolin@gmail.com', 'Computer Engineering', 4),
('Joshua Calalo', 'joshua.calalo@gmail.com', 'Computer Science', 1),
('Rowell Tan', 'rowell.tan@gmail.com', 'Information Systems', 3);

-- Insert Courses
INSERT INTO courses (course_code, course_name, department, credits, description) VALUES
('CS101', 'Introduction to Programming', 'Computer Science', 3, 'Basic programming concepts using Python'),
('CS201', 'Data Structures and Algorithms', 'Computer Science', 3, 'Advanced data structures and algorithm design'),
('IT101', 'Web Development Fundamentals', 'Information Technology', 3, 'HTML, CSS, JavaScript basics'),
('IT201', 'Database Management Systems', 'Information Technology', 3, 'SQL, MySQL, database design and normalization'),
('CE101', 'Digital Logic Design', 'Computer Engineering', 4, 'Boolean algebra and digital circuit design'),
('CS301', 'Software Engineering', 'Computer Science', 3, 'Software development lifecycle and methodologies'),
('IT301', 'Network Administration', 'Information Technology', 3, 'Network protocols and system administration');

-- Insert Enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date, status, grade) VALUES
(1, 1, '2024-08-15', 'Completed', 1.75),
(1, 2, '2024-08-15', 'Active', NULL),
(1, 6, '2024-08-15', 'Active', NULL),
(2, 1, '2024-08-15', 'Completed', 1.50),
(2, 3, '2024-08-15', 'Active', NULL),
(2, 4, '2024-08-15', 'Active', NULL),
(3, 2, '2024-08-15', 'Active', NULL),
(3, 5, '2024-08-15', 'Completed', 2.00),
(4, 1, '2024-08-15', 'Active', NULL),
(5, 3, '2024-08-15', 'Completed', 1.25),
(5, 4, '2024-08-15', 'Active', NULL);

-- ==========================================
-- VERIFICATION QUERIES
-- ==========================================

-- View all tables
-- SHOW TABLES;

-- View students with their enrollments
-- SELECT s.name, s.email, c.course_name, e.status, e.grade
-- FROM students s
-- JOIN enrollments e ON s.id = e.student_id
-- JOIN courses c ON e.course_id = c.id
-- ORDER BY s.name;

-- Count enrollments per course
-- SELECT c.course_name, COUNT(e.id) as total_students
-- FROM courses c
-- LEFT JOIN enrollments e ON c.id = e.course_id
-- GROUP BY c.id, c.course_name
-- ORDER BY total_students DESC;
