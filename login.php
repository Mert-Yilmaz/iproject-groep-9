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
require ('db.php'); //DB connection

$_SESSION['errormessage'] = "<p style='color: red; text-align: center'>Combinatie van username/email en wachtwoord is fout, of je account is nog niet geverifieerd. Probeer opnieuw.</p>";

if(isset($_POST['username-mail']) AND isset($_POST['password'])) {
    $usernamemail = $_POST['username-mail'];
    $passworduser = md5($_POST['password']);

    if(isset($_POST['loginbtn'])) {
        $query_login = "SELECT * FROM Gebruiker WHERE (gebruikersnaam='$usernamemail' OR mailbox='$usernamemail') AND wachtwoord='$passworduser' AND actief=1 AND isToegestaan=1";
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
?>
