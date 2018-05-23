<?php
$isLoggedIn = false;
if(isset($_SESSION['login-token'])) {
    $isLoggedIn = true;
}
?>

<div class="navbar title-bar" data-sticky data-options="marginTop:0;" style="width:100%; z-index: 11;">
    <div class="grid-container">
        <div class="grid-x grid-y grid-padding-x">
            <div class="large-4 text-center cell">
                <a href="index.php"><img src="img/Eennaalandermaaal.svg" alt="EenmaalAndermaal"></a>
            </div>

            <div class="large-8 text-center cell">
                <div class="grid-x grid-padding-x">
                    <div class="large-3 medium-3 cell">
                        <div class="grid-y grid-padding-y">
                            <div class="cell small-6">
                                <a href="index.php">Home</a>
                            </div>
                        </div>
                    </div>
                    <div class="large-3 medium-3 cell">
                        <div class="grid-y grid-padding-y">
                            <div class="cell small-6">
                                <a href="about.php">Over</a>
                            </div>
                        </div>
                    </div>
                    <div class="large-3 medium-3 cell">
                        <div class="grid-y grid-padding-y">
                            <div class="cell small-6 medium-8 large-2">
                                <?php
                                if(!$isLoggedIn) {
                                    echo "<a href='personpage.php'>Account</a>";
                                } else {
                                    echo "<a href='register.php'>Aanmelden</a>";
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                    <div class="large-3 medium-3 cell">
                        <div class="grid-y grid-padding-y">
                            <div class="cell small-6">
                                <?php
                                if($isLoggedIn) {
                                    echo "<a href='logout.php'>Uitloggen</a>";
                                } else {
                                    echo "<a href='login-page.php'>Inloggen</a>";
                                }
                                //<a href="login-page.php">Inloggen</a>
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
