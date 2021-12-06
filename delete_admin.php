<?php

include("core/Util.php");

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$userId = $_COOKIE["userid"];
$password = md5($_POST["password"]);
$passwordUser = $admin = Util::getUserData($userId)["password"];

if($password == $passwordUser) {
    $sql = "UPDATE `user` SET `admin`=0 WHERE `id`=$userId";
    $result = $pdo->query($sql);
}

header("Location: " . $_SERVER["HTTP_REFERER"]);