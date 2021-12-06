-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 07 2021 г., 00:13
-- Версия сервера: 8.0.27-0ubuntu0.21.04.1
-- Версия PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dirtagbase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `date` varchar(255) NOT NULL,
  `post_id` int NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `text`, `date`, `post_id`, `author_id`) VALUES
(4, 'гуль', '10.10.2021', 12, 1),
(5, 'Было очень весело и оооочень вкусно! Бабушка нас порадовала кулинарными разносолами)', '10.10.2021', 11, 9),
(7, 'Если ты не волк то ты волк в не волке, а не волк если ты не волк', '10.10.2021', 10, 1),
(8, '☝️☝️☝️🐺🐺🐺', '10.10.2021', 10, 1),
(9, 'fdg', '10.10.2021', 20, 1),
(10, 'здарова', '10.10.2021', 13, 1),
(13, 'Круто! ', '11.10.2021', 6, 10),
(14, 'Добавь, пожалуйста, обои, чтобы можно было ставить разный фон.', '14.10.2021', 21, 8),
(15, 'Бери))', '14.10.2021', 20, 8),
(16, 'ага!', '14.10.2021', 23, 1),
(17, 'сижу тут :)', '23.10.2021', 25, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `comment_gallery`
--

CREATE TABLE `comment_gallery` (
  `id` int UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `date` varchar(255) NOT NULL,
  `post_id` int NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment_gallery`
--

INSERT INTO `comment_gallery` (`id`, `text`, `date`, `post_id`, `author_id`) VALUES
(2, 'крутой', '10.10.2021', 4, 1),
(3, 'да', '10.10.2021', 11, 1),
(4, 'Ооооооочень!', '11.10.2021', 15, 9),
(5, 'Да-да, очень вкусная была😋', '14.10.2021', 15, 8),
(6, 'Красота😍😍', '14.10.2021', 14, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `comment_video`
--

CREATE TABLE `comment_video` (
  `id` int UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `date` varchar(255) NOT NULL,
  `post_id` int NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment_video`
--

INSERT INTO `comment_video` (`id`, `text`, `date`, `post_id`, `author_id`) VALUES
(2, 'Трусишка)', '10.10.2021', 13, 8),
(3, 'Думаю', '10.10.2021', 16, 1),
(4, 'Вкусно надеюсь', '10.10.2021', 18, 1),
(5, 'Марка', '10.10.2021', 16, 1),
(6, 'Мммммим!!!', '14.10.2021', 19, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `file`
--

CREATE TABLE `file` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `author_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gallery`
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
(12, 'Ах я да я', '6163d20613493', '09.10.2021', 9),
(13, 'Лев', 'DC46D28C-D9C6-4E91-BD3F-F2639A6DD86D.jpeg', '09.10.2021', 13),
(14, 'Осень наступает', '6162a557ec299', '10.10.2021', 1),
(15, 'очень вкусная котлетка!!! ', '6162a9c6a4c7a', '10.10.2021', 1),
(18, 'Жидкий кот', '616851e839db1', '14.10.2021', 8),
(19, 'У мамы др', '616a81dd01820', '16.10.2021', 15),
(20, 'Симона', '616a82fa12998', '16.10.2021', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`) VALUES
(10, 6, 1),
(30, 12, 9),
(31, 11, 9),
(32, 6, 9),
(38, 11, 1),
(39, 10, 1),
(40, 15, 8),
(42, 11, 8),
(44, 15, 1),
(50, 14, 1),
(52, 20, 8),
(54, 19, 8),
(59, 9, 1),
(62, 18, 1),
(63, 19, 1),
(64, 13, 1),
(65, 20, 1),
(68, 21, 1),
(69, 12, 1),
(71, 21, 10),
(72, 20, 10),
(73, 6, 10),
(74, 21, 8),
(75, 18, 8),
(76, 23, 1),
(77, 24, 15),
(78, 21, 15),
(79, 20, 15),
(80, 18, 15),
(81, 1, 15),
(82, 25, 1),
(83, 26, 8),
(84, 26, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `likes_gallery`
--

CREATE TABLE `likes_gallery` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `likes_gallery`
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
(15, 10, 1),
(16, 15, 9),
(17, 7, 10),
(18, 15, 8),
(19, 14, 8),
(20, 9, 8),
(22, 18, 15),
(23, 19, 15),
(24, 20, 15),
(25, 19, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `likes_video`
--

CREATE TABLE `likes_video` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `likes_video`
--

INSERT INTO `likes_video` (`id`, `post_id`, `user_id`) VALUES
(5, 16, 1),
(6, 13, 1),
(7, 15, 8),
(8, 13, 8),
(9, 15, 1),
(12, 19, 8),
(13, 19, 1),
(14, 18, 1),
(15, 3, 1),
(16, 18, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `music`
--

CREATE TABLE `music` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `music`
--

INSERT INTO `music` (`id`, `name`, `filename`, `date`, `author_id`) VALUES
(3, 'Агрепина босиком', '6163d558e8532', '10.10.2021', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date` text NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post`
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
(12, 'Ах я да', '', '09.10.2021', 11),
(13, 'Привет', 'Привет', '09.10.2021', 13),
(14, 'Таня зарегистрировалась!', 'Ура! ', '09.10.2021', 1),
(15, 'Обновление', 'Долгожданное (не очень) обновление!\r\n\r\nДобавлены видео! Может сегодня, а может завтра добавлю лайки и комментарии', '09.10.2021', 1),
(18, 'Огромнейшие изменения', 'Произошли изменения! Причем очень большие\r\n\r\nДобавлены лайки, комментарии и музыка!!!!) Пока что лайки и комментарии доступны только под постами,картинками и видео, но потом они станут доступны для всех', '10.10.2021', 1),
(19, 'Бабушка что то готовит', 'Бабушка готовит что то, надеюсь это будет очень вкусным🙂 Видео выложил', '10.10.2021', 1),
(20, 'Родители, услыште!!! ', 'Разрешите взять домой плюшу на 1 день!!! ', '10.10.2021', 1),
(21, 'Гули 2', 'Пишите под этим постом все что хотите чтобы я добавил\r\nРассмотрю и добавлю)', '10.10.2021', 1),
(24, 'Урааа!! ', 'Наконец то это выпадающее меню сделано!!! Я его делал часа два\r\nА еще я случайно удалил пост мамы:((( Перезалей пожалуйста', '15.10.2021', 1),
(25, 'Вопрос', 'А что ты там делаешь?', '16.10.2021', 15),
(26, 'Переделка подвала', 'Всем привет после большого перерыва! Он был из-за того, что у меня забирали компьютер и телефон. Сейчас же все отдали, но все равно еще несколько дней сайт не работал.\r\nКогда-то давно мы с Миланой решили убраться в подвале, разрисовать стены. Но что-то мы это быстро забросили. Сейчас же я решил переделать подвал под комнату отдыха/студию.\r\nЯ уже там убрался, поставил стол, стулья и притащил оборудование для гитары и саму гитару. Что из этого выйдет, я не знаю, но надеюсь проект не забросится!!\r\n\r\nНу и конечно, как же без обновлений. Изменен дизайн сайта, добавлено выпадающее меню, а также можно добавить собственный фон.\r\nВ дальнейшем запилю WISYWIG редактор в форму добавления поста. Но не скоро.\r\n\r\nВсем пока', '30.10.2021', 1),
(27, 'Интереснейшая история о сервере', 'Всем привет. Расскажу вам историю, как я сервер на бабушкин комп переносил.\r\nПодумал я, это не дело, что для работы сайта нужно с винды уходить, да на линуксе грузиться. Вспомнил, что бабушкин комп без дела стоит, и решил его сервером сделать.\r\nВсе хорошо было, но решил я сделать еще и FTP сервер на этом адресе, так как хотел программировать на основном компе.\r\nЯ обновил шрифт на сайте, но после загрузки файла на сервер все стили пропали. Я офигел и решил залить все файлы с моего компа на сервер.\r\nНо меня ждал ужас, так как весь сайт больше не работал. Была просто белая страница.\r\nЯ уж испугался, думал все, конец. Долго понять не мог, в чем проблема, ведь все файлы на месте. И прогуглив 2 часа я наткнулся на тред в StackOverflow,\r\nгде говорилось, типа проверь права на файлы, открыт ли он для публичного доступа. Ну я посмотрел, а там права rw -- -- (700). К ним был запрещен доступ отовсюду!\r\nВ общем, сделал я \"chmod 777 -R html\" и все заработало. Перепугался я тогда конечно очень сильно.\r\n\r\nА сейчас сайт будет работать с 12:00 до 0:00. Но че то никто не заходит :(\r\nНу всем пока!', '07.11.2021', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `avatar_file` varchar(255) NOT NULL,
  `bg_file` varchar(255) NOT NULL,
  `invert_bg` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `password`, `email`, `admin`, `avatar_file`, `bg_file`, `invert_bg`) VALUES
(1, 'dinikai', 'Тимоза', 'd3ef3c62641c8a4743fc2fca1d143a28', 'dinikaigd@gmail.com', 1, '616319ae3770a.jpeg', 'no_bg.png', 0),
(8, 'ssveta4449', 'Света', '202cb962ac59075b964b07152d234b70', 'foo', 1, '61642c0bc1617.jpeg', '617d3068dc0c1.jpeg', 1),
(9, 'makson', 'Max', '2ffe4e77325d9a7152f7086ea7aa5114', 'foo', 0, '61642c27a87c8.jpeg', 'no_bg.png', 0),
(10, 'babushka', 'Галя', '202cb962ac59075b964b07152d234b70', 'foo', 0, '61643ef587135.jpg', 'no_bg.png', 0),
(11, 'Milka', 'Силана ', '263f395100d3a0058d6723569ce8746c', 'foo', 0, 'no_avatar.jpg', 'no_bg.png', 0),
(12, 'Shancept', 'Николас', '45a9dfcf62f538b65df9d4ab21bf9b2d', 'foo', 0, 'no_avatar.jpg', 'no_bg.png', 0),
(13, 'tanya', 'Таня', '202cb962ac59075b964b07152d234b70', 'foo', 0, 'no_avatar.jpg', 'no_bg.png', 0),
(15, 'natalia', 'Ната', '202cb962ac59075b964b07152d234b70', 'foo', 0, '616a82220794c.jpeg', 'no_bg.png', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `video`
--

CREATE TABLE `video` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `author_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `video`
--

INSERT INTO `video` (`id`, `name`, `filename`, `date`, `author_id`) VALUES
(3, 'Тестcd', '6163d43520b30', '09.10.2021', 1),
(13, 'Том и робот-пылесос', '6161b0df18e67.MOV', '09.10.2021', 8),
(15, 'Мася', '6161b24c6a700.MOV', '09.10.2021', 8),
(16, 'Загадка', '61628c5bb42dd.MOV', '10.10.2021', 9),
(18, 'Бабушка что то готовит', '6162a3c8a62da.mp4', '10.10.2021', 1),
(19, 'чувапчичи', '6162c44deffcd.mp4', '10.10.2021', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment_gallery`
--
ALTER TABLE `comment_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment_video`
--
ALTER TABLE `comment_video`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `likes_gallery`
--
ALTER TABLE `likes_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `likes_video`
--
ALTER TABLE `likes_video`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `comment_gallery`
--
ALTER TABLE `comment_gallery`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `comment_video`
--
ALTER TABLE `comment_video`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `file`
--
ALTER TABLE `file`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT для таблицы `likes_gallery`
--
ALTER TABLE `likes_gallery`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `likes_video`
--
ALTER TABLE `likes_video`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `music`
--
ALTER TABLE `music`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `video`
--
ALTER TABLE `video`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
