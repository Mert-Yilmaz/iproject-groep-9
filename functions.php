<?php
//Database Connection
include_once 'db.php';
function get_database_connection() {
$hostname = "mssql.iproject.icasites.nl";
$username = "iproject9";
$password = "PXDDupJ2bw";
$dbname   = "iproject9";
try {$dbh = new PDO ("sqlsrv:Server=$hostname;
    Database=$dbname;
    ConnectionPooling=0",
    "$username", "$password");
    // set the PDO error mode to exception
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $dbh;
    }
catch(PDOException $e)
    {
    echo "Error: " . $e->getMessage();
    }
}

//Haal gegevens uit 'Vraag'
$output;
function search_item($dbh, $input){
    $query;
    if ($input == "*"){
        $query = "SELECT * FROM Vraag";
    } else {
        $query = "SELECT top 50 * FROM Vraag WHERE [tekstvraag] LIKE '%$input%'" ;
    }
    $output = "";
    $input = preg_replace('#[^0-9a-z]#i','',$input);
    $sqlexe = $dbh -> prepare($query);
    $sqlexe -> execute();
    while ($row = $sqlexe -> fetch()){
        $vraagnr = $row['vraagnummer'];
        $tekstvraag = $row['tekstvraag'];
        $output .=
        '<div><strong>Vraagnummer: ' . $vraagnr . '</strong></div>
        <div><strong>Tekstvraag: ' . $tekstvraag . '</strong></div>'
        ;
    }
    echo $output;
}

//Hot Items (Werkt inmiddels BIJNA!!!)
$output;
function hot_items($dbh){
    $output="";
        $sql = "SELECT * FROM Voorwerp v INNER JOIN Bod b on b.voorwerp = v.voorwerpnummer ORDER BY bodtijdstip ASC";
        $stmt = $dbh->prepare($sql);
        $stmt->execute(array($nummer));
        while ($row = $stmt->fetch()) {
            $title = $row['titel'];
            $desc = $row['beschrijving'];
            $day = $row['looptijdBeginDag'];
            $output .=
            '<div class="grid-x grid-padding-x">
              <div class="small-12 cell">
                <div class="callout">
                  <h3 class="text-center">Welkom bij de beste veilingsite van Nederland!</h3>
                  <p class="text-center">Zoek hieronder naar leuke items of klik op de menubalk om een account aan te maken.</p>
                  <div class="grid-x grid-padding-x">
                    <div class="large-4 medium-4 small-12 cell">
                      <p><a href="#" class="success button">' . $title . '</a>
                      <br />' . $desc . '</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>';
            }
    echo $output;
}

// Zoek naar Rubrieken op hoofdpagina
function zoekRubriek($dbh, $zoekWoord) {
    if(isset($_POST['zoeken'])) {
        echo "<div class='$zoekWoord'>";
        echo "U heeft gezocht op: " . $zoekWoord . "</div>";
    }
    try{
        $query = $dbh->query("SELECT rubrieknaam
                                                      FROM	 Rubriek
                                                      WHERE rubriek = -1
                                                      ORDER BY rubrieknaam ASC");
        if(isset($_POST['zoeken'])) {
            $query = $dbh->query("SELECT rubrieknaam
                                                      FROM	 Rubriek
                                                      WHERE rubriek = -1
                                                      AND rubrieknaam LIKE '%$zoekWoord%'
                                                      ORDER BY rubrieknaam ASC");
        }
        $query->execute();
        $rubriek = $row['rubrieknaam'];
        while($row = $query->fetch()) {
            echo '<li><a href="producten.php?rubriek=' . $row['rubrieknaam'] . '">
                 ' . $row['rubrieknaam'] . '</a></li>';
        }
    } catch(PDOException $e) {
        echo "Er is iets mis gegaan. De foutmelding is: $e";
    }
}

// Toont Items op producten.php
function toonItems($dbh, $zoekWoord) {
    if(isset($_GET['rubriek'])) {
        echo "Categorie: " . $zoekWoord . "</div>";
    }
    try{
        $query = $dbh->query("SELECT *
                                              FROM	Voorwerp v
                                              INNER JOIN VoorwerpInRubriek vi
                                              ON v.voorwerpnummer = vi.voorwerp INNER JOIN Rubriek r on r.rubrieknummer = vi.rubriekOpHoogsteNiveau
                                              WHERE r.rubrieknaam
                                              LIKE '%$zoekWoord%'
                                              ORDER BY v.looptijdEindeTijdstip ASC");
        $query->execute();
        while($row = $query->fetch()) {
            echo '<li>'. $row['titel'] . ':
                 '. $row['beschrijving'] . '</li>';
        }
    } catch(PDOException $e) {
        echo "Er is iets mis gegaan. De foutmelding is: $e";
    }
}

?>
