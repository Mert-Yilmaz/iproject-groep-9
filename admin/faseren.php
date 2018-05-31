<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 29-5-2018
 * Time: 12:04
 */

require '../db.php';
error_reporting(E_ALL ^ E_NOTICE);

$id = $_GET['fas_id'];

$select = $dbh->prepare("SELECT * FROM Rubriek WHERE rubrieknummer='$id' ");
$select->setFetchMode(PDO::FETCH_ASSOC);
$select->execute();
$data=$select->fetch();

if($data['isToegestaan'] == 1) {
    $isActief = 0;
}
else {
    $isActief = 1;
}

$update = $dbh->prepare("UPDATE Rubriek SET isToegestaan=:isActief WHERE rubrieknummer='$id'");
$update->bindParam(':isActief',$isActief);
$update->execute();

header('Location: dashboard.php');