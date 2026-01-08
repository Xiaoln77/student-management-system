<?php
include 'db.php';

if (!isset($_GET['id'])) {
    header("Location: index.php");
    exit;
}

$id = intval($_GET['id']);
$result = $conn->query("SELECT * FROM students WHERE id=$id");

if ($result->num_rows == 0) {
    header("Location: index.php?error=notfound");
    exit;
}

$student = $result->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $conn->real_escape_string($_POST['name']);
    $email = $conn->real_escape_string($_POST['email']);
    $course = $conn->real_escape_string($_POST['course']);
    $year = intval($_POST['year']);
    
    $sql = "UPDATE students SET name='$name', email='$email', course='$course', year_level=$year WHERE id=$id";
    
    if ($conn->query($sql)) {
        header("Location: index.php?success=updated");
    } else {
        header("Location: index.php?error=" . urlencode($conn->error));
    }
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>✏️ Edit Student</h1>
        </header>
        
        <div class="card">
            <form action="" method="POST">
                <div class="form-grid">
                    <div class="form-group">
                        <label>Student Name</label>
                        <input type="text" name="name" value="<?= htmlspecialchars($student['name']) ?>" required>
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" value="<?= htmlspecialchars($student['email']) ?>" required>
                    </div>
                    <div class="form-group">
                        <label>Course</label>
                        <input type="text" name="course" value="<?= htmlspecialchars($student['course']) ?>" required>
                    </div>
                    <div class="form-group">
                        <label>Year Level</label>
                        <input type="number" name="year" min="1" max="5" value="<?= $student['year_level'] ?>" required>
                    </div>
                </div>
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">💾 Update Student</button>
                    <a href="index.php" class="btn btn-secondary">← Back to List</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>