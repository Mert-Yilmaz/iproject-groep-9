/**
 * Created by Atom
 * User: Jeffrey Kragten
 * Date: 25-5-2018
 * Time: 12:34
 */
<?php
session_start();
include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);
?>

<!doctype html>
<html class="no-js" lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>De beste veilingsite van Nederland!</title>
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="icon" href="img/logo2.PNG">
  </head>
<body>
  <?php include 'navbar.php'; ?>
<div class="menubar cell text-center">
    <?php productBreadCrumbs($dbh, $_GET['rubriek']);
          toonItems($dbh, $_GET['rubriek']);?>
</div>
<div class="cell text-center randomtext"><p>EenmaalAndermaal, de perfecte plek om al uw geld uit te geven.</p></div>
  <?php include_once 'footer.html';
?>

</body>
</html>
