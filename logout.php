<?php
session_start();

if(isset($_SESSION['login_token'])){
  header("Location: index.php");
}

unset($_SESSION['login_token']);

if(session_destroy()) {
    header("Location: index.php");
}

$_SESSION['WelkomPopUp'] = 1;
?>
