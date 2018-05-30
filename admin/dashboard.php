<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 8-5-2018
 * Time: 11:06
 */

    //include '../navbar.php';
    include '../functions.php';
    include '../db.php';
    error_reporting(E_ALL ^ E_NOTICE);



try {
    $statement = $dbh->prepare("SELECT * FROM Rubriek WHERE rubriek = -1");
    $statement->setFetchMode(PDO::FETCH_ASSOC);
    $statement->execute();
}
catch(PDOException $e) {
    echo $e;
}

?>
<html class="no-js" lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>De beste veilingsite van Nederland!</title>
    <link rel="stylesheet" href="../css/foundation.css">
    <link rel="stylesheet" href="../css/app.css">
    <link rel="stylesheet" href="../css/admin/app.css"
  </head>
  <body>
    <table>
<!--        --><?php
//        $query = $dbh->query("SELECT rubrieknaam
//                                                            FROM	 Rubriek
//                                                            WHERE rubriek = -1
//                                                            ORDER BY rubrieknaam ASC");
//
//        $query->execute();
//
//        while($row = $query->fetch()) {
//            echo '<tr><td>' . $row['rubrieknaam'] . '</td><td><input type</td></tr>';
//        }
//        ?>

        <h1 class="text-center">Rubrieken</h1>
        <table>
            <thead>
                <tr>
                    <th>Rubrieknaam</th>
                    <th colspan="4">Acties</th>
                </tr>
            </thead>
            <tbody>
                <?php
                        while ($row = $statement->fetch()) {
                            ?>
                            <tr>
                                <td><?= $row['rubrieknaam'] ?></td>
                                <td>
                                    <a href="view.php?view_id=<?= $row['rubrieknummer'] ?>">Bekijk</a>
                                </td>
                                <td>
                                    <a href="edit.php?edit_id=<?= $row['rubrieknummer'] ?>">Wijzig</a>
                                </td>
                                <td>
                                <?php
                                if($row['isToegestaan'] == 0) { ?>
                                    <a href="faseren.php?fas_id=<?= $row['rubrieknummer'] ?>">Faseer in</a>
                                <?php } else if ($row['isToegestaan'] == 1) { ?>
                                    <a href="faseren.php?fas_id=<?= $row['rubrieknummer'] ?>">Faseer uit</a>
                                <?php } ?>
                                </td>
                                <td>
                                    <a onclick="return confirm('Weet je zeker dat je deze rubriek wilt verwijderen?')" href="delete.php?del_id=<?= $row['rubrieknummer'] ?>">Verwijder</a>
                                </td>
                            </tr>
                        <?php
                            }
                        ?>
            </tbody>
        </table>

        <form method="post" action="dashboard.php">
            <div class="input-group">
                <label>Rubrieknummer</label>
                <input type="text" name="rubnummer">
            </div>
            <div class="input-group">
                <label>Rubrieknaam</label>
                <input type="text" name="rubnaam">
            </div>
            <div>
                <button type="submit" name="save" class="btn">Opslaan</button>
            </div>
        </form>

        <?php
        try {
            $rubrieknummer = "";
            $rubrieknaam = "";
            $rubriekroot = -1;
            $volgnr = NULL;
            $isActief = 1;

            if (isset($_POST['save'])) {

                $rubrieknummer = $_POST['rubnummer'];
                $rubrieknaam = $_POST['rubnaam'];

                $query = $dbh->prepare("INSERT INTO Rubriek (rubrieknummer, rubrieknaam, rubriek, isToegestaan) VALUES ('$rubrieknummer', '$rubrieknaam', '$rubriekroot', '$isActief')");

                $query->execute();
                header('location: dashboard.php');
            }
        }
        catch (PDOException $e) {
            echo $e;
        }
        try {
            $gebruikersophalen = $dbh->prepare("SELECT * FROM Gebruiker");
            $gebruikersophalen->setFetchMode(PDO::FETCH_ASSOC);
            $gebruikersophalen->execute();
        }
        catch(PDOException $e) {
            echo $e;
        }
?>

    </table>
    <h1 class="text-center">Rubrieken</h1>
    <table>
        <thead>
            <tr>
                <th>Gebruikersnaam</th>
                <th colspan="4">Acties</th>
            </tr>
        </thead>
        <tbody>
            <?php
                    while ($row = $gebruikersophalen->fetch()) {
                        ?>
                        <tr>
                            <td><?= $row['gebruikersnaam'] ?></td>
                            <td>
                            <?php
                            if($row['isToegestaan'] == 1) { ?>
                                <a href="blokkeren.php?blok_id=<?= $row['gebruikersnaam'] ?>">Blokkeer</a>
                            <?php } else if ($row['isToegestaan'] == 0) { ?>
                                <a href="blokkeren.php?blok_id=<?= $row['gebruikersnaam'] ?>">Deblokkeren</a>
                            <?php } ?>
                            </td>
                        </tr>
                    <?php
                        }
                    ?>
        </tbody>
    </table>
    <?php
    try {
        $itemnaam = $_POST['itemnaam'];
        if(!isset($itemnaam)){
        $itemsophalen = $dbh->prepare("SELECT TOP 10 * FROM Voorwerp ORDER BY titel ASC");
      }
      else{
        $itemsophalen = $dbh->prepare("SELECT * FROM Voorwerp WHERE titel LIKE '%$itemnaam%'");
      }
        $itemsophalen->setFetchMode(PDO::FETCH_ASSOC);
        $itemsophalen->execute();
    }
    catch(PDOException $e) {
        echo $e;
    }
    ?>

    <h1 class="text-center">Items</h1>
    <table>
        <thead>
            <tr>
                <th>Voorwerpnummer</th>
                <th>Items</th>
                <th colspan="2">Acties</th>
            </tr>
        </thead>
        <tbody>
            <?php
                    while ($row = $itemsophalen->fetch()) {
                        ?>
                        <tr>
                            <td><a href="../detailpagina.php?item=<?= $row['voorwerpnummer']?>"><?= $row['voorwerpnummer']?></td>
                            <td><a href="../detailpagina.php?item=<?= $row['voorwerpnummer']?>"><?= $row['titel'] ?></td>
                            <td>
                            <?php
                            if($row['isToegestaan'] == 1) { ?>
                                <a href="itemblok.php?vp_id=<?= $row['voorwerpnummer'] ?>">Blokkeer</a>
                            <?php } else if ($row['isToegestaan'] == 0) { ?>
                                <a href="itemblok.php?vp_id=<?= $row['voorwerpnummer'] ?>">Deblokkeren</a>
                            <?php } ?>
                            </td>
                        </tr>
                    <?php
                        }
                    ?>
                    <form method="post" action="dashboard.php">
                        <div class="input-group">
                            <label>Zoek items</label>
                            <input type="text" name="itemnaam">
                        </div>
                        <div>
                            <button type="submit" name="zoekitems" class="btn">Zoek</button>
                        </div>
                    </form>
        </tbody>
    </table>
    <?php
    include_once '../footer.html';
    ?>

  </body>
</html>
