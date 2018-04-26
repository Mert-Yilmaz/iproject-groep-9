<!doctype html>
<?php include 'navbar.php';
      include 'functions.php'; ?>
<html class="no-js" lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>De beste veilingsite van Nederland!</title>
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
  </head>
  <body>
    <div class="grid-container fluid">
      <div class="grid-x grid-padding-x">
        <div class="cell large-4 text-center">
          <div class="grid-y">
            <div class="cell small-6 medium-8 large-2">
              <form action="index.php" method="get">
              <input type="text" name="search" placeholder="Zoek naar items"/>
              <button class="succes button">Zoek</button>
              </form>
              <?php

              $allitems = "*";
              $dbh = get_database_connection();

              if(isset($_GET['search'])){
                  search_item($dbh, $_GET['search']);
              } else {
                  search_item($dbh, $allitems);
              }
              ?>
                <h2>Rubrieken</h2>
                <ul>
                  <li><a href="#">Auto's, motoren en boten</a></li>
                  <li><a href="#">Muziekwaren</a></li>
                  <li><a href="#">Verzamelen</a></li>
                  <li><a href="#">Computers</a></li>
                  <li><a href="#">Speelgoed & spellen</a></li>
                  <li><a href="#">Postzegels</a></li>
                  <li><a href="#">Boeken & strips</a></li>
                  <li><a href="#">Sieraden & horloges</a></li>
                  <li><a href="#">Consuentenelektronica</a></li>
                  <li><a href="#">Kunst, antiek & design</a></li>
                  <li><a href="#">Sport, fietsen & vakantie</a></li>
                  <li><a href="#">Modelbouw & miniatuur</a></li>
                  <li><a href="#">Hobby's & handwerken</a></li>
                  <li><a href="#">Munten & bankbiljetten</a></li>
                </ul>
            </div>
            <div class="cell small-6 medium-4 large-10">
              <p>Hier komt nog wat tekst!</p>
            </div>
          </div>
        </div>
        <div class="cell large-8">
          <div class="box">
            <div class="card-a"><img src="img/5.jpg"></div>
            <div class="card-a"><h2>Card</h2></div>
            <div class="card-b"><h2>Card</h2></div>
            <div class="card-a"><h2>Card</h2></div>
            <div class="card-b"><h2>Card</h2></div>
          </div>
        </div>
      </div>
      <div class="box">
        <div class="card-a"></div>
        <div class="card-b"></div>
        <div class="card-a"></div>
        <div class="card-b"></div>
      </div>
      <div class="grid-x grid-padding-x">
        <div class="large-8 cell">
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
    </div>

    <script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/app.js"></script>
  </body>
</html>