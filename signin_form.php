<?php include("template/header.php"); ?>

<fieldset>
	<legend>Вход</legend>
	<form method="POST" action="signin.php">
		<label>Логин:<br><input type="text" name="username" required></label><br>
		<label>Пароль:<input type="password" name="password" required></label><br>
		<input type="submit" value="Войти">
	</form>
</fieldset>
<a href="signup_form.php">Регистрация</a>

<?php include("template/footer.php"); ?>