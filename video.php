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
			<legend>Добавить видео</legend>
			<form method="POST" action="add_video.php" enctype="multipart/form-data">
	            <label>Название видео:<br><input type="text" name="name" required></label><br>
	            <label>Файл:<br><input type="file" name="file" accept="video/*" required></label><br>
	            <input type="submit" value="Добавить">
            </form>
		</fieldset>

		<?php else: ?>

<i>Внимание! Чтобы выкладывать видео, надо войти</i>

<?php endif; ?>

<div class="gallery-flex">

<?php

		$sql = "SELECT * FROM video ORDER BY id DESC";
		$result = $pdo->query($sql);

		foreach($result as $row):

			if(array_key_exists("userid", $_COOKIE)) {
				$sql = "SELECT * FROM likes_video WHERE `post_id`=" . $row["id"] . " AND `user_id`=" . $_COOKIE["userid"];
				$result2 = $pdo->query($sql);
				$fetchUserLikes = $result2->fetch();
				$userLikesCount = $result2->rowCount();
			}

			$sql = "SELECT * FROM likes_video WHERE `post_id`=" . $row["id"];
			$result3 = $pdo->query($sql);
			$fetchLikes = $result3->fetch();
			$likesCount = $result3->rowCount();
		?>

<div class="gallery-picture-box" id="<?= $row["id"]; ?>">
<img src="avatars/<?= Util::getUserData($row["author_id"])["avatar_file"]; ?>" class="avatar">
    <span class="post-title">"<?= trim($row["name"]); ?>"</span>
	<?php
				if(array_key_exists("userid", $_COOKIE)): if($admin == 1) {
					echo " id=" . $row["id"] . " aid=" . $row["author_id"];
				}
			?>
	<?php if($row["author_id"] == $_COOKIE["userid"] || $admin == 1): ?>
		<form method="POST" action="edit_video_form.php" class="like-form">
				<label><span class="blue">Изменить</span><input type="submit" class="like-input"></label>
				<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
			</form>
			<form method="POST" action="delete_video.php" class="like-form">
				<label><span class="warning">Удалить</span><input type="submit" class="like-input"></label>
				<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
			</form><?php endif; endif; ?><br>
    <video src="video/<?= $row["filename"]; ?>" class="gallery-picture" controls type="video/*"></video><br>
	<span class="post-date">От <?= $row["date"]; ?></span><br>
	<a class="post-date" href="view_user.php?id=<?= Util::getUserData($row["author_id"])["id"]; ?>">
			-<?= Util::getUserData($row["author_id"])["name"]; ?></a>
	<?php if(array_key_exists("userid", $_COOKIE)): ?>
			<form method="POST" action="add_like_video.php" class="like-form">
				<label><span class="<?= $userLikesCount >= 1 ? "liked" : "like"; ?>">♡</span><input type="submit" class="like-input"></label>
				<?= $likesCount; ?>
				<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
				<input type="hidden" name="user_id" value="<?= $_COOKIE["userid"]; ?>">
			</form>
				<form method="POST" action="add_comment_video.php">
					<textarea name="text" class="comment-area" placeholder="Добавить комментарий" required></textarea>
					<input type="hidden" name="post_id" value="<?= $row["id"]; ?>">
					<input type="submit" value="Добавить">
				</form>
			<?php else: ?>
				<span class="like">♡</span>
				<?= $likesCount; ?>
			<?php
		endif;
		$sql = "SELECT * FROM comment_video WHERE `post_id`=" . $row["id"];
		$result4 = $pdo->query($sql);
		foreach($result4 as $commentRow):
			$sql = "SELECT * FROM likes_comment WHERE `comment_id`=" . $commentRow["id"] . " AND table_id=2 AND `user_id`=" . $_COOKIE["userid"];
			$result4 = $pdo->query($sql);
			$userCommentLikesCount = $result4->rowCount();

			$sql = "SELECT * FROM likes_comment WHERE table_id=2 AND `comment_id`=" . $commentRow["id"];
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
					<input type="hidden" name="table_id" value="2">
				</form>
			</div>
		<?php
		endforeach; ?>
</div>
        

		<?php
		endforeach;
		?>

</div>

<?php include("template/footer.php"); ?>