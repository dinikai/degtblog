<?php

/*if($_COOKIE["userid"] != 1) {
	header("Location: engineering_works.php");
}*/

include("template/header.php");

error_reporting(E_ALL);
ini_set('display_errors', '1');

if(array_key_exists("userid", $_COOKIE)):
	$admin = Util::getUserData($_COOKIE["userid"])["admin"];
	$userData = Util::getUserData($_COOKIE["userid"]);
?>
		<fieldset>
			<legend>Добавить пост</legend>
			<form method="POST" action="add_post.php">
				<label>Название поста:<br><input type="text" name="title" required></label><br>
				<label>Текст:<br><textarea name="text" required placeholder="Пост"></textarea></label><br>
				<input type="submit" value="Добавить">
			</form>
		</fieldset>

		<?php else: ?>

<i>Внимание! Чтобы писать посты и лайкать, надо войти</i>

<?php endif;

		$sql = "SELECT * FROM post ORDER BY id DESC";
		$result = $pdo->query($sql);

		foreach($result as $row):
			if(array_key_exists("userid", $_COOKIE)) {
				$sql = "SELECT * FROM likes WHERE `post_id`=" . $row["id"] . " AND `user_id`=" . $_COOKIE["userid"];
				$result2 = $pdo->query($sql);
				$userLikesCount = $result2->rowCount();
			}

			$sql = "SELECT * FROM likes WHERE `post_id`=" . $row["id"];
			$result3 = $pdo->query($sql);
			$likesCount = $result3->rowCount();
		?>

		<div class="post" id="<?= $row["id"]; ?>">
			<img src="avatars/<?= Util::getUserData($row["author_id"])["avatar_file"]; ?>" class="avatar">
			<span class="post-title">"<?= trim($row["name"]); ?>"</span>
			<?php
				if(array_key_exists("userid", $_COOKIE)): if($admin == 1) {
					echo " id=" . $row["id"] . " aid=" . $row["author_id"];
				}
			?>
			<?php if($row["author_id"] == $_COOKIE["userid"] || $admin == 1): ?>
			<form method="POST" action="edit_post_form.php" class="like-form">
				<label><span class="blue">Изменить</span><input type="submit" class="like-input"></label>
				<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
			</form>
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
			$sql = "SELECT * FROM likes_comment WHERE `comment_id`=" . $commentRow["id"] . " AND table_id=0 AND `user_id`=" . $_COOKIE["userid"];
			$result4 = $pdo->query($sql);
			$userCommentLikesCount = $result4->rowCount();

			$sql = "SELECT * FROM likes_comment WHERE table_id=0 AND `comment_id`=" . $commentRow["id"];
			$result5 = $pdo->query($sql);
			$likesCommentCount = $result5->rowCount();
		?>
			<div class="comment">
				<?= nl2br($commentRow["text"]); ?><br>
				<span class="post-date">От <?= $commentRow["date"]; ?></span><br>
				<a class="post-date" href="view_user.php?id=<?= Util::getUserData($commentRow["author_id"])["id"]; ?>">
				-<?= Util::getUserData($commentRow["author_id"])["name"]; ?></a>
				<form method="POST" action="add_like_comment.php" class="like-form">
					<label><span class="<?= $userCommentLikesCount >= 1 ? "liked" : "like"; ?>">♡</span><input type="submit" class="like-input"></label>
					<?= $likesCommentCount; ?>
					<input type="hidden" name="comment_id" value="<?= $commentRow["id"]; ?>">
					<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
					<input type="hidden" name="user_id" value="<?= $_COOKIE["userid"]; ?>">
					<input type="hidden" name="table_id" value="0">
				</form>
			</div>
		<?php
		endforeach; ?>
		</div>
		<?php endforeach;
		?>

<?php include("template/footer.php"); ?>