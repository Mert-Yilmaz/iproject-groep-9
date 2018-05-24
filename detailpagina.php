<?php
  session_start();
  include 'functions.php';
  include_once 'db.php';
  error_reporting(E_ALL ^ E_NOTICE);
  $usernamemail = $_SESSION['login-token'];
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
    <div class="grid-container">
      <?php productBreadCrumbs($dbh, $_GET['rubriek']);
            toonItems($dbh, $_GET['rubriek']);
            detailPagina($dbh, $_GET['item']);

            if (isset($_POST["submit"])){
              $voorwerpnummer = $_GET['item'];
              $bodbedrag = $_POST["bodbedrag"];
              $boddag = $_POST["datum"];
              $bodtijdstip = $_POST["tijd"];
              $gebruiker = 'gebruiker5';
              try{ $query = $dbh->prepare("INSERT INTO Bod
                                     (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                      VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','1-1-2018','$bodtijdstip')");
              $query->execute();}
              catch(PDOException $e) {
              echo '<script type="text/javascript">alert("Gegevens niet goed ingevuld")</script>';
                }
              }
              ?>
    </div>
    <?php
    include("footer.html");
    ?>
    <script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/app.js"></script>
  </body>
</html>
