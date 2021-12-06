<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$name = $_POST["name"];
$file = $_FILES["file"];
$date = date("d.m.Y");
$authorId = $_COOKIE["userid"];

$uploadDir = "gallery";
$filename = uniqid();
$tmpName = $file["tmp_name"];

move_uploaded_file($tmpName, "$uploadDir/$filename");

$sql = "INSERT INTO gallery (name, filename, date, author_id) VALUES ('$name', '$filename', '$date', $authorId);";
$result = $pdo->query($sql);

header("Location: " . $_SERVER["HTTP_REFERER"]);