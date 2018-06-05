<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 23-5-2018
 * Time: 11:22
 */

require 'db.php';

if (isset($_GET['user_account']) && !empty($_GET['user_account'])) {
    //Haal email uit link
    $getemail = $_GET['user_account'];

    //Controleer email adres link met email db
    $query = $dbh->prepare("SELECT * FROM Gebruiker WHERE mailbox = '$getemail'");
    $query->setFetchMode(PDO::FETCH_ASSOC);
    $query->execute();
    $querydata = $query->fetch();

    //Haal gegevens op uit db
    $voornaam = $querydata['voornaam'];
    $email = $querydata['mailbox'];
    $gebruikersnaam = $querydata['gebruikersnaam'];
    $isVerkoper = $querydata['verkoper'];

    //Controleer of link mail = db mail, als gelijk
    if ($getemail == $email && $isVerkoper == 0) {
        //Genereer code en verwerk in db
        $verkopercode = md5(rand(0, 1000));
        $insertquery = $dbh->prepare("UPDATE Gebruiker SET verkopercode='$verkopercode' WHERE mailbox = '$getemail' AND verkopercode IS NULL");
        $insertquery->execute();
        
        //Verstuur email met random gegenereerde code
        $to = $email;
        $from = "noreply@eenmaalandermaal9.nl";
        $subject = "Verificatiecode verkoopaccount activatie";
        $message = '
        Beste ' . $voornaam . ',
        Om uw verkoopaccount te activeren, dient u de onderstaande code in het veld "activatiecode" in te vullen:
        ' . $verkopercode . '';
        $headers = 'From: ' . $from . "\r\n";
        mail($to, $subject, $message, $headers);
        
        //Als er op de knop gedrukt is
        if (isset($_POST['done'])) {
            //Haal code op uit veld
            $getverkopercode = $_POST['verkopercode'];

            //Haal gegevens uit db met db code = gekregen code en db mail = gekregen mail
            $checkquery = $dbh->prepare("SELECT * FROM Gebruiker WHERE verkopercode = '$getverkopercode' AND mailbox = '$getemail'");
            $checkquery->setFetchMode(PDO::FETCH_ASSOC);
            $checkquery->execute();
            $checkquerydata = $checkquery->fetch();

            //Haal verkopercode op uit db
            $verkopercodeDB = $checkquerydata['verkopercode'];

            //Controleer of veld verkopercode = db verkopercode en link mail = db mail
            if ($getverkopercode == $verkopercodeDB && $getemail == $email) {
                //Update gebruiker met verkoper = 1
                $updatequery = $dbh->prepare("UPDATE Gebruiker SET verkoper=1 WHERE verkoper=0 AND mailbox = '$getemail' AND verkopercode = '$getverkopercode'");
                $updatequery->execute();

                //Haal gegevens uit form
                $bank = $_POST['bank'];
                $bankrekening = $_POST['bankrekening'];
                $controleoptie = $_POST['controle'];
                $creditcard = $_POST['creditcard'];

                //Stop gegevens in db tabel Verkoper
                $insert = $dbh->prepare("INSERT INTO Verkoper VALUES ('$gebruikersnaam', '$bank', '$bankrekening', '$controleoptie', '$creditcard')");
                $insert->execute();

                //Ga terug naar persoonlijke pagina
                header('location: personpage.php');
            } else {
                echo "<h1>Email en/of code komen niet overeen!</h1>";
                echo "<br>";
                echo "<a href='http://iproject9.icasites.nl/'>Terug naar de home pagina</a>";
            }
        }
    } else {
        echo "<h1>U bent al verkoper!</h1>";
        echo "<br>";
        echo "<a href='http://iproject9.icasites.nl/'>Terug naar de home pagina</a>";
    }
} else {
    echo "<h1>Could not get email (check)</h1>";
    echo "<br>";
    echo "<a href='http://iproject9.icasites.nl/'>Terug naar de home pagina</a>";
}
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
        <link rel="stylesheet" href="css/admin/app.css"
    </head>
<body>
<br>
<form method="post">
    <div class="input-group">
        <label>Gebruikersnaam</label>
        <label type="text" name="user"><?= $gebruikersnaam ?></label>
    </div>
    <div class="input-group">
        <label>Verkopercode</label>
        <input type="text" name="verkopercode" placeholder="Vul uw activatiecode in (zie uw mailbox)" required>
    </div>
    <div class="input-group">
        <label>Bank</label>
        <select name="bank">
            <option value disabled selected>Selecteer uw bank</option>
            <option value="ABN AMRO">ABN AMRO</option>
            <option value="ASN BANK">ASN BANK</option>
            <option value="ING">ING</option>
            <option value="RABOBANK">RABOBANK</option>
            <option value="SNS BANK">SNS BANK</option>
        </select>
    </div>
    <div class="input-group">
        <label>Bankrekening</label>
        <input type="text" name="bankrekening" maxlength="12">
    </div>
    <div class="input-group">
        <label>Controle optie</label>
        <select name="controle">
            <option value disabled selected>Selecteer een controle optie</option>
            <option value="post">Post</option>
            <option value="Creditcard">Creditcard</option>
        </select>
    </div>
    <div class="input-group">
        <label>Creditcard</label>
        <input type="text" name="creditcard" maxlength="19">
    </div>
    <div>
        <button type="submit" name="done" class="btn">Opslaan</button>
    </div>
</form>
</body>
</html>
