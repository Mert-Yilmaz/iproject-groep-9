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
    <title>De beste veilingsite van Nederland!</title>
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.csss">
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
  <form method="POST" action="Registreren.php">
		<div>
  	  <label>Naam</label>
  	  <input type="text" name="Naam">
  	</div>

		<div>
  	  <label>Achternaam</label>
  	  <input type="text" name="Achternaam">
  	</div>

		<div>
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
  	  <label>Geboortedatum</label>
  	  <input type="date" name="Geboortedatum">
  	</div>

		<div>
  	  <label>E-mail</label>
  	  <input type="email" name="Email">
  	</div>

		<div>
  	  <label>Rekeningnummer</label>
  	  <input type="text" name="Rekeningnummer">
  	</div>

		<div>
  	  <label>Abonnement</label>
        <select name="Abonnement">
          <option value="Basic">Basic ($5,99)</option>
          <option value="Weeaboo">Premium ($8,99)</option>
          <option value="Otaku" selected="selected">Diamond ($14,99)</option>
        </select>
  	</div>

  	<div>
  	  <label>Gebruikersnaam</label>
  	  <input type="text" name="Gebruikersnaam">
  	</div>

  	<div>
  	  <label>Wachtwoord</label>
  	  <input type="password" name="Wachtwoord-1">
  	</div>

  	<div>
  	  <label>Wachtwoord bevestigen</label>
  	  <input type="password" name="Wachtwoord-2">
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

</body>
