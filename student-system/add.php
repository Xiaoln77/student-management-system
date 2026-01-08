<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $conn->real_escape_string($_POST['name']);
    $email = $conn->real_escape_string($_POST['email']);
    $course = $conn->real_escape_string($_POST['course']);
    $year = intval($_POST['year']);
    
    $sql = "INSERT INTO students (name, email, course, year_level) VALUES ('$name', '$email', '$course', $year)";
    
    if ($conn->query($sql)) {
        header("Location: index.php?success=added");
    } else {
        header("Location: index.php?error=" . urlencode($conn->error));
    }
    exit;
}
?>