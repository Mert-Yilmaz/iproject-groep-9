<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 30-5-2018
 * Time: 09:53
 */

include_once 'db.php';
session_start();

if(isset($_SESSION['login-token'])) {
    $logintoken = $_SESSION['login-token'];
    $sqlquery = $dbh->prepare("SELECT gebruikersnaam FROM Gebruiker WHERE gebruikersnaam = '$logintoken' OR mailbox = '$logintoken'");
    $sessionQueryData = $sqlquery->execute();
    $sessionGebruikersnaam = $sessionQueryData['gebruikersnaam'];

    $getGebruikersnaamQuery = $dbh->prepare("SELECT gebruikersnaam FROM Gebruiker WHERE gebruikersnaam = '$sessionGebruikersnaam'");
    $getGebruikersnaamQuery->execute();
    $getGebruikersnaamData = $getGebruikersnaamQuery->fetch();

    $getGebruikersnaam = $getGebruikersnaamData['gebruikersnaam'];
    echo $getGebruikersnaam;

    $query = $dbh->prepare("SELECT V.voorwerpnummer, V.looptijdEindeDag, V.looptijdEindeTijdstip, V.isMailVerstuurd, G.mailbox 
                                 FROM Voorwerp V INNER JOIN Gebruiker G ON v.verkoper = G.gebruikersnaam
                                 WHERE V.verkoper='$getGebruikersnaam'");
    $query->setFetchMode(PDO::FETCH_ASSOC);
    $query->execute();
    $data = $query->fetch();

    $voorwerpnummer = $data['voorwerpnummer'];
    $enddate = $data['looptijdEindeDag'];
    $endtime = $data['looptijdEindeTijdstip'];
    $isMailVerstuurd = $data['isMailVerstuurd'];
    $email = $data['mailbox'];

    $day = date('d', strtotime($enddate));
    $month = date('m', strtotime($enddate));
    $year = date('Y', strtotime($enddate));

    $hour = date('H', strtotime($endtime));
    $minute = date('i', strtotime(($endtime)));
    $seconds = date('s', strtotime($endtime));

    echo "<b>Database time and date:</b><br>$year-$month-$day $hour:$minute:$seconds";
    echo "<br><br>";

    $from_unix_time = mktime($hour, $minute, $seconds, $month, $day, $year);
    $day_before = strtotime("yesterday", $from_unix_time);
    $formatted = date("Y-m-d", $day_before);

    echo "<b>Formatted: </b><br>$formatted";
    echo "<br><br>";

    $today = date("Y-m-d"); /*TESTEN*/
    echo "<b>Today: </b><br>$today";
    echo "<br><br>";

    if ($formatted >= $today && $isMailVerstuurd == 0) {
        echo "<h1>MORGEN VERLOOPT UW VEILING</h1>";
        echo $formatted;
        echo "<br>";
        echo $today;
        $to = $email;
        $from = 'noreply@eenmaalandermaal9.nl';
        $subject = 'Uw veiling verloopt morgen!';
        $message = 'UW VEILING VERLOOPT MORGEN!';
        $headers = 'From: ' . $from . "\r\n";
        mail($to, $subject, $message, $headers);

        $sql = $dbh->prepare("UPDATE Voorwerp 
                                   SET isMailVerstuurd=1 
                                   WHERE voorwerpnummer=$voorwerpnummer");
        $sql->setFetchMode(PDO::FETCH_ASSOC);
        $sql->execute();
    }
} else {
    echo "<h1>Could not get username.</h1>";
}
?>
