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

    <form method="post">
        <input type="text" name="rubnaam" placeholder="Rubrieknaam" value="<?= $data['rubrieknaam'] ?>">
        <input type="submit" name="done">
    </form>