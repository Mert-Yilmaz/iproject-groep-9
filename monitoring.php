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
    <?php require 'navbar.php';?>

    <div class="grid-container fluid text-center">
      <div class="grid-x grid-padding-x">
        <div class="cell large-6">


          <?php

            $mvg = $dbh->prepare("SELECT TOP 5 VERKOPER, COUNT(VERKOPER) AS VERKOPERS
                                	FROM VOORWERP
                                	GROUP BY VERKOPER
                                	ORDER BY VERKOPERS DESC");

            $mvg->setFetchMode(PDO::FETCH_ASSOC);
            $mvg->execute();

          ?>
          <p>Meest verkopende gebruikers</p>
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

              $mbg = $dbh->prepare("SELECT TOP 5 GEBRUIKER, COUNT(GEBRUIKER) AS GEBRUIKERS
          	  FROM BOD
          	  GROUP BY GEBRUIKER
          	  ORDER BY GEBRUIKERS DESC");

              $mbg->setFetchMode(PDO::FETCH_ASSOC);
              $mbg->execute();

          ?>
          <p>Meest biedende gebruikers</p>
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

              $mkg = $dbh->prepare("SELECT TOP 5 KOPER, COUNT(KOPER) AS KOPERS
                                    FROM VOORWERP
                                    GROUP BY KOPER
                                    ORDER BY KOPERS DESC");

              $mkg->setFetchMode(PDO::FETCH_ASSOC);
              $mkg->execute();

            ?>
            <p>Meest kopende gebruikers</p>
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

          </div><div class="cell large-6">


            <?php

                $mvr = $dbh->prepare("SELECT TOP 5 VOORWERP, COUNT(VOORWERP) AS VOORWERPEN
                                      FROM BOD
                                      INNER JOIN VOORWERP ON VOORWERP = VOORWERPNUMMER
                                      GROUP BY VOORWERP
                                      ORDER BY VOORWERPEN DESC");

                $mvr->setFetchMode(PDO::FETCH_ASSOC);
                $mvr->execute();

            ?>
              <p>Populairste rubrieken -- UNDER CONSTROCTION --</p>
                <table>
                    <tr>
                        <th>Rubrieken</th>
                        <th>Aantal</th>
                    </tr>
                    <?php while ($row = $mvr->fetch()){?>
                    <tr>
                        <td><?= $row['VOORWERP']?></td>
                        <td><?= $row['VOORWERPEN']?></td>
                    </tr>
                    <?php }?>
                </table>

            <?php

                $mvr = $dbh->prepare("SELECT TOP 5 VOORWERP, TITEL, COUNT(VOORWERP) AS VOORWERPEN
                                  	FROM BOD
                                  	INNER JOIN VOORWERP ON VOORWERP = VOORWERPNUMMER
                                  	GROUP BY VOORWERP, TITEL
                                  	ORDER BY VOORWERPEN DESC");

                $mvr->setFetchMode(PDO::FETCH_ASSOC);
                $mvr->execute();

            ?>
              <p>Populairste items</p>
                <table>
                    <tr>
                        <th>Itemnummer</th>
                        <th>Itemnaam</th>
                        <th>Aantal</th>
                    </tr>
                    <?php while ($row = $mvr->fetch()){?>
                    <tr>
                        <td><?= $row['VOORWERP']?></td>
                        <td><?= $row['TITEL']?></td>
                        <td><?= $row['VOORWERPEN']?></td>
                    </tr>
                    <?php }?>
                </table>

          </div></div></div>

      <?php
          require 'footer.html';
      ?>
    </body>
</html>
