/**
 * Created by Atom
 * User: Jeffrey Kragten
 * Date: 25-5-2018
 * Time: 12:34
 */
<?php
require 'functions.php';

require 'db.php';

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
    <?php
include 'navbar.php';

?>
        <div class="grid-container">
            <div class="grid-y">
                <h1 class="aboutkop">Over ons</h1>
                <p>EenmaalAndermaal is een advertentiesite die
                kopers en verkopers samenbrengt. Ondanks het feit dat de website
                zich vooral kenmerkt door het laagdrempelige karakter ziet
                EenmaalAndermaal het als haar missie om hen zo goed mogelijk te
                adviseren over prettig en veilig handelen. De website is zeer
                eenvoudig in gebruik. Iedereen kan er een advertentie plaatsen of
                producten verkopen. Momenteel hebben gebruikers keuze uit
                een grote verscheidenheid van groepen, van Antiek en Kunst tot Zakelijke goederen.</p>
            <div class="cell">
                <h1 class="aboutkop">Info</h1>
                <p>EenmaalAndermaal-hoofdkantoor<br />
                EenmaalAndermaal BV<br />
                Ruitenberglaan 00<br />
                1234 AB Arnhem<br />
                Nederland<br /></p>
            </div>
            </div>
            <div class="cell">
                <h1 class="aboutkop" id="privacybeleid">Privacybeleid</h1>
                <h2>Belangrijkste hoofdpunten waar u mee instemt</h2>
                <p>Door de service te gebruiken of ermee om te gaan, stemt u in met:</P>
                <ul>
                    <li>Het gebruik van cookies en andere technologieën.</li>
                    <li>Het verzamelen, gebruiken, delen en op andere manier verwerken van uw informatie.</li>
                    <li>De openbare beschikbaarheid van uw informatie en de controles over dergelijke informatie, zoals beschreven in Het delen van informatie.</li>
                    <li>In het geval van een fusie worden persoonsgegevens overgedragen naar het bedrijf in kwestie.</li>
                </ul>
            </div>
        </div>
        <?php
include ("footer.html");

?>
</body>
</html>
