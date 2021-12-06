<?php

class Util {
    public static function getUserData($id) {
        $dsn = "mysql:dbname=dirtagbase;host=localhost";
        $user = "admin";
        $password = "122572";

        $pdo = new \PDO($dsn, $user, $password);

        $sql = "SELECT * FROM user WHERE id=$id";
        $result = $pdo->query($sql);
        $rows = $result->fetch();

        return $rows;
    }
}