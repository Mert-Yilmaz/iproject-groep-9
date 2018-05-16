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
      <h1>Accountregistratie</h1>
    </div>
  <div class="medium-3"></div>
</div>
  <div class="grid-x">
  <div class="large-4 medium-3"></div>
  <div class="medium-6 small-12 large-4">
  <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

    <div>
      <label>Gebruikersnaam</label>
      <input type="text" name="Gebruikersnaam">
    </div>

    <div>
      <label>Wachtwoord</label>
      <input type="password" name="Wachtwoord">
    </div>

    <div>
      <label>Adres</label>
      <input type="text" name="Adresregel1">
    </div>

    <div>
      <label>Extra adres</label>
      <input type="text" name="Adresregel2" placeholder="Optioneel">
    </div>

    <div>
  	  <label>Naam</label>
  	  <input type="text" name="Naam">
  	</div>

		<div>
  	  <label>Achternaam</label>
  	  <input type="text" name="Achternaam">
  	</div>

    <div>
        <label>Land</label>
		    <select name="Land">
		        <option value="Nederland">Nederland</option>
		        <option value="USA">USA</option>
		        <option value="Duitsland">Duitsland</option>
		        <option value="Frankrijk">Frankrijk</option>
		        <option value="België">België</option>
		        <option value="Anders">Anders</option>
	      </select>
  	</div>

    <div>
      <label>Plaats</label>
      <input type="text" name="Plaats">
    </div>

    <div>
      <label>Postcode</label>
      <input type="text" name="Postcode">
    </div>

		<div>
  	  <label>Geboortedatum</label>
  	  <input type="date" name="Geboortedatum">
  	</div>

		<div>
  	  <label>E-mail</label>
  	  <input type="email" name="Email">
  	</div>

    <div>
        <label>Vraag</label>
        <select name="Vraag" placeholder="Vraag">
            <option value="1">Welk gerecht kon je als eerste koken?</option>
            <option value="2">Wat is je moeders tweede naam?</option>
            <option value="3">Welke bijnaam had je als kind?</option>
            <option value="4">In welke plaats ben je geboren?</option>
            <option value="5">Hoe heette je eerste huisdier?</option>
        </select>
    </div>

    <div>
      <label>Antwoord</label>
      <input type="text" name="Antwoord">
    </div>

    <div>
      <label>Verkoper</label>
      <input type="radio" name="Verkoper" value="1" > Ja<br>
      <input type="radio" name="Verkoper" value="0" checked> Nee
    </div>

  	<div>
  	  <button type="submit" class="success button" name="reg_user">Registreer</button>
  	</div>
  	<p>
  		Heeft u al een account? <a href="login.php" class="alert button">Log in</a>
  	</p>
	</form>
</div>
<div class="medium-3 large-4"></div>


<?php
try{
$gebruikersnaam = $_POST["Gebruikersnaam"];
$wachtwoord = password_hash($_POST["Wachtwoord"], PASSWORD_DEFAULT);
$adresregel1 = $_POST["adresregel1"];
$adresregel2 = $_POST["adresregel2"];
$voornaam = $_POST["Naam"];
$achternaam = $_POST["Achternaam"];
$land = $_POST["Land"];
$plaats = $_POST["Plaats"];
$postcode = $_POST["Postcode"];
$geboortedatum = $_POST["Geboortedatum"];
$email = $_POST["Email"];
$vraag = $_POST["Vraag"];
$antwoord = $_POST["Antwoord"];
$verkoper = $_POST["Verkoper"];

$query = $dbh->prepare("INSERT INTO Gebruiker
                        VALUES ('$gebruikersnaam','$voornaam','$achternaam','$adresregel1','$adresregel2','$postcode','$plaats','$land','$geboortedatum','$email','$wachtwoord','$vraag','$antwoord','$verkoper')");
$query->execute();
}catch(PDOException $e) {
  echo $e;
}
include("footer.html");
?>

</body>
