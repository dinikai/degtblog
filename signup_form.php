<?php include("template/header.php"); ?>

<fieldset>
	<legend>Регистрация</legend>
	<form method="POST" action="signup.php">
		<label>Логин:<br><input type="text" name="username" required></label><br>
        <label>Имя:<br><input type="text" name="name" required></label><br>
		<label>Пароль:<input type="password" name="password" required></label><br>
        <label>Повторите пароль:<input type="password" name="password2" required></label><br>
		<input type="submit" value="Зарегистрироваться">
	</form>
</fieldset>
<a href="signin_form.php">Вход</a>

<?php include("template/footer.php"); ?>