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
    <div class="grid-container fluid">
      <div class="grid-x grid-padding-x">
        <div class="cell large-4 text-center">
          <div class="grid-y">
            <div class="cell small-6 medium-8 large-2">
              <form method="post" action="">
                    <input type="text" name="zoekterm"/>
                    <input type="submit" name="zoeken" />
              </form>
              <?php
                echo '<ul class="ulNone">';
                    zoekRubriek($dbh, $_POST['zoekterm']);
                echo '</ul>';
              ?>
            </div>
            <div class="cell small-6 medium-4 large-10">
              <p>Hier komt waarschijnlijk geen tekst!</p>
            </div>
          </div>
        </div>
        <div class="cell large-8 text-center">
          <?php include 'orbit-slider.php'; ?>
        </div>
      </div>
      <div class="grid-x grid-padding-x">
        <div class="small-12 cell">
          <div class="callout">
            <h3 class="text-center">Welkom bij de beste veilingsite van Nederland!</h3>
            <p class="text-center">Bekijk hieronder populaire items of klik op een rubriek voor nog meer leuke koopjes!</p>
            <div class="grid-x grid-padding-x">
              <?php hot_items($dbh); ?>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/app.js"></script>
  </body>
</html>
