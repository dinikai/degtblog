<?php

include("template/header.php");

error_reporting(E_ALL);
ini_set('display_errors', '1');

$userId = $_GET["id"];
$userData = Util::getUserData($userId);

$sql = "SELECT * FROM post WHERE author_id=$userId ORDER BY id DESC";
$result = $pdo->query($sql);

if(array_key_exists("userid", $_COOKIE)):
    $admin = Util::getUserData($_COOKIE["userid"])["admin"];

    if($_COOKIE["userid"] == $userId || $admin == 1):
?>
	<fieldset>
		<legend>Изменить данные</legend>
		<form method="POST" action="change_user.php" enctype="multipart/form-data">
			<label>Новый логин: <br><input type="text" name="username" value="<?= $userData["username"]; ?>" required></label><br>
			<label>Новое имя: <br><input type="text" name="name" value="<?= $userData["name"]; ?>" required></label><br>
            <label>Аватарка: <br><input type="file" name="avatar" accept="image/*" required></label><br>
			<input type="submit" value="Добавить">
		</form>
	</fieldset>

	<a href="app_customize.php" class="blue">Персонализировать приложение</a><br><br>

<?php endif; endif; ?>

<img src="avatars/<?= $userData["avatar_file"]; ?>" class="big-avatar">
<h2><?= $userData["username"]; ?></h2>
Имя: <?= $userData["name"]; ?><br>
<?php if($userData["admin"] == 1): ?> <span class="warning">Администратор</span> <?php endif; ?><br>
	Все посты:

<?php foreach($result as $row):
    $sql = "SELECT * FROM likes WHERE `post_id`=" . $row["id"];
    $result3 = $pdo->query($sql);
    $fetchLikes = $result3->fetch();
    $likesCount = $result3->rowCount();
    ?>

    <div class="post" id="<?= $row["id"]; ?>">
			<img src="avatars/<?= Util::getUserData($row["author_id"])["avatar_file"]; ?>" class="avatar">
			<span class="post-title">"<?= trim($row["name"]); ?>"</span>
			<?php
				if(array_key_exists("userid", $_COOKIE)): if($admin == 1) {
					echo " adminInfo: id=" . $row["id"] . "; author_id=" . $row["author_id"];
				}
			?>
			<?php if($row["author_id"] == $_COOKIE["userid"] || $admin == 1): ?>
			<form method="POST" action="delete_post.php" class="like-form">
				<label><span class="warning">Удалить</span><input type="submit" class="like-input"></label>
				<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
			</form><?php endif; endif; ?><br>
			<span class="post-date">От <?= $row["date"]; ?></span><br>
			<div class="post-body"><?= nl2br($row["text"]); ?></div>
			<a class="post-date" href="view_user.php?id=<?= Util::getUserData($row["author_id"])["id"]; ?>">
			-<?= Util::getUserData($row["author_id"])["name"]; ?></a>
			<?php if(array_key_exists("userid", $_COOKIE)): ?>
			<form method="POST" action="add_like.php" class="like-form">
				<label><span class="<?= $userLikesCount >= 1 ? "liked" : "like"; ?>">♡</span><input type="submit" class="like-input"></label>
				<?= $likesCount; ?>
				<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
				<input type="hidden" name="user_id" value="<?= $_COOKIE["userid"]; ?>">
			</form>
				<form method="POST" action="add_comment.php">
					<textarea name="text" class="comment-area" placeholder="Добавить комментарий" required></textarea>
					<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
					<input type="submit" value="Добавить">
				</form>
			<?php else: ?>
				<span class="like">♡</span>
				<?= $likesCount; ?>
			<?php
		endif;
		$sql = "SELECT * FROM comment WHERE `post_id`=" . $row["id"];
		$result4 = $pdo->query($sql);
		foreach($result4 as $commentRow):
		?>
			<div class="comment">
				<?= nl2br($commentRow["text"]); ?><br>
				<span class="post-date">От <?= $commentRow["date"]; ?></span><br>
				<a class="post-date" href="view_user.php?id=<?= Util::getUserData($commentRow["author_id"])["id"]; ?>">
				-<?= Util::getUserData($commentRow["author_id"])["name"]; ?></a>
			</div>

<?php endforeach; ?> 
    </div>
<?php endforeach; include("template/footer.php"); ?>