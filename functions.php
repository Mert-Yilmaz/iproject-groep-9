<?php
//Database Connection
include_once 'db.php';
function get_database_connection() {
$hostname = "mssql.iproject.icasites.nl";
$username = "iproject9";
$password = "PXDDupJ2bw";
$dbname   = "iproject9";
try {
    $dbh = new PDO ("sqlsrv:Server=$hostname;
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

//Haalt gegevens uit 'Vraag'
$output;
function search_item($dbh, $input){
  $query;
  if ($input == "*"){
      $query = "SELECT * FROM Vraag";
  } else {
      $query = "SELECT top 50 * FROM Vraag WHERE [tekstvraag] LIKE '%$input%'";
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

//Hot Items (Selecteert 3 items met de meest recente biedingen)
function hot_items($dbh){
  $output="";
  $sql = "SELECT TOP (3) * FROM Voorwerp v
          INNER JOIN Bod b on b.voorwerp = v.voorwerpnummer
          INNER JOIN Bestand be on be.voorwerp = v.voorwerpnummer
          ORDER BY boddag DESC";
  $stmt = $dbh->prepare($sql);
  $stmt->execute();
  while ($row = $stmt->fetch()) {
    $title = $row['titel'];
    $desc = $row['beschrijving'];
    $number = $row['voorwerpnummer'];
    $file = "img/veilingen/" . $row['filenaam'];
    $endtime = date_create($row['looptijdEindeTijdstip']);
    $endday = date_create($row['looptijdEindeDag']);
    $output .=
    '<div class="large-4 medium-4 small-12 cell">
        <h4 style="margin: 0;"><a href="producten.php?item=' . $number . '">
        ' . $title . '</a></h4>
        <p>' . $desc . '</p>
        <p>Veiling eindigt om: <strong>' . date_format($endtime, "H:i:s") . '</strong> op: <strong>
        ' . date_format($endday, "d/m/Y") . '</strong><p>
        <div class="homepage-items-img">
            <img src=' . $file . '>
        </div>
     </div>';
  }
  echo $output;
}

//Aflopende Items (Selecteert 3 items die het snelst aflopen)
function ending_items($dbh){
  $output="";
  $sql = "SELECT TOP (3) * FROM Voorwerp v
          INNER JOIN Bod b on b.voorwerp = v.voorwerpnummer
          INNER JOIN Bestand be on be.voorwerp = v.voorwerpnummer
          ORDER BY looptijdEindeDag, looptijdEindeTijdstip ASC";
  $stmt = $dbh->prepare($sql);
  $stmt->execute();
  while ($row = $stmt->fetch()) {
    $title = $row['titel'];
    $desc = $row['beschrijving'];
    $number = $row['voorwerpnummer'];
    $file = "img/veilingen/" . $row['filenaam'];
    $endtime = date_create($row['looptijdEindeTijdstip']);
    $endday = date_create($row['looptijdEindeDag']);
    $output .=
    '<div class="large-4 medium-4 small-12 cell">
        <h4 style="margin: 0;"><a href="producten.php?item=' . $number . '">
        ' . $title . '</a></h4>
        <p>' . $desc . '</p>
        <p>Veiling eindigt om: <strong>' . date_format($endtime, "H:i:s") . '</strong> op: <strong>
        ' . date_format($endday, "d/m/Y") . '</strong><p>
        <div class="homepage-items-img">
            <img src=' . $file . '>
        </div>
     </div>';
  }
echo $output;
}

//Laaggeboden Items (Selecteert 3 items met de laagste biedingen)
function cheap_items($dbh){
  $output="";
  $sql = "SELECT TOP (3) * FROM Voorwerp v
          INNER JOIN Bod b on b.voorwerp = v.voorwerpnummer
          INNER JOIN Bestand be on be.voorwerp = v.voorwerpnummer
          ORDER BY startprijs-bodbedrag DESC";
  $stmt = $dbh->prepare($sql);
  $stmt->execute();
  while ($row = $stmt->fetch()) {
    $title = $row['titel'];
    $desc = $row['beschrijving'];
    $number = $row['voorwerpnummer'];
    $file = "img/veilingen/" . $row['filenaam'];
    $endtime = date_create($row['looptijdEindeTijdstip']);
    $endday = date_create($row['looptijdEindeDag']);
    $output .=
    '<div class="large-4 medium-4 small-12 cell">
        <h4 style="margin: 0;"><a href="producten.php?item=' . $number . '">
        ' . $title . '</a></h4>
        <p>' . $desc . '</p>
        <p>Veiling eindigt om: <strong>' . date_format($endtime, "H:i:s") . '</strong> op: <strong>
        ' . date_format($endday, "d/m/Y") . '</strong><p>
        <div class="homepage-items-img">
            <img src=' . $file . '>
        </div>
     </div>';
  }
  echo $output;
}


// Zoek naar RUBRIEKEN op hoofdpagina
function zoekRubriek($dbh, $zoekWoord, $order) {
  if($order == "COUNT ASC") {
      $order = 'SELECT *
                          FROM	Rubriek r INNER JOIN VoorwerpInRubriek v ON r.rubrieknummer = v.rubriekOpHoogsteNiveau
                          WHERE rubriek = -1
                          GROUP BY rubrieknummer, rubrieknaam, rubriek, volgnr, voorwerp, rubriekOpHoogsteNiveau, rubriekOpLaagsteNiveau
                          ORDER BY COUNT(rubrieknummer) ASC';
  }
  if($order == "COUNT DESC") {
      $order = 'SELECT *
                          FROM	Rubriek r INNER JOIN VoorwerpInRubriek v ON r.rubrieknummer = v.rubriekOpHoogsteNiveau
                          WHERE rubriek = -1
                          GROUP BY rubrieknummer, rubrieknaam, rubriek, volgnr, voorwerp, rubriekOpHoogsteNiveau, rubriekOpLaagsteNiveau
                          ORDER BY COUNT(rubrieknummer) DESC';
  }
  if($order == "rubrieknaam ASC") {
      $order = 'SELECT *
                                FROM	Rubriek
                                WHERE rubriek = -1
                                ORDER BY rubrieknaam ASC';
  }
  if($order == "rubrieknaam DESC") {
      $order = 'SELECT *
                                FROM	Rubriek
                                WHERE rubriek = -1
                                ORDER BY rubrieknaam DESC';
  }
  if(isset($_POST['zoeken']) && $_POST['zoekterm'] !== "") {
    echo "<div class='$zoekWoord'>";
    echo "U heeft gezocht op: " . $zoekWoord . "</div>";
    $query = $dbh->query("SELECT *
                          FROM	Rubriek
                          WHERE rubriek = -1
                          AND   rubrieknaam LIKE '%$zoekWoord%'
                          ORDER BY rubrieknaam ASC");
   } else if(isset($_POST['order'])) {
     $query = $dbh->query($order);
   }
   else { $query = $dbh->query('SELECT *
                               FROM	Rubriek
                               WHERE rubriek = -1
                               ORDER BY rubrieknaam ASC');
   }
   try{
     $query->execute();
     $rubriek = $row['rubrieknaam'];
     while($row = $query->fetch()) {
         echo '<li><a href="producten.php?rubriek=' . $row['rubrieknaam'] . '">
              ' . $row['rubrieknaam'] . ' (';
         echo aantalItems($dbh, $row['rubrieknummer']);
         echo ')</a></li>';
     }
   } catch(PDOException $e) {
       echo "Er is iets mis gegaan. De foutmelding is: $e";
   }
}

// Haalt het antal items op in een Rubriek
function aantalItems($dbh, $rubrieknummer) {
  $query = $dbh->prepare("SELECT COUNT(rubrieknummer) AS Aantal_items
                          FROM	 Rubriek r INNER JOIN VoorwerpInRubriek v
                          ON r.rubrieknummer = v.rubriekOpHoogsteNiveau
                          WHERE  rubriekOpHoogsteNiveau = :rubrieknummer");
  $query->bindParam(':rubrieknummer', $rubrieknummer);
  $query->execute();
  while($row = $query->fetch()) {
      echo $row['Aantal_items'];
  }
}

// Toont PRODUCTEN op producten.php
function toonItems($dbh, $zoekWoord) {
  try{
      $query = $dbh->prepare("SELECT *
                              FROM	Voorwerp v
                              INNER JOIN VoorwerpInRubriek vi
                              ON v.voorwerpnummer = vi.voorwerp
                              INNER JOIN Rubriek r
                              ON r.rubrieknummer = vi.rubriekOpHoogsteNiveau
                              WHERE r.rubrieknaam
                              LIKE :zoekwoord
                              ORDER BY v.looptijdEindeTijdstip ASC");
      $query->bindParam(':zoekwoord', $zoekWoord);
      $query->execute();
      while($row = $query->fetch()) {
          echo "<li>". $row['titel'] . ":
               ". $row['beschrijving'] . "</li>";
      }
  } catch(PDOException $e) {
      echo "Er is iets mis gegaan. De foutmelding is: $e";
  }
}

//Toont BREADCRUMBS voor Producten
function productBreadCrumbs($dbh, $zoekWoord) {
  $breadcrumb;
  if(isset($_GET['rubriek'])) {
    $breadcrumb .= '<nav aria-label="You are here: "role="navigation">
                   <ul class="breadcrumbs">
                   <li><a href="index.php">Home</a></li>';
                   if(isset($_GET['rubriek2'])) {
                    $breadcrumb .=  '<li><a href="producten.php?rubriek='
                                    . $_GET['rubriek2'] . '">' . $_GET['rubriek2']
                                    . '</a></li>';
                   }
                   $breadcrumb .= '<li>' . $_GET['rubriek'] . '</li>
                                  </ul></nav';
    echo $breadcrumb;
    echo Category($dbh, $zoekWoord);
}
  else { echo '<nav aria-label="You are here: "role="navigation">
              <ul class="breadcrumbs">
              <li><a href="index.php">Home</a></li>
              <li>Producten</li>
              </ul>
              </nav';
  }
}

//Toont BREADCRUMBS voor de website
function breadCrumbs($dbh, $zoekWoord) {
  echo '<nav aria-label="You are here: "role="navigation">
        <ul class="breadcrumbs">
        <li><a href="index.php">Home</a></li>
        <li>' . $zoekWoord . '</li>
        </ul>
        </nav';
}

// Haalt RUBRIEKEN op de Database
function Category($dbh, $zoekWoord) {
  $query = $dbh->prepare("SELECT *
                          FROM	 Rubriek
                          WHERE rubrieknaam = :zoekwoord");
  $query->bindParam(':zoekwoord', $zoekWoord);
  $query->execute();
  while($row = $query->fetch()) {
    $rubrieknummer = $row['rubrieknummer'];
    $rubrieknaam = $row['rubrieknaam'];
    subCategory($dbh, $rubrieknummer, $rubrieknaam);
  }
}

// Haalt SUBRUBRIEKEN op de Database
function subCategory($dbh, $rubrieknummer, $rubrieknaam) {
  $query = $dbh->prepare("SELECT *
                          FROM	 Rubriek
                          WHERE rubriek = :rubrieknummer");
  $query->bindParam(':rubrieknummer', $rubrieknummer);
  $query->execute();
  while($row = $query->fetch()) {
    echo '<li><a href="producten.php?rubriek=' . $row['rubrieknaam'] .
         '&rubriek2=' . $rubrieknaam . '">
         ' . $row['rubrieknaam'] . '</a></li>';
  }
}
?>
