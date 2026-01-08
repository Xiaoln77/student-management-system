# Student Management System

A comprehensive web-based application for managing student records, course offerings, and enrollment tracking. Built with PHP, MySQL, HTML, CSS, and JavaScript.

## Table of Contents
- [Features](#features)
- [Technologies](#technologies)
- [Database Design](#database-design)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Screenshots](#screenshots)
- [Documentation](#documentation)

## Features

- Complete CRUD Operations - Create, Read, Update, Delete student records
- 3-Table Relational Database - Normalized schema with Students, Courses, and Enrollments
- Modern UI Design - Beautiful gradient interface with responsive layout
- Mobile Responsive - Works seamlessly on all devices
- Interactive JavaScript - Form validation and dynamic content updates
- Data Integrity - Foreign keys, constraints, and validation
- Search and Filter - Easy data retrieval and management
- Enrollment Tracking - Monitor student course registrations and grades

## Technologies

**Frontend:**
- HTML5
- CSS3 (Grid, Flexbox)
- JavaScript (ES6+)

**Backend:**
- PHP 8.x
- MySQL 8.x

**Server:**
- Apache (via MAMP)

## Database Design

### Entity-Relationship Model

The system uses three interconnected tables:

1. **Students** - Stores student information
2. **Courses** - Contains available courses
3. **Enrollments** - Junction table for student-course relationships

### Key Relationships
- One student can enroll in many courses (1:N)
- One course can have many students (1:N)
- Many-to-many relationship through enrollments table

### Database Features
- Primary and Foreign Keys
- Cascade operations (ON DELETE/UPDATE CASCADE)
- CHECK constraints for data validation
- UNIQUE constraints to prevent duplicates
- Indexed columns for performance
- Third Normal Form (3NF) compliance

## Installation

### Prerequisites
- MAMP, XAMPP, or similar (Apache + MySQL)
- PHP 7.4 or higher
- MySQL 5.7 or higher
- Modern web browser

### Setup Steps

1. **Clone the repository**
```bash
git clone https://github.com/Xiaoln77/student-management-system.git
cd student-management-system
```

2. **Start your server**
   - Open MAMP/XAMPP
   - Start Apache and MySQL services

3. **Create the database**
   - Access phpMyAdmin at `http://localhost:8888/phpMyAdmin`
   - Create a new database named `student_db`

4. **Import database schema**
   - Select `student_db` database
   - Click "SQL" tab
   - Copy and paste contents from `database_schema.sql`
   - Click "Go" to execute

5. **Configure database connection**
   - Open `db.php`
   - Update credentials if needed:
```php
$host = "localhost";
$username = "root";
$password = "root";
$database = "student_db";
```

6. **Access the application**
   - Navigate to `http://localhost:8888/student-system/`
   - Start managing students!

## Usage

### Adding a Student
1. Fill out the form on the main dashboard
2. Enter name, email, course, and year level
3. Click "Add Student" button
4. Student appears in the table below

### Editing a Student
1. Click "Edit" button next to student record
2. Modify information as needed
3. Click "Update Student" to save changes

### Deleting a Student
1. Click "Delete" button next to student record
2. Confirm deletion in the popup dialog
3. Student and related enrollments are removed

## Project Structure

```
student-management-system/
│
├── db.php                 # Database connection
├── index.php              # Main dashboard
├── add.php                # Add student logic
├── edit.php               # Edit student page
├── delete.php             # Delete student logic
├── style.css              # Styles and design
├── database_schema.sql    # Complete DB schema
├── README.md              # This file
└── docs/
    └── PROJECT_DOCUMENTATION.md  # Full documentation
```

## Screenshots

### Main Dashboard
Shows the main page with student list and add form

### Add Student Form
Demonstrates the form for adding new students

### Edit Student
Shows the edit interface with pre-filled data

### Delete Student
Displays the database schema in phpMyAdmin

## Author

**Comiso, Piolo R.**
- GitHub: [@Xiaoln77](https://github.com/Xiaoln77)
- Project Link: [https://github.com/Xiaoln77/student-management-system](https://github.com/Xiaoln77/student-management-system)

