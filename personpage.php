<?php
session_start();
include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);
$usernamemail = $_SESSION['login-token'];
$querynaw = $dbh->prepare("SELECT * FROM Gebruiker WHERE gebruikersnaam = '$usernamemail' OR mailbox = '$usernamemail'");
$querynaw->setFetchMode(PDO::FETCH_ASSOC);
$querynaw->execute();

$query = $dbh->prepare("SELECT * FROM Gebruiker WHERE gebruikersnaam = '$usernamemail' OR mailbox = '$usernamemail'");
$query->setFetchMode(PDO::FETCH_ASSOC);
$query->execute();
$data = $query->fetch();
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
          <?php
            while($rownaw = $querynaw->fetch()){


                $getMail = $rownaw['mailbox'];

                $link = "<a href='registerVerkoper.php?user_account=$getMail'>(Verkoper worden? Klik hier!)</a>";
                if ($rownaw['verkoper'] == 0) {
                    $isVerkoper = 'Nee' . $link;
                }
                else {
                    $isVerkoper = 'Ja';
                }
          ?>
        <h1 class="aboutkop text-center">Hallo, <?= $rownaw['voornaam'] . ' ' . $rownaw['achternaam'] ?></h1>
        <h3>Dit zijn uw NAW-gegevens</h3>

          <table id="infoTable">
              <tr>
                  <th>Emailadres</th>
                  <td><?= $rownaw['mailbox']?></td>
              </tr>
              <tr>
                  <th>Adres</th>
                  <td><?= $rownaw['adresregel1']?></td>
              </tr>
              <tr>
                  <th>Plaats</th>
                  <td><?= $rownaw['plaatsnaam']?></td>
              </tr>
              <tr>
                  <th>Postcode</th>
                  <td><?= $rownaw['postcode']?></td>
              </tr>
              <tr>
                  <th>Land</th>
                  <td><?= $rownaw['land']?></td>
              </tr>
              <tr>
                  <th>Verkoper?</th>
                  <td><?= $isVerkoper ?></td>
              </tr>
              <tr>
                  <th><a href="editPersonpage.php?edit_account=<?= $rownaw['mailbox'] ?>">Wijzig NAW-gegevens</a></th>
              </tr>
          </table>
            <?php } ?>
          <?php
          if($data['verkoper'] == 1) {

          $gebruikersnaam = $data['gebruikersnaam'];

          $querybank = $dbh->prepare("SELECT * FROM Verkoper WHERE gebruiker = '$gebruikersnaam'");
          $querybank->setFetchMode(PDO::FETCH_ASSOC);
          $querybank->execute();

          while ($rowbank = $querybank->fetch()) {
          ?>
          <h3>Dit zijn uw bankgegevens</h3>

          <table id="infoTable">
              <tr>
                  <th>Bank</th>
                  <td><?= $rowbank['bank']?></td>
              </tr>
              <tr>
                  <th>Bankrekening</th>
                  <td><?= $rowbank['bankrekening']?></td>
              </tr>
              <tr>
                  <th>Creditcard</th>
                  <td><?= $rowbank['creditcard']?></td>
              </tr>
              <tr>
                  <th><a href="editBankgegevens.php?edit_account=<?= $rowbank['gebruiker'] ?>">Wijzig bankgegevens</a></th>
              </tr>
          </table>
          <?php } } ?>

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
