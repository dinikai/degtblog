<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$text = $_POST["text"];
$date = date("d.m.Y");
$postId = $_POST["post_id"];
$authorId = $_COOKIE["userid"];

$sql = "INSERT INTO `comment_gallery` (`text`, `date`, `post_id`, `author_id`) VALUES ('$text', '$date', $postId, $authorId)";
$result = $pdo->query($sql);

header("Location: " . $_SERVER["HTTP_REFERER"] . "#" . $postId);