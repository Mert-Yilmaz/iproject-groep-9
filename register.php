/**
 * Created by Atom
 * User: Jeffrey Kragten
 * Date: 25-5-2018
 * Time: 12:34
 */
<?php
require "functions.php";
require "db.php";
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
    <?php require "navbar.php"; ?>
    <div class="grid-x">
        <div class="medium-3"></div>
            <div class="medium-6 text-center">
                <h1 class="text-center">Accountregistratie</h1>
            </div>
        <div class="medium-3"></div>
    </div>
    <div class="grid-x">
        <div class="large-4 medium-3"></div>
            <div class="medium-6 small-12 large-4">
                <form class="registerform" method="POST" action="register.php">
                    <div>
                        <input type="text" name="Naam" placeholder="Voornaam, verplicht" maxlength="15" required>
                    </div>
                    <div>
                        <input type="text" name="Achternaam" placeholder="Achternaam, verplicht" maxlength="20" required>
                    </div>
                    <div>
                        <label>Geboortedatum</label>
                        <input type="date" name="Geboortedatum" placeholder="Geboortedatum, verplicht" required>
                    </div>
                    <div>
                        <input type="email" name="Email" placeholder="E-Mail, verplicht" maxlength="50" required>
                    </div>
                    <div>
                        <input type="text" name="Gebruikersnaam" placeholder="Gebruikersnaam, verplicht" maxlength="20" required>
                    </div>
                    <div>
                        <input type="password" name="Wachtwoord" placeholder="Wachtwoord (Minimaal 7 tekens, een hoofdletter en een getal), verplicht" maxlength="100"
                            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{7,}" required>
                    </div>
                    <div>
                        <input type="text" name="Adresregel1" placeholder="Adres, verplicht" maxlength="30" required>
                    </div>
                    <div>
                        <input type="text" name="Plaats" placeholder="Plaats, verplicht" maxlength="15" required>
                    </div>
                    <div>
                        <input type="text" name="Postcode" placeholder="Postcode, verplicht" maxlength="7" required>
                    </div>
                    <div>
                        <select name="Land">
                            <option value disabled selected>Selecteer een land, verplicht</option>
                            <option value="Afghanistan"> Afghanistan</option>
                            <option value="Albania"> Albanië</option>
                            <option value="Algerije"> Algerije</option>
                            <option value="Amerikaans Samoa"> Amerikaans Samoa</option>
                            <option value="Andorra"> Andorra</option>
                            <option value="Angola"> Angola</option>
                            <option value="Anguilla"> Anguilla</option>
                            <option value="Antartica"> Antarctica</option>
                            <option value="Antigua en Barbuda"> Antigua en Barbuda</option>
                            <option value="Argentina"> Argentinië</option>
                            <option value="Armenia"> Armenië</option>
                            <option value="Aruba"> Aruba</option>
                            <option value="Nederland"> Nederland</option>
                            <option value="Czech Republic"> Czech Republic</option>
                            <option value="Denemarken"> Denemarken</option>
                            <option value="Djibouti"> Djibouti</option>
                            <option value="Dominica"> Dominica</option>
                            <option value="Guatemala"> Guatemala</option>
                            <option value="Guinea"> Guinea</option>
                            <option value="Guinee-Bissau"> Guinee-Bissau</option>
                            <option value="Guyana"> Guyana</option>
                            <option value="Haiti"> Haïti</option>
                            <option value="Heilige Stoel"> Heilige Stoel (Vaticaanstad)</option>
                            <option value="Honduras"> Honduras</option>
                            <option value="Turkije"> Turkije</option>
                            <option value="Anders"> Overig</option>
                        </select>
                    </div>
                    <div>
                        <input type="text" name="Adresregel2" maxlength="15" placeholder="Adres 2, niet verplicht">
                    </div>
                    <div>
                        <select name="Vraag">
                            <option value disabled selected>Selecteer een beveiligingsvraag, verplicht</option>
                            <option value="1">Welk gerecht kon je als eerste koken?</option>
                            <option value="2">Wat is je moeders tweede naam?</option>
                            <option value="3">Welke bijnaam had je als kind?</option>
                            <option value="4">In welke plaats ben je geboren?</option>
                            <option value="5">Hoe heette je eerste huisdier?</option>
                        </select>
                    </div>
                    <div>
                        <input type="text" name="Antwoord" placeholder="Antwoord beveiligingsvraag, verplicht" maxlength="20" required>
                    </div>
                    <div>
                        <button type="submit" class="knop" name="reg_user">Registreer</button>
                    </div>
                    <p>
                        Heb je al een account? <a href="login-page.php">Klik hier om in te loggen</a>
                    </p>
                </form>
    </div>
    <?php
    if (isset($_POST['reg_user'])) {
        $gebruikersnaam = $_POST["Gebruikersnaam"];
        $wachtwoord = md5($_POST["Wachtwoord"]);
        $adresregel1 = $_POST["Adresregel1"];
        $adresregel2 = $_POST["Adresregel2"];
        $voornaam = $_POST["Naam"];
        $achternaam = $_POST["Achternaam"];
        $land = $_POST["Land"];
        $plaats = $_POST["Plaats"];
        $postcode = $_POST["Postcode"];
        $geboortedatum = $_POST["Geboortedatum"];
        $email = $_POST["Email"];
        $vraag = $_POST["Vraag"];
        $antwoord = md5($_POST["Antwoord"]);
        $verkoper = 0;
        $code = md5(rand(0,1000));
        $actief = 0;
        $isToegestaan = 1;
        $verkopercode = NULL;

        $query = "INSERT INTO Gebruiker VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $query = $dbh->prepare($query);

        try {
            $query->execute(array($gebruikersnaam, $voornaam, $achternaam, $adresregel1, $adresregel2, $postcode, $plaats, $land, $geboortedatum, $email, $wachtwoord, $vraag, $antwoord, $verkoper, $code, $actief, $isToegestaan, $verkopercode));
            $to      = $email;
            $from    = 'noreply@eenmaalandermaal9.nl';
            $subject = 'Verificatie account EenmaalAndermaal';
            $message = '

            Beste ' . $voornaam . ',
            Bedankt voor het aanmelden op EenmaalAndermaal!
            Om mee te kunnen bieden en in te kunnen loggen moet u uw account activeren aan de hand van de onderstaande link.
            ------------------------
            Gebruikersnaam: ' . $gebruikersnaam . '
            Email: ' . $email . '
            Wachtwoord: ' . $_POST['Wachtwoord'] . '
            ------------------------
            Kopieer de onderstaande link om uw account te activeren:
            http://iproject9.icasites.nl/verify.php?email='.$email.'&code='.$code.'';

            $headers = 'From: ' . $from . "\r\n";
            mail($to, $subject, $message, $headers);
            } catch (PDOException $e) {
                    echo $e;
                    echo '<script type="text/javascript">alert("Gegevens niet goed ingevuld")</script>';
            }
            }
            require "footer.html";
    ?>
</body>
</html>
