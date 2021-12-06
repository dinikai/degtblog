<?php

include("core/Util.php");

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$newName = $_POST["name"];
$newText = $_POST["text"];
$postId = $_POST["post_id"];

$sql = "UPDATE `post` SET `name`='$newName', `text`='$newText' WHERE `id`=$postId";
$result = $pdo->query($sql);

header("Location: /");