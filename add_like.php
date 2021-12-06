<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$userId = $_POST["user_id"];
$postId = $_POST["post_id"];

$sql = "SELECT * FROM `likes` WHERE `post_id`=$postId AND `user_id`=$userId";
$result2 = $pdo->query($sql);
$rows = $result2->fetch();
$numRows = $result2->rowCount();

if($numRows >= 1) {
    $sql = "DELETE FROM `likes` WHERE `post_id`=$postId AND `user_id`=$userId";
    $result = $pdo->query($sql);
} else {
    $sql = "INSERT INTO `likes` (`post_id`, `user_id`) VALUES ($postId, $userId)";
    $result = $pdo->query($sql);
}

header("Location: /#" . $postId);