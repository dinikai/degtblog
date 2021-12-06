<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$userId = $_POST["user_id"];
$postId = $_POST["comment_id"];
$postId1 = $_POST["post_id"];
$tableId = $_POST["table_id"];

$sql = "SELECT * FROM `likes_comment` WHERE `comment_id`=$postId AND `user_id`=$userId";
$result2 = $pdo->query($sql);
$numRows = $result2->rowCount();

if($numRows >= 1) {
    $sql = "DELETE FROM `likes_comment` WHERE `comment_id`=$postId AND `user_id`=$userId AND `table_id`=$tableId";
    $result = $pdo->query($sql);
} else {
    $sql = "INSERT INTO `likes_comment` (`comment_id`, `user_id`, `table_id`) VALUES ($postId, $userId, $tableId)";
    $result = $pdo->query($sql);
}

header("Location: " . $_SERVER["HTTP_REFERER"] . "#" . $postId1);