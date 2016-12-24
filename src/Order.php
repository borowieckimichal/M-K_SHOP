<?php

/*
 * klasa zamówienia:
 * - składanie nowych zamówień/ edycja zamówienia
 * - wyświetlanie zamównia wg użytkownika/ wszystkich zamówień
 *  co jeszcze ?
 */

class Order {

    private $id;
    private $idUser;
    private $status;
    private $creationDate;
    private $paymentMethod;
    private $amount;
    private $adressStreet;
    private $adressLocalNo;
    private $postalCode;
    private $adressCity;



    public function __construct() {
        $this->id = -1;
        $this->idUser = 0;
        $this->status = 0;
        $this->creationDate = "";
        $this->paymentMethod = "";
        $this->amount = 0.00;
        $this->adressStreet = "";
        $this->adressLocalNo = "";
        $this->postalCode = "";
        $this->adressCity = "";
    }

    public function getId() {
        return $this->id;
    }

    public function setId($newId) {
        if (is_numeric($newId)) {
            $this->id = $newId;
        }
        return $this;
    }

    public function getUserId() {
        return $this->idUser;
    }

    public function setUserId($newUserId) {
        if (is_numeric($newUserId)) {
            $this->idUser = $newUserId;
        }
        return $this;
    }

    public function getStatus() {
        return $this->status;
    }

    public function setStatus($newStatus) {
        if (is_numeric($newStatus)) {
            $this->status = $newStatus;
        }
        return $this;
    }

    public function getCreationDate() {
        return $this->creationDate;
    }

    public function setCreationDate($newCreationDate) {
        if (is_integer($newCreationDate)) {
            $this->creationDate = $newCreationDate;
        }
        return $this;
    }

    public function getPaymentMethod() {
        return $this->paymentMethod;
    }

    public function setPaymentMethod($newPaymentMethod) {
        if (is_string($newPaymentMethod)) {
            $this->paymentMethod = $newPaymentMethod;
        }
        return $this;
    }

    public function getAmount() {
        return $this->amount;
    }

    public function setAmount($newAmount) {
        if (is_numeric($newAmount)) {
            $this->amount = $newAmount;
        }
        return $this;
    }
    public function getAdressStreet() {
        return $this->adressStreet;
    }

    public function setAdressStreet($newAdressStreet) {
        if (is_string($newAdressStreet)) {
            $this->adressStreet = $newAdressStreet;
        }
        return $this;
    }

    public function getAdressLocalNo() {
        return $this->adressLocalNo;
    }

    public function setAdressLocalNo($newAdressLocal) {
        if (preg_match("/[^\s]*$/", $newAdressLocal)) {
            $this->adressLocalNo = $newAdressLocal;
        }
        return $this;
    }

    public function getPostalCode() {
        return $this->postalCode;
    }

    public function setPostalCode($newPostalCode) {
        if (preg_match("/[0-9][0-9]-[0-9][0-9][0-9]$/", $newPostalCode)) {
            $this->postalCode = $newPostalCode;
        }
        return $this;
    }

    public function getAdressCity() {
        return $this->adressCity;
    }

    public function setAdresscity($newAdressCity) {
        if (is_string($newAdressCity)) {
            $this->adressCity = $newAdressCity;
        }
        return $this;
    }


    public function saveToDB(mysqli $connection) {

        if ($this->id == -1) {

            //zapisywanie zamówienia do bazy danych

            $sql = "INSERT INTO Orders(id_user, status,  payment_method, amount,
                adress_street, adress_local, postal_code, adress_city)
               VALUES ('$this->idUser','$this->status', '$this->paymentMethod', '$this->amount',
                    '$this->adressStreet', '$this->adressLocalNo', '$this->postalCode', '$this->adressCity' )";

            $result = $connection->query($sql);
            if ($result == true) {
                $this->id = $connection->insert_id;

                return true;
            } else {
                return false;
            }
        } else {
            $sql = "UPDATE Orders SET status='$this->status', payment_method='$this->paymentMethod', amount='$this->amount',
                '$this->adressStreet', '$this->adressLocalNo', '$this->postalCode', '$this->adressCity'
                 WHERE id=$this->id";
            $result = $connection->query($sql);
            if ($result == true) {
                return true;
            }
        }

        return false;
    }

// wyświetlanie zamówień wg id zamówienia
    static public function loadOrderById(mysqli $connection, $id) {

        $sql = "SELECT * FROM Orders WHERE id=$id";

        $result = $connection->query($sql);

        if ($result == true && $result->num_rows == 1) {

            $row = $result->fetch_assoc();
            $loadedOrder = new Order();
            $loadedOrder->id = $row['id'];
            $loadedOrder->idUser = $row['id_user'];
            $loadedOrder->status = $row['status'];
            $loadedOrder->creationDate = $row['creation_date'];
            $loadedOrder->paymentMethod = $row['payment_method'];
            $loadedOrder->amount = $row['amount'];
            $loadedOrder->adressStreet = $row['adress_street'];
            $loadedOrder->adressLocalNo = $row['adress_local'];
            $loadedOrder->postalCode = $row['postal_code'];
            $loadedOrder->adressCity = $row['adress_city'];

            return $loadedOrder;
        }

        return null;
    }

// wyświetlanie wszystkich zamówień wg id użytkownika
    static public function loadAllOrdersByUserId(mysqli $connection, $userId) {

        $sql = "SELECT * FROM Orders WHERE id_user=$userId ORDER BY status DESC";
        $ret = [];

        $result = $connection->query($sql);
        if ($result == true && $result->num_rows != 0) {
            foreach ($result as $row) {

                $loadedOrder = new Order();
                $loadedOrder->id = $row['id'];
                $loadedOrder->status = $row['status'];
                $loadedOrder->creationDate = $row['creation_date'];
                $loadedOrder->paymentMethod = $row['payment_method'];
                $loadedOrder->amount = $row['amount'];
                $loadedOrder->adressStreet = $row['adress_street'];
                $loadedOrder->adressLocalNo = $row['adress_local'];
                $loadedOrder->postalCode = $row['postal_code'];
                $loadedOrder->adressCity = $row['adress_city'];
                $ret[] = $loadedOrder;
            }

            return $ret;
        }
    }

// wyświetlanie wszystkich zamówień w bazie
    static public function loadAllOrders(mysqli $connection) {

        $sql = "SELECT * FROM Orders ORDER BY status DESC";
        $ret = [];

        $result = $connection->query($sql);
        if ($result == true && $result->num_rows != 0) {
            foreach ($result as $row) {


                $loadedOrder = new Order();
                $loadedOrder->id = $row['id'];
                $loadedOrder->idUser = $row['id_user'];
                $loadedOrder->status = $row['status'];
                $loadedOrder->creationDate = $row['creation_date'];
                $loadedOrder->paymentMethod = $row['payment_method'];
                $loadedOrder->amount = $row['amount'];
                $loadedOrder->adressStreet = $row['adress_street'];
                $loadedOrder->adressLocalNo = $row['adress_local'];
                $loadedOrder->postalCode = $row['postal_code'];
                $loadedOrder->adressCity = $row['adress_city'];

                $ret[] = $loadedOrder;
            }
        }

        return $ret;
    }


    static public function getCartByUser(mysqli $connection, $userId) {
        $sql = "SELECT * FROM Orders WHERE id_user=$userId AND status=0";
        $result = $connection->query($sql);
        if ($result == true && $result->num_rows == 1) {
            $row = $result->fetch_assoc();
            $loadedOrder = new Order();
            $loadedOrder->id = $row['id'];
            $loadedOrder->idUser = $row['id_user'];
            $loadedOrder->status = $row['status'];
            $loadedOrder->creationDate = $row['creation_date'];
            $loadedOrder->paymentMethod = $row['payment_method'];
            $loadedOrder->amount = $row['amount'];
            return $loadedOrder;
        }

        return null;
    }
 
    
        //Wyswietla zamówienia w wierszu tabeli admina
    public function showProductInAdminTabRow($no) {
        echo '<tr onclick="location.href=';
        echo "'showOrder.php?orderId=";
        echo $this->getId();
        echo "'" . '">';
        echo "<td>" . $no . "</td>";
        echo "<td>Zamówienie nr " . $this->getId() . "</td>";
        echo "<td>" . $this->getCreationDate() . "</td>";
        echo "<td>" . $this->getUserId() . "</td>";
        echo "<td>" . $this->getAmount() . " PLN</td>";
        echo "<td>" . $this->getStatus() . "</td>";
        echo "<td><button type='button' class='btn btn-info'>Pokaż</button></td>";
        echo "<td><button type='button' class='btn btn-warning'>Wyślij wiadomość</button></td>";
        echo "<td><button type='button' class='btn btn-danger'>Usuń</button></td>";
        echo "</tr>";
    }
}

