<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 30-5-2018
 * Time: 09:53
 */

include_once 'db.php';
$getGebruikersnaam = 'Demi12345'; /*Ophalen uit file*/

$query = $dbh->prepare("SELECT V.voorwerpnummer, V.looptijdEindeDag, V.looptijdEindeTijdstip, V.isMailVerstuurd, G.mailbox 
                                 FROM Voorwerp V INNER JOIN Gebruiker G ON v.verkoper = G.gebruikersnaam
                                 WHERE verkoper='$getGebruikersnaam'");
$query->setFetchMode(PDO::FETCH_ASSOC);
$query->execute();
$data = $query->fetch();

$voorwerpnummer = $data['voorwerpnummer'];
$enddate = $data['looptijdEindeDag'];
$endtime = $data['looptijdEindeTijdstip'];
$gebruikersnaam = $data['verkoper'];
$isMailVerstuurd = $data['isMailVerstuurd'];
$email = $data['mailbox'];

//$day = date('d', strtotime($enddate));
//$month = date('m', strtotime($enddate));
//$year = date('Y', strtotime($enddate));
//
//$hour = date('H', strtotime($endtime));
//$minute = date('i', strtotime(($endtime)));
//$seconds = date('s', strtotime($endtime));

$day = 31;
$month = 5;
$year = 2018;
$hour = 11;
$minute = 22;
$seconds = 00;

$from_unix_time = mktime($hour, $minute, $seconds, $month, $day, $year);
$day_before = strtotime("yesterday", $from_unix_time);
$formatted = date("Y-m-d H:i:s", $day_before);

echo "Today $year-$month-$day $hour:$minute:$seconds";
echo "<br>";
echo "Formatted " . $formatted;
echo "<br>";

$today = date("Y-m-d H:i:s"); /*TESTEN*/
echo $today;
echo "<br>";

if($formatted >= $today && $isMailVerstuurd == 0) {
    echo "<h1>MORGEN VERLOOPT UW VEILING</h1>";
    echo $formatted;
    echo "<br>";
    echo $today;
    $to = $email;
    $from    = 'noreply@eenmaalandermaal9.nl';
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

?>
