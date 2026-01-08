<?php
include 'db.php';

if (!isset($_GET['id'])) {
    header("Location: index.php");
    exit;
}

$id = intval($_GET['id']);

if ($conn->query("DELETE FROM students WHERE id=$id")) {
    header("Location: index.php?success=deleted");
} else {
    header("Location: index.php?error=" . urlencode($conn->error));
}
exit;
?>