<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

include("core/Util.php");

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$newName = $_POST["name"];
$file = $_FILES["file"];
$postId = $_POST["post_id"];

$uploadDir = "video";
$filename = uniqid();
$tmpName = $file["tmp_name"];

move_uploaded_file($tmpName, "$uploadDir/$filename");

$sql = "UPDATE `video` SET `name`='$newName', `filename`='$filename' WHERE `id`=$postId";
$result = $pdo->query($sql);

header("Location: video.php");