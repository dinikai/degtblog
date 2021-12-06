<?php

include("template/header.php");

if(array_key_exists("userid", $_COOKIE)):
    $admin = Util::getUserData($_COOKIE["userid"])["admin"];
	$userData = Util::getUserData($_COOKIE["userid"]);
?>

<fieldset>
    <legend>Добавить песню</legend>
    <form method="POST" action="add_music.php" enctype="multipart/form-data">
	    <label>Название песни:<br><input type="text" name="name" required></label><br>
	    <label>Файл:<br><input type="file" name="file" accept="audio/*" required></label><br>
	    <input type="submit" value="Добавить">
    </form>
</fieldset>

<?php else: ?>

	<i>Внимание! Чтобы выкладывать музыку, надо войти</i>

<?php endif; ?>

<div class="gallery-flex">

<?php

$sql = "SELECT * FROM `music` ORDER BY id DESC";
$result = $pdo->query($sql);

foreach($result as $row):

?>

<div class="gallery-picture-box">
<img src="avatars/<?= Util::getUserData($row["author_id"])["avatar_file"]; ?>" class="avatar">
    <span class="post-title">"<?= trim($row["name"]); ?>"</span>
    <?php
				if(array_key_exists("userid", $_COOKIE)): if($admin == 1) {
					echo " id=" . $row["id"] . " aid=" . $row["author_id"];
				}
			?>
    <?php if($row["author_id"] == $_COOKIE["userid"] || $admin == 1): ?>
		<form method="POST" action="edit_music_form.php" class="like-form">
				<label><span class="blue">Изменить</span><input type="submit" class="like-input"></label>
				<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
			</form>
			<form method="POST" action="delete_music.php" class="like-form">
				<label><span class="warning">Удалить</span><input type="submit" class="like-input"></label>
				<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
			</form><?php endif; endif; ?><br>
	<audio src="music/<?= $row["filename"]; ?>" controls></audio><br>
	<span class="post-date">От <?= $row["date"]; ?></span><br>
	<div class="post-date">-<?= Util::getUserData($row["author_id"])["name"]; ?></div>
</div>

<?php
endforeach;
?>

</div>

<?php include("template/footer.php"); ?>