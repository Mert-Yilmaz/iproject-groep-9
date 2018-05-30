<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 30-5-2018
 * Time: 09:53
 */

include_once 'db.php';

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

$day = 1;
$month = 6;
$year = 2018;
$hour = 10;
$minute = 37;
$seconds = 0;

$from_unix_time = mktime($hour, $minute, $seconds, $month, $day, $year);
$day_before = strtotime("yesterday", $from_unix_time);
$formatted = date("Y-m-d H:i:s", $day_before);

echo "Today $year-$month-$day $hour:$minute:$seconds";
echo "<br>";
echo "Formatted " . $formatted;
echo "<br>";
echo "<br>";

$today = date("Y-m-d H:i:s"); /*TESTEN*/
if($formatted >= $today) {
    echo "<h1>MORGEN VERLOOPT UW VEILING</h1>";
    $to = 'demi.van.kesteren@gmail.com';
    $from    = 'noreply@eenmaalandermaal9.nl';
    $subject = 'Uw veiling verloopt morgen!';
    $message = 'UW VEILING VERLOOPT MORGEN!';
    $headers = 'From: ' . $from . "\r\n";
    mail($to, $subject, $message, $headers);
}

?>
