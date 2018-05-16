<!doctype html>
<?php include 'navbar.php';
include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);
?>
<html class="no-js" lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>EenmaalAndermaal - De beste veilingsite van Nederland!</title>
  <link rel="stylesheet" href="css/foundation.css">
  <link rel="stylesheet" href="css/app.css">
</head>

<body>
  <div class="grid-x">
    <div class="medium-3"></div>
    <div class="medium-6 text-center">
      <h1 class=text-center>Accountregistratie</h1>
    </div>
    <div class="medium-3"></div>
  </div>
  <div class="grid-x">
    <div class="large-4 medium-3"></div>
    <div class="medium-6 small-12 large-4">
      <form class="registerform" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

        <div>
          <input type="text" name="Naam" placeholder="Voornaam" required>
        </div>

        <div>
          <input type="text" name="Achternaam" placeholder="Achternaam" required>
        </div>

        <div>
          <label>Geboortedatum</label>
          <input type="date" name="Geboortedatum" placeholder="Geboortedatum" required>
        </div>

        <div>
          <input type="email" name="Email" placeholder="E-Mail" required>
        </div>

        <div>
          <input type="text" name="Gebruikersnaam" placeholder="Gebruikersnaam" required>
        </div>

        <div>
          <input type="password" name="Wachtwoord" placeholder="Wachtwoord" required>
        </div>

        <div>
          <input type="text" name="Adresregel1" placeholder="Adres" required>
        </div>

        <div>
          <input type="text" name="Plaats" placeholder="Plaats" required>
        </div>

        <div>
          <input type="text" name="Postcode" placeholder="Postcode" required>
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
            <optiewaarde = "Denemarken"> Denemarken </option>
              <option value = "Djibouti"> Djibouti </option>
              <option value = "Dominica"> Dominica </option>
              <option value = "Dominicaanse Republiek"> Dominicaanse Republiek </option>
              <option value = "Guatemala"> Guatemala </ option>
                <option value = "Guinea"> Guinea </ option>
                  <option value = "Guinee-Bissau"> Guinee-Bissau </option>
                  <option value = "Guyana"> Guyana </option>
                  <option value = "Haiti"> Haïti </option>
                  <option value = "Heard en McDonaldeilanden"> Heard en Mc Donald Eilanden </option>
                  <optiewaarde = "Heilige Stoel"> Heilige Stoel (Vaticaanstad) </option>
                    <option value = "Honduras"> Honduras </option>
                    <option value = "Anders"> Overig </option>
                  </select>
                </div>

                <div>
                  <input type="text" name="Adresregel2" placeholder="Adres 2">
                </div>

                <div>
                  <select name="Vraag">
                    <option value disabled selected>Selecteer een beveiligingsvraag</option>
                    <option value="1">Welk gerecht kon je als eerste koken?</option>
                    <option value="2">Wat is je moeders tweede naam?</option>
                    <option value="3">Welke bijnaam had je als kind?</option>
                    <option value="4">In welke plaats ben je geboren?</option>
                    <option value="5">Hoe heette je eerste huisdier?</option>
                  </select>
                </div>

                <div>
                  <input type="text" name="Antwoord" placeholder="Antwoord beveiligingsvraag" required>
                </div>

                <div>
                  <button type="submit" class="knop" name="reg_user">Registreer</button>
                </div>
                <p>
                  Heb je al een account? <a href="login-page.php">Klik hier om in te logggen</a>
                </p>
              </form>
            </div>
            <div class="medium-3 large-4"></div>


            <?php
            try{
              $gebruikersnaam = $_POST["Gebruikersnaam"];
              $wachtwoord = password_hash($_POST["Wachtwoord"], PASSWORD_DEFAULT);
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
              $antwoord = password_hash($_POST["Antwoord"], PASSWORD_DEFAULT);
              $verkoper = $_POST["Verkoper"];

              $query = $dbh->prepare("INSERT INTO Gebruiker
                VALUES ('$gebruikersnaam','$voornaam','$achternaam','$adresregel1','$adresregel2','$postcode','$plaats','$land','$geboortedatum','$email','$wachtwoord','$vraag','$antwoord','$verkoper')");
                $query->execute();
              }catch(PDOException $e) {
                //echo $e;
              }
              include("footer.html");
              ?>

            </body>
