<?php

include("core/Util.php");

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$userId = $_COOKIE["userid"];
$newAvatar = $_FILES["bg_image"];
$invert = $_POST["invert"] == "on" ? 1 : 0;

$uploadDir = "backgrounds";
$filename = uniqid() . "." . pathinfo($newAvatar["name"], PATHINFO_EXTENSION);
$tmpName = $newAvatar["tmp_name"];

move_uploaded_file($tmpName, "$uploadDir/$filename");

$sql = "UPDATE `user` SET `bg_file`='$filename', `invert_bg`=$invert WHERE `id`=$userId";
$result = $pdo->query($sql);

var_dump($result->errorInfo());

header("Location: " . $_SERVER["HTTP_REFERER"]);