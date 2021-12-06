<?php

include("template/header.php");

error_reporting(E_ALL);
ini_set('display_errors', '1');

$postId = $_POST["post_id"];

$sql = "SELECT * FROM gallery WHERE id=$postId";
$result = $pdo->query($sql);
$rows = $result->fetch();

?>

	<fieldset>
		<legend>Изменить фото</legend>
		<form method="POST" action="edit_picture.php" enctype="multipart/form-data">
			<input type="hidden" name="post_id" value="<?= $postId; ?>">
			<label>Новое название:<br><input type="text" name="name" value="<?= $rows["name"]; ?>" required></label><br>
			<label>Файл:<br><input type="file" name="file" accept="image/*" required></label><br>
			<input type="submit" value="Изменить">
		</form>
	</fieldset>

<?php include("template/footer.php"); ?>