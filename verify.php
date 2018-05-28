<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 24-5-2018
 * Time: 11:07
 */

$connectionInfo = array("DB"=>$dbname, "UN"=>$username, "PW"=>$pw);
$conn = sqlsrv_connect($hostname, $connectionInfo);

if(isset($_POST['email']) && isset($_POST['code'])) {
    echo "EMAIL EN CODE MEEGEKREGEN";
    $email = $_POST['email'];
    $code = $_POST['code'];

    $query = "SELECT mailbox, wachtwoord FROM Gebruiker WHERE mailbox=$email AND code=$code";
    $stmt = sqlsrv_query($conn, $query);

    $match = sqlsrv_num_rows($stmt);
    if($match > 0) {
        $sqlquery = $dbh->prepare("UPDATE Gebruiker SET actief=1 WHERE mailbox='$email' AND code='$code'");
        $sqlquery->execute();
        $message = "Bedankt voor het aanmelden! Check je mailbox voor de activatiecode!";
        echo $message;
    } else {
        $message = "Error";
        echo $message;
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

<?php include_once 'footer.html'; ?>
</body>
</html>
