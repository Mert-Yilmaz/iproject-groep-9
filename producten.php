<!doctype html>
<?php include 'navbar.php';
      include 'functions.php';
      include_once 'db.php';
      error_reporting(E_ALL ^ E_NOTICE);
?>
<html class="no-js" lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>De beste veilingsite van Nederland!</title>
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
  </head>
<body>

    <?php productBreadCrumbs($dbh, $_GET['rubriek']);
          toonItems($dbh, $_GET['rubriek']);

include_once 'footer.html';
?>

</body>
</html>
