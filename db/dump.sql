-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 11, 2021 at 12:03 AM
-- Server version: 8.0.26-0ubuntu0.21.04.3
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dirtagbase`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `date` varchar(255) NOT NULL,
  `post_id` int NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `text`, `date`, `post_id`, `author_id`) VALUES
(4, 'гуль', '10.10.2021', 12, 1),
(5, 'Было очень весело и оооочень вкусно! Бабушка нас порадовала кулинарными разносолами)', '10.10.2021', 11, 9),
(7, 'Если ты не волк то ты волк в не волке, а не волк если ты не волк', '10.10.2021', 10, 1),
(8, '☝️☝️☝️🐺🐺🐺', '10.10.2021', 10, 1),
(9, 'fdg', '10.10.2021', 20, 1),
(10, 'здарова', '10.10.2021', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comment_gallery`
--

CREATE TABLE `comment_gallery` (
  `id` int UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `date` varchar(255) NOT NULL,
  `post_id` int NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comment_gallery`
--

INSERT INTO `comment_gallery` (`id`, `text`, `date`, `post_id`, `author_id`) VALUES
(2, 'крутой', '10.10.2021', 4, 1),
(3, 'да', '10.10.2021', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comment_video`
--

CREATE TABLE `comment_video` (
  `id` int UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `date` varchar(255) NOT NULL,
  `post_id` int NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comment_video`
--

INSERT INTO `comment_video` (`id`, `text`, `date`, `post_id`, `author_id`) VALUES
(2, 'Трусишка)', '10.10.2021', 13, 8),
(3, 'Думаю', '10.10.2021', 16, 1),
(4, 'Вкусно надеюсь', '10.10.2021', 18, 1),
(5, 'Марка', '10.10.2021', 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`id`, `name`, `filename`, `date`, `author_id`) VALUES
(3, 'sdfg', '6162d3c7edc00', '10.10.2021', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `author_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `name`, `filename`, `date`, `author_id`) VALUES
(1, 'Котя', 'IMG_20211004_012011.jpg', '08.10.2021', 1),
(3, 'Томик', 'IMG_20211008_184717.jpg', '08.10.2021', 1),
(4, 'Лев', 'IMG_20211007_193735.jpg', '08.10.2021', 1),
(5, 'Синеглазый Том', 'EF974279-F2E0-406A-9E55-8DF481A1CA36.jpeg', '08.10.2021', 8),
(6, 'Срём!', '682DACB8-5A29-4CF3-B74C-450FF726B7F8.jpeg', '08.10.2021', 9),
(7, 'Поле', 'IMG_20190927_162858_BURST002.jpg', '09.10.2021', 10),
(8, 'том', '2021-10-0914.30.544608403281893523233.jpg', '09.10.2021', 1),
(9, 'Кот', 'IMG_20211008_210824.jpg', '09.10.2021', 11),
(10, 'День рождения! ', 'image.jpg', '09.10.2021', 12),
(11, 'сало', 'IMG_20211009_173455_148.jpg', '09.10.2021', 1),
(12, 'Ах я да я', 'image.jpg', '09.10.2021', 9),
(13, 'Лев', 'DC46D28C-D9C6-4E91-BD3F-F2639A6DD86D.jpeg', '09.10.2021', 13),
(14, 'Осень наступает', '6162a557ec299', '10.10.2021', 1),
(15, 'очень вкусная котлетка!!! ', '6162a9c6a4c7a', '10.10.2021', 1);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`) VALUES
(10, 6, 1),
(30, 12, 9),
(31, 11, 9),
(32, 6, 9),
(33, 12, 1),
(38, 11, 1),
(39, 10, 1),
(40, 15, 8),
(42, 11, 8),
(44, 15, 1),
(50, 14, 1),
(52, 20, 8),
(54, 19, 8),
(55, 18, 8),
(59, 9, 1),
(62, 18, 1),
(63, 19, 1),
(64, 13, 1),
(65, 20, 1),
(67, 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `likes_gallery`
--

CREATE TABLE `likes_gallery` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `likes_gallery`
--

INSERT INTO `likes_gallery` (`id`, `post_id`, `user_id`) VALUES
(7, 4, 1),
(8, 5, 1),
(9, 13, 1),
(10, 9, 1),
(11, 6, 1),
(12, 1, 1),
(13, 3, 1),
(14, 13, 8),
(15, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `likes_video`
--

CREATE TABLE `likes_video` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `likes_video`
--

INSERT INTO `likes_video` (`id`, `post_id`, `user_id`) VALUES
(5, 16, 1),
(6, 13, 1),
(7, 15, 8),
(8, 13, 8),
(9, 15, 1),
(12, 19, 8),
(13, 19, 1),
(14, 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `music`
--

CREATE TABLE `music` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `music`
--

INSERT INTO `music` (`id`, `name`, `filename`, `date`, `author_id`) VALUES
(3, 'Агрепина босиком', '61628731cc66c.mp3', '10.10.2021', 1);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date` text NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `name`, `text`, `date`, `author_id`) VALUES
(1, 'Открытие #DEGTBLOG', '<b>Добро пожаловать в #DEGTBLOG!</b>\r\n\r\nНа этом сайте будут выкладываться новости и события Дегтяревых, и вы тоже можете их выкладывать!.\r\nТакже можно выкладывать любые медиафайлы: картинки, видео, музыка.\r\n\r\nНадеюсь вам понравится этот \"сайт\"!', '06.10.2021', 1),
(2, 'Мы завели кота!!', 'На самом деле это произошло еще несколько дней назад, а идея создания этого сайта мне пришла только сегодня. Поэтому новость не свежая.\r\n\r\nЕго зовут Томас, вот фотка:\r\n<img src=\"gallery/IMG_20211004_012011.jpg\" style=\"width: 140px;\">\r\n\r\nЭто сиамский кот, и он очень крутой и игривый!!! Ему 1 месяц', '06.10.2021', 1),
(3, 'МИЛАН!!!', 'Го к бабушке в амогус', '06.10.2021', 1),
(5, 'Обновления на сайте!', 'Был технический перерыв, а это значит что у нас обновление!\r\n\r\nСписок изменений:\r\n<ul>\r\n<li>Система аккаунтов</li>\r\n<li>Имя автора под постом или файлом</li>\r\n</ul>\r\nТакже завтра планирую добавить галерею, где можно будет выкладывать фотки!', '07.10.2021', 1),
(6, 'Том спит', 'Томик спит очень часто, чутко, просыпается от каждого шума. Много спит, потому что растет.', '07.10.2021', 8),
(7, 'Еще одно обновление', 'И снова обнова!\r\nЯ добавил галерею. Теперь можете загружать фотки с котами! Также я пофиксил баг с загрузкой файлов.\r\n\r\nКонечно обновление маленькое, но крутое', '08.10.2021', 1),
(8, 'Посты ', 'Посты ', '09.10.2021', 11),
(9, 'Да ', 'Нет ', '09.10.2021', 11),
(10, 'Великие цытаты ', 'Если ты не волк то ты не волк если ты волк то ты волк 👆👆👆🐺🐺🐺', '09.10.2021', 11),
(11, 'У бабушки день рождения!', 'Оно конечно уже прошло, но празднуем мы сегодня. Поздравляю бабушку с днем рождения, желаю счастья, здоровья и все такого! ', '09.10.2021', 1),
(12, 'Гуля ', 'Гул гуль гуль🕊️🕊️🕊️🕊️', '09.10.2021', 11),
(13, 'Привет', 'Привет', '09.10.2021', 13),
(14, 'Таня зарегистрировалась!', 'Ура! ', '09.10.2021', 1),
(15, 'Обновление', 'Долгожданное (не очень) обновление!\r\n\r\nДобавлены видео! Может сегодня, а может завтра добавлю лайки и комментарии', '09.10.2021', 1),
(18, 'Огромнейшие изменения', 'Произошли изменения! Причем очень большие\r\n\r\nДобавлены лайки, комментарии и музыка!!!!) Пока что лайки и комментарии доступны только под постами,картинками и видео, но потом они станут доступны для всех', '10.10.2021', 1),
(19, 'Бабушка что то готовит', 'Бабушка готовит что то, надеюсь это будет очень вкусным🙂 Видео выложил', '10.10.2021', 1),
(20, 'Родители, услыште!!! ', 'Разрешите взять домой плюшу на 1 день!!! ', '10.10.2021', 1),
(21, 'Гули 2', 'Пишите под этим постом все, что хотите для улучшения сайта.\r\nРассмотрю и добавлю)', '10.10.2021', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `avatar_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `password`, `email`, `admin`, `avatar_file`) VALUES
(1, 'dinikai', 'Тимоза', 'd3ef3c62641c8a4743fc2fca1d143a28', 'dinikaigd@gmail.com', 1, '616319ae3770a.jpeg'),
(8, 'ssveta4449', 'Света', '202cb962ac59075b964b07152d234b70', 'foo', 1, 'no_avatar.jpg'),
(9, 'makson', 'Max', '2ffe4e77325d9a7152f7086ea7aa5114', 'foo', 0, 'no_avatar.jpg'),
(10, 'babushka', 'Галя', '202cb962ac59075b964b07152d234b70', 'foo', 0, 'no_avatar.jpg'),
(11, 'Milka', 'Силана ', '263f395100d3a0058d6723569ce8746c', 'foo', 0, 'no_avatar.jpg'),
(12, 'Shancept', 'Николас', '45a9dfcf62f538b65df9d4ab21bf9b2d', 'foo', 0, 'no_avatar.jpg'),
(13, 'tanya', 'Таня', '202cb962ac59075b964b07152d234b70', 'foo', 0, 'no_avatar.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `name`, `filename`, `date`, `author_id`) VALUES
(3, 'Тест', '6161967182fa5.mp4', '09.10.2021', 1),
(13, 'Том и робот-пылесос', '6161b0df18e67.MOV', '09.10.2021', 8),
(15, 'Мася', '6161b24c6a700.MOV', '09.10.2021', 8),
(16, 'Загадка', '61628c5bb42dd.MOV', '10.10.2021', 9),
(18, 'Бабушка что то готовит', '6162a3c8a62da.mp4', '10.10.2021', 1),
(19, 'чувапчичи', '6162c44deffcd.mp4', '10.10.2021', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_gallery`
--
ALTER TABLE `comment_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_video`
--
ALTER TABLE `comment_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes_gallery`
--
ALTER TABLE `likes_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes_video`
--
ALTER TABLE `likes_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `comment_gallery`
--
ALTER TABLE `comment_gallery`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comment_video`
--
ALTER TABLE `comment_video`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `likes_gallery`
--
ALTER TABLE `likes_gallery`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `likes_video`
--
ALTER TABLE `likes_video`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `music`
--
ALTER TABLE `music`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
