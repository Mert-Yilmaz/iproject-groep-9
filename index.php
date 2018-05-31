<?php
    session_start();
    require 'functions.php';
    require 'db.php';
    error_reporting(E_ALL ^ E_NOTICE);
    if(!isset($_SESSION['WelkomPopUp'])){
    $_SESSION['WelkomPopUp'];}
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
    <?php require 'navbar.php'; ?>
      <div class="grid-container fluid">
        <div class="grid-x grid-padding-x">
          <div class="cell large-2 text-center">
            <div class="grid-y">
              <div class="cell small-6 medium-8 large-2"><br>
                <form method="post" action="">
                  <input type="text" name="zoekterm" placeholder="Zoeken..."/>
                  <div class="dertig"><input type="text" name="minprijs" placeholder="minprijs..."/></div>
                  <div class="dertig"><input type="text" name="maxprijs" placeholder="maxprijs..."/></div>
                  <select name="order">
                    <option value="rubrieknaam ASC">A-Z</option>
                    <option value="rubrieknaam DESC">Z-A</option>
                    <option value="COUNT ASC">Groot-Klein</option>
                    <option value="COUNT DESC">Klein-Groot</option>
                  </select>
                  <input type="submit" name="zoeken" value="Zoek / Order" class="knop">
                </form>
                <br>
                <h1>Groepen</h1>
                <?php
                  echo '<ul class="ulNone">';
                  zoekRubriek($dbh, $_POST['zoekterm'], $_POST['order']);
                  echo '</ul>';
                ?>
              </div>
            </div>
          </div>
        <div class="cell large-8 text-center">
          <br>
          <div class="grid-x grid-padding-x">
            <div class="small-12 cell">
              <div class="callout">
                <h3 class="text-center">Welkom bij de beste veilingsite van Nederland!</h3>
                <p class="text-center">Zoek hieronder naar leuke items of klik op de menubalk om een account aan te maken. </p>
              <div class="grid-x grid-padding-x">
                <?php hot_items($dbh); ?>
              </div>
            </div>
          </div>
        </div>
        <?php require 'orbit-slider.php'; ?>
        <div class="grid-x grid-padding-x">
          <div class="small-12 cell">
            <div class="callout">
              <h3 class="text-center">Deze items lopen binnenkort af! Bied snel!</h3>
              <div class="grid-x grid-padding-x">
                <?php ending_items($dbh); ?>
              </div>
            </div>
          </div>
        </div>
        <div class="grid-x grid-padding-x">
          <div class="small-12 cell">
            <div class="callout">
              <h3 class="text-center">Deze items hebben nog geen hoge biedingen! Bied snel!</h3>
              <div class="grid-x grid-padding-x">
                <?php cheap_items($dbh); ?>
              </div>
            </div>
          </div>
        </div>
      </div>
        <script src="js/vendor/jquery.js"></script>
        <script src="js/vendor/what-input.js"></script>
        <script src="js/vendor/foundation.js"></script>
        <script src="js/app.js"></script>
        <?php
          require 'footer.html';
          if (!isset($_SESSION['WelkomPopUp'])){
              echo '<script type="text/javascript">alert("Welkom, zie ons privacybeleid")</script>';
              $_SESSION['WelkomPopUp'] = 1;}
        ?>
    </body>
  </html>
