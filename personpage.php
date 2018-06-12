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
$usernamemail = $_SESSION['login-token'];
$querynaw = $dbh->prepare("SELECT * FROM Gebruiker WHERE gebruikersnaam = '$usernamemail' OR mailbox = '$usernamemail'");
$querynaw->setFetchMode(PDO::FETCH_ASSOC);
$querynaw->execute();

$query = $dbh->prepare("SELECT * FROM Gebruiker WHERE gebruikersnaam = '$usernamemail' OR mailbox = '$usernamemail'");
$query->setFetchMode(PDO::FETCH_ASSOC);
$query->execute();
$data = $query->fetch();

$gebruikersnaam = $data['gebruikersnaam'];

$queryv2 = $dbh->prepare("SELECT *
                          FROM Verkoper vk
                          INNER JOIN Voorwerp vw
                          ON vk.gebruiker = vw.verkoper
                          WHERE vk.gebruiker = '$gebruikersnaam'");
$queryv2->setFetchMode(PDO::FETCH_ASSOC);
$queryv2->execute();
$data2 = $queryv2->fetch();
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
            while ($rownaw = $querynaw->fetch()) {

                $getMail = $rownaw['mailbox'];
                $getUsername = $rownaw['gebruikersnaam'];

                $link = "<a href='registerVerkoper.php?user_account=$getMail'>(Verkoper worden? Klik hier!)</a>";
                if ($rownaw['verkoper'] == 0) {
                    $isVerkoper = 'Nee' . $link;
                } else {
                    $isVerkoper = 'Ja';
                }
                ?>
                <h1 class="aboutkop">Hallo, <?= $rownaw['voornaam'] . ' ' . $rownaw['achternaam'] ?></h1>
                <h3>Dit zijn uw NAW-gegevens</h3>

                <table id="infoTable">
                    <tr>
                        <th>Emailadres</th>
                        <td><?= $rownaw['mailbox'] ?></td>
                    </tr>
                    <tr>
                        <th>Adres</th>
                        <td><?= $rownaw['adresregel1'] ?></td>
                    </tr>
                    <tr>
                        <th>Plaats</th>
                        <td><?= $rownaw['plaatsnaam'] ?></td>
                    </tr>
                    <tr>
                        <th>Postcode</th>
                        <td><?= $rownaw['postcode'] ?></td>
                    </tr>
                    <tr>
                        <th>Land</th>
                        <td><?= $rownaw['land'] ?></td>
                    </tr>
                    <tr>
                        <th>Verkoper?</th>
                        <td><?= $isVerkoper ?></td>
                    </tr>
                </table>
            <?php } ?>
            <div class=knoppenbalk>
                <ul>
                  <li><a class= "knop" href="editPersonpage.php?edit_account=<?php echo $getMail; ?>">Wijzig NAW-gegevens</a></li><br>
                <?php
                    if ($data['verkoper'] == 1) { echo "<li><a class='knop' href='verkooppage.php'>Klik hier om te verkopen</a></li><br>";}
                    if($getUsername == 'Admin') { echo "<li><a class='knop' href='admin/dashboard.php'>Beheeromgeving</a><li><br>
                                                        <li><a class='knop' href='monitoring.php'>Monitoring activiteit gebruikers</a></li>";}
                ?>
                </ul>
            </div>
            <?php
            if ($data['verkoper'] == 1) {

                $querybank = $dbh->prepare("SELECT * FROM Verkoper WHERE gebruiker = '$gebruikersnaam'");
                $querybank->setFetchMode(PDO::FETCH_ASSOC);
                $querybank->execute();

                while ($rowbank = $querybank->fetch()) {
                    ?>

                    <h3>Dit zijn uw bankgegevens</h3>

                    <table id="infoTable">
                        <tr>
                            <th>Bank</th>
                            <td><?= $rowbank['bank'] ?></td>
                        </tr>
                        <tr>
                            <th>Bankrekening</th>
                            <td><?= $rowbank['bankrekening'] ?></td>
                        </tr>
                        <tr>
                            <th>Creditcard</th>
                            <td><?= $rowbank['creditcard'] ?></td>
                        </tr>
                        <tr>
                            <th><a href="editBankgegevens.php?edit_account=<?= $rowbank['gebruiker'] ?>">Wijzig
                                    bankgegevens</a></th>

                        </tr>
                    </table>

                <?php }
            } ?>

            <?php
            if ($data['verkoper'] == 1) {

                $queryv = $dbh->prepare("SELECT *
                                            FROM Verkoper vk
                                            INNER JOIN Voorwerp vw ON vk.gebruiker = vw.verkoper
                                            WHERE vk.gebruiker = '$gebruikersnaam'");
                $queryv->setFetchMode(PDO::FETCH_ASSOC);
                $queryv->execute();
                ?>

                <p>
                <h3>Dit zijn uw veilingen</h3>
                <!-- <a class='knop' href='verkooppage.php'>Klik hier om te verkopen</a> -->
                </p>

                <?php
                $queryNRows = $dbh->prepare("SELECT COUNT(*) FROM	Voorwerp WHERE verkoper = '$gebruikersnaam'");
                $queryNRows->setFetchMode(PDO::FETCH_ASSOC);
                $queryNRows->execute();
                $nRows = $queryNRows->fetchColumn();

                if ($nRows != 0) {
                    ?>

                    <table>
                        <tr>
                            <th>Titel</th>
                            <th>Beschrijving</th>
                            <th>Bieden vanaf</th>
                            <th>Einddag</th>
                            <th>Eindtijd</th>
                            <th>Huidige hoogste bod</th>
                            <th>Status</th>
                        </tr>
                        <?php
                        while ($rowv = $queryv->fetch()) {
                            ?>
                            <tr>
                                <td class="text-center"><?= $rowv['titel'] ?></td>
                                <td class="text-center"><?= $rowv['beschrijving'] ?></td>
                                <td class="text-center"><?= $rowv['startprijs'] ?></td>
                                <td class="text-center"><?= $rowv['looptijdEindeDag'] ?></td>
                                <td class="text-center"><?= $rowv['looptijdEindeTijdstip'] ?></td>
                                <td class="text-center"><?= $rowv['verkoopprijs'] ?></td>
                                <?php
                                if($rowv['veilingGesloten'] == 0) { ?>
                                    <td class="text-center">Open</td>
                                <?php } else { ?>
                                    <td class="text-center">Gesloten</td>
                                <?php } ?>
                            </tr>
                        <?php } ?>
                    </table>
                <?php } else { ?>
                    <p>U heeft op dit moment geen veilingen openstaan.</p>
                <?php }
            } ?>
        </div>
    </div>
    <div class="cell">
        <h1 class="aboutkop">Privacybeleid</h1>
        <h2>Belangrijkste hoofdpunten waar u mee instemt</h2>
        <p>Door de service te gebruiken of ermee om te gaan, stemt u in met:</P>
        <ul>
            <li>het gebruik van cookies en andere technologieën.</li>
            <li>Het verzamelen, gebruiken, delen en op andere manier verwerken van uw informatie.</li>
            <li>De openbare beschikbaarheid van uw informatie en de controles over dergelijke informatie, zoals
                beschreven in Het delen van informatie.
            </li>
            <li>In het geval van een fusie worden persoonsgegevens overgedragen naar het bedrijf in kwestie.</li>
        </ul>
    </div>
</div>
<?php
include("footer.html");
?>
</body>
</html>
