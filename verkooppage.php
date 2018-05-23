<?php
session_start();
include 'functions.php';
include_once 'db.php';
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
  <?php include 'navbar.php'; ?>
  <div class="grid-x">
    <div class="medium-3"></div>
    <div class="medium-6 text-center">
      <h1 class=text-center>Plaats item</h1>
    </div>
    <div class="medium-3"></div>
  </div>
  <div class="grid-x">
    <div class="large-4 medium-3"></div>
    <div class="medium-6 small-12 large-4">
      <form class="registerform" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

        <div>
          <input type="text" name="titel" placeholder="Titel" maxlength="18">
        </div>

        <div>
          <textarea rows="4" name="beschrijving" placeholder="Geef hier de beschrijving van het product.. (optioneel)" maxlength="22" required></textarea>
        </div>

        <div>
          <label>Prijs in: €</label>
          <input type="number" name="startprijs" placeholder="99999.99 (Startprijs)" maxlength="8" required>
        </div>

        <div>
          <select name="betalingswijze">
            <option value disabled selected>Kies een betalingswijze</option>
            <option value="IDeal/PayPal">IDeal/Paypal</option>
            <option value="Creditcard">Creditcard</option>
          </select>
        </div>

        <div>
          <input type="text" name="betalingsinstructie" placeholder="Geef hier aanvullende betaal instructies" maxlength="30">
        </div>

        <div>
          <input type="text" name="plaats" placeholder="Plaats naam" maxlength="12">
        </div>

        <div>
          <select name="land">
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
          <select name="looptijd">
            <option value selected disabled>Selecteer de looptijd in dagen</option>
            <option value = "1"> 1 </option>
            <option value = "3"> 3 </option>
            <option value = "5"> 5 </option>
            <option value = "7"> 7 (Standaard) </option>
            <option value = "10"> 10 </option>
          </select>
        </div>

        <div>
          <label>Prijs in: €</label>
          <input type="number" name="verzendkosten" placeholder="99.99 (Verzendkosten)" maxlength="5">
        </div>

        <div>
          <textarea rows="4" name="verzendinstructies" placeholder="Geef hier instructies voor het verzenden.. (optioneel)" maxlength="30"></textarea>
        </div>

      <!--  <div>
          <label>Upload hier je image</label>
          <input name="plaatje" type="file" accept="image/*" multiple required>
        </div> -->

        <div>
          <button type="submit" class="knop" name="plaats_item">Plaats</button>
        </div>
      </form>
    </div>
    <div class="medium-3 large-4"></div>


    <?php
      //alle componenten voor de insert query
      $titel = $_POST["titel"];
      $beschrijving = $_POST["beschrijving"];
      $startprijs = $_POST["startprijs"];
      $betalingswijze = $_POST["betalingswijze"];
      $betalingsinstructie = $_POST["betalingsinstructie"];
      $plaats = $_POST["plaats"];
      $land = $_POST["land"];
      $plaats = $_POST["Plaats"];
      $looptijd = $_POST["looptijd"];
      $verzendkosten = $_POST["verzendkosten"];
      $verzendinstructies = $_POST["verzendinstructies"];
      $plaatje = $_POST["plaatje"];
      is_null($koper);
      $begindag = date("Y/M/D");
      $einddag = date("Y/M/(D + $looptijd)");
      $plaatstijd = date("H:i:s");
      $veilinggesloten = 0;
      is_null($verkoopprijs);
      $usernamemail = $_SESSION['login_token'];

      //query om het voorwerpnummer te bepalen
      $queryid = "SELECT * FROM Voorwerp";
      $result = $dbh->query($queryid);
      $count = $result->rowCount();
      $voorwerpid = $count + 1;

      //de insert $query

      try{
      $query = $dbh->prepare("INSERT INTO Voorwerp
        VALUES ('$voorwerpid','$titel','$beschrijving','$startprijs','$betalingswijze','$betalingsinstructie','$plaats','$land','$looptijd',
        '$begindag','$plaatstijd','$verzendkosten','$verzendinstructies','$usernamemail','$koper','$einddag','$plaatstijd','$veilinggesloten','$verkoopprijs')");
        $query->execute();
      }catch(PDOException $e) {
        //echo '<script type="text/javascript">alert("Gegevens niet goed ingevuld")</script>';
        echo $e;
      }
    include("footer.html");
    ?>

  </body>
