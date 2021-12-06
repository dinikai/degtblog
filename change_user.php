<?php

include("core/Util.php");

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$userId = $_COOKIE["userid"];
$newUsername = $_POST["username"];
$newName = $_POST["name"];
$newAvatar = $_FILES["avatar"];

$uploadDir = "avatars";
$filename = uniqid() . "." . pathinfo($newAvatar["name"], PATHINFO_EXTENSION);
$tmpName = $newAvatar["tmp_name"];

move_uploaded_file($tmpName, "$uploadDir/$filename");

$sql = "UPDATE `user` SET `username`='$newUsername', `name`='$newName', `avatar_file`='$filename' WHERE `id`=$userId";
$result = $pdo->query($sql);

header("Location: " . $_SERVER["HTTP_REFERER"]);