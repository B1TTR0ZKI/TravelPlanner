<?php
include("connection.php"); // Include the database connection
$name = "";
$email = "";
$phone = 0;
$password = "";
$gender = "";
$name = $_POST["name"];
$email = $_POST["email"];
$phone = $_POST["phone"];
$password = password_hash($_POST["password"], PASSWORD_BCRYPT); // Hash the password
$gender = $_POST["gender"];

// SQL query to insert user data into the user table
$sql = "INSERT INTO user (name, email, phone, password, gender) VALUES ('$name', '$email', '$phone', '$password', '$gender')";

if ($conn->query($sql) === TRUE) {
    echo "Registration successful!";
    header("Location: ../index.html");
    exit();
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close(); // Close the database connection
?>

