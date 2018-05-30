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
            ><a href="detailpagina.php?item=' . $number . '"><img src=' . $file . '></a>
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
  $query = $dbh->prepare("SELECT * FROM Voorwerp v
                          INNER JOIN Bestand b
                          ON v.voorwerpnummer = b.voorwerp
                          WHERE v.voorwerpnummer = :voorwerpnummer ");
  $query->bindParam(':voorwerpnummer', $voorwerpnummer);
  $query->setFetchMode(PDO::FETCH_ASSOC);
  $query->execute();
  while($row = $query->fetch()){
    $file = "img/veilingen/" . $row['filenaam'];
    $endtime = date_create($row['looptijdEindeTijdstip']);
    echo "<h1 class= 'aboutkop'> " . $row['titel']  . "</h1><br>
    <div class='grid-x grid-padding-x'>
      <div class='small-12'>
        <div class='orbit' role='region' aria-label='Favorite Space Pictures' data-orbit>
          <div class='orbit-wrapper'>
            <div class='orbit-controls'>
              <button class='orbit-previous'><span class='show-for-sr'>Previous Slide</span>&#9664;&#xFE0E;</button>
              <button class='orbit-next'><span class='show-for-sr'>Next Slide</span>&#9654;&#xFE0E;</button>
            </div>
            <ul class='orbit-container'>
              <li class='is-active orbit-slide'>
                <figure class='orbit-figure'>
                  <img class='orbit-image' src= " . $file . " alt='Space'>
                  </figure>
              </li>
              <li class='orbit-slide'>
                <figure class='orbit-figure'>
                  <img class='orbit-image' src= " . $file . " alt='Space'>
                  </figure>
              </li>
              <li class='orbit-slide'>
                <figure class='orbit-figure'>
                  <img class='orbit-image' src= " . $file . " alt='Space'>
                  </figure>
              </li>
              <li class='orbit-slide'>
                <figure class='orbit-figure'>
                  <img class='orbit-image' src= " . $file . " alt='Space'>
                  </figure>
              </li>
            </ul>
          </div>
          <nav class='orbit-bullets'>
            <button class='is-active' data-slide='0'><span class='show-for-sr'>First slide details.</span><span class='show-for-sr'>Current Slide</span></button>
            <button data-slide='1'><span class='show-for-sr'>Second slide details.</span></button>
            <button data-slide='2'><span class='show-for-sr'>Third slide details.</span></button>
            <button data-slide='3'><span class='show-for-sr'>Fourth slide details.</span></button>
          </nav>
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
            <td>" . $row['beschrijving'] . "</td>
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
                                  VALUES  ('$voorwerpnummer', '$bodbedrag', '$gebruiker','1-1-2018','$bodtijdstip')");
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
?>
