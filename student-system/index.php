<?php include 'db.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>🎓 Student Management System</h1>
            <p>Manage your student records efficiently</p>
        </header>

        <div class="card">
            <h2>Add New Student</h2>
            <form action="add.php" method="POST">
                <div class="form-grid">
                    <div class="form-group">
                        <label>Student Name</label>
                        <input type="text" name="name" placeholder="Enter full name" required>
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" placeholder="student@example.com" required>
                    </div>
                    <div class="form-group">
                        <label>Course</label>
                        <input type="text" name="course" placeholder="e.g., Computer Science" required>
                    </div>
                    <div class="form-group">
                        <label>Year Level</label>
                        <input type="number" name="year" min="1" max="5" placeholder="1-5" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">➕ Add Student</button>
            </form>
        </div>

        <div class="card">
            <h2>Student Records</h2>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Course</th>
                            <th>Year</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $result = $conn->query("SELECT * FROM students ORDER BY id DESC");
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                echo "<tr>
                                    <td>{$row['name']}</td>
                                    <td>{$row['email']}</td>
                                    <td>{$row['course']}</td>
                                    <td>{$row['year_level']}</td>
                                    <td class='actions'>
                                        <a href='edit.php?id={$row['id']}' class='btn btn-edit'>✏️ Edit</a>
                                        <a href='delete.php?id={$row['id']}' class='btn btn-delete' onclick='return confirm(\"Delete this student?\")'>🗑️ Delete</a>
                                    </td>
                                </tr>";
                            }
                        } else {
                            echo "<tr><td colspan='5' class='no-data'>No students found. Add your first student above!</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
