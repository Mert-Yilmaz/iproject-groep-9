<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 24-5-2018
 * Time: 11:07
 */

if(isset($_POST['email']) && isset($_POST['code'])) {
    $email = $_POST['email'];
    $code = $_POST['code'];

    $sql = $dbh->prepare("SELECT email, password FROM Gebruiker WHERE email='$email' AND code='$code'");
    $sql->execute();
    $match = sqlsrv_num_rows($sql);
    if($match > 0) {
        sqlsrv_query("UPDATE Gebruiker SET actief='1' WHERE email='$email' AND code='$code'");
    }
}

include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);
?>
<!doctype html>
<html class="no-js" lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EenmaalAndermaal - Verify</title>
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="icon" href="img/logo2.PNG">
</head>
<body>
<?php include 'navbar.php'; ?>

<h1>Bedankt voor het aanmelden! Check je mailbox voor de activatiecode!</h1>

<?php include_once 'footer.html'; ?>
</body>
</html>
