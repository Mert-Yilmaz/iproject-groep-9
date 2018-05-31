<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 28-5-2018
 * Time: 10:56
 */

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
        <h1 class=text-center>Feedback</h1>
    </div>
    <div class="medium-3"></div>
</div>
<div class="grid-x">
  <div class="large-4 medium-3"></div>
    <div class="medium-6 small-12 large-4">
        <form class="registerform" method="POST" action="feedback.php">
            <div>
              <select name="feedback" required> <!-- Ophalen uit DB? -->
                  <option value disabled selected>Selecteer je feedback</option>
                  <option value="negatief">Negatief</option>
                  <option value="neutraal">Neutraal</option>
                  <option value="positief">Positief</option>
              </select>
            </div>
            <div>
                <input type="text" name="feedbackdesc" placeholder="commentaar (optioneel)" maxlength="12">
            </div>
            <div>
                <button type="submit" class="knop" name="geef_feedback">Geef feedback</button>
            </div>
        </form>
    </div>
    <!--<div class="medium-3 large-4"></div>-->

    <?php

    $feedback = $_POST['feedback']
    $voorwerp = $_GET['item'];
    $soortgebruiker = 'koper';
    $dag = date("Y-m-d");
    $tijd = date("H:i:s");
    if(!isset($_POST['feedbackdesc'])){
    $commentaar = "";
  } else{
    $commentaar = $_POST['feedbackdesc'];
  }

if(isset($_POST['geef_feedback'])){
    $sql = "INSERT INTO Feedback VALUES (?,?,?,?,?,?)";
    $stmt = $dbh->prepare($sql);
    $stmt->execute(array($voorwerp,$soortgebruiker,$feedback,$dag,$tijd,$commentaar));
  }
    include("footer.html");
    ?>
</body>
</html>
