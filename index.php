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
    <link rel="icon" href="img/logo2.PNG">
  </head>
  <body>
    <div class="grid-container fluid">
      <div class="grid-x grid-padding-x">
        <div class="cell large-2 text-center">
          <div class="grid-y">
            <div class="cell small-6 medium-8 large-2">
                <br>
              <form method="post" action="">
                    <input type="text" name="zoekterm" placeholder="Zoeken..."/>
                    <input type="submit" name="zoeken" value="Zoek..." class="btn"/>
              </form>
                <br>
                <h1>Groepen</h1>
              <?php
                echo '<ul class="ulNone">';
                    zoekRubriek($dbh, $_POST['zoekterm']);
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
                <p class="text-center">Zoek hieronder naar leuke items of klik op de menubalk om een account aan te maken.</p>
                <div class="grid-x grid-padding-x">
                  <div class="large-4 medium-4 small-12 cell">
                    <p><a href="#" class="success button">Veilingitem 1</a>
                    <br />Hier staat de beschrijving van product 1</p>
                  </div>
                  <div class="large-4 medium-4 small-12 cell">
                    <p><a href="#" class="success button">Veilingitem 2</a>
                    <br />Hier staat de beschrijving van product 2</p>
                  </div>
                  <div class="large-4 medium-4 small-12 cell">
                    <p><a href="#" class="success button">Veilingitem 3</a>
                    <br />Hier staat de beschrijving van product 3</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <?php include 'orbit-slider.php'; ?>
        </div>
      </div>
    </div>

    <script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/app.js"></script>
    <?php
    include_once 'footer.html';
    ?>
  </body>
</html>
