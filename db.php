<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 26-4-2018
 * Time: 11:22
 */
$hostname = "mssql.iproject.icasites.nl";
$dbname = "iproject9";
$username = "iproject9";
$pw = "PXDDupJ2bw";
try{
    $dbh = new PDO("sqlsrv:Server=$hostname;Database=$dbname;ConnectionPooling=0", "$username", "$pw");
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (PDOException $e) {
    die ( "Fout met de database: {$e->getMessage()} "
    );
}
?>
