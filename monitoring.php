<?php
    session_start();
    require 'functions.php';
    require 'db.php';
    error_reporting(E_ALL ^ E_NOTICE);
    if(!isset($_SESSION['WelkomPopUp'])){
    $_SESSION['WelkomPopUp'];}
    if(!isset($top)){
      $top = 2;
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
    <?php require 'navbar.php';?>

    <div class="grid-container fluid text-center">
      <div class="grid-x grid-padding-x">
        <div class="cell large-3"></div>
        <div class="cell large-6">

          <form method="POST">
              <h2>Selecteer hier het aantal records dat u wilt zien in de onderstaande tabellen.</h2>
              <select name="top">
                  <option value disabled selected>Selecteer het aantal records</option>
                  <option value=1>1</option>
                  <option value=3>3</option>
                  <option value=5>5</option>
                  <option value=10>10</option>
                  <option value=15>15</option>
                  <option value=20>20</option>
                  <option value=20>50</option>
                  <option value=20>100</option>
                  <option value=20>150</option>
                  <option value=20>200</option>
              </select>
              <button type="submit" class="knop" name="top-submit">verzenden</button>
          </form>

          <?php

            if(isset($_POST['top-submit']) && isset($_POST['top'])){
              $top = $_POST['top'];
            }
            else {
              $top = 3;
            }
            $mvg = $dbh->prepare("SELECT TOP $top VERKOPER, COUNT(VERKOPER) AS VERKOPERS
                                	FROM VOORWERP
                                  WHERE YEAR(LooptijdBeginDag) = YEAR(CURRENT_TIMESTAMP)
                                	GROUP BY VERKOPER
                                	ORDER BY VERKOPERS DESC");

            $mvg->setFetchMode(PDO::FETCH_ASSOC);
            $mvg->execute();

          ?>
          <h2>Meest verkopende gebruikers</h2>
          <p>Verkopers die afgelopen jaar de meeste advertenties hebben gepost.</p>
            <table>
                <tr>
                    <th>Verkoper</th>
                    <th>Aantal</th>
                </tr>
                    <?php while ($row = $mvg->fetch()){?>
                <tr>
                    <td><?= $row['VERKOPER']?></td>
                    <td><?= $row['VERKOPERS']?></td>
              </tr>
              <?php }?>
            </table>

          <?php

              $mbg = $dbh->prepare("SELECT TOP $top GEBRUIKER, COUNT(GEBRUIKER) AS GEBRUIKERS
          	  FROM BOD
              WHERE YEAR(BodDag) = YEAR(CURRENT_TIMESTAMP)
          	  GROUP BY GEBRUIKER
          	  ORDER BY GEBRUIKERS DESC");

              $mbg->setFetchMode(PDO::FETCH_ASSOC);
              $mbg->execute();

          ?>
          <h2>Meest biedende gebruikers</h2>
          <p>Gebruikers die afgelopen jaar het meest hebben geboden.</p>
            <table>
                <tr>
                    <th>Gebruiker</th>
                    <th>Aantal</th>
                </tr>
                    <?php while ($row = $mbg->fetch()){?>
                <tr>
                    <td><?= $row['GEBRUIKER']?></td>
                    <td><?= $row['GEBRUIKERS']?></td>
                </tr>
                <?php }?>
            </table>

          <?php

              $mkg = $dbh->prepare("SELECT TOP $top KOPER, COUNT(KOPER) AS KOPERS
                                    FROM VOORWERP
                                    WHERE YEAR(LooptijdEindeDag) = YEAR(CURRENT_TIMESTAMP)
                                    GROUP BY KOPER
                                    ORDER BY KOPERS DESC");

              $mkg->setFetchMode(PDO::FETCH_ASSOC);
              $mkg->execute();

            ?>
            <h2>Meest kopende gebruikers</h2>
            <p>Gebruikers die afgelopen jaar de meeste veilingen hebben gewonnen.</P>
            <table>
                <tr>
                    <th>Koper</th>
                    <th>Aantal</th>
                </tr>
                <?php while ($row = $mkg->fetch()){?>
                <tr>
                    <td><?= $row['KOPER']?></td>
                    <td><?= $row['KOPERS']?></td>
                </tr>
                <?php }?>
            </table>

            <?php

                $mvr = $dbh->prepare("SELECT TOP $top R.rubrieknaam, COUNT(V.voorwerpnummer) AS aantal
                                    	FROM Voorwerp V INNER JOIN VoorwerpInRubriek VR ON VR.voorwerp = V.voorwerpnummer
                                    	INNER JOIN Rubriek R ON R.rubrieknummer = VR.rubriekOpLaagsteNiveau
                                    	GROUP BY R.rubrieknaam
                                    	ORDER BY aantal DESC");

                $mvr->setFetchMode(PDO::FETCH_ASSOC);
                $mvr->execute();

            ?>
              <h2>Populairste rubrieken </h2>
              <p>Rubrieken waar de meeste lopende advertenties in staan.</p>
                <table>
                    <tr>
                        <th>Rubrieken</th>
                        <th>Aantal</th>
                    </tr>
                    <?php while ($row = $mvr->fetch()){?>
                    <tr>
                        <td><?= $row['rubrieknaam']?></td>
                        <td><?= $row['aantal']?></td>
                    </tr>
                    <?php }?>
                </table>

            <?php

                $mvr = $dbh->prepare("SELECT TOP $top VOORWERP, TITEL, COUNT(VOORWERP) AS VOORWERPEN
                                  	FROM BOD
                                  	INNER JOIN VOORWERP ON VOORWERP = VOORWERPNUMMER
                                  	GROUP BY VOORWERP, TITEL
                                  	ORDER BY VOORWERPEN DESC");

                $mvr->setFetchMode(PDO::FETCH_ASSOC);
                $mvr->execute();

            ?>
              <h2>Populairste items</h2>
              <p>Items waar het vaakst op is geboden.</p>
                <table>
                    <tr>
                        <th>Itemnummer</th>
                        <th>Itemnaam</th>
                        <th>Aantal keer geboden</th>
                    </tr>
                    <?php while ($row = $mvr->fetch()){?>
                    <tr>
                        <td><?= $row['VOORWERP']?></td>
                        <td><?= $row['TITEL']?></td>
                        <td><?= $row['VOORWERPEN']?></td>
                    </tr>
                    <?php }?>
                </table>
            </div>
        </div>
      </div>

      <?php
          require 'footer.html';
      ?>
    </body>
</html>
