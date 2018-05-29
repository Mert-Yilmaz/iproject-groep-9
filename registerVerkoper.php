<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 23-5-2018
 * Time: 11:22
 */

require 'db.php';

try {
    //Haal email uit link
    $email = $_GET['user_account'];

    //Haal gegevens op uit db met hetzelfde email adres
    $select = $dbh->prepare("SELECT * FROM Gebruiker WHERE mailbox='$email'");
    $select->setFetchMode(PDO::FETCH_ASSOC);
    $select->execute();
    $data=$select->fetch();

    //Stuur mail met random gegenereerde code
    $code = md5(rand(0,1000));
    $insertCode = $dbh->prepare("INSERT INTO Gebruiker (verkopercode) VALUES ('$code')");
    $insertCode->execute();

    $to = $email;
    $from = "noreply@eenmaalandermaal9.nl";
    $subject = "Verificatiecode verkoopaccount activatie";
    $message = '
        Beste ' . $_POST['user'] . ',
        Om uw verkoopaccount te activeren, dient u de onderstaande code in het veld "activatiecode" in te vullen:
        ' . $code;
    $headers = 'From: ' . $from . "\r\n";
    mail($to, $subject, $message, $headers);

    //Als er op de submit knop gedruk wordt
    if(isset($_POST['done'])) {
        $query = "SELECT * FROM Gebruiker WHERE gebruikersnaam='$email' AND verkopercode=" . $_POST['verkoopcode'] . "";
        $result = $dbh->query($query);
        $count = $result->rowCount();

        if ($count == 1 || $count == -1) {
            $update = $dbh->prepare("UPDATE Gebruiker SET verkoper = 1 WHERE mailbox = '$email'");
            $update->execute();

            $gebruikersnaam = $_POST['user'];
            $bank = $_POST['bank'];
            $bankrekening = $_POST['bankrekening'];
            $controleoptie = $_POST['controle'];
            $creditcard = $_POST['creditcard'];

            $insert = $dbh->prepare("INSERT INTO Verkoper VALUES ('$gebruikersnaam', '$bank', '$bankrekening', '$controleoptie', '$creditcard')");
            $insert->execute();
            header('location: personpage.php');
        }
    }
}
catch(PDOException $e) {
    echo "error:".$e->getMessage();
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
        <label type="text" name="user"><?= $data['gebruikersnaam'] ?></label>
    </div>
    <div class="input-group" >
        <label >Verkoopcode</label >
        <input type = "text" name = "verkoopcode" placeholder = "Vul uw activatiecode in" required >
    </div >
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
        <input type="text" name="bankrekening">
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
        <input type="text" name="creditcard">
    </div>
    <div>
        <button type="submit" name="done" class="btn">Opslaan</button>
    </div>
</form>
