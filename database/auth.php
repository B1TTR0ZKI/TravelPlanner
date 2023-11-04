<?php
// Include your database connection code (e.g., connection.php)
include("connection.php");

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get user input (e.g., email and password)
    $email = $_POST["email"];
    $password = $_POST["password"];

    // SQL query to retrieve user data
    $sql = "SELECT * FROM user WHERE email = ?";

    // Use prepared statement to execute the query
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if a user with the given email exists
    if ($result->num_rows === 1) {
        // User exists, fetch user data
        $user = $result->fetch_assoc();

        // Verify the password
        if (password_verify($password, $user["password"])) {
            // Password is correct, user is authenticated
            $user_name = $user["name"];

            // Set a session variable to store the username
            session_start();
            $_SESSION["user_name"] = $user_name;

            // Redirect to dashboard.html
            header("Location: ../dashboard.html");
            exit();
        } else {
            // Incorrect password
            echo "Authentication failed: Incorrect password";
        }
    } else {
        // User with the provided email doesn't exist
        echo "Authentication failed: User not found";
    }

    $stmt->close();
} else {
    // Handle the case where the form was not submitted
    echo "Authentication failed: Form not submitted";
}

// Close the database connection
$conn->close();
?>
