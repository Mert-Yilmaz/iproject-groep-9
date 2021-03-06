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
  <title>EenmaalAndermaal - De beste veilingsite van Nederland!</title>
  <link rel="stylesheet" href="css/foundation.css">
  <link rel="stylesheet" href="css/app.css">
  <link rel="icon" href="img/logo2.PNG">
</head>

<body>
  <?php include 'navbar.php'; ?>
  <div class="grid-x">
    <div class="medium-3"></div>
    <div class="medium-6 text-center">
      <h1 class=text-center>Plaats item</h1>
    </div>
    <div class="medium-3"></div>
  </div>
  <div class="grid-x">
    <div class="large-4 medium-3"></div>
    <div class="medium-6 small-12 large-4">

      <?php
      if($isLoggedIn) {
        plaatsItem($dbh);
      }
      else {
        echo "Log in om een item aan te bieden!";
      }
      ?>

    </div>
  </div>
  <?php include("footer.html"); ?>
</body>
