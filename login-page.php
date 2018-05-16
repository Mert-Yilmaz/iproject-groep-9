<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 16-5-2018
 * Time: 10:06
 */

session_start();

include 'navbar.php';
include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);

if(isset($_SESSION['login_token'])) {
    header("Location: index.php");
}
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
        <div class="login-container">
            <form method="POST" action="login.php">
                <input type="text" name="username" id="username" placeholder="Gebruikersnaam (of email adres, nog niet!)" required>
                <input type="password" name="password" id="password" placeholder="Wachtwoord" required>
                <input type="submit" name="loginbtn" value="Log in">
            </form>
            <p>Heb je nog geen account? <a href="account.php">Maak een account aan en bied mee!</a></p>
        </div>
        <?php include_once 'footer.html' ?>
    </body>
</html>
