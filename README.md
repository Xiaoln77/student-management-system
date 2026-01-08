# Student Management System

A comprehensive web-based application for managing student records. Built with PHP, MySQL, HTML, CSS, and JavaScript.

## Table of Contents
- [Features](#features)
- [Technologies](#technologies)
- [Database Design](#database-design)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Screenshots](#screenshots)
- [Challenges and Learnings](#challengesandlearnings)


## Features

- Complete CRUD Operations - Create, Read, Update, Delete student records
- Database-Driven System - MySQL database with proper constraints and validation
- Modern UI Design - Beautiful gradient interface with responsive layout
- Mobile Responsive - Works seamlessly on all devices
- Interactive JavaScript - Form validation and dynamic content updates
- Data Integrity - Primary keys, unique constraints, and CHECK constraints
- Real-time Updates - Changes reflect immediately in the interface
- User-Friendly Interface - Clean and intuitive design for easy management

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

### Database Structure

The system uses a MySQL database with a **Students** table that stores:
- Student Name
- Email Address
- Course/Program
- Year Level (1-5)

### Database Features
- Primary Key for unique identification
- Unique constraint on email to prevent duplicates
- CHECK constraint to ensure year level is between 1-5
- NOT NULL constraints on required fields
- Proper data types for each column
- Indexed columns for better performance

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
3. Student record is removed from the database

## Project Structure

```
student-management-system/
│
├── db.php                 
├── index.php              
├── add.php                
├── edit.php               
├── delete.php             
├── style.css              
├── database_schema.sql    
├── README.md              

```

## Screenshots

### Main Dashboard
Shows the main page with student list and add form
<img width="1710" height="1112" alt="input" src="https://github.com/user-attachments/assets/06cf4a01-d6e4-460b-af18-2bd854fe25d7" />


### Add Student Form
Demonstrates the form for adding new students
<img width="1710" height="1112" alt="add" src="https://github.com/user-attachments/assets/97b6253e-e65c-43ba-aed4-f716ff1ac84a" />

### Edit Student
Shows the edit interface with pre-filled data
<img width="1710" height="1112" alt="edit" src="https://github.com/user-attachments/assets/15ce1582-80a8-4d9f-b9cd-bdf5d3aeb7ef" />

### Delete Student
Shows the confirmation dialog before removing a student record
<img width="1710" height="1112" alt="delete" src="https://github.com/user-attachments/assets/04230dac-fb3f-4766-a317-cbea518a00f6" />

## ER Diagram
<img width="641" height="663" alt="ERDiagram" src="https://github.com/user-attachments/assets/00432ec7-b32f-47ea-aa57-07c44c02eee6" />

## Challenges and Learning
What I Found Challenging
Connecting MySQL and PHP
This was my first time linking MySQL with PHP, and it was quite challenging at the start. Understanding how to establish a database connection, execute queries, and handle errors took time and practice. I had to learn about the MySQLi extension and how to properly sanitize user inputs to prevent SQL injection.
Managing Database Constraints
Understanding how to properly implement primary keys, unique constraints, and CHECK constraints was initially difficult. Learning how these constraints maintain data integrity automatically took practice and experimentation.
Form Validation
Implementing both client-side and server-side validation was challenging. I learned that JavaScript validation improves user experience, but PHP validation is essential for security since users can bypass client-side checks.
What I Learned

How to properly connect PHP to MySQL databases
The importance of both client-side and server-side validation
How database constraints maintain data integrity
Responsive design principles using CSS Grid and Flexbox
The complete CRUD operation workflow
Security practices like input sanitization and SQL injection prevention

## Author

**Comiso, Piolo R.**
- GitHub: [@Xiaoln77](https://github.com/Xiaoln77)
- Project Link: [https://github.com/Xiaoln77/student-management-system](https://github.com/Xiaoln77/student-management-system)
