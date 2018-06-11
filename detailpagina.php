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
  $usernamemail = $_SESSION['login-token'];
  //is de pagina geblokkeerd?:
  $voorwerpnummer = $_GET['item'];
  $ItemBlok = $dbh->prepare("SELECT isToegestaan AS antwoord FROM Voorwerp
                            WHERE voorwerpnummer = :voorwerpnummer ");
  $ItemBlok->bindParam(':voorwerpnummer', $voorwerpnummer);
  $ItemBlok->execute();
  while($row = $ItemBlok->fetch()){
    if($row['antwoord'] == 0){
    header('Location: index.php');
    }
  }
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
            detailPagina($dbh);?>
            <div class= "grid-x padding-x text-center" style="margin-top:20px;">
              <div class="cell large-8 medium-7">
                <?php biedingenItem($dbh); ?>
              </div>
              <div class="cell large-4 medium-5">
                <?php
                $itemID = $_GET['item'];
                $geslotenQuery = $dbh->prepare("SELECT * FROM Voorwerp WHERE voorwerpnummer = '$itemID'");
                $geslotenQuery->setFetchMode(PDO::FETCH_ASSOC);
                $geslotenQuery->execute();
                $queryData = $geslotenQuery->fetch();
                $veilingGesloten = $queryData['veilingGesloten'];

                if(isset($_SESSION['login-token'])) {
                biedOpItem($dbh);
                    if($veilingGesloten == 1) {
                        echo "<p>Deze veiling is gesloten!</p>";
                    }
                } else {
                  echo "<a href='login-page.php'>Log in om te kunnen bieden</a>";
                } ?>
              </div>
          </div>
    </div>
    <?php include("footer.html"); ?>
    <script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/app.js"></script>
  </body>
</html>
