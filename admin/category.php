<?php
/*
 * Lista kategorii w korej mozemy dodac i usunac dowolna z nich
 */
require_once __DIR__ . '/../src/required.php';

//jeśli user jest zalogowany to przekierowuję na główną
if (!isLoggedAdmin($conn)) {
    header("Location: loginAdmin.php");
}
$errors = [];

//sprawdzam czy został przesłany e-mail i hasło
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['category']) && strlen(trim($_POST['category'])) > 4) {
        $newCategory = $_POST['category'];
        $category = new Group();
        $category->setGroupName($newCategory);
        if ($category->saveToDB($conn)) {
            $errors[] = "Dodano nową kategorię";
        } else {
            $errors[] = "Nie udało się dodać kategorii";
        }
    } else {
        $errors[] = "Podana kategoria jest za krotka";
    }
}
?>

<!DOCTYPE html>
<html>
    <head>
        <title>M&K Shop - Admin Panel - Category</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../css/style.css" type="text/css" />
    </head>
    <body>
        <!-----------Nagłówek z menu-------------->
        <header>
            <?php require_once __DIR__ . '/header.php' ?>
        </header>

        <!—-----------Główna treść --------------->

        <div class="container-fluid text-center">

            <div class="row content"> 
                <!-Tutaj wyświetlam błędy-->
                <?php printErrors($errors); ?>
                <div class="col-sm-6 text-left">
                    <form action=# method="POST">
                        <div class="form-group">
                            <label for="category"><h4>Dodaj kategorię:</h4></label>
                            <input type="text" class="form-control" id="category" name="category" placeholder="Wprowadź nowa kategorię">
                        </div>
                        <button type="submit" class="btn btn-info">Dodaj kategorię</button>
                    </form>
                </div>

                <div class="col-sm-8 text-left">
                    <br>
                    <hr>
                    <h4>Lista kategorii</h4>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Lp</th>
                                <th>Nazwa kategorii</th>
                                <th>Ilość towarów</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            //Wyświetlam wszystkie kategorie
                            $no = 0;
                            $allCategories = Group::loadAllGroups($conn);
                            foreach ($allCategories as $category) {
                                
                                $no++;
                                $category->showCategoryInTabRow($conn, $no);
                            }
                            ?>
                        </tbody>
                    </table>


                </div>

            </div>
        </div>

    </body>
</html>