-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.43 - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных games
CREATE DATABASE IF NOT EXISTS `games` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `games`;

-- Дамп структуры для таблица games.game
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `publisher_id` int(10) unsigned NOT NULL,
  `year` year(4) NOT NULL,
  `comment` text,
  `first_play` date DEFAULT NULL,
  `grade` enum('0','1','2','3','4','5') DEFAULT NULL,
  `series_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_publisher_id` (`publisher_id`),
  KEY `FK2_series_id` (`series_id`),
  CONSTRAINT `FK2_series_id` FOREIGN KEY (`series_id`) REFERENCES `game_series` (`id`),
  CONSTRAINT `FK_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы games.game: ~14 rows (приблизительно)
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` (`id`, `name`, `description`, `publisher_id`, `year`, `comment`, `first_play`, `grade`, `series_id`) VALUES
	(1, 'The Witcher', '«Ведьмак» — ролевая игра, действие которой разворачивается в мрачном фэнтезийном мире. Мораль здесь — понятие относительное, а грань между добром и злом стёрта. Создатели игры уделили большое внимание сюжету и развитию персонажей, а тщательно продуманная боевая система в режиме реального времени делает историю ещё динамичней.', 1, '2007', NULL, '2010-07-06', '5', 1),
	(2, 'The Witcher 2: Assassins of Kings', '«Ведьмак 2: Убийцы королей», вторая часть приключений профессионального охотника на монстров Геральта из Ривии, разворачивает зрелую, философскую историю — продолжение одной из наиболее детально проработанных ролевых игр, когда-либо выходивших для ПК.', 1, '2011', NULL, '2012-08-12', '5', 1),
	(3, 'The Witcher 3: Wild Hunt', '«Ведьмак 3: Дикая Охота» — это сюжетная ролевая игра с открытым миром. Её действие разворачивается в поразительной волшебной вселенной, и любое ваше решение может повлечь за собой серьёзные последствия. Вы играете за профессионального охотника на монстров Геральта из Ривии, которому поручено найти Дитя предназначения в огромном мире, полном торговых городов, пиратских островов, опасных горных перевалов и заброшенных пещер.', 1, '2015', NULL, '2015-05-20', '5', 1),
	(6, 'World of tanks', 'World of Tanks — культовая ММО-игра о бронетехнике, покорившая миллионы игроков по всему миру. Разнообразие игровых карт, исторически достоверные машины, реалистичный геймплей — присоединяйтесь к армии танкистов и окунитесь в атмосферу легендарных сражений.', 2, '2010', 'Можно покатать', '2015-09-03', '4', NULL),
	(7, 'The Elder Scrolls V: Skyrim', 'Долгожданная новая глава в саге Elder Scrolls появилась от разработчиков, создавших «Игру года» в 2006 и 2008 годах — Bethesda Game Studios. В Skyrim понятие фантастического эпоса в открытом мире было переосмыслено и выведено на качественно новый уровень, позволяя вам исследовать полноценный виртуальный мир в том направлении, в каком вы пожелаете.', 3, '2011', 'СКАЙРИИИМ ДЛЯ НОРДОВ', '2012-01-03', '5', 2),
	(8, 'Terraria', 'Копайте, сражайтесь, исследуйте, стройте! Нет ничего невозможного в этой насыщенной событиями приключенческой игре. Весь мир — ваше полотно, а вся земля — ваши краски!', 4, '2011', NULL, NULL, NULL, NULL),
	(10, 'Forager', 'Forager — это 2D-игра с открытым миром, вдохновленная механикой исследования, фермерства и создания предметов из таких игр, как Stardew Valley, Terraria и Zelda.', 5, '2019', NULL, NULL, NULL, NULL),
	(11, 'Astroneer', 'Исследуйте и меняйте далекие планеты! События в игре происходят в эпоху межгалактических открытий в XXV веке, когда человечество добралось до границ космического пространства. Рискуя собственной жизнью, космооткрыватели в суровых условиях исследуют неизведанное и постигают тайны Вселенной.', 6, '2016', NULL, NULL, NULL, NULL),
	(14, 'PAYDAY 2', 'PAYDAY 2 is an action-packed, four-player co-op shooter that once again lets gamers don the masks of the original PAYDAY crew - Dallas, Hoxton, Wolf and Chains - as they descend on Washington DC for an epic crime spree. ', 7, '2013', NULL, NULL, NULL, NULL),
	(15, 'Assassin’s Creed IV Black Flag', '1715 год, Карибские острова. Пираты стали истинными владыками моря и суши, организовав собственную республику беззакония, жадности и жестокости.', 8, '2013', 'Очень понравилась', '2014-01-26', '4', 3),
	(16, 'Assassin\'s Creed', 'Assassin\'s Creed™ — игра нового поколения, разработанная Ubisoft Montreal, которая изменила представление об экшн-жанре. Пока другие игры претендуют называться новым поколением, пытаясь впечатлить нас графикой и физикой, Assassin\'s Creed сливает технологии, игровой дизайн, мотивы и чувства в мир, где вы вызываете хаос и становитесь могущественным, но уязвимым агентом смерти.', 8, '2008', 'Немного сложное управление, но игра хороша', '2009-08-06', '5', 3),
	(17, 'Assassin\'s Creed 2', 'Assassin’s Creed® 2 — это продолжение одной из самых известных и продаваемых игр в истории игровой индустрии. Долгожданное продолжение обрело нового героя — молодого итальянского дворянина Эцио Аудиторе да Фиренце, а также новую эру — эпоху Возрождения.', 8, '2010', NULL, '2010-07-06', '4', 3),
	(18, 'Assassin’s Creed Brotherhood', 'Живите и дышите, как Эцио, легендарный Ассасин-мастер, сражающийся против Тамплиеров. Он должен попасть в самый большой город Италии, Рим, центр власти, алчности и коррупции, где он ударит прямо в сердце врага.', 8, '2011', NULL, '2012-03-10', '4', 3),
	(20, 'Assassin\'s Creed Revelations', 'Когда человек выиграл во всех своих битвах и победил всех своих врагов, чего ему еще добиваться? Эцио Аудиторе должен посвятить свою жизнь поиску ответов, поиску истины.', 8, '2011', NULL, '2013-07-06', '5', 3);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;

