<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 29-5-2018
 * Time: 12:04
 */

require '../db.php';
error_reporting(E_ALL ^ E_NOTICE);

$id = $_GET['vp_id'];

$select = $dbh->prepare("SELECT * FROM Voorwerp WHERE voorwerpnummer='$id' ");
$select->setFetchMode(PDO::FETCH_ASSOC);
$select->execute();
$data=$select->fetch();

if($data['isToegestaan'] == 1) {
    $isActief = 0;
}
else {
    $isActief = 1;
}

$update = $dbh->prepare("UPDATE Voorwerp SET isToegestaan=:isActief WHERE voorwerpnummer='$id'");
$update->bindParam(':isActief',$isActief);
$update->execute();

header('Location: dashboard.php');
