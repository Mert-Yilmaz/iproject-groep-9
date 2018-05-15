<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 9-5-2018
 * Time: 11:06
 */

require '../db.php';
error_reporting(E_ALL ^ E_NOTICE);

$id = $_GET['del_id'];
$query = "DELETE FROM Rubriek WHERE rubrieknummer='$id'";
$statement = $dbh->prepare($query);
$statement->execute();
    header("location: dashboard.php");


