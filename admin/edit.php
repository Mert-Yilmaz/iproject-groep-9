<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 9-5-2018
 * Time: 11:06
*/

require '../db.php';

try{

    $edit_id = $_GET['edit_id'];

    $select = $dbh->prepare("SELECT * FROM Rubriek WHERE rubrieknummer='$edit_id' ");
    $select->setFetchMode(PDO::FETCH_ASSOC);
    $select->execute();
    $data=$select->fetch();

    if(isset($_POST['done']))
    {
        $rubrieknaam = $_POST['rubnaam'];


        $update = $dbh->prepare("UPDATE Rubriek SET rubrieknaam=:rubnaam WHERE rubrieknummer='$edit_id'");
        $update->bindParam(':rubnaam',$rubrieknaam);
        $update->execute();
        header("location: dashboard.php");
    }
}
catch(PDOException $e)
{
    echo "error:".$e->getMessage();
}
?>

<html class="no-js" lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EenmaalAndermaal - De beste veilingsite van Nederland!</title>
    <link rel="stylesheet" href="../css/foundation.css">
    <link rel="stylesheet" href="../css/app.css">
    <link rel="stylesheet" href="../css/admin/app.css"
  </head>
  <body><br>

    <form class="adminformulier" method="post">
        <p>Vul hieronder de nieuwe rubrieknaam in.</p>
        <input type="text" name="rubnaam" placeholder="Rubrieknaam" value="<?= $data['rubrieknaam'] ?>">
        <input type="submit" name="done" class="btn">
    </form>

    <?php

      include("footer.html");
    ?>
  </body>
  </html>
