<?php include("template/header.php"); ?>

Внимание!!!!!!!<br>
Эта страница лишает вас прав администратора!<br>

<form action="delete_admin.php" method="POST">
    ДЛЯ ОТКАЗА ОТ ПРАВ АДМИНИСТРАТОРА, ВВЕДИТЕ ПАРОЛЬ ОТ ВАШЕГО АККАУНТА:
    <input type="password" name="password">
    <button type="submit">ВНИМАНИЕ!!! ПРИ НАЖАТИИ НА КНОПКУ ВЫ ЛИШИТЕСЬ ПРАВ АДМИНИСТРАТОРА НАВСЕГДА!</button>
</form>

<?php include("template/footer.php"); ?>