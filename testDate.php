<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 30-5-2018
 * Time: 09:53
 */

include_once 'db.php';
session_start();
$_SESSION["isEmailSend"] = false;

$query = $dbh->prepare("SELECT looptijdEindeDag, looptijdEindeTijdstip FROM Voorwerp"); /*WHERE verkoper = persoon, INNER JOIN Gebruiker*/
$query->setFetchMode(PDO::FETCH_ASSOC);
$query->execute();
$data = $query->fetch();

$enddate = $data['looptijdEindeDag'];
$endtime = $data['looptijdEindeTijdstip'];

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
$minute = 00;
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

if($formatted >= $today && $_SESSION['isEmailSend'] == false) {
    echo "<h1>MORGEN VERLOOPT UW VEILING</h1>";
    echo $formatted;
    echo "<br>";
    echo $today;
    $to = 'demi.van.kesteren@gmail.com';
    $from    = 'noreply@eenmaalandermaal9.nl';
    $subject = 'Uw veiling verloopt morgen!';
    $message = 'UW VEILING VERLOOPT MORGEN!';
    $headers = 'From: ' . $from . "\r\n";
    mail($to, $subject, $message, $headers);
    $_SESSION['isEmailSend'] = true;
}

?>
