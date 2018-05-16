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
                    <th colspan="3">Acties</th>
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

            if (isset($_POST['save'])) {

                $rubrieknummer = $_POST['rubnummer'];
                $rubrieknaam = $_POST['rubnaam'];

                $query = $dbh->prepare("INSERT INTO Rubriek (rubrieknummer, rubrieknaam, rubriek) VALUES ('$rubrieknummer', '$rubrieknaam', '$rubriekroot')");

                $query->execute();
                header('location: dashboard.php');
            }
        }
        catch (PDOException $e) {
            echo $e;
        }

        include_once '../footer.html';
        ?>

    </table>
  </body>
</html>