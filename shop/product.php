<?php
/*
 * Strona przedmiotu
 * Na tej stronie wyświetla się opis przedmiotu oraz jego zdjęcia w postaci
 * karuzeli. Jest też możliwość dodania przedmiotu do koszyka obecnie
 * zalogowanego użytkownika.
 */
require_once __DIR__ . '/../src/required.php';
//Ustalamy id i name zalogowanego usera
if ($loggedUser = isLoggedUser($conn)) {
    $loggedUserName = $loggedUser->getName();
    $loggedUserId = $loggedUser->getId();
}

// Jeżeli dostaliśmy poprawny productId w adresie
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['productId']) && is_numeric($_GET['productId'])) {
        $productId = $_GET['productId'];

        //Jeżeli produkt o tym productId jest w bazie
        if ($product = Product::loadProductById($conn, $productId)) {
            $productname = $product->getName();
            $category = $product->getIdGroup();
            $description = $product->getDescription();
            $availability = $product->getAvailability();
            $price = $product->getPrice();
        } else {
            $errors[] = 'Nie ma takiego towaru w bazie.';
        }
    } else {
        $errors[] = 'Grrr... coś kombinujesz z adresem url... Nieładnie!';
    }
    if (!empty($errors)) {
        printErrors($errors);
        die();
    }
}
?>

<!DOCTYPE html>
<html>
    <head>
        <title>M&K Shop - Cart</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../css/style.css" type="text/css" />
        <style>
            .carousel-inner > .item > img,
            .carousel-inner > .item > a > img {
                width: 60%;
                margin: auto;
                padding: 30px;
            }
        </style>
    </head>
    <body>
        <!-----------Nagłówek z menu-------------->
        <header>
            <?php require_once __DIR__ . '/header.php' ?>
        </header>

        <!—-----------Główna treść --------------->

        <div class="container-fluid text-center">

            <div class="row content">

                <!—-----------Panel z kategoriami --------------->
                <?php //require_once __DIR__ . '/sidebar.php' ?>

                <div class="col-sm-12 text-left"> 

                    <h3><?php echo $productname ?></h3>
                    <h4>Kategoria :<?php echo $category ?></h4>
                    <hr>
                    <div class="col-sm-6 text-left"> 

                        <h4>Galeria zdjęć</h4>
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>

                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img src="../images/image_1.jpg" alt="Procesor1" width="460" height="245">
                                </div>

                                <div class="item">
                                    <img src="../images/image_2.jpg"  alt="Procesor2" width="460" height="245">
                                </div>
                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-3 text-left"> 
                        <h4>Opis przedmiotu</h4>
                        <p><?php echo $description ?> </p>
                    </div>
                    <div class="col-sm-3 ">
                        <div class="text-right panel panel-default panel-body">
                            <br>
                            <h3> Cena</h3>
                            <h3> <?php echo $price ?> PLN</h3>
                            <br><br>
                            <h3> Dostępnych</h3>
                            <h3> <?php echo $availability ?> Sztuk</h3>
                            <br><br>
                        </div> 
                        <div class="text-center panel panel-default panel-body">   
                            <label class="input-lg">
                                Sztuk&nbsp;
                                <input type="number" class="input-lg" name="Ilość" min="1" max="<?php echo $availability ?>" step="1" value="1">
                            </label>
                            <br><br>
                            <input type="submit" class="btn btn-danger btn-lg" value="Dodaj do koszyka">
                            <br> 
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>

    <!—--------------Stopka------------------->
    <?php //require_once __DIR__ . '/footer.php' ?>

</body>
</html>



