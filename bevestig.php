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



<?php
if (isset($_POST["submit"])){
  $target_dir = "img/veilingen/";
  $target_file = $target_dir . basename($_FILES["plaatje"]["name"]);
  $uploadOk = 1;
  $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

  move_uploaded_file($_FILES["plaatje"]["tmp_name"], $target_file);
}


//query om het voorwerpnummer te bepalen
$nRows = $dbh->query("SELECT count(*) FROM Voorwerp")->fetchColumn();
$voorwerpid = 1 + $nRows;

  $titel = $_POST["titel"];
  $beschrijving = $_POST["beschrijving"];
  $startprijs = $_POST["startprijs"];
  $betalingswijze = $_POST["betalingswijze"];
  $betalingsinstructie = $_POST["betalingsinstructie"];
  $plaats = $_POST["plaats"];
  $land = $_POST["land"];
  $looptijd = $_POST["looptijd"];
  $verzendkosten = $_POST["verzendkosten"];
  $verzendinstructies = $_POST["verzendinstructies"];
  $plaatje = basename($_FILES["plaatje"]["name"]);
  $hoogstenummer = $_POST["rij1"];
  $hoogste = $dbh->query("SELECT rubrieknaam FROM Rubriek WHERE rubrieknummer = '$hoogstenummer'")->fetchColumn();
  $koper = NULL; // Dit nog aanpassen naar session

  echo "Titel: " . $titel . '<br>' .
  "VoorwerpID: " . $voorwerpid . '<br>' .
  "Beschrijving: " . $beschrijving . '<br>' .
  "Startprijs: " . $startprijs . '<br>' .
  "Betalingswijze: " . $betalingswijze . '<br>' .
  "Betalingsinstructie: " . $betalingsinstructie . '<br>' .
  "Plaats: " . $plaats  . '<br>' .
  "Land: " . $land . '<br>' .
  "Looptijd: " . $looptijd  . '<br>' .
  "Verzendkosten: " . $verzendkosten . '<br>' .
  "Verzendinstructies: " . $verzendinstructies . '<br>' .
  "Hoogste rubriek: " . $hoogste  . '<br>' .
  "Plaatje: " . $plaatje  . '<br>' .
  "<img  src='img/veilingen/$plaatje'>"; ?>

  <form action="#" method="post">
    <div>
      <input type="hidden" name="titel" value="<?php echo $_POST["titel"] ?>">
      <input type="hidden" name="voorwerpid" value="<?php echo $_POST["voorwerpid"] ?>">
      <input type="hidden" name="beschrijving" value="<?php echo $_POST["beschrijving"] ?>">
      <input type="hidden" name="startprijs" value="<?php echo $_POST["startprijs"] ?>">
      <input type="hidden" name="betalingswijze" value="<?php echo $_POST["betalingswijze"] ?>">
      <input type="hidden" name="betalingsinstructie" value="<?php echo $_POST["betalingsinstructie"] ?>">
      <input type="hidden" name="plaats" value="<?php echo $_POST["plaats"] ?>">
      <input type="hidden" name="land" value="<?php echo $_POST["land"] ?>">
      <input type="hidden" name="looptijd" value="<?php echo $_POST["looptijd"] ?>">
      <input type="hidden" name="verzendkosten" value="<?php echo $_POST["verzendkosten"] ?>">
      <input type="hidden" name="verzendinstructies" value="<?php echo $_POST["verzendinstructies"] ?>">
      <input type="hidden" name="plaatje" value="<?php echo $_FILES["plaatje"]["name"] ?>">
      <input type="hidden" name="hoogste" value="<?php echo $_POST["rij1"] ?>">
      <input type="hidden" name="koper" value="<?php echo $_POST["koper"] ?>">
      <button type="submit" class="knop" name="bevestig">Plaats</button>
    </div>
  </form>
<br/>

<a href="verkooppage.php">Terug</a>

<?php

if (isset($_POST["bevestig"])){
    $begindag = date("Y/m/d");// Deze drie dingen nog verbeteren
    $einddag = date("Y-M-D");// Deze dus ook
    $plaatstijd = $_POST['time'];// En deze
    $veilinggesloten = 0;
    is_null($verkoopprijs);
    $plaatjeverwijdert;

    $titel = $_POST["titel"];
    $beschrijving = $_POST["beschrijving"];
    $startprijs = $_POST["startprijs"];
    $betalingswijze = $_POST["betalingswijze"];
    $betalingsinstructie = $_POST["betalingsinstructie"];
    $plaats = $_POST["plaats"];
    $land = $_POST["land"];
    $looptijd = $_POST["looptijd"];
    $verzendkosten = $_POST["verzendkosten"];
    $verzendinstructies = $_POST["verzendinstructies"];
    $plaatje = $_POST["plaatje"];
    $hoogste = $_POST["hoogste"];

    //query om de gebruikersnaam op te halen
    $logintoken = $_SESSION['login-token'];
    $sqlquery = $dbh->prepare("SELECT gebruikersnaam FROM Gebruiker WHERE gebruikersnaam = '$logintoken' OR mailbox = '$logintoken'");
    $sqlquery->setFetchMode(PDO::FETCH_ASSOC);
    $sqlquery->execute();
    $sessionQueryData = $sqlquery->fetch();
    $verkoper = $sessionQueryData['gebruikersnaam'];

    //query om het voorwerpnummer te bepalen
    $nRows = $dbh->query("SELECT count(*) FROM Voorwerp")->fetchColumn();
    $voorwerpid = 1 + $nRows;

  try{
  $query = $dbh->prepare("INSERT INTO Voorwerp
                          VALUES ('$voorwerpid','$titel','$beschrijving',
                                   '$startprijs','$betalingswijze','$betalingsinstructie',
                                   '$plaats','$land','$looptijd',
                                   '1-1-2018','12:00:00','$verzendkosten',
                                   '$verzendinstructies','$verkoper',NULL,
                                   '2-1-2018','12:00:01',0,NULL, 1, 0)");
  $query->execute();
  $query2 = $dbh->prepare("INSERT INTO VoorwerpInRubriek
                           VALUES ('$voorwerpid','$hoogste','$hoogste')");
  $query2->execute();
  $query3 = $dbh->prepare("INSERT INTO Bestand
                           VALUES ('$plaatje','$voorwerpid')");
  $query3->execute();
  header('Location: succes.php');
  }catch(PDOException $e) {
    unlink("img/veilingen/$plaatje");
    echo $verkoper . $e;
  }
}

?>

    </div>
  </div>

<?php include("footer.html"); ?>
</body>
