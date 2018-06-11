<?php
/**
 * Created by PhpStorm.
 * User: demiv
 * Date: 4-6-2018
 * Time: 11:23
 */

include_once "db.php";

echo "
    <table>
        <tr>
            <th>ID</th>
            <th>Titel</th>
            <th>Beschrijving</th>
            <th>Categorie</th>
            <th>Postcode</th>
            <th>Locatie (land)</th>
            <th>Land (afkorting)</th>
            <th>Verkoper</th>
            <th>Prijs</th>
            <th>Valuta</th>
            <th>Conditie</th>
            <th>Thumbnail</th>
        </tr>
";

$getData = $dbh->prepare("SELECT * FROM Items");
$getData->setFetchMode(PDO::FETCH_ASSOC);
$getData->execute();

while ($itemData = $getData->fetch()) {
    $itemID = $itemData['ID'];
    $itemTitel = $itemData['Titel'];
    $itemBeschrijving = $itemData['Beschrijving'];
    $itemCategorie = $itemData['Categorie'];
    $itemPostcode = $itemData['Postcode'];
    $itemLocatie = $itemData['Locatie'];
    $itemLand = $itemData['Land'];
    $itemVerkoper = $itemData['Verkoper'];
    $itemPrijs = $itemData['Prijs'];
    $itemValuta = $itemData['Valuta'];
    $itemConditie = $itemData['Conditie'];
    $itemThumbnail = $itemData['Thumbnail'];

    $stripHTMLBeschrijving = $dbh->prepare("UPDATE Items
                                            SET Beschrijving = (SELECT [dbo].[udf_StripHTML]((SELECT Beschrijving
                                            FROM Items
                                            WHERE ID = '$itemID'))) WHERE ID='$itemID'");
    $stripHTMLBeschrijving->execute();

    echo "
    <tr>
        <td>$itemID</td>
        <td>$itemTitel</td>
        <td>$itemBeschrijving</td>
        <td>$itemCategorie</td>
        <td>$itemPostcode</td>
        <td>$itemLocatie</td>
        <td>$itemLand</td>
        <td>$itemVerkoper</td>
        <td>$itemPrijs</td>
        <td>$itemValuta</td>
        <td>$itemConditie</td>
        <td>$itemThumbnail</td>
    </tr>
    ";
}
echo "</table>";
?>
