<?php

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$postId = $_POST["post_id"];

$sql = "DELETE FROM `video` WHERE `id`=$postId";
$result = $pdo->query($sql);

header("Location: " . $_SERVER["HTTP_REFERER"]);