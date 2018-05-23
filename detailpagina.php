<?php
session_start();
include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);
$usernamemail = $_SESSION['login-token'];
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
  <div class="grid-container">
    <div class="grid-y">
      <div class="cell">
        <?php detailPagina($dbh, $_GET['item']);


        if (isset($_POST["submit"])){
        $voorwerpnummer = $_GET['item'];
        $bodbedrag = $_POST["bodbedrag"];
        $boddag = $_POST["datum"];
        $bodtijdstip = $_POST["tijd"];
        $gebruiker = 'gebruiker5';

        try{
          $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES	('$voorwerpnummer', '$bodbedrag',	'$gebruiker','1-1-2018','$bodtijdstip')");
          $query->execute();
        }catch(PDOException $e) {
          echo '<script type="text/javascript">alert("Gegevens niet goed ingevuld")</script>';
        }
}
?>
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
