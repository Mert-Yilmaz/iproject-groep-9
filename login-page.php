<?php

session_start();
if (isset($_SESSION['login_token'])) {
    header("Location: index.php");
}

include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);
?>

<!DOCTYPE html>
<html class="no-js" lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EenmaalAndermaal - Inloggen</title>
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="icon" href="img/logo2.PNG">
</head>

<body>
<?php include 'navbar.php'; ?>
<div class="login-container">
    <form method="POST" action="login.php">
        <input type="text" name="username-mail" id="username-mail" placeholder="Gebruikersnaam of email adres" required>
        <input type="password" name="password" id="password" placeholder="Wachtwoord" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{7,}">
        <?php
        if (isset($_SESSION['errormessage'])) {
            echo $_SESSION['errormessage'];
            unset($_SESSION['errormessage']);
        }
        ?>
        <input type="submit" class="knop" name="loginbtn" value="Log in">
    </form>
    <p>Heb je nog geen account? <a href="register.php">Maak een account aan en bied mee!</a></p>
</div>
<?php include_once 'footer.html' ?>
</body>
</html>
