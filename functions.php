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

//Hot Items (Is nog een oude/WebTech versie!)
$output;
function hot_items($dbh){
    $output="";
    for ($i=0; $i <3 ; $i++) {
        $nummer = (rand(1,30));
        $sql = "SELECT * FROM movie WHERE movie_id = ?";
        $stmt = $dbh->prepare($sql);
        $stmt->execute(array($nummer));
        $row = $stmt->fetch();
        $mname = $row['title'];
        $poster = $row['poster_link'];
        $desc = $row['description'];
        $year = $row['publication_year'];
        $dur = $row['duration'];
        $output .=
        '<div class = "result">
        <img class="poster-result" src = ../img/poster/'.$poster.' </img>
        <div class = "result-text">
        <div><strong>' .$mname. '</strong></div>
        <div> <strong>Publication Year:</strong>   ' .$year. '</div>
        <br>
        <div class="result-text">
        <form action="Description-page.php" class="Filmoptie">
        <input type="hidden" name="defilm" value='. ($row['title']) .'>
        <input type="submit" name="mybtn" class="btn" value="Filmpagina"/>
        </form>
        </div>
        </div></div>';
    }
    echo $output;
}

// Zoek naar Rubrieken
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
        while($row = $query->fetch()) {
            echo '<li><a href="#">'. $row['rubrieknaam'] . '</a></li>';
        }
    } catch(PDOException $e) {
        echo "Er is iets mis gegaan. De foutmelding is: $e";
    }
}

// Toon Items
function toonItems($dbh) {
  try{
      $query = $dbh->query("SELECT *
                                                          FROM	 Voorwerp
                                                          ORDER BY looptijdEindeTijdstip ASC");
      $query->execute();
      while($row = $query->fetch()) {
          echo '<li>'. $row['titel'] . ':
               '. $row['beschrijving'] . '</li>';
      }
    }
    catch(PDOException $e) {
      echo "Er is iets mis gegaan. De foutmelding is: $e";
  }
}

?>
