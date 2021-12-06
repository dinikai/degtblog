<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

$dsn = "mysql:dbname=dirtagbase;host=localhost";
$user = "admin";
$password = "122572";

$pdo = new PDO($dsn, $user, $password);

include("core/Util.php");

if(array_key_exists("userid", $_COOKIE)) {
    $admin = Util::getUserData($_COOKIE["userid"])["admin"];
	$username = Util::getUserData($_COOKIE["userid"])["username"];
	$userData = Util::getUserData($_COOKIE["userid"]);
}
?>

<html>
<head>
	<title>#DEGTBLOG</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="../main.css">
	<link rel="stylesheet" href="../icomoon/style.css">

	<?php if(array_key_exists("userid", $_COOKIE)): ?><style>
		body {
			background: url("backgrounds/<?= $userData["bg_file"]; ?>");
			<?php if($userData["invert_bg"] == 1): ?>
				filter: invert(100%);
			<?php endif; ?>
		}
	</style><?php endif; ?>
</head>
<body>
	<div class="nav">
		<a class="logo" href="/">#DEGTBLOG</a>
		<span class="nav-list">
		<a href="files.php" class="nav-item">Файлы</a> <a href="gallery.php" class="nav-item">Галерея</a>
		<a href="video.php" class="nav-item">Видео</a> <a href="music.php" class="nav-item">Музыка</a>
		<?php if(isset($_COOKIE["userid"])): ?>
			<a href="view_user.php?id=<?= $_COOKIE["userid"] ?>" class="nav-item"><?= $username; ?></a> <a href="logout.php" class="nav-item">Выход</a>
		<?php else: ?>
			<a href="signin_form.php" class="nav-item">Вход</a>
		<?php endif; ?> </span> <button class="dropdown-btn-button"><img class="dropdown-btn" src="img/menu.png"></button>
		
		<?php if(isset($_COOKIE["userid"])): ?>
			<div class="dropdown-list">
				<div class="dropdown-child"><span class="icon-home"></span><a href="/" class="dropdown-child">Главная</a></div><br>
				<div class="dropdown-child"><span class="icon-attachment"></span><a href="files.php" class="dropdown-child">Файлы</a></div><br>
				<div class="dropdown-child"><span class="icon-image"></span><a href="gallery.php" class="dropdown-child">Галерея</a></div><br>
				<div class="dropdown-child"><span class="icon-film"></span><a href="video.php" class="dropdown-child">Видео</a></div><br>
				<div class="dropdown-child"><span class="icon-music"></span><a href="music.php" class="dropdown-child">Музыка</a></div><br>
				<div class="dropdown-child"><span class="icon-user"></span><a href="view_user.php?id=<?= $_COOKIE["userid"] ?>" class="dropdown-child"><?= $username; ?></a></div><br>
				<div class="dropdown-child"><span class="icon-exit"></span><a href="logout.php" class="dropdown-child">Выход</a></div>
		</div>
		<?php else: ?>
			<div class="dropdown-list">
				<div class="dropdown-child"><a href="/" class="dropdown-child">Главная</a></div><br>
				<div class="dropdown-child"><span class="icon-files-empty"></span></span><a href="files.php" class="dropdown-child">Файлы</a></div><br>
				<div class="dropdown-child"></span><a href="gallery.php" class="dropdown-child">Галерея</a></div><br>
				<div class="dropdown-child"></span><a href="video.php" class="dropdown-child">Видео</a></div><br>
				<div class="dropdown-child"></span><a href="music.php" class="dropdown-child">Музыка</a></div><br>
				<div class="dropdown-child"><a href="signin_form.php" class="dropdown-child">Вход</a></div>
			</div>
		<?php endif; ?>
	</div>
	<div class="container">
		<div class="content">