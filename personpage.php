<?php
session_start();
include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);
$usernamemail = $_SESSION['login-token'];
$queryophalen = $dbh->prepare("SELECT * FROM Gebruiker WHERE gebruikersnaam = '$usernamemail' OR mailbox = '$usernamemail'");
$queryophalen->setFetchMode(PDO::FETCH_ASSOC);
$queryophalen->execute();
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
          <?php while($row = $queryophalen->fetch()){?>
        <h1 class="aboutkop text-center">Hallo, <?= $row['voornaam'] . ' ' . $row['achternaam'] ?></h1>
        <h2>Dit zijn uw NAW-gegevens</h2>

          <table>
              <tr>
                  <th>Emailadres</th>
                  <td><?= $row['mailbox']?></td>
                  <td><a href="edit.php?edit_id=<?= $row['rubrieknummer'] ?>">Wijzig</a></td>
              </tr>
              <tr>
                  <th>Wachtwoord</th>
                  <td></td>
              </tr>
              <tr>
                  <th>Adres</th>
                  <td><?= $row['adresregel1']?></td>
              </tr>
              <tr>
                  <th>Plaats</th>
                  <td><?= $row['plaatsnaam']?></td>
              </tr>
              <tr>
                  <th>Postcode</th>
                  <td><?= $row['postcode']?></td>
              </tr>
              <tr>
                  <th>Land</th>
                  <td><?= $row['land']?></td>
              </tr>
              <tr>
                  <th>Verkoper?</th>
                  <td>
                      <?php
                          if($row['verkoper'] = 0) {
                              echo 'Nee';
                          }
                          else if($row['verkoper'] = 1) {
                              echo 'Ja';
                          }
                      ?>
                  </td>
              </tr>
          </table>
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
