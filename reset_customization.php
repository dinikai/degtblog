<?php

include("core/Util.php");

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$userId = $_COOKIE["userid"];

$sql = "UPDATE `user` SET `bg_file`='no_bg.png', `invert_bg`=0";
$result = $pdo->query($sql);

header("Location: " . $_SERVER["HTTP_REFERER"]);