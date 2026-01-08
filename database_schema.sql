-- ==========================================
-- STUDENT MANAGEMENT SYSTEM DATABASE
-- Database: student_db
-- Author: Comiso, Piolo R.
-- Date: January 2026
-- ==========================================

-- Drop table if it exists (for clean setup)
DROP TABLE IF EXISTS students;

-- ==========================================
-- TABLE: STUDENTS
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
-- SAMPLE DATA
-- ==========================================

-- Insert Students
INSERT INTO students (name, email, course, year_level) VALUES
('Kent Agno', 'kent.agno@gmail.com', 'Computer Science', 3),
('Jaymarck Maniegos', 'jaymarck.maniegos@gmail.com', 'Information Technology', 2),
('Jaybee Jamolin', 'jaybee.jamolin@gmail.com', 'Computer Engineering', 4),
('Joshua Calalo', 'joshua.calalo@gmail.com', 'Computer Science', 1),
('Rowell Tan', 'rowell.tan@gmail.com', 'Information Systems', 3);

-- ==========================================
-- VERIFICATION QUERIES
-- ==========================================

-- View all students
-- SELECT * FROM students ORDER BY name;

-- Count students by course
-- SELECT course, COUNT(*) as total_students
-- FROM students
-- GROUP BY course
-- ORDER BY total_students DESC;

-- Count students by year level
-- SELECT year_level, COUNT(*) as total_students
-- FROM students
-- GROUP BY year_level
-- ORDER BY year_level;
