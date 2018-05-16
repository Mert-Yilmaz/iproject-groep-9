<?php

session_start();
unset($_SESSION['login_token']);

if(session_destroy()) {
    header("Location: index.php");
}
?>