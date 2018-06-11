<?php
/**
 * Created by PhpStorm.
 * User: Mert Yilmaz
 * Date: 23-5-2018
 * Time: 12:28
 */

require 'db.php';

try {

    $editAccount = $_GET['edit_account'];

    $select = $dbh->prepare("SELECT * FROM Verkoper WHERE gebruiker='$editAccount' ");
    $select->setFetchMode(PDO::FETCH_ASSOC);
    $select->execute();
    $data=$select->fetch();

    if(isset($_POST['done']))
    {

        $bank = $_POST['bank'];
        $bankrekening = $_POST['bankrekening'];
        $controleoptie = $_POST['controle'];
        $creditcard = $_POST['creditcard'];

        $update = $dbh->prepare("UPDATE Verkoper
                                          SET bank='$bank',
                                              bankrekening='$bankrekening',
                                              controleoptie='$controleoptie',
                                              creditcard='$creditcard'
                                          WHERE gebruiker='$editAccount'");

        $update->execute();
        header('location: personpage.php');
    }
}
catch(PDOException $e)
{
    echo "error:".$e->getMessage();
}

$getBank = $data['bank'];
$getControle = $data['controleoptie'];

?>
<!doctype html>
<html class="no-js" lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>De beste veilingsite van Nederland!</title>
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="css/admin/app.css"
</head>
<body>
<br>
<form method="post">
    <div class="input-group">
        <label>Bank</label>
        <select name="bank">
            <option value="<?php echo $getBank; ?>" selected><?php echo $getBank; ?></option>
            <option value="ABN AMRO">ABN AMRO</option>
            <option value="ASN BANK">ASN BANK</option>
            <option value="ING">ING</option>
            <option value="RABOBANK">RABOBANK</option>
            <option value="SNS BANK">SNS BANK</option>
        </select>
    </div>
    <div class="input-group">
        <label>Bankrekening</label>
        <input type="text" name="bankrekening" value="<?= $data['bankrekening'] ?>">
    </div>
    <div class="input-group">
        <label>Controle optie</label>
        <input type="text" name="controle" value="<?= $data['controleoptie'] ?>" readonly>
    </div>
    <div class="input-group">
        <label>Creditcard</label>
        <input type="text" name="creditcard" value="<?= $data['creditcard'] ?>">
    </div>
    <div>
        <button type="submit" name="done" class="btn">Opslaan</button>
    </div>
</form>
