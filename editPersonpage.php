<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 23-5-2018
 * Time: 10:02
 */

require 'db.php';

try {

$editAccount = $_GET['edit_account'];

    $select = $dbh->prepare("SELECT * FROM Gebruiker WHERE mailbox='$editAccount' ");
    $select->setFetchMode(PDO::FETCH_ASSOC);
    $select->execute();
    $data=$select->fetch();

    if(isset($_POST['done']))
    {


            $newEmail = $_POST['email'];
            $newAddress = $_POST['address'];
            $newCity = $_POST['city'];
            $newZipcode = $_POST['zipcode'];
            $newCountry = $_POST['country'];

            $update = $dbh->prepare("UPDATE Gebruiker 
                                          SET mailbox='$newEmail',
                                              adresregel1='$newAddress',
                                              plaatsnaam='$newCity',
                                              postcode='$newZipcode',
                                              land='$newCountry'
                                          WHERE mailbox='$editAccount'");

            $update->execute();
        header('location: personpage.php');
    }
}
catch(PDOException $e)
{
    echo "error:".$e->getMessage();
}

$getLand = $data['land'];

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
        <label>Emailadres</label>
        <input type="text" name="email" placeholder="Emailadres" value="<?= $data['mailbox'] ?>" readonly>
    </div>
    <div class="input-group">
        <label>Wachtwoord</label>
        <input type="password" name="password" placeholder="Wachtwoord">
    </div>
    <div class="input-group">
        <label>Adres</label>
        <input type="text" name="address" placeholder="Adres" value="<?= $data['adresregel1'] ?>">
    </div>
    <div class="input-group">
        <label>Plaats</label>
        <input type="text" name="city" placeholder="Plaats" value="<?= $data['plaatsnaam'] ?>">
    </div>
    <div class="input-group">
        <label>Postcode</label>
        <input type="text" name="zipcode" placeholder="Postcode" value="<?= $data['postcode'] ?>">
    </div>
    <div class="input-group">
        <label>Land</label>
        <select name="country">
            <option value selected = '<?php echo $getLand; ?>'><?php echo $getLand; ?></option>
            <option value = "Afghanistan"> Afghanistan </option>
            <option value = "Albania"> Albanië </option>
            <option value = "Algerije"> Algerije </option>
            <option value = "Amerikaans Samoa"> Amerikaans Samoa </option>
            <option value = "Andorra"> Andorra </option>
            <option value = "Angola"> Angola </option>
            <option value = "Anguilla"> Anguilla </option>
            <option value = "Antartica"> Antarctica </option>
            <option value = "Antigua en Barbuda"> Antigua en Barbuda </option>
            <option value = "Argentina"> Argentinië </option>
            <option value = "Armenia"> Armenië </option>
            <option value = "Aruba"> Aruba </option>
            <option value = "Nederland"> Nederland </option>
            <option value = "Czech Republic"> Czech Republic </option>
            <option value = "Denemarken"> Denemarken </option>
            <option value = "Djibouti"> Djibouti </option>
            <option value = "Dominica"> Dominica </option>
            <option value = "Guatemala"> Guatemala </option>
            <option value = "Guinea"> Guinea </option>
            <option value = "Guinee-Bissau"> Guinee-Bissau </option>
            <option value = "Guyana"> Guyana </option>
            <option value = "Haiti"> Haïti </option>
            <option value = "Heilige Stoel"> Heilige Stoel (Vaticaanstad) </option>
            <option value = "Honduras"> Honduras </option>
            <option value = "Turkije"> Turkije </option>
            <option value = "Anders"> Overig </option>
        </select>
    </div>
    <div>
        <button type="submit" name="done" class="btn">Opslaan</button>
    </div>
</form>
