<?php

session_start();
require ('db.php'); //DB connection

$_SESSION['errormessage'] = "<p style='color: red; text-align: center'>Combination of username/email and password is wrong.</p>";

if(isset($_POST['username-mail']) AND isset($_POST['password'])) {
    $usernamemail = $_POST['username-mail'];
    $passworduser = $_POST['password'];

    if(isset($_POST['loginbtn'])) {
        $query_login = "SELECT * FROM Gebruiker WHERE (gebruikersnaam='$usernamemail' OR mailbox='$usernamemail') AND wachtwoord='$passworduser'";
        $result = $dbh->query($query_login);
        $count = $result->rowCount();

        if ($count == 1 || $count == -1) {
            $_SESSION['login-token'] = $usernamemail;
            header("Location: index.php");
        } else {
            header("Location: login-page.php");
        }
    }
}

//if(isset($_SESSION['username-mail'])) {
//    $usernamemail = $_SESSION['username-mail'];
//    echo "Hi " . $usernamemail;
//}
?>
