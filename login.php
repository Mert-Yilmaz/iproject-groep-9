<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 16-5-2018
 * Time: 10:55
 */

session_start();
require ('db.php'); //DB connection

if(isset($_POST['username']) AND isset($_POST['password'])) {
    $usernameuser = $_POST['username'];
    $passworduser = $_POST['password'];

    $query_login = "SELECT * FROM Gebruiker WHERE gebruikersnaam='$usernameuser' AND wachtwoord='$passworduser'";
    $result = $dbh->query($query_login);
    $count = $result->rowCount();

    if($count == 1 || $count == -1) {
        $_SESSION['login-token'] = $usernameuser;
        header("Location: index.php");
    } else {
        echo "U FAILED";
    }
}

if(isset($_SESSION['username'])) {
    $usernameuser = $_SESSION['username'];
    echo "Hi " . $usernameuser;
}
?>