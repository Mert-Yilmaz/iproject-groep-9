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
          WHERE isToegestaan = 1
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
//Aflopende Items (Selecteert 3 items die het snelst aflopen)
function ending_items($dbh){
  $output="";
  $sql = "SELECT TOP (3) * FROM Voorwerp v
          INNER JOIN Bod b on b.voorwerp = v.voorwerpnummer
          INNER JOIN Bestand be on be.voorwerp = v.voorwerpnummer
          WHERE isToegestaan = 1
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
          WHERE isToegestaan = 1
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
                          WHERE vv.isToegestaan = 1 AND rubriekOpHoogsteNiveau = :rubrieknummer");
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
                          WHERE vv.isToegestaan = 1 AND rubriekOpLaagsteNiveau = :rubrieknummer");
  $query->bindParam(':rubrieknummer', $rubrieknummer);
  $query->execute();
  while($row = $query->fetch()) {
    if($row['Aantal_items'] != 0){
      echo $row['Aantal_items'];
      }
    }
  //   $isAantalItemsLeeg = $query->fetchColumn();
  //     if(!isset($isAantalItemsLeeg)){
  //       $query = $dbh->prepare("SELECT COUNT(rubrieknummer) AS Aantal_items
  //                               FROM	 Rubriek r INNER JOIN VoorwerpInRubriek v
  //                               ON r.rubrieknummer = v.rubriekOpLaagsteNiveau
  //                               WHERE  rubriekOpLaagsteNiveau = :rubriek");
  //       $query->bindParam(':rubriek', $rubriek);
  //       $query->execute();
  //       while($row = $query->fetch()) {
  //           echo $row['Aantal_items'];
  //     }
  // }
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
                              WHERE v.isToegestaan = 1 AND vi.rubriekOpLaagsteNiveau IN (SELECT rubrieknummer
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
  $voorwerpnummer = $_GET['item'];
  $query = $dbh->prepare("SELECT * FROM Voorwerp
                          WHERE voorwerpnummer = $voorwerpnummer");
  $query->setFetchMode(PDO::FETCH_ASSOC);
  $query->execute();
  while($row = $query->fetch()){
    $numberofpics = 0;
    $endtime = date_create($row['looptijdEindeTijdstip']);
    echo "<h1 class= 'aboutkop'> " . $row['titel']  . "</h1><br>
    <div class='grid-x grid-padding-x imageborder'>
      <div class='small-12'>
        <div class='orbit' role='region' aria-label='Favorite Space Pictures' data-orbit>
          <div class='orbit-wrapper'>
            <div class='orbit-controls'>
              <button class='orbit-previous'><span class='show-for-sr'>Previous Slide</span>&#9664;&#xFE0E;</button>
              <button class='orbit-next'><span class='show-for-sr'>Next Slide</span>&#9654;&#xFE0E;</button>
            </div>
            <ul class='orbit-container'>";
            $query2 = $dbh->prepare("SELECT * FROM Bestand
                                    WHERE voorwerp = $voorwerpnummer");
            $query2->setFetchMode(PDO::FETCH_ASSOC);
            $query2->execute();
            while($row2 = $query2->fetch()){
              $numberofpics++;
              $file = "img/veilingen/" . $row2['filenaam'];
              echo "<li class='is-active orbit-slide'>
                <figure class='orbit-figure'>
                  <img class='orbit-image' src= " . $file . " alt='Space'>
                  </figure>
              </li>";
            }
            echo "</ul>
          </div>
          <nav class='orbit-bullets'>
            <button class='is-active' data-slide='0'><span class='show-for-sr'>First slide details.</span><span class='show-for-sr'>Current Slide</span></button>";
            if($numberofpics > 1){
              echo "<button data-slide='2'><span class='show-for-sr'>Second slide details.</span></button>";
            }
            if($numberofpics > 2){
              echo "<button data-slide='3'><span class='show-for-sr'>Third slide details.</span></button>";
            }
            if($numberofpics > 3){
              echo "<button data-slide='4'><span class='show-for-sr'>Fourth slide details.</span></button>";
            }
          echo "</nav>
        </div>
      </div>
    </div>
    <div class= 'grid-x grid-padding-x'>
      <div class= 'cell large-8 medium-7'>
        <table>
          <tr>
            <th>Verkoper</th>
            <td>" . $row['verkoper'] . "</td>
          </tr>
          <tr>
            <th>Beschrijving</th>
            <td>" . htmlspecialchars($row['beschrijving']) . "</td>
          </tr>
          <tr>
            <th>Plaats</th>
            <td>" . $row['plaatsnaam'] . "</td>
          </tr>
          <tr>
            <th>Betalingsinstructie</th>
            <td>" . $row['betalingsinstructie'] . "</td>
          </tr>
          <tr>
            <th>Betalingswijze</th>
            <td>" . $row['betalingswijze'] . "</td>
         </tr>
          <tr>
            <th>Land</th>
            <td>" . $row['land'] . "</td>
          </tr>
        </table>
      </div>
      <div class='cell large-4 medium-5 right'>
        <table>
          <tr>
            <th>Vraagprijs</th>
            <td> €" . $row['verkoopprijs'] . ",- </td>
          </tr>
          <tr>
            <th>Startprijs</th>
            <td> €" . $row['startprijs'] . ",- </td>
          </tr>
          <tr>
            <th>Looptijd</th>
            <td>" . $row['looptijd'] . " dagen</td>
          </tr>
          <tr>
            <th>Einddatum</th>
            <td>" . $row['looptijdEindeDag'] . "</td>
          </tr>
            <tr>
            <th>Tijdstip einde</th>
            <td>" . date_format($endtime, "H:i:s") . "</td>
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
    if (isset($_POST["submit"])){
    $voorwerpnummer = $_GET['item'];
    $bodbedrag = $_POST["bodbedrag"];
    $boddag = $_POST["datum"];
    $bodtijdstip = $_POST["tijd"];
    $usernamemail = $_SESSION['login-token'];
    try{
      $query = $dbh->prepare("SELECT *
                              FROM Gebruiker
                              WHERE gebruikersnaam = '$usernamemail'
                              OR mailbox = '$usernamemail'");
      $query->setFetchMode(PDO::FETCH_ASSOC);
      $query->execute();
      $data = $query->fetch();
      $gebruiker = $data['gebruikersnaam'];
    } catch(PDOException $e) {
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
    } catch(PDOException $e) {
        echo '<script type="text/javascript">alert("Gegevens niet goed ingevuld")</script>';
    }
    try{
      if($bodbedrag < 50) {
        if($bodbedrag >= $hoogstebod + 0.5) {
          $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','$boddag','$bodtijdstip')");
          $query->execute();
        }
        else throw new PDOException ("Bedrag te laag!");
      }
      if($bodbedrag > 50 && $bodbedrag < 500) {
        if($bodbedrag >= $hoogstebod + 1) {
          $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','1-1-2018','$bodtijdstip')");
          $query->execute();
        }
        else throw new PDOException ($e);
      }
      if($bodbedrag > 500 && $bodbedrag < 1000) {
        if($bodbedrag >= $hoogstebod + 5) {
          $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','1-1-2018','$bodtijdstip')");
          $query->execute();
        }
        else throw new PDOException ($e);
      }
      if($bodbedrag > 1000 && $bodbedrag < 5000) {
        if($bodbedrag >= $hoogstebod + 10) {
          $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','1-1-2018','$bodtijdstip')");
          $query->execute();
        }
        else throw new PDOException ($e);
      }
      if($bodbedrag > 5000) {
        if($bodbedrag >= $hoogstebod + 50) {
          $query = $dbh->prepare("INSERT INTO Bod
                                  (voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','1-1-2018','$bodtijdstip')");
          $query->execute();
        }
        else throw new PDOException ($e);
      }
    } catch(PDOException $e) {
        echo '<script type="text/javascript">alert("Bedrag te laag!")</script>';
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
        if ($formatted >= $today && $isMailVerstuurd == 0) {
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
        }
    }
}
zendMailVerloopVeiling($dbh);

// Toont het formulier voor het plaatsen van een veilingitem
function plaatsItem($dbh) {
  $forms = '';
  $forms .=
  '<form action="bevestig.php" method="post" enctype="multipart/form-data">
  <div>
   <label>Naam van het Product</label>
   <input type="text" name="titel" placeholder="Titel" maxlength="18">
  </div>
  <label>Hoofdrubriek<label>
    <select name = rij1>';
    $query = $dbh->prepare("SELECT * FROM Rubriek WHERE rubriek = -1");
    $query->execute();
    while($row = $query->fetch()) {
      $forms .= "<option value = ". $row['rubrieknummer'] .">" . $row['rubrieknaam'] . "</option>";
    }
  $forms .=
  '</select>
  <div>
    <label>Voeg een kleine beschrijving toe</label>
    <textarea rows="4" name="beschrijving" placeholder="Geef hier de beschrijving van het product.. (optioneel)" maxlength="22" required></textarea>
  </div>
  <div>
    <label>Prijs in: €</label>
    <input type="text" name="startprijs" placeholder="99999.99 (Startprijs)" maxlength="8" required>
  </div>
  <div>
    <label>Hoe wil je worden betaald?</label>
    <select name="betalingswijze">
      <option value disabled selected>Kies een betalingswijze</option>
      <option value="IDeal/PayPal">IDeal/Paypal</option>
      <option value="Creditcard">Creditcard</option>
    </select>
  </div>
  <div>
    <label>Geef hier nog wat extra betaalinstructies</label>
    <input type="text" name="betalingsinstructie" placeholder="Geef hier aanvullende betaal instructies" maxlength="30">
  </div>
  <div>
    <label>Waar wil je het item aanbieden?</label>
    <input type="text" name="plaats" placeholder="Plaats naam" maxlength="12">
  </div>
  <div>
    <label>In welk land wil je het item aanbieden?</label>
    <select name="land">';
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
    <label>Hoe lang wil je het product aanbieden?</label>
    <select name="looptijd">
      <option value selected disabled>Selecteer de looptijd in dagen</option>
      <option value = "3"> 1 </option>
      <option value = "3"> 3 </option>
      <option value = "5"> 5 </option>
      <option value = "7" selected="selected"> 7 (Standaard) </option>
        <option value = "10"> 10 </option>
    </select>
  </div>
  <div>
    <label>Hoe hoog zijn de verzendkosten</label>
    <input type="text" name="verzendkosten" placeholder="99.99 (Verzendkosten)" maxlength="5">
  </div>
    <div>
    <label>Eventuele verdere verzendinstructies?</label>
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

// Upload het item wanneer alles correct is ingevuld
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
        $query5 = $dbh->prepare("INSERT INTO Bestand
                                 VALUES ('$plaatje4','$voorwerpid')");
        $query5->execute();
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

?>
