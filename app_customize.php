<?php

include("template/header.php");

error_reporting(E_ALL);
ini_set('display_errors', '1');

?>
	<fieldset>
		<legend>Персонализация приложения</legend>
		<form method="POST" action="customize.php" enctype="multipart/form-data">
            <label>Изображение для фона: <br><input type="file" name="bg_image" accept="image/*" required></label><br>
			<label>Инвертировать фон: <input type="checkbox" name="invert"></label>
			<input type="submit" value="Изменить">
		</form>
	</fieldset>

	<a class="warning" href="reset_customization.php">Сбросить персонализацию</a>

<?php include("template/footer.php"); ?>