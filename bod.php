<?php
session_start();
include 'functions.php';
include_once 'db.php';
include 'navbar.php';
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
  <div class="grid-x">
    <div class="medium-3"></div>
    <div class="medium-6 text-center">
      <h1 class=text-center>Bied een item aan!</h1>
    </div>
    <div class="medium-3"></div>
  </div>
  <div class="grid-x">
    <div class="large-4 medium-3"></div>
    <div class="medium-6 small-12 large-4">
      <form class="registerform" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <div>
          <label>Naam item</label>
          <input type="text" name="item" placeholder="Geboortedatum" required>
        </div>
        <div>
          <label>Vraagprijs</label>
          <input type="text" name="Vraagprijs" placeholder="Geboortedatum" required>
        </div>
        <div>
          <label>Beschrijving</label>
          <input type="text" name="Beschrijving" placeholder="Geboortedatum" required>
        </div>
        <div>
          <label>Plaats</label>
          <input type="text" name="Plaats" placeholder="Geboortedatum" required>
        </div>
        <div>
          <label>Betalingsinstructie</label>
          <input type="text" name="Betalingsinstructie" placeholder="Geboortedatum" required>
        </div>
        <div>
          <label>Betalingswijze</label>
          <input type="text" name="Betalingswijze" placeholder="Geboortedatum" required>
        </div>
        <div>
          <label>Looptijd</label>
          <input type="text" name="Looptijd" placeholder="Geboortedatum" required>
        </div>
        <div>
          <select name="Land">
            <option value disabled selected>Selecteer een land</option>
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
            <option value = "Anders"> Overig </option>
          </select>
        </div>
        <div>
          <button type="submit" class="knop" name="reg_user">Bied aan!</button>
        </div>
      </form>
    </div>
    <div class="medium-3 large-4"></div>

        <?php
            if (isset($_POST["Gebruikersnaam"],$_POST["Wachtwoord"],$_POST["Adresregel1"],$_POST["Naam"],$_POST["Achternaam"],$_POST["Land"],$_POST["Plaats"],$_POST["Postcode"],$_POST["Geboortedatum"],$_POST["Email"],$_POST["Vraag"],$_POST["Antwoord"])){
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

            try{
            $query = $dbh->prepare("INSERT INTO Gebruiker
              VALUES ('$gebruikersnaam','$voornaam','$achternaam','$adresregel1','$adresregel2','$postcode','$plaats','$land','$geboortedatum','$email','$wachtwoord','$vraag','$antwoord',0)");
              $query->execute();
            }catch(PDOException $e) {
              echo '<script type="text/javascript">alert("Gegevens niet goed ingevuld")</script>';
            }}
            include("footer.html");
        ?>
</body>
