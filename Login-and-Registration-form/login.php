<?php
require 'db.php';
header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    if (empty($email) || empty($password)) {
        echo json_encode(["status" => "error", "message" => "Email and password cannot be empty."]);
        exit();
    }

    // Bonus: Encrypting password with MD5
    $hashed_password = md5($password);

    $stmt = $conn->prepare("SELECT name FROM user WHERE email = ? AND password = ?");
    $stmt->bind_param("ss", $email, $hashed_password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode(["status" => "success", "message" => "Welcome " . $row['name']]);
    } else {
        echo json_encode(["status" => "error", "message" => "Invalid Email or Password."]);
    }

    $stmt->close();
    $conn->close();
}
?>