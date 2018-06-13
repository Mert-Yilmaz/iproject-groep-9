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

zendMailVerloopVeiling($dbh);

//Hot Items (Selecteert 3 items met de meest recente biedingen)
function hot_items($dbh){
  $output="";
  $sql = "SELECT TOP (3) * FROM Voorwerp v
          INNER JOIN Bod b on b.voorwerp = v.voorwerpnummer
          INNER JOIN Bestand be on be.voorwerp = v.voorwerpnummer
          WHERE isToegestaan = 1 AND v.veilingGesloten = 0
          ORDER BY boddag DESC";
  $stmt = $dbh->prepare($sql);
  $stmt->execute();
  while ($row = $stmt->fetch()) {
    $title = $row['titel'];
    $desc = $row['beschrijving'];
    $number = $row['voorwerpnummer'];
    
    $bestandQuery = $dbh->prepare("SELECT TOP(1) * FROM Bestand WHERE voorwerp = '$number'");
    $bestandQuery->setFetchMode(PDO::FETCH_ASSOC);
    $bestandQuery->execute();
    while($bestandData = $bestandQuery->fetch()) {
        $directory = '';
        $file1 = $bestandData['filenaam'];

        if(substr( $file1, 0, 3 ) === "dt_") {
              $directory = 'http://iproject9.icasites.nl/pics/';
          } else {
              $directory = 'img/veilingen/';
          }
          $file = $directory . $file1;
    }
      
    $endtime = date_create($row['looptijdEindeTijdstip']);
    $endday = date_create($row['looptijdEindeDag']);
    $output .=
    '<div class="large-4 medium-4 small-12 cell">
        <h4 style="margin: 0;"><a href="detailpagina.php?item=' . $number . '">
        ' . $title . '</a></h4>
        <p>' . $desc . '</p>
        <p>Veiling eindigt om: <strong>' . date_format($endtime, "H:i:s") . '</strong> op: <strong>
        ' . date_format($endday, "d/m/Y") . '</strong></p>
        <div class="homepage-items-img">
            <a href="detailpagina.php?item=' . $number . '"><img src=' . $file . '></a>
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
          WHERE isToegestaan = 1 AND v.veilingGesloten = 0
          ORDER BY looptijdEindeDag, looptijdEindeTijdstip ASC";
  $stmt = $dbh->prepare($sql);
  $stmt->execute();
  while ($row = $stmt->fetch()) {
    $title = $row['titel'];
    $desc = $row['beschrijving'];
    $number = $row['voorwerpnummer'];
    
      $bestandQuery = $dbh->prepare("SELECT TOP(1) * FROM Bestand WHERE voorwerp = '$number'");
    $bestandQuery->setFetchMode(PDO::FETCH_ASSOC);
    $bestandQuery->execute();
    while($bestandData = $bestandQuery->fetch()) {
        $directory = '';
        $file1 = $bestandData['filenaam'];

        if(substr( $file1, 0, 3 ) === "dt_") {
              $directory = 'http://iproject9.icasites.nl/pics/';
          } else {
              $directory = 'img/veilingen/';
          }
          $file = $directory . $file1;
    }
      
    $endtime = date_create($row['looptijdEindeTijdstip']);
    $endday = date_create($row['looptijdEindeDag']);
    $output .=
    '<div class="large-4 medium-4 small-12 cell">
        <h4 style="margin: 0;"><a href="detailpagina.php?item=' . $number . '">
        ' . $title . '</a></h4>
        <p>' . $desc . '</p>
        <p>Veiling eindigt om: <strong>' . date_format($endtime, "H:i:s") . '</strong> op: <strong>
        ' . date_format($endday, "d/m/Y") . '</strong><p>
        <div class="homepage-items-img">
            <a href="detailpagina.php?item=' . $number . '"><img src=' . $file . '></a>
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
          WHERE isToegestaan = 1 AND v.veilingGesloten = 0
          ORDER BY startprijs-bodbedrag DESC";
  $stmt = $dbh->prepare($sql);
  $stmt->execute();
  while ($row = $stmt->fetch()) {
    $title = $row['titel'];
    $desc = $row['beschrijving'];
    $number = $row['voorwerpnummer'];
    
      $bestandQuery = $dbh->prepare("SELECT TOP(1) * FROM Bestand WHERE voorwerp = '$number'");
    $bestandQuery->setFetchMode(PDO::FETCH_ASSOC);
    $bestandQuery->execute();
    while($bestandData = $bestandQuery->fetch()) {
        $directory = '';
        $file1 = $bestandData['filenaam'];

        if(substr( $file1, 0, 3 ) === "dt_") {
              $directory = 'http://iproject9.icasites.nl/pics/';
          } else {
              $directory = 'img/veilingen/';
          }
          $file = $directory . $file1;
    }
      
    $endtime = date_create($row['looptijdEindeTijdstip']);
    $endday = date_create($row['looptijdEindeDag']);
    $output .=
    '<div class="large-4 medium-4 small-12 cell">
        <h4 style="margin: 0;"><a href="detailpagina.php?item=' . $number . '">
        ' . $title . '</a></h4>
        <p>' . $desc . '</p>
        <p>Veiling eindigt om: <strong>' . date_format($endtime, "H:i:s") . '</strong> op: <strong>
        ' . date_format($endday, "d/m/Y") . '</strong><p>
        <div class="homepage-items-img">
            <a href="detailpagina.php?item=' . $number . '"><img src=' . $file . '></a>
        </div>
     </div>';
  }
  echo $output;
}
// Zoek naar RUBRIEKEN op hoofdpagina
function zoekRubriek($dbh, $zoekWoord, $order, $keywords, $minprijs, $maxprijs) {
  if($order == "COUNT ASC") {
      $order = 'SELECT *
                          FROM	Rubriek r INNER JOIN VoorwerpInRubriek v ON r.rubrieknummer = v.rubriekOpHoogsteNiveau
                          WHERE rubriek = -1 AND r.isToegestaan = 1
                          GROUP BY rubrieknummer, rubrieknaam, rubriek, volgnr, voorwerp, rubriekOpHoogsteNiveau, rubriekOpLaagsteNiveau
                          ORDER BY COUNT(rubrieknummer) ASC';
  }
  if($order == "COUNT DESC") {
      $order = 'SELECT *
                          FROM	Rubriek r INNER JOIN VoorwerpInRubriek v ON r.rubrieknummer = v.rubriekOpHoogsteNiveau
                          WHERE rubriek = -1 AND r.isToegestaan = 1
                          GROUP BY rubrieknummer, rubrieknaam, rubriek, volgnr, voorwerp, rubriekOpHoogsteNiveau, rubriekOpLaagsteNiveau
                          ORDER BY COUNT(rubrieknummer) DESC';
  }
  if($order == "rubrieknaam ASC") {
      $order = 'SELECT *
                                FROM	Rubriek
                                WHERE rubriek = -1 AND isToegestaan = 1
                                ORDER BY rubrieknaam ASC';
  }
  if($order == "rubrieknaam DESC") {
      $order = 'SELECT *
                                FROM	Rubriek
                                WHERE rubriek = -1 AND isToegestaan = 1
                                ORDER BY rubrieknaam DESC';
  }
  if(isset($_POST['zoeken']) && $_POST['zoekterm'] !== "") {
    echo "<div class='$zoekWoord'>";
    echo "U heeft gezocht op: " . $zoekWoord . "</div>";
    $query = $dbh->query("SELECT *
                          FROM	Rubriek
                          WHERE rubriek = -1
                          AND   rubrieknaam LIKE '%$zoekWoord%' AND isToegestaan = 1
                          ORDER BY rubrieknaam ASC");
   } else if(isset($_POST['order'])) {
     $query = $dbh->query($order);
   }
   else { $query = $dbh->query('SELECT *
                               FROM	Rubriek
                               WHERE rubriek = -1 AND isToegestaan = 1
                               ORDER BY rubrieknaam ASC');
   }
   if($keywords == ""){
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
 else if ($keywords !== "" && $minprijs == "" && $maxprijs == ""){
   echo "<div class='$zoekWoord'>";
   $parts = explode(" ", $keywords);
   echo "U heeft gezocht op: " . $keywords . "</div>";
   //for ($i=0; $i < count($parts); $i++) {
     //$query = $dbh->query("SELECT * FROM	Voorwerp WHERE titel LIKE '%$parts[$i]%' OR beschrijving LIKE '%$parts[$i]%' ");

     $sql = "SELECT * FROM Voorwerp WHERE (veilingGesloten = 0) ";

foreach($parts as $k){
    $sql .= " AND (titel LIKE '%$k%' OR beschrijving LIKE '%$k%') ";
}

//$result = mysql_query($sql);

     try{
       $sql = $dbh->query($sql);
       $sql->execute();
       //$item = $row['titel'];
       while($row = $sql->fetch()) {
           echo '<li><a href="detailpagina.php?item=' . $row['voorwerpnummer'] . '">
                ' . $row['titel'] . '(€' . $row['startprijs'] . ')';
       }
     } catch(PDOException $e) {
         echo "Er is iets mis gegaan. De foutmelding is: $e";
     }
   }
 else if ($keywords !== "" && $minprijs !== "" && $maxprijs == ""){
     echo "<div class='$zoekWoord'>";
     $parts = explode(" ", $keywords);
     echo "U heeft gezocht op: " . $keywords . "</div>";
     //for ($i=0; $i < count($parts); $i++) {
       //$query = $dbh->query("SELECT * FROM	Voorwerp WHERE titel LIKE '%$parts[$i]%' OR beschrijving LIKE '%$parts[$i]%' ");

       $sql = "SELECT * FROM Voorwerp WHERE (veilingGesloten = 0) ";

  foreach($parts as $k){
      $sql .= " AND (titel LIKE '%$k%' OR beschrijving LIKE '%$k%') ";
  }
      $sql .= " AND (startprijs >= $minprijs)";

  //$result = mysql_query($sql);

       try{
         $sql = $dbh->query($sql);
         $sql->execute();
         //$item = $row['titel'];
         while($row = $sql->fetch()) {
             echo '<li><a href="detailpagina.php?item=' . $row['voorwerpnummer'] . '">
                  ' . $row['titel'] . '(€' . $row['startprijs'] . ')';
         }
       } catch(PDOException $e) {
           echo "Er is iets mis gegaan. De foutmelding is: $e";
       }
     }
  else if ($keywords !== "" && $minprijs == "" && $maxprijs !== ""){
         echo "<div class='$zoekWoord'>";
         $parts = explode(" ", $keywords);
         echo "U heeft gezocht op: " . $keywords . "</div>";
         //for ($i=0; $i < count($parts); $i++) {
           //$query = $dbh->query("SELECT * FROM	Voorwerp WHERE titel LIKE '%$parts[$i]%' OR beschrijving LIKE '%$parts[$i]%' ");

           $sql = "SELECT * FROM Voorwerp WHERE (veilingGesloten = 0) ";

      foreach($parts as $k){
          $sql .= " AND (titel LIKE '%$k%' OR beschrijving LIKE '%$k%') ";
      }
          $sql .= " AND (startprijs <= $maxprijs)";

      //$result = mysql_query($sql);

           try{
             $sql = $dbh->query($sql);
             $sql->execute();
             //$item = $row['titel'];
             while($row = $sql->fetch()) {
                 echo '<li><a href="detailpagina.php?item=' . $row['voorwerpnummer'] . '">
                      ' . $row['titel'] . '(€' . $row['startprijs'] . ')';
             }
           } catch(PDOException $e) {
               echo "Er is iets mis gegaan. De foutmelding is: $e";
           }
         }
         else if ($keywords !== "" && $minprijs !== "" && $maxprijs !== "" && $minprijs <= $maxprijs){
                echo "<div class='$zoekWoord'>";
                $parts = explode(" ", $keywords);
                echo "U heeft gezocht op: " . $keywords . "</div>";
                //for ($i=0; $i < count($parts); $i++) {
                  //$query = $dbh->query("SELECT * FROM	Voorwerp WHERE titel LIKE '%$parts[$i]%' OR beschrijving LIKE '%$parts[$i]%' ");

                  $sql = "SELECT * FROM Voorwerp WHERE (veilingGesloten = 0) ";

             foreach($parts as $k){
                 $sql .= " AND (titel LIKE '%$k%' OR beschrijving LIKE '%$k%') ";
             }
                 $sql .= " AND (startprijs >= $minprijs AND startprijs <= $maxprijs)";

             //$result = mysql_query($sql);

                  try{
                    $sql = $dbh->query($sql);
                    $sql->execute();
                    //$item = $row['titel'];
                    while($row = $sql->fetch()) {
                        echo '<li><a href="detailpagina.php?item=' . $row['voorwerpnummer'] . '">
                             ' . $row['titel'] . '(€' . $row['startprijs'] . ')';
                    }
                  } catch(PDOException $e) {
                      echo "Er is iets mis gegaan. De foutmelding is: $e";
                  }
                }
         else if ($keywords !== "" && $minprijs !== "" && $maxprijs !== "" && $minprijs > $maxprijs){
           header("Location: index.php");
         }
}
//}
// Haalt het antal items op in een Rubriek
function aantalItems($dbh, $rubrieknummer) {
  $query = $dbh->prepare("SELECT COUNT(rubrieknummer) AS Aantal_items
                          FROM	 Rubriek r INNER JOIN VoorwerpInRubriek v
                          ON r.rubrieknummer = v.rubriekOpHoogsteNiveau
                          INNER JOIN Voorwerp vv
                          ON v.voorwerp = vv.voorwerpnummer
                          WHERE vv.isToegestaan = 1 AND vv.veilingGesloten = 0 AND rubriekOpHoogsteNiveau = :rubrieknummer");
  $query->bindParam(':rubrieknummer', $rubrieknummer);
  $query->execute();
  while($row = $query->fetch()) {
      echo $row['Aantal_items'];
  }
}


// Haalt het antal items op in een Rubriek
function aantalItemsSub($dbh, $rubrieknummer, $rubriek) {
  $query = $dbh->prepare("SELECT COUNT(rubrieknummer) AS Aantal_items
                          FROM	 Rubriek r INNER JOIN VoorwerpInRubriek v
                          ON r.rubrieknummer = v.rubriekOpLaagsteNiveau
                          INNER JOIN Voorwerp vv
                          ON v.voorwerp = vv.voorwerpnummer
                          WHERE vv.isToegestaan = 1 AND vv.veilingGesloten = 0 AND rubriekOpLaagsteNiveau = :rubrieknummer");
  $query->bindParam(':rubrieknummer', $rubrieknummer);
  $query->execute();
  while($row = $query->fetch()) {
    if($row['Aantal_items'] != 0){
      echo $row['Aantal_items'];
      }
    }
}


// Toont PRODUCTEN op producten.php
function toonItems($dbh, $zoekWoord) {
  try{
      $query = $dbh->prepare("SELECT *, v.voorwerpnummer
                              FROM	Voorwerp v
                              INNER JOIN VoorwerpInRubriek vi
                              ON v.voorwerpnummer = vi.voorwerp
                              INNER JOIN Rubriek r
                              ON r.rubrieknummer = vi.rubriekOpHoogsteNiveau
                              WHERE v.isToegestaan = 1 AND v.veilingGesloten = 0 AND vi.rubriekOpLaagsteNiveau IN (SELECT rubrieknummer
                                                                  FROM Rubriek
                                                                  WHERE rubrieknaam LIKE :zoekwoord)
                              ORDER BY v.looptijdEindeTijdstip ASC");
      $query->bindParam(':zoekwoord', $zoekWoord);
      $query->execute();
      while($row = $query->fetch()) {
          echo "<li><a href='detailpagina.php?item=". $row['voorwerpnummer'] . "'><strong>" . $row['titel'] . '</strong></a> ||' . ' startprijs: ' . $row['startprijs'] . '</li>';
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
         '&rubriek2=' . $rubrieknaam . '" class="rubrieken">
         ' . $row['rubrieknaam'] . '</a></li>';
         echo aantalItemsSub($dbh, $row['rubrieknummer'], $row['rubriek']);
  }
}
// Laat de details van een item zien
function detailPagina($dbh) {
    $getNummer = $_GET['item'];

    $queryVoorwerpgegevens = $dbh->prepare("SELECT * FROM Voorwerp WHERE voorwerpnummer = '$getNummer'"); //voorwerpnummer = :voorwerpnummer?
    //$queryVoorwerpgegevens->bindParam(':voorwerpnummer',$getNummer);?
    $queryVoorwerpgegevens->setFetchMode(PDO::FETCH_ASSOC);
    $queryVoorwerpgegevens->execute();
    while($voorwerpData = $queryVoorwerpgegevens->fetch()) {
        $titel = $voorwerpData['titel'];
        $verkoper = $voorwerpData['verkoper'];
        $beschrijving = $voorwerpData['beschrijving'];
        $plaats = $voorwerpData['plaatsnaam'];
        $betalingsinstructie = $voorwerpData['betalingsinstructie'];
        $betalingswijze = $voorwerpData['betalingswijze'];
        $land = $voorwerpData['land'];
        $vraagprijs = $voorwerpData['verkoopprijs'];
        $startprijs = $voorwerpData['startprijs'];
        $looptijddagen = $voorwerpData['looptijd'];
        $einddatum = $voorwerpData['looptijdEindeDag'];
        $eindtijd = $endtime = date_create($voorwerpData['looptijdEindeTijdstip']);

        echo "<h1 class= 'aboutkop'> " . $titel  . "</h1><br>
    <div class='grid-x grid-padding-x imageborder'>
      <div class='small-12'>
        <div class='orbit' role='region' aria-label='Favorite Space Pictures' data-orbit>
          <div class='orbit-wrapper'>
            <div class='orbit-controls'>
              <button class='orbit-previous'><span class='show-for-sr'>Previous Slide</span>&#9664;&#xFE0E;</button>
              <button class='orbit-next'><span class='show-for-sr'>Next Slide</span>&#9654;&#xFE0E;</button>
            </div>
            <ul class='orbit-container'>";

        //slider
        $bestandQuery = $dbh->prepare("SELECT * FROM Bestand WHERE voorwerp = '$getNummer'");
        $bestandQuery->setFetchMode(PDO::FETCH_ASSOC);
        $bestandQuery->execute();
        while($bestandData = $bestandQuery->fetch()) {
            $directory = '';
            $file1 = $bestandData['filenaam'];
            if(substr( $file1, 0, 3 ) === "dt_") {
                $directory = 'http://iproject9.icasites.nl/pics/';
            } else {
                $directory = 'img/veilingen/';
            }
            $file = $directory . $file1;

            $illustratieArray['filenaam'] = $file;

            foreach($illustratieArray as $image) {
                echo "<li class='orbit-slide'>
                        <figure class='orbit-figure'>
                            <img class='orbit-image' src= " . $image . " alt='Space'>
                        </figure>
                    </li>";
            }
        }

        echo "
        </ul>
          </div>
        </div>
      </div>
    </div>
    <div class= 'grid-x grid-padding-x' style='padding-top: 2%;'>
      <div class= 'cell large-8 medium-7'>
        <table>
          <tr>
            <th>Verkoper</th>
            <td>" . $verkoper . "</td>
          </tr>
          <tr>
            <th>Beschrijving</th>
            <td>" . htmlspecialchars($beschrijving) . "</td>
          </tr>
          <tr>
            <th>Plaats</th>
            <td>" . $plaats . "</td>
          </tr>
          <tr>
            <th>Betalingsinstructie</th>
            <td>" . $betalingsinstructie . "</td>
          </tr>
          <tr>
            <th>Betalingswijze</th>
            <td>" . $betalingswijze . "</td>
         </tr>
          <tr>
            <th>Land</th>
            <td>" . $land . "</td>
          </tr>
        </table>
      </div>
      <div class='cell large-4 medium-5 right'>
        <table>
          <tr>
            <th>Vraagprijs</th>
            <td> €" . $vraagprijs . ",- </td>
          </tr>
          <tr>
            <th>Startprijs</th>
            <td> €" . $startprijs . ",- </td>
          </tr>
          <tr>
            <th>Looptijd</th>
            <td>" . $looptijddagen . " dagen</td>
          </tr>
          <tr>
            <th>Einddatum</th>
            <td>" . $einddatum . "</td>
          </tr>
            <tr>
            <th>Tijdstip einde</th>
            <td>" . date_format($eindtijd, "H:i:s") . "</td>
          </tr>
        </table>
      </div>
    </div>";
    }
}
// Toont details van de 3 hoogste biedingen op het Item
function biedingenItem($dbh) {
  $voorwerpnummer = $_GET['item'];
  try{
    $query = $dbh->prepare("SELECT TOP(3) *
                            FROM Bod
                            WHERE voorwerp = $voorwerpnummer
                            ORDER BY bodbedrag DESC");
    $query->execute();
  } catch(PDOException $e) {
      echo '<script type="text/javascript">alert("Gegevens niet goed ingevuld")</script>';
  }
  while($row = $query->fetch()){
    $bodbedrag = $row['bodbedrag'];
    $gebruiker = $row['gebruiker'];
    $boddag = $row['boddag'];
    $bodtijdstip = date_create($row['bodtijdstip']);
    echo "<ul>
          <li>Geboden bodbedrag: €$bodbedrag,-</li>
          <li>Geboden door: $gebruiker<li>
          <li>Datum: $boddag</li>
          <li>Tijdstip: " . date_format($bodtijdstip, 'H:i:s'). " </li>
          </ul>";
  }
}


// Gebruiker plaatst een bod binnen de richtlijnen
function biedOpItem($dbh) {
    echo "<form action='#' method='POST'>
            <input type='text' name='bodbedrag' placeholder='Vul hier uw gewenste bod in.'>
            <input type='hidden' name='datum' value=" . date("m/d/Y") . ">
            <input type='hidden' name='tijd' value=" . date("H:i") . ">
            <input type='submit' class='knop' value='Bied' name='submit'>
          </form>";
    if (isset($_POST["submit"])) {
        $voorwerpnummer = $_GET['item'];
        $bodbedrag = $_POST["bodbedrag"];
        $boddag = $_POST["datum"];
        $bodtijdstip = $_POST["tijd"];
        $usernamemail = $_SESSION['login-token'];

        $voorwerpQuery = $dbh->prepare("SELECT * FROM Voorwerp WHERE voorwerpnummer = '$voorwerpnummer'");
        $voorwerpQuery->setFetchMode(PDO::FETCH_ASSOC);
        $voorwerpQuery->execute();
        $voorwerpData = $voorwerpQuery->fetch();
        $veilingGesloten = $voorwerpData['veilingGesloten'];

        if ($veilingGesloten == 0) {
            try {
                $query = $dbh->prepare("SELECT *
                              FROM Gebruiker
                              WHERE gebruikersnaam = '$usernamemail'
                              OR mailbox = '$usernamemail'");
                $query->setFetchMode(PDO::FETCH_ASSOC);
                $query->execute();
                $data = $query->fetch();
                $gebruiker = $data['gebruikersnaam'];
            } catch (PDOException $e) {
                echo '<script type="text/javascript">alert("Gegevens niet goed ingevuld")</script>';
            }
            try {
                $query = $dbh->prepare("SELECT TOP(1) *
                              FROM Bod
                              WHERE voorwerp = $voorwerpnummer
                              ORDER BY bodbedrag DESC");
                $query->setFetchMode(PDO::FETCH_ASSOC);
                $query->execute();
                $data = $query->fetch();
                $hoogstebod = $data['bodbedrag'];
            } catch (PDOException $e) {
                echo '<script type="text/javascript">alert("Gegevens niet goed ingevuld")</script>';
            }
            try {
                if ($bodbedrag < 50) {
                    if ($bodbedrag >= $hoogstebod + 0.5) {
                        $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','$boddag','$bodtijdstip')");
                        $query->execute();
                    } else throw new PDOException ("Bedrag te laag!");
                }
                if ($bodbedrag >= 50 && $bodbedrag < 500) {
                    if ($bodbedrag >= $hoogstebod + 1) {
                        $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','$boddag','$bodtijdstip')");
                        $query->execute();
                    } else throw new PDOException ($e);
                }
                if ($bodbedrag >= 500 && $bodbedrag < 1000) {
                    if ($bodbedrag >= $hoogstebod + 5) {
                        $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','$boddag','$bodtijdstip')");
                        $query->execute();
                    } else throw new PDOException ($e);
                }
                if ($bodbedrag >= 1000 && $bodbedrag < 5000) {
                    if ($bodbedrag >= $hoogstebod + 10) {
                        $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','$boddag','$bodtijdstip')");
                        $query->execute();
                    } else throw new PDOException ($e);
                }
                if ($bodbedrag >= 5000) {
                    if ($bodbedrag >= $hoogstebod + 50) {
                        $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','$boddag','$bodtijdstip')");
                        $query->execute();
                    } else throw new PDOException ($e);
                }
            } catch (PDOException $e) {
                echo '<script type="text/javascript">alert("Bedrag te laag!")</script>';
            }
        }
    }
}

//Versturen van een mail (1 dag voor verloopdatum)
function zendMailVerloopVeiling($dbh) {
    if(isset($_SESSION['login-token'])) {
        $logintoken = $_SESSION['login-token'];
        $sqlquery = $dbh->prepare("SELECT gebruikersnaam FROM Gebruiker WHERE gebruikersnaam = '$logintoken' OR mailbox = '$logintoken'");
        $sqlquery->setFetchMode(PDO::FETCH_ASSOC);
        $sqlquery->execute();
        $sessionQueryData = $sqlquery->fetch();
        $sessionGebruikersnaam = $sessionQueryData['gebruikersnaam'];
        $getGebruikersnaamQuery = $dbh->prepare("SELECT gebruikersnaam FROM Gebruiker WHERE gebruikersnaam = '$sessionGebruikersnaam'");
        $getGebruikersnaamQuery->setFetchMode(PDO::FETCH_ASSOC);
        $getGebruikersnaamQuery->execute();
        $getGebruikersnaamData = $getGebruikersnaamQuery->fetch();
        $getGebruikersnaam = $getGebruikersnaamData['gebruikersnaam'];
        $query = $dbh->prepare("SELECT V.voorwerpnummer, V.titel, V.looptijdEindeDag, V.looptijdEindeTijdstip, V.isMailVerstuurd, G.mailbox
                                 FROM Voorwerp V INNER JOIN Gebruiker G ON v.verkoper = G.gebruikersnaam
                                 WHERE V.verkoper='$getGebruikersnaam'");
        $query->setFetchMode(PDO::FETCH_ASSOC);
        $query->execute();
        $data = $query->fetch();
        $voorwerpnummer = $data['voorwerpnummer'];
        $titel = $data['titel'];
        $enddate = $data['looptijdEindeDag'];
        $endtime = $data['looptijdEindeTijdstip'];
        $isMailVerstuurd = $data['isMailVerstuurd'];
        $email = $data['mailbox'];
        $day = date('d', strtotime($enddate));
        $month = date('m', strtotime($enddate));
        $year = date('Y', strtotime($enddate));
        $hour = date('H', strtotime($endtime));
        $minute = date('i', strtotime(($endtime)));
        $seconds = date('s', strtotime($endtime));
        $from_unix_time = mktime($hour, $minute, $seconds, $month, $day, $year);
        $day_before = strtotime("yesterday", $from_unix_time);
        $formatted = date("Y-m-d", $day_before);
        $today = date("Y-m-d");
        if ($today >= $formatted && $isMailVerstuurd == 0) {
            $to = $email;
            $from = 'noreply@eenmaalandermaal9.nl';
            $subject = 'Uw veiling verloopt morgen!';
            $message = '
            Beste ' . $getGebruikersnaam . ',
            Je veiling ' . $titel . ' verloopt morgen!';
            $headers = 'From: ' . $from . "\r\n";
            mail($to, $subject, $message, $headers);
            $sql = $dbh->prepare("UPDATE Voorwerp
                                   SET isMailVerstuurd=1
                                   WHERE voorwerpnummer=$voorwerpnummer");
            $sql->setFetchMode(PDO::FETCH_ASSOC);
            $sql->execute();

            $getdata = $dbh->prepare("SELECT * FROM Voorwerp v inner join Gebruiker g on g.gebruikersnaam = v.koper WHERE v.veilingGesloten=1 AND v.isMailVerstuurdFeedback = 0");
            $getdata->execute();
            while ($row = $getdata->fetch()){
            $to = $row['mailbox'];
            $from = 'noreply@eenmaalandermaal9.nl';
            $subject = 'Geef feedback op uw gewonnen veiling';
            $message = 'Beste ' . $row['voornaam'] . ',
            Gefeliciteerd met het winnen van de veiling ' . $row['titel'] . '! Met behulp van de onderstaande link kunt u feedback geven op de veiling.
            http://iproject9.icasites.nl/feedback.php?item=' . $row['voorwerpnummer'] . '';
            $headers = 'From: ' . $from . "\r\n";
            mail($to, $subject, $message, $headers);

          }
        }
    }
}
zendMailVerloopVeiling($dbh);



function plaatsItem($dbh) {
  $forms = '<form action="bevestig.php" method="post" enctype="multipart/form-data">
                <div>
                    <label>Veiling titel</label>
                    <input type="text" name="titel" placeholder="Titel" maxlength="18">
                </div>';
  $forms .= "<label>Hoofdrubriek<label>
                <select required name = rij1>";
  $query = $dbh->prepare("SELECT * FROM Rubriek WHERE rubriek = -1");
  $query->execute();
  while($row = $query->fetch()) {
      $forms .= "<option value = ". $row['rubrieknummer'] .">" . $row['rubrieknaam'] . "</option>";
  }
  $forms .= '</select>
  <div>
    <label>Voeg een beschrijving toe</label>
    <textarea rows="4" name="beschrijving" placeholder="Geef hier de beschrijving van het product" maxlength="22" required></textarea>
  </div>
  <div>
    <label>Startprijs</label>
    <input type="text" name="startprijs" placeholder="99999.99 (Startprijs)" maxlength="8" required>
  </div>
  <div>
    <label>Betalingswijze</label>
    <select name="betalingswijze" required>
      <option value disabled selected>Kies een betalingswijze</option>
      <option value="IDeal/PayPal">IDeal/Paypal</option>
      <option value="Creditcard">Creditcard</option>
    </select>
  </div>
  <div>
    <label>Aanvullende betalingsinstructies</label>
    <input type="text" name="betalingsinstructie" placeholder="Geef hier aanvullende betaal instructies (optioneel)" maxlength="30">
  </div>
  <div>
    <label>Plaats</label>
    <input type="text" name="plaats" placeholder="Plaatsnaam" maxlength="12" required>
  </div>
  <div>
    <label>Land</label>
    <select name="land" required>';
    $query2 = $dbh->prepare("SELECT * FROM tblIMAOLand");
    $query2->execute();
    while($row = $query2->fetch()) {
      $forms .= "<option value = ". $row['NAAM_LAND'] .">" . $row['NAAM_LAND'] . "</option>";
    }
    $forms .='
      <option value = "Anders"> Overig </option>
    </select>
  </div>
  <div>
    <label>Selecteer looptijd (in dagen)</label>
    <select name="looptijd" required>
      <option value selected disabled>Selecteer de looptijd in dagen</option>
      <option value = "3"> 1 </option>
      <option value = "3"> 3 </option>
      <option value = "5"> 5 </option>
      <option value = "7" selected="selected"> 7 (Standaard) </option>
        <option value = "10"> 10 </option>
    </select>
  </div>
  <div>
    <label>Eventuele verzendkosten</label>
    <input type="text" name="verzendkosten" placeholder="99.99 (Verzendkosten)" maxlength="5">
  </div>
    <div>
    <label>Eventuele verdere verzendinstructies</label>
    <textarea rows="4" name="verzendinstructies" placeholder="Geef hier instructies voor het verzenden.. (optioneel)" maxlength="30"></textarea>
  </div>
    <div>
  <label>Upload hier je image</label>
    <input name="plaatje" type="file" accept=".jpg, .jpeg, .bpem, .png" required>
  </div>
  <div>
    <label>Upload hier je image</label>
    <input name="plaatje2" type="file" accept=".jpg, .jpeg, .bpem, .png">
  </div>
  <div>
    <label>Upload hier je image</label>
    <input name="plaatje3" type="file" accept=".jpg, .jpeg, .bpem, .png">
  </div>
  <div>
    <label>Upload hier je image</label>
    <input name="plaatje4" type="file" accept=".jpg, .jpeg, .bpem, .png">
  </div>
  <div>
    <button type="submit" class="knop" name="submit">Plaats</button>
  </div>
  <input type="hidden" name="time" value="' . date("H:i:s") . '">
  <input type="hidden" name="day" value="' . date("m-d-Y") . '">
  </form>
  <div class="medium-3 large-4"></div>';
  echo $forms;
}


function uploadItem($dbh) {
  if (isset($_POST["bevestig"])){
    $veilinggesloten = 0;
    is_null($verkoopprijs);

    $titel = $_POST["titel"];
    $beschrijving = $_POST["beschrijving"];
    $startprijs = $_POST["startprijs"];
    $betalingswijze = $_POST["betalingswijze"];
    $betalingsinstructie = $_POST["betalingsinstructie"];
    $plaats = $_POST["plaats"];
    $land = $_POST["land"];
    $looptijd = $_POST["looptijd"];
    $verzendkosten = $_POST["verzendkosten"];
    $verzendinstructies = $_POST["verzendinstructies"];
    $plaatje = $_POST["plaatje"];
    $plaatje2 = $_POST["plaatje2"];
    $plaatje3 = $_POST["plaatje3"];
    $plaatje4 = $_POST["plaatje4"];
    $hoogste = $_POST["hoogste"];
    $tijd = $_POST["tijd"];
    $begindag = $_POST["dag"];
    $date1 = str_replace('-', '/', $begindag);
    $einddag = date('m-d-Y',strtotime($date1 . "+$looptijd days"));

    //query om de gebruikersnaam op te halen
    $logintoken = $_SESSION['login-token'];
    $sqlquery = $dbh->prepare("SELECT gebruikersnaam FROM Gebruiker WHERE gebruikersnaam = '$logintoken' OR mailbox = '$logintoken'");
    $sqlquery->setFetchMode(PDO::FETCH_ASSOC);
    $sqlquery->execute();
    $sessionQueryData = $sqlquery->fetch();
    $verkoper = $sessionQueryData['gebruikersnaam'];

    //query om het voorwerpnummer te bepalen
    $nRows = $dbh->query("SELECT count(*) FROM Voorwerp")->fetchColumn();
    $voorwerpid = 1 + $nRows;

    try{
    $query = $dbh->prepare("INSERT INTO Voorwerp
                            VALUES ('$voorwerpid','$titel','$beschrijving',
                                     '$startprijs','$betalingswijze','$betalingsinstructie',
                                     '$plaats','$land','$looptijd',
                                     '$begindag','$tijd','$verzendkosten',
                                     '$verzendinstructies','$verkoper',NULL,
                                     '$einddag','$tijd',0,NULL, 1, 0, 0)");
    $query->execute();
    $query2 = $dbh->prepare("INSERT INTO VoorwerpInRubriek
                             VALUES ('$voorwerpid','$hoogste','$hoogste')");
    $query2->execute();
    $query3 = $dbh->prepare("INSERT INTO Bestand
                             VALUES ('$plaatje','$voorwerpid')");
    $query3->execute();
    if (isset($_POST["plaatje2"])){
      if($_POST["plaatje2"] !== ""){
        $query4 = $dbh->prepare("INSERT INTO Bestand
                                 VALUES ('$plaatje2','$voorwerpid')");
        $query4->execute();
      }
    }
    if (isset($_POST["plaatje3"])){
      if($_POST["plaatje3"] !== ""){
        $query5 = $dbh->prepare("INSERT INTO Bestand
                                 VALUES ('$plaatje3','$voorwerpid')");
        $query5->execute();
      }
    }
    if (isset($_POST["plaatje4"])){
      if($_POST["plaatje4"] !== ""){
        $query6 = $dbh->prepare("INSERT INTO Bestand
                                 VALUES ('$plaatje4','$voorwerpid')");
        $query6->execute();
      }
    }
    echo "<h1> VEILING SUCCESVOL GEUPLOAD! </h1>";
    header('refresh: 3; url=index.php');
    }catch(PDOException $e) {
      unlink("img/veilingen/$plaatje");
      if (isset($_POST["plaatje2"])){
        if($_POST["plaatje2"] !== ""){
          unlink("img/veilingen/$plaatje2");
        }
      }
      if (isset($_POST["plaatje3"])){
        if($_POST["plaatje3"] !== ""){
          unlink("img/veilingen/$plaatje3");
        }
      }
      if (isset($_POST["plaatje4"])){
        if($_POST["plaatje4"] !== ""){
          unlink("img/veilingen/$plaatje4");
        }
      }
      echo '<h1>Uploaden mislukt!</h1>
      <p><a href="verkooppage.php">Klik hier om terug te gaan.</a></p>';
    }
  }
}

function sluitVeilingen($dbh) {
    date_default_timezone_get("Europe/Amsterdam");

    $query = $dbh->prepare("SELECT * FROM Voorwerp");
    $query->setFetchMode(PDO::FETCH_ASSOC);
    $query->execute();

    while ($data = $query->fetch()) {
        $itemID = $data['voorwerpnummer'];
        $enddate = $data['looptijdEindeDag'];
        $endtime = $data['looptijdEindeTijdstip'];
        $veilingGesloten = $data['veilingGesloten']; //0 = false, 1 = true

        $day = date('d', strtotime($enddate));
        $month = date('m', strtotime($enddate));
        $year = date('Y', strtotime($enddate));
        $hour = date('H', strtotime($endtime));
        $minute = date('i', strtotime(($endtime)));
        $seconds = date('s', strtotime($endtime));
        $from_unix_time = mktime($hour, $minute, $seconds, $month, $day, $year);

        $formattedDate = date("Y-m-d", $from_unix_time);    //DB
        $formattedTime = date("H:i:s", $from_unix_time);    //DB
        $todayDate = date("Y-m-d");                         //today
        $todayTime = date("H:i:s");                         //today

        //echo "<p>" . $todayDate . " " . $todayTime . "</p>";

        if ((($todayDate == $formattedDate && $todayTime >= $formattedTime) || $todayDate > $formattedDate) && $veilingGesloten == 0) {
            //DB date is vandaag en tijd > vandaag, of de date is al geweest.
            $update = $dbh->prepare("UPDATE Voorwerp SET veilingGesloten = 1 WHERE voorwerpnummer = '$itemID'");
            $update->execute();
        }
    }
}

sluitVeilingen($dbh);

?>
