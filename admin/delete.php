<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 9-5-2018
 * Time: 11:06
 */

require '../db.php';
error_reporting(E_ALL ^ E_NOTICE);

$edit_id = $_GET['edit_id'];
$id = $_GET['del_id'];

$select = $dbh->prepare("SELECT * FROM Rubriek WHERE rubrieknummer='$edit_id' ");
$select->setFetchMode(PDO::FETCH_ASSOC);
$select->execute();
$data=$select->fetch();

$root = $data['rubriek'];



$query = "DELETE FROM Rubriek WHERE rubrieknummer='$id'";
$statement = $dbh->prepare($query);
$statement->execute();
//header("location: view.php?view_id=$root");
echo "<meta http-equiv='refresh' content='0'>";


