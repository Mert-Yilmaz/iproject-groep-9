<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 24-5-2018
 * Time: 11:07
 */

include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);

if(isset($_GET['email']) && !empty($_GET['email']) && isset($_GET['code']) && !empty($_GET['code'])) {
    $getemail = $_GET['email'];
    $getcode = $_GET['code'];
    echo "<h3>Email en code meegekregen (check)</h3>";
    echo "<p>" . $getemail . ", " . $getcode . "</p>";

    $sqlquery = $dbh->prepare("SELECT mailbox, code FROM Gebruiker WHERE mailbox='$getemail' AND code='$getcode'");
    $sqlquery->setFetchMode(PDO::FETCH_ASSOC);
    $sqlquery->execute();
    $sqlquerydata = $sqlquery->fetch();

    $email = $sqlquerydata['mailbox'];
    $code = $sqlquerydata['code'];

    if($getemail=$email && $getcode=$code) {
        $updatestmt = $dbh->prepare("UPDATE Gebruiker SET actief=1 WHERE mailbox='$email' AND code='$code' AND actief=0 AND isToegestaan=1");
        $updatestmt->execute();
        echo "<h3>Bedankt voor het aanmelden!</h3>";
    }
} else {
    echo "<h3>Error, use link</h3>";
}
?>
