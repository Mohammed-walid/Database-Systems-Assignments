<?php
require 'db.php';
header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $confirm_password = trim($_POST['confirm_password']);

    if (empty($name) || empty($email) || empty($password) || empty($confirm_password)) {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
        exit();
    }

    // Bonus: Email format validation (Server-side)
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(["status" => "error", "message" => "Invalid email format."]);
        exit();
    }

    if ($password !== $confirm_password) {
        echo json_encode(["status" => "error", "message" => "Passwords do not match."]);
        exit();
    }

    // Check if email already exists
    $check_stmt = $conn->prepare("SELECT user_id FROM user WHERE email = ?");
    $check_stmt->bind_param("s", $email);
    $check_stmt->execute();
    $check_stmt->store_result();

    if ($check_stmt->num_rows > 0) {
        echo json_encode(["status" => "error", "message" => "Email Already Exists"]);
        $check_stmt->close();
        exit();
    }
    $check_stmt->close();

    // Bonus: Encrypting password with MD5 before saving
    $hashed_password = md5($password);

    // Insert new user
    $insert_stmt = $conn->prepare("INSERT INTO user (name, email, password) VALUES (?, ?, ?)");
    $insert_stmt->bind_param("sss", $name, $email, $hashed_password);

    if ($insert_stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Welcome " . $name]);
    } else {
        echo json_encode(["status" => "error", "message" => "Registration failed. Try again."]);
    }

    $insert_stmt->close();
    $conn->close();
}
?>