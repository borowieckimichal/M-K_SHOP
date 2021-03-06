<?php

require_once __DIR__ . '/../src/User.php';

class UserTest extends PHPUnit_Extensions_Database_TestCase {

    protected static $mysqliConn;

    public function getConnection() {
        $conn = new PDO(
                $GLOBALS['DB_DSN'], $GLOBALS['DB_USER'], $GLOBALS['DB_PASSWD']
        );
        return new PHPUnit_Extensions_Database_DB_DefaultDatabaseConnection($conn, $GLOBALS['DB_NAME']);
    }

    public function getDataSet() {
        return $this->createFlatXmlDataSet(__DIR__ . '/datasets/Users.xml');
    }

    static public function setUpBeforeClass() {
        self::$mysqliConn = new mysqli(
                $GLOBALS['DB_HOST'], $GLOBALS['DB_USER'], $GLOBALS['DB_PASSWD'], $GLOBALS['DB_NAME']
        );
    }

    public function testSaveWhenCreatingNewUser() {

        $user = new User();
        $user->setName('testUser');
        $user->setSurname('Kowalski');
        $user->setPassword('12345');
        $user->setEmail('test@test.com');
        $user->setAdressStreet('Marszalkowska');
        $user->setAdressLocalNo('20');
        $user->setPostalCode('35-125');
        $user->setAdresscity('Elk');
        $this->assertTrue($user->saveToDB(self::$mysqliConn));
    }

    public function testLoadUserByIdWithCorrectId() {
        $user = User::loadUserById(self::$mysqliConn, 4);
        $this->assertEquals(4, $user->getId());
    }

    public function testIfLoadAllUsers() {
        $noUsers = count(User::loadAllUsers(self::$mysqliConn));
        $this->assertEquals($noUsers, 2);
    }

    public function testIfDeleteUser() {
        $user = new User();
        $this->assertTrue($user->delete(self::$mysqliConn));
    }

    public function testLoadUserByIdIfIdIsNotInDB() {
        $this->assertNull(User::loadUserById(self::$mysqliConn, 32));
    }

    public function testLoadUserByEmailWithCorrectEmail() {
        $user = User::loadUserByEmail(self::$mysqliConn, 'user2@user.pl');
        $this->assertEquals(4, $user->getId());
    }

    public function testIfLoginReturnsUserId() {
        $this->assertEquals(2, User::loginUser(self::$mysqliConn, 'user@user.pl', '12345'));
    }

    public function testIfEmailIsAvailable() {
        $user = User::emailIsAvailable(self::$mysqliConn, 'user3@user3.pl');
        $this->assertEquals($user, true);
    }

}
