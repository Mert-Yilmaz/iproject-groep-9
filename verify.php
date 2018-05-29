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
    $email = $_GET['email'];
    $code = $_GET['code'];
    echo "<h3>Email en code meegekregen (check)</h3>";
    echo "<p>$email, $code</p>";

    $result = $dbh->prepare("SELECT mailbox, code FROM Gebruiker WHERE mailbox='$email' AND code='$code'");
    $result->setFetchMode(PDO::FETCH_ASSOC);
    $result->execute();
    $test = $result->fetch();
    
    echo $test;

    if($test['mailbox']==$email && $test['code'] == $code) {
        $updatestmt = $dbh->prepare("UPDATE Gebruiker SET actief=1 WHERE mailbox='$email' AND code='$code' AND actief=0 AND isToegestaan=1"); /*AND isToegestaan=1*/
        $updatestmt->execute();

        $message = "Bedankt voor het aanmelden! Check je mailbox voor de activatiecode!";
    } else {
        $message = "Error, no match.";
    }
    echo "<h3>$message</h3>";

    /*if($match > 0) {
        //sqlsrv_query($conn, "UPDATE Gebruiker SET actief=1 WHERE mailbox=$email AND code=$code AND actief=0 AND isToegestaan=1") OR DIE (sqlsrv_errors());

        //ANDERS:
        $updatestmt = $dbh->prepare("UPDATE Gebruiker SET actief=1 WHERE mailbox='$email' AND code='$code' AND actief=0 AND isToegestaan=1");
        $updatestmt->execute();

        //ANDERS:
        //$update = "UPDATE Gebruiker SET actief=1 WHERE mailbox=? AND code=? AND actief=0 AND isToegestaan=1";
        //$update = $dbh->prepare($update);
        //$update->execute(array($email, $code));

        $message = "Bedankt voor het aanmelden! Check je mailbox voor de activatiecode!";
        echo "<h3>$message</h3>";
    } else {
        $message = "Error, no match.";
        echo "<h3>$message</h3>";
    }*/

} else {
    echo "<h3>Error, use link</h3>";
}

include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);
?>
