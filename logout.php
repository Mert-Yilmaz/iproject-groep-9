/**
 * Created by Atom
 * User: Jeffrey Kragten
 * Date: 25-5-2018
 * Time: 12:34
 */
<?php
session_start();

if(isset($_SESSION['login_token'])){
  header("Location: index.php");
}

unset($_SESSION['login_token']);

if(session_destroy()) {
  header("Location: index.php");
}
?>
