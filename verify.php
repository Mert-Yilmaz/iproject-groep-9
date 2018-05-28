<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 24-5-2018
 * Time: 11:07
 */

$connectionInfo = array("DB"=>$dbname, "UN"=>$username, "PW"=>$pw);
$conn = sqlsrv_connect($hostname, $connectionInfo);

if(isset($_GET['email']) && isset($_GET['code'])) {
    echo "EMAIL EN CODE MEEGEKREGEN";
    $email = $_GET['email'];
    $code = $_GET['code'];
    echo "<h3>Email en code meegekregen (check)</h3>";
    echo "<p>$email, $code</p>";

    $query = sqlsrv_query($conn, "SELECT mailbox, wachtwoord FROM Gebruiker WHERE mailbox=$email AND code=$code");
    $match = sqlsrv_num_rows($query);

    if($match > 0) {
        sqlsrv_query($conn, "UPDATE Gebruiker SET actief=1 WHERE mailbox='$email' AND code='$code'");
//        $sqlquery = $dbh->prepare("UPDATE Gebruiker SET actief=1 WHERE mailbox='$email' AND code='$code'");
//        $sqlquery->execute();
        $message = "Bedankt voor het aanmelden! Check je mailbox voor de activatiecode!";
        echo "<h3>$message</h3>";
    } else {
        $message = "Error, no match.";
        echo "<h3>$message</h3>";
    }
} else {
    echo "<h3>Error, use link</h3>";
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
