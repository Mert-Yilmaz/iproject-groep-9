/**
 * Created by Atom
 * User: Jeffrey Kragten
 * Date: 25-5-2018
 * Time: 12:34
 */
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

          $target_dir = "img/veilingen/";
          $target_file2 = $target_dir . basename($_FILES["plaatje2"]["name"]);
          $uploadOk = 1;
          $imageFileType2 = strtolower(pathinfo($target_file2,PATHINFO_EXTENSION));
          move_uploaded_file($_FILES["plaatje2"]["tmp_name"], $target_file2);

          $target_dir = "img/veilingen/";
          $target_file3 = $target_dir . basename($_FILES["plaatje3"]["name"]);
          $uploadOk = 1;
          $imageFileType3 = strtolower(pathinfo($target_file3,PATHINFO_EXTENSION));
          move_uploaded_file($_FILES["plaatje3"]["tmp_name"], $target_file3);

          $target_dir = "img/veilingen/";
          $target_file4 = $target_dir . basename($_FILES["plaatje4"]["name"]);
          $uploadOk = 1;
          $imageFileType4 = strtolower(pathinfo($target_file4,PATHINFO_EXTENSION));
          move_uploaded_file($_FILES["plaatje4"]["tmp_name"], $target_file4);
        }

          $titel = $_POST["titel"];
          $voorwerpid = $_POST["voorwerpid"];
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
          $plaatje2 = basename($_FILES["plaatje2"]["name"]);
          $plaatje3 = basename($_FILES["plaatje3"]["name"]);
          $plaatje4 = basename($_FILES["plaatje4"]["name"]);
          $hoogstenummer = $_POST["rij1"];
          $hoogste = $dbh->query("SELECT rubrieknaam FROM Rubriek WHERE rubrieknummer = '$hoogstenummer'")->fetchColumn();
          $tijd = $_POST["time"];
          $voorwerpid = 1 + $nRows;
          $dag = $_POST['day'];
          $date1 = str_replace('-', '/', $begindag);
          $einddag = date('m-d-Y',strtotime($date1 . "+$looptijd days"));

          echo
          "Titel: " . $titel . '<br>' .
          "Beschrijving: " . $beschrijving . '<br>' .
          "Startprijs: " . $startprijs . '<br>' .
          "Betalingswijze: " . $betalingswijze . '<br>' .
          "Plaats: " . $plaats . '<br>' .
          "Land: " . $land . '<br>' .
          "Looptijd: " . $looptijd . '<br>' .
          "Verzendkosten: " . $verzendkosten . '<br>' .
          "Verzendinstructies: " . $verzendinstructies . '<br>' .
          "Hoogste rubriek: " . $hoogste  . '<br>' .
          "Tijd: " . $tijd . '<br>' .
          "Dag: " . $dag . '<br>' .
          "Einddag: " . $einddag . '<br>' .
          "<img  src='img/veilingen/$plaatje'>";
          "Foto: " . $plaatje  . '<br>' .
          "<img src='img/veilingen/$plaatje'>" . '<br>';
          if(!empty($plaatje2)) {
            echo "Foto 2: " . $plaatje2  . '<br>';
            echo "<img src='img/veilingen/$plaatje2'>" . '<br>';
          }
          if(!empty($plaatje3)) {
            echo "Foto 3: " . $plaatje3  . '<br>';
            echo "<img src='img/veilingen/$plaatje3'>" . '<br>';
          }
          if(!empty($plaatje4)) {
            echo "Foto 4: " . $plaatje4  . '<br>';
            echo "<img src='img/veilingen/$plaatje4'>" . '<br>';
          }
          ?>

  <form action="succes.php" method="post">
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
      <input type="hidden" name="plaatje2" value="<?php echo $_FILES["plaatje2"]["name"] ?>">
      <input type="hidden" name="plaatje3" value="<?php echo $_FILES["plaatje3"]["name"] ?>">
      <input type="hidden" name="plaatje4" value="<?php echo $_FILES["plaatje4"]["name"] ?>">
      <input type="hidden" name="hoogste" value="<?php echo $_POST["rij1"] ?>">
      <input type="hidden" name="koper" value="<?php echo $_POST["koper"] ?>">
      <input type="hidden" name="tijd" value="<?php echo $_POST["time"] ?>">
      <input type="hidden" name="dag" value="<?php echo $_POST["day"] ?>">
      <button type="submit" class="knop" name="bevestig">Plaats</button>
    </div>
  </form>
<br/>

<a href="verkooppage.php">Terug</a>

    </div>
  </div>

<?php include("footer.html"); ?>
</body>
