<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$title = $_POST["title"];
$text = $_POST["text"];
$date = date("d.m.Y");
$authorId = $_COOKIE["userid"];

$sql = "INSERT INTO post (name, text, date, author_id) VALUES ('$title', '$text', '$date', $authorId);";
$result = $pdo->query($sql);

header("Location: " . $_SERVER["HTTP_REFERER"]);