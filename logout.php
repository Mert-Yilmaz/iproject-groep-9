<?php
session_start();

if(isset($_SESSION['login_token'])){
  header("Location: index.php");
}

unset($_SESSION['login_token']);

if(session_destroy()) {
    $_SESSION['WelkomPopUp'] = 1;
    header("Location: index.php");
}

?>
