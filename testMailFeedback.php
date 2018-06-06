<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 31-5-2018
 * Time: 12:06
 */

require 'db.php';

/*
 * Als de veiling is afgelopen (gesloten == 1) moet de hoogste bieder (als hij/zij er is (koper IS NOT NULL)) een mail krijgen met een verzoek
 * om feedback te geven. Hierbij wordt de link gestuurd met het itemnummer ($_GET['item']). Hierop wordt feedback gegeven en in de database
 * verwerkt.
 */

/*http://iproject9.icasites.nl/feedback.php?item=1*/

//gegevens ophalen
//gegevens in variabelen stoppen
//if veiling afgelopen
//if verkoper is not null
//verstuur mail met link

/*Link wordt geopend*/
/*http://iproject9.icasites.nl/feedback.php?item=1*/
//als er geen feedback is
//insert feedback waar nummer = get item
//else
//geef melding? terug naar index

//if veiling sluit stuur mail (if today >
$getdata = $dbh->prepare("SELECT * FROM Voorwerp WHERE veilingGesloten=1");

/*
 * Het versturen van de mail werkt alleen als het online staat. De code hiervoor is als volgt:
 *
 * $to = email van user (in dit geval de koper (als deze niet NULL is), kan uit db gehaald worden)
 * $from = 'noreply@eenmaalandermaal9.nl';
 * $subject = Onderwerp mail (iets in de richting van 'U heeft gewonnen, geef feedback op het item [titel])
 * $message = het bericht. Een voorbeeld zou kunnen zijn:
 * 'Het item $titel is verlopen en u bent de hoogste bieder! Om feedback te geven dient u de volgende link te bezoeken:
 * http://iproject9.icasites.nl/feedback.php?item=' . $item . '';
 * $headers = 'From: ' . $from . "\r\n";
 * mail($to, $subject, $message, $headers);
 */