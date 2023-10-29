<?php
require "dataBase.php";
$db = new DataBase();
if (isset($_POST['name']) && isset($_POST['email']) 
&& isset($_POST['password']) && isset($_POST['gender'] && isset($_POST['phone']))) {
    if ($db->dbConnect()) {
        $db->addProfile("user", $_POST['Name'], $_POST['Phonenumber'], $_POST['Address'], $_POST['Email']);

        if ($db->signUp("user", $_POST['Username'], $_POST['Phonenumber'], $_POST['Address'], $_POST['Email'], $_POST['Password'])) {
            echo "Sign Up Success";
        } else echo "Sign up Failed";
    } else echo "Error: Database connection";
} else echo "All fields are required";
?>