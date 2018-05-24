<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 24-5-2018
 * Time: 11:21
 */

include 'functions.php';
include_once 'db.php';
error_reporting(E_ALL ^ E_NOTICE);

if(isset($_POST['reg_user'])) {
    $email = $_POST['email'];
    $code = md5(rand(0,1000));

    //Uit te voeren query
    $insert = sqlsrv_query("UPDATE Gebruiker SET code='$code' WHERE mailbox='$email'");

    $to = $email;
    $from = "noreply@eenmaalandermaal9.nl";
    $subject = "Verificatie account EenmaalAndermaal (groep 9)";
    $message = 'Bedankt voor je registratie bij EenmaalAndermaal! Je hebt de onderstaande gegevens ingevuld:
    ---------------
    Gebruikersnaam: HIER KOMT DE USERNAME
    Email adres:' . $email . '
    ?Wachtwoord: HIER KOMT HET WACHTWOORD?
    ---------------
    
    Klik op de onderstaande link om je account te activeren en mee te bieden:
    <a href="verification.php">verify.php?email=' . $email . '&code=' . $code.'</a>';
    $headers = "From: " . $from;
    mail($to, $subject, $message, $headers);
    echo 'Er is een mail gestuurd naar' . $email . 'met een activatiecode.';
}

if(isset($_GET['email']) && isset($_GET['code'])) {
    $email = $_GET['email'];
    $code = $_GET['code'];

    //Uit te voeren query:
    $select = sqlsrv_query("SELECT email, code FROM Gebruiker WHERE email='$email' AND code='$code'");
    if(sqlsrv_num_rows($select) > 0) {
        //Uit te voeren query:
        $updateActief = sqlsrv_query("UPDATE Gebruiker SET actief=1 WHERE mailbox='$email'");
        //header('Location: index.php');
        echo '<script type="text/javascript">alert("Registratie voltooid! Log in en start met bieden!")</script>';
    }
}

?>
