<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

$username = $_POST["username"];
$name = $_POST["name"];
$password = $_POST["password"];
$password2 = $_POST["password2"];
$email = "foo";

if($password == $password2) {
    $password = md5($password);
    
    $sql = "INSERT INTO user (username, name, password, email, `admin`, `avatar_file`, bg_file) VALUES ('$username', '$name', '$password', '$email', 0, 'no_avatar.jpg', 'no_bg.png')";
    $result = $pdo->query($sql);
    $sql = "SELECT * FROM user WHERE username='$username' AND password='$password'";
    $result = $pdo->query($sql);
    $rows = $result->fetch();

    if($rows) {
        header("Set-Cookie: userid=" . $rows["id"] . "; Expires=Wed, 1 Oct 2025 01:00:00 GMT");
    } else {
        echo "error";
    }
}

header("Location: /");