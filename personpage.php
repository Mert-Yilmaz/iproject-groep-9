<!doctype html>
<?php include 'navbar.php';
include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);
?>
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

<h1>Hallo,  {naam}</h1>
<h2>Dit zijn uw NAW-gegevens</h2>

<hr>

<p>emailadres $_POST['emailadres']</p>
<p>Wachtwoord</p>
<p>telefoonnummer<p>
<p>adres</p>
<p>plaats<p>
<p>Postcode<p>
<p>Land</p>
<p>gekozen beveiligingsvraag<p>


        <?php
        include_once 'footer.html';
        ?>
      </body>
      </html>