-- Дамп структуры для таблица games.game_genres
CREATE TABLE IF NOT EXISTS `game_genres` (
  `genre_id` int(10) unsigned NOT NULL,
  `game_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`genre_id`,`game_id`),
  KEY `FK_game` (`game_id`),
  CONSTRAINT `FK_game` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  CONSTRAINT `FK_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы games.game_genres: ~26 rows (приблизительно)
/*!40000 ALTER TABLE `game_genres` DISABLE KEYS */;
INSERT INTO `game_genres` (`genre_id`, `game_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 6),
	(1, 7),
	(1, 8),
	(3, 8),
	(4, 8),
	(5, 8),
	(3, 10),
	(4, 10),
	(5, 10),
	(3, 11),
	(5, 11),
	(1, 14),
	(4, 14),
	(4, 15),
	(5, 15),
	(4, 16),
	(5, 16),
	(4, 17),
	(5, 17),
	(4, 18),
	(5, 18),
	(4, 20),
	(5, 20);
/*!40000 ALTER TABLE `game_genres` ENABLE KEYS */;

-- Дамп структуры для таблица games.game_series
CREATE TABLE IF NOT EXISTS `game_series` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы games.game_series: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `game_series` DISABLE KEYS */;
INSERT INTO `game_series` (`id`, `name`) VALUES
	(1, 'The Witcher'),
	(2, 'The Elder Scrolls'),
	(3, 'Assassin\'s Creed');
/*!40000 ALTER TABLE `game_series` ENABLE KEYS */;

-- Дамп структуры для таблица games.genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы games.genre: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`id`, `name`) VALUES
	(1, 'RPG'),
	(2, 'MMO RPG'),
	(3, 'Indie'),
	(4, 'Action'),
	(5, 'Adventure');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

-- Дамп структуры для таблица games.publisher
CREATE TABLE IF NOT EXISTS `publisher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы games.publisher: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` (`id`, `name`) VALUES
	(1, 'CD Projekt RED'),
	(2, 'Wargaming'),
	(3, 'Bethesda Softworks'),
	(4, 'Re-Logic'),
	(5, 'Humble Bundle'),
	(6, 'System Era Softworks'),
	(7, 'Starbreeze Publishing AB'),
	(8, 'Ubisoft');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
