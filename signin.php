<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$username = $_POST["username"];
$password = $_POST["password"];

$password = md5($password);

$sql = "SELECT * FROM user WHERE username='$username' AND password='$password'";
$result = $pdo->query($sql);
$rows = $result->fetch();

if($rows) {
    header("Set-Cookie: userid=" . $rows["id"] . "; Expires=Wed, 1 Oct 2025 01:00:00 GMT");
} else {
    echo "error";
}

header("Location: /");