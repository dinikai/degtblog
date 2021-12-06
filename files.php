<?php

include("template/header.php");

if(array_key_exists("userid", $_COOKIE)):
	$admin = Util::getUserData($_COOKIE["userid"])["admin"];
	$userData = Util::getUserData($_COOKIE["userid"]);
?>

<fieldset>
    <legend>Добавить файл</legend>
    <form method="POST" action="add_file.php" enctype="multipart/form-data">
	    <label>Название файла:<br><input type="text" name="name" required></label><br>
	    <label>Файл:<br><input type="file" name="file" required></label><br>
	    <input type="submit" value="Добавить">
    </form>
</fieldset>

<?php else: ?>

	<i>Внимание! Чтобы выкладывать файлы, надо войти</i>

<?php endif;

$sql = "SELECT * FROM `file` ORDER BY id DESC";
$result = $pdo->query($sql);

foreach($result as $row):

?>

<div class="post">
<img src="avatars/<?= Util::getUserData($row["author_id"])["avatar_file"]; ?>" class="avatar">
	<span class="post-title">"<?= trim($row["name"]); ?>"</span>
	<?php
				if(array_key_exists("userid", $_COOKIE)): if($admin == 1) {
					echo " id=" . $row["id"] . " aid=" . $row["author_id"];
				}
			?>
	<?php if($row["author_id"] == $_COOKIE["userid"] || $admin == 1): ?>
		<form method="POST" action="edit_file_form.php" class="like-form">
				<label><span class="blue">Изменить</span><input type="submit" class="like-input"></label>
				<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
			</form>
			<form method="POST" action="delete_file.php" class="like-form">
				<label><span class="warning">Удалить</span><input type="submit" class="like-input"></label>
				<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
			</form><?php endif; endif; ?><br>
	<span class="post-date">От <?= $row["date"]; ?></span><br>
	Имя файла: <?= $row["filename"]; ?><br>
	<div class="post-date">-<?= Util::getUserData($row["author_id"])["name"]; ?></div>
    <a href="files/<?= $row["filename"]; ?>" download>Скачать</a>
</div>

<?php
endforeach;
?>

<?php include("template/footer.php"); ?>