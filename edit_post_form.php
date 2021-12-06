<?php

include("template/header.php");

error_reporting(E_ALL);
ini_set('display_errors', '1');

$postId = $_POST["post_id"];

$sql = "SELECT * FROM post WHERE id=$postId";
$result = $pdo->query($sql);
$rows = $result->fetch();

?>

	<fieldset>
		<legend>Изменить пост</legend>
		<form method="POST" action="edit_post.php">
			<input type="hidden" name="post_id" value="<?= $postId; ?>">
			<label>Новое название:<br><input type="text" name="name" value="<?= $rows["name"]; ?>" required></label><br>
			<label>Текст:<br><textarea name="text" required placeholder="Пост"><?= $rows["text"]; ?></textarea></label><br>
			<input type="submit" value="Изменить">
		</form>
	</fieldset>

<?php include("template/footer.php"); ?>