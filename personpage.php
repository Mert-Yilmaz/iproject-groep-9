<!doctype html>
<?php
session_start();
include 'navbar.php';
include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);
$usernamemail = $_SESSION['login-token'];
$queryophalen = $dbh->prepare("SELECT * FROM Gebruiker WHERE gebruikersnaam = '$usernamemail' OR mailbox = '$usernamemail'");
$queryophalen->setFetchMode(PDO::FETCH_ASSOC);
$queryophalen->execute();
?>
<html class="no-js" lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>EenmaalAndermaal - De beste veilingsite van Nederland!</title>
  <link rel="stylesheet" href="css/foundation.css">
  <link rel="stylesheet" href="css/app.css">
</head>
<body>
  <div class="grid-container">
    <div class="grid-y">
      <div class="cell">
        <h1 class="aboutkop text-center">Hallo,  {naam}</h1>
        <h2>Dit zijn uw NAW-gegevens</h2>
        <p>emailadres $_POST['emailadres']</p>
        <p>Wachtwoord</p>
        <p>telefoonnummer<p>
        <p>adres</p>
        <p>plaats<p>
        <p>Postcode<p>
        <p>Land</p>
        <p>gekozen beveiligingsvraag</p>
        <p>verkoper ja nee</p>


        <?php while($row = $queryophalen->fetch()){?>

        <p>emailadres <?= $row['mailbox']?></p>
        <p>Wachtwoord</p>
        <!--<p>telefoonnummer<p>-->
        <p>adres <?= $row['adresregel1']?></p>
        <p>plaats <?= $row['plaatsnaam']?><p>
        <p>Postcode <?= $row['postcode']?><p>
        <p>Land <?= $row['land']?></p>
        <p>gekozen beveiligingsvraag<p>
        <p>verkoper <?= if($row['verkoper'] = 0){echo nee;} else {echo ja;} ?><p>
        <?php } ?>

      </div>
    </div>
    <div class="cell">
      <h1 class="aboutkop">Privacybeleid</h1>
      <h2>Belangrijkste hoofdpunten waar u mee instemt</h2>
      <p>Door de service te gebruiken of ermee om te gaan, stemt u in met:</P>
      <ul>
        <li>het gebruik van cookies en andere technologieën.</li>
        <li>Het verzamelen, gebruiken, delen en op andere manier verwerken van uw informatie.</li>
        <li>De openbare beschikbaarheid van uw informatie en de controles over dergelijke informatie, zoals beschreven in Het delen van informatie.</li>
        <li>In het geval van een fusie worden persoonsgegevens overgedragen naar het bedrijf in kwestie.</li>
      </ul>
    </div>
  </div>
    <?php
    include("footer.html");
    ?>
  </body>
</html>
