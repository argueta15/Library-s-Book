-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.31-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table librarybd.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `published_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_name_unique` (`name`),
  KEY `books_category_id_foreign` (`category_id`),
  CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.books: ~101 rows (approximately)
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id`, `name`, `author`, `category_id`, `published_date`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Quas voluptatem sit.', 'Terrill Abbott DVM', 31, '1979-03-25', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(2, 'Sit quam illum.', 'Whitney Turner', 49, '1999-11-09', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(3, 'Qui dolorem dolor.', 'Prof. Presley Moen III', 44, '1987-11-16', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(4, 'A quia consequatur.', 'Hiram Jaskolski', 36, '1978-02-02', 0, '2018-10-06 00:12:13', '2018-10-06 00:15:40'),
	(5, 'Dolore ea eum.', 'Serenity Mayert', 19, '2007-08-07', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(6, 'Possimus laboriosam.', 'Mrs. Maxie Bednar Sr.', 12, '2004-10-28', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(7, 'Omnis ab.', 'Mr. Mack Runolfsdottir DDS', 6, '2018-03-27', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(8, 'Necessitatibus incidunt vel.', 'Elvie Kovacek', 27, '1985-01-22', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(9, 'Consectetur sit.', 'Jovanny Gutkowski', 35, '1990-10-18', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(10, 'Est qui.', 'Tatum Renner', 49, '1974-04-18', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(11, 'Nulla perspiciatis.', 'Miss Stephanie Barrows', 30, '1972-04-17', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(12, 'Autem doloremque.', 'Burley Zulauf', 4, '2001-01-31', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(13, 'Voluptates sint sit.', 'Jacinto Beer', 39, '1972-01-30', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(14, 'Consectetur neque.', 'Darian Gusikowski', 7, '1987-11-07', 0, '2018-10-06 00:12:13', '2018-10-06 00:20:29'),
	(15, 'Eos sed.', 'Herminio Carter', 41, '1993-01-25', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(16, 'Aut placeat.', 'Remington Volkman', 21, '2018-08-21', 0, '2018-10-06 00:12:13', '2018-10-06 00:15:08'),
	(17, 'Ducimus facere.', 'Joel Farrell', 13, '1970-03-23', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(18, 'Natus qui.', 'Della Hermiston', 5, '2000-08-30', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(19, 'Tenetur ab.', 'Mr. Myles Bosco DVM', 3, '2015-08-28', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(20, 'Ut fugiat explicabo.', 'Juwan Schmeler', 11, '2009-07-08', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(21, 'Deserunt labore.', 'Pete McKenzie', 12, '1984-03-04', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(22, 'Recusandae excepturi.', 'Quinton Jakubowski', 8, '1991-10-28', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(23, 'Qui omnis.', 'Prof. Toni Schumm', 16, '1976-01-27', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(24, 'Facilis rem minus.', 'Marcus Strosin DVM', 34, '2014-01-06', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(25, 'Autem dolores.', 'Prof. Vincenza Prosacco DVM', 13, '2017-11-09', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(26, 'Vel qui consectetur.', 'Melyssa Conroy', 21, '2008-12-12', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(27, 'Enim maiores.', 'Chaya Lindgren DDS', 45, '1990-12-11', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(28, 'Deleniti voluptatem.', 'Arvilla Wilderman', 35, '2014-02-17', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(29, 'Hic cupiditate.', 'Daphnee Ullrich', 46, '1973-09-09', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(30, 'Eos assumenda adipisci.', 'Osborne Gutmann MD', 27, '1984-04-20', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(31, 'Non quasi.', 'Erika Okuneva', 34, '2002-06-04', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(32, 'Et ex.', 'Cullen Paucek', 31, '1971-11-06', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(33, 'Vitae autem voluptatum.', 'Adell Schaefer', 3, '2016-05-20', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(34, 'Pariatur doloribus perferendis.', 'Clare Klocko III', 37, '2014-11-09', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(35, 'Quasi tempora.', 'Nicolas Bosco', 39, '1971-11-21', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(36, 'Est mollitia voluptates.', 'Mr. Abe Schroeder', 19, '2010-04-18', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(37, 'Itaque magnam.', 'Dr. Rickie Howe', 1, '1999-08-31', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(38, 'In et.', 'Dr. Macie Becker DDS', 26, '2001-01-13', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(39, 'Possimus est.', 'Aracely Borer', 38, '2002-04-08', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(40, 'Delectus ut.', 'Mr. Bill Dickens I', 26, '2016-02-01', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(41, 'Dolores aut sit.', 'Maybell Lind', 10, '1998-09-26', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(42, 'Et molestiae ea.', 'Winnifred Murray', 50, '2012-03-12', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(43, 'Voluptas maxime velit.', 'Easter Watsica DDS', 18, '1979-04-10', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(44, 'Consequatur non et.', 'Citlalli Anderson DDS', 25, '2006-01-28', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(45, 'Repellendus voluptatibus cum.', 'Miss Valerie Rogahn', 33, '1988-12-06', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(46, 'Dolorum quo inventore.', 'Haskell Treutel', 27, '2014-10-15', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(47, 'Officia iure iure.', 'Dr. Akeem Medhurst', 39, '1972-06-25', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(48, 'Enim dignissimos qui.', 'Lucio Hackett II', 45, '1997-07-09', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(49, 'Nostrum voluptatem debitis.', 'Prof. Eulalia Bashirian I', 2, '1982-04-23', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(50, 'Cum autem error.', 'Sammy Gerhold', 49, '1993-06-26', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(51, 'Commodi sunt praesentium.', 'Shayne Runolfsdottir', 37, '1997-11-28', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(52, 'Aut incidunt alias.', 'Ms. Brianne Haley I', 13, '1979-04-14', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(53, 'Eveniet voluptatum maxime.', 'Josue Champlin', 19, '1997-01-08', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(54, 'Qui vel commodi.', 'Bradley Wolf', 15, '2001-05-04', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(55, 'Nihil id.', 'Andrew Towne', 8, '1993-06-26', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(56, 'Sit quasi et.', 'Ms. Augusta Beier IV', 1, '1971-11-16', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(57, 'Officiis sed.', 'Mr. Harold Goodwin', 46, '1979-12-22', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(58, 'Nostrum error.', 'Mr. Ansley Goyette', 45, '1998-04-20', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(59, 'Et eius debitis.', 'Chelsea Kirlin IV', 16, '1998-08-03', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(60, 'Qui ipsum.', 'Daphney Blanda', 7, '2015-01-29', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(61, 'Atque labore.', 'Winona Gulgowski', 1, '2017-06-09', 0, '2018-10-06 00:12:13', '2018-10-06 00:14:53'),
	(62, 'Reprehenderit quas.', 'Pat Raynor', 13, '2017-03-16', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(63, 'Magni molestias.', 'Prof. Emmitt Goyette Jr.', 43, '1989-07-31', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(64, 'Quaerat dolor omnis.', 'Dr. Yadira Douglas', 48, '1975-01-14', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(65, 'Tempora quis deserunt.', 'Ansley Abshire', 3, '1992-04-11', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(66, 'Doloribus sed.', 'Alexane Kunde', 9, '2008-06-27', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(67, 'Accusamus magni.', 'Chadrick Rippin', 24, '2001-05-01', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(68, 'Sint animi unde.', 'Barbara Kuphal', 28, '1989-01-13', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(69, 'Tempora voluptas odit.', 'Prof. Shanna Rohan', 47, '2004-06-21', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(70, 'Consequuntur ut.', 'Layne Zemlak', 20, '1986-08-08', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(71, 'Perspiciatis est et.', 'Kamille O\'Kon', 19, '1973-09-21', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(72, 'Velit eos.', 'Dr. Orland Johns', 8, '1982-07-27', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(73, 'Error temporibus.', 'Corene Vandervort', 32, '1987-08-02', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(74, 'Blanditiis tenetur sed.', 'Mr. Kolby Mueller', 1, '1971-04-13', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(75, 'Reiciendis maiores.', 'Quincy Abshire', 25, '1989-03-09', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(76, 'Explicabo repellendus et.', 'Cheyenne Leuschke', 28, '1994-06-20', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(77, 'Quis et est.', 'Madison Kub', 46, '1992-07-03', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(78, 'Vitae natus repellendus.', 'Mr. Royce Ledner', 23, '1990-08-07', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(79, 'Dolore non fugiat.', 'Prof. Gardner Hegmann DVM', 47, '1987-06-15', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(80, 'Voluptas rerum.', 'Aida Veum DVM', 19, '1998-07-10', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(81, 'Quasi sint.', 'Mr. Jules Jakubowski', 15, '1989-11-19', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(82, 'Dolor nesciunt maiores.', 'Ms. Anabel Hermann', 43, '1973-01-01', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(83, 'Inventore placeat.', 'Mohammad Langworth', 12, '1983-03-11', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(84, 'Velit sunt sint.', 'Cydney Fadel', 46, '1970-07-06', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(85, 'Corporis accusantium.', 'Javier West', 30, '1982-08-27', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(86, 'Eligendi et debitis.', 'Okey Nienow', 44, '1990-01-18', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(87, 'Repudiandae accusantium.', 'Leann Cronin', 13, '2000-11-17', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(88, 'Recusandae distinctio.', 'Nelle Flatley III', 40, '1970-08-16', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(89, 'Vero molestias.', 'Connor Eichmann', 44, '2012-04-16', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(90, 'Hic necessitatibus.', 'Ian Parker', 36, '1988-12-29', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(91, 'Dolores fugiat.', 'Eriberto Abbott', 4, '1980-01-25', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(92, 'Vitae distinctio.', 'Ronny O\'Conner', 42, '2012-03-20', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(93, 'Iusto voluptatum vitae.', 'Mr. Gayle Spinka MD', 39, '2013-01-06', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(94, 'Molestiae qui.', 'Dr. Deon Lehner PhD', 32, '1994-09-07', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(95, 'Molestias dolores nesciunt.', 'Anibal Hartmann', 43, '1989-09-15', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(96, 'Corrupti nihil voluptatem.', 'Stan Koss', 50, '1982-08-29', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(97, 'Officiis omnis.', 'Estelle Schmidt', 24, '1986-11-23', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(98, 'Labore omnis similique.', 'Davion Price', 37, '1981-12-14', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(99, 'Quas exercitationem.', 'Zack Spinka', 8, '1970-01-09', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(100, 'Ut architecto ullam.', 'Travis Beier', 28, '2007-10-16', 1, '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(101, 'ingles 1', 'brian', 51, '2018-10-10', 1, '2018-10-06 00:24:57', '2018-10-06 00:27:04');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- Dumping structure for table librarybd.book_user
CREATE TABLE IF NOT EXISTS `book_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `book_user_book_id_foreign` (`book_id`),
  KEY `book_user_user_id_foreign` (`user_id`),
  CONSTRAINT `book_user_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `book_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.book_user: ~5 rows (approximately)
/*!40000 ALTER TABLE `book_user` DISABLE KEYS */;
INSERT INTO `book_user` (`id`, `book_id`, `user_id`, `status`) VALUES
	(1, 61, 20, 1),
	(3, 16, 1, 1),
	(4, 4, 8, 1),
	(5, 14, 8, 1),
	(6, 101, 21, 0);
/*!40000 ALTER TABLE `book_user` ENABLE KEYS */;

-- Dumping structure for table librarybd.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.categories: ~51 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Occaecati.', 'Ipsam ab suscipit iste. Tempore debitis asperiores similique voluptatem voluptas enim neque.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(2, 'Debitis consequuntur.', 'Quae aperiam atque excepturi quo magnam et dolore. Nesciunt omnis qui qui et.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(3, 'Facilis.', 'Placeat aut modi harum numquam fuga. Rerum consequuntur harum tempore consequatur itaque et. Eveniet quas vero enim adipisci aut optio sed.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(4, 'Quibusdam ut.', 'Ipsa aut eveniet tempore. Dolor rem autem excepturi omnis. Consectetur dolores enim quis et quidem sit debitis officiis.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(5, 'Error.', 'Deserunt delectus id et unde. Alias doloribus expedita et sequi quos dicta. Rerum at rerum eveniet corrupti.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(6, 'Veniam excepturi.', 'Aut illo repellendus reprehenderit et voluptatem cumque fugit. Nesciunt perspiciatis recusandae qui praesentium in.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(7, 'Ut.', 'Ut nemo modi ipsum hic. Laudantium labore dolorem quae voluptatibus. Odit ducimus eum maiores vel dignissimos vitae.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(8, 'Eum.', 'Et est rem sed sit enim fugiat distinctio. Quia doloribus deleniti qui quis.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(9, 'Esse reiciendis.', 'Modi aperiam alias vero eveniet vel reiciendis. Ea qui numquam asperiores ut aut. Illo cupiditate dolorum cum explicabo qui quibusdam.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(10, 'Quae non.', 'Voluptates non quo aut asperiores. Quo molestias consectetur deserunt necessitatibus numquam cum neque. Sunt mollitia dolor debitis rerum.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(11, 'Ea architecto.', 'Fugit repellat deserunt iusto minima occaecati dignissimos alias saepe. Dolor molestiae numquam dolores modi fugiat.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(12, 'Quo.', 'Saepe molestiae quas tempora alias sequi quis hic. Autem facere repellendus quidem omnis. Est id unde consequuntur qui temporibus autem.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(13, 'Id aut.', 'Est in ut nostrum necessitatibus. Voluptate quaerat rerum omnis consequatur qui quisquam maxime. Est doloribus animi iusto quam.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(14, 'Ut nobis.', 'Consectetur tenetur fuga quis alias. Molestiae reiciendis et nemo consequatur. Sed et fugit quia eum. Vel qui a assumenda suscipit numquam.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(15, 'Nam id.', 'Veniam inventore provident repudiandae. Est quia sint est dolor non. Deleniti veritatis perspiciatis aut explicabo ducimus.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(16, 'Aut culpa.', 'Harum molestiae et quidem nobis. Repellat necessitatibus ut error. Enim aliquam ab inventore eum.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(17, 'Officiis officiis.', 'Velit ab est atque illo. Corrupti expedita ut aut. Repudiandae inventore consequuntur exercitationem in.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(18, 'Aut aliquam.', 'Sed sapiente vitae ut voluptatum quis aut voluptas autem. Aliquid et et assumenda ut. Sunt praesentium iste in optio quae.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(19, 'Et commodi.', 'Sed deleniti consequuntur quia. Ut non et fugiat nemo molestiae. Cum quo culpa eligendi distinctio impedit magnam.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(20, 'Ipsa atque.', 'Sint ipsam et ducimus at et ut. Et eum distinctio aliquid recusandae. Sint quis ea et veniam.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(21, 'Omnis optio.', 'Et qui magnam et minus fuga optio hic. Dicta sint fuga rem libero est.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(22, 'Ab corrupti.', 'At perferendis minima rerum quis. Voluptatem rem neque facere esse consequatur vel. Porro unde consequatur ipsum.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(23, 'Nihil laboriosam.', 'Amet assumenda et tempora ut velit. Molestias corporis ipsam fuga.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(24, 'Aspernatur.', 'Nihil expedita necessitatibus deserunt sed aut consequatur exercitationem. Consectetur aut neque tenetur officia.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(25, 'Sint.', 'Velit consectetur nam aut esse vero. Ratione ipsa veniam aut magnam asperiores veniam ut omnis. Et mollitia esse corporis accusantium.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(26, 'In.', 'Dolores ullam ipsum quae. Soluta iure temporibus odit sapiente qui quia tempore aliquid. Doloribus libero molestiae tenetur.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(27, 'Iusto.', 'Dolor provident quia quidem et accusamus reprehenderit. Incidunt quos et id ut rerum. Qui sed vel ut magnam fugit.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(28, 'Atque ut.', 'Enim ea autem odio illo ullam. Iste commodi omnis unde voluptates. Laudantium soluta incidunt omnis eius.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(29, 'Est.', 'Voluptas eveniet at debitis dolores ut eum repudiandae. Non ab temporibus consequatur qui qui dolores. Et fuga modi perspiciatis aut.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(30, 'Esse id.', 'Vitae enim laborum blanditiis. Non neque nihil officiis maxime beatae qui.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(31, 'Iste.', 'Dolor dolorem consectetur soluta. Illo aliquam tempore voluptas quo neque eos. Quidem modi aspernatur corrupti et laborum.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(32, 'Rem.', 'Rerum et suscipit enim quo aut labore doloremque. Ducimus labore assumenda et eos. Fuga delectus libero est est nam cupiditate nesciunt.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(33, 'Laudantium omnis.', 'Esse aspernatur voluptas at culpa consectetur beatae modi. Libero suscipit hic et. Sed dicta aut sapiente.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(34, 'Totam.', 'Nobis odio dolore aut accusantium iure quas eos. Velit cumque sint et saepe est. Tenetur deleniti vitae laudantium.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(35, 'Molestias aliquam.', 'Corporis voluptatem sed fugiat dolorum. Culpa cum voluptate id ipsa aut laboriosam. Iusto aut fuga unde placeat quibusdam fugit.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(36, 'Odit.', 'Voluptatem dolores aliquid ad non ea. Eaque aut modi enim facere. Ut est molestiae tempore qui molestiae ullam et.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(37, 'Repellat dignissimos.', 'Repellat nihil id nihil impedit. Nisi quia autem cupiditate et. Officia nesciunt voluptatum eum. Qui minus ratione quo sit et autem itaque.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(38, 'Et.', 'Id atque voluptate expedita dolorem. Quaerat cum non sunt voluptatum corrupti. Molestiae mollitia dolorum dolor porro nihil et voluptatem.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(39, 'Aut.', 'Maxime et consequatur asperiores blanditiis. Aut tenetur ut rerum reiciendis odio corporis nisi. Impedit eos in in.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(40, 'Nisi eum.', 'Omnis in ut aut cum eos. Mollitia similique ut velit rerum. Earum reiciendis totam esse esse.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(41, 'Non eveniet.', 'Natus corrupti vel animi. Voluptas quo expedita et sit. Autem cupiditate ea voluptate expedita.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(42, 'Quisquam omnis.', 'Eos nulla provident et ut. Iste reprehenderit earum autem dolores ducimus eos dolore. Debitis voluptatum provident nostrum ipsa similique.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(43, 'Sed.', 'Nihil sequi ex ea quisquam quis. Maiores ducimus at tenetur blanditiis praesentium. Earum occaecati id iste culpa quo.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(44, 'Magnam repellat.', 'Ea totam quas error ut quidem sint debitis vel. Magni voluptatum cumque et aut qui autem porro. Architecto eum excepturi qui.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(45, 'Numquam qui.', 'Id minima ut ipsum quia sit corporis id. Sit voluptatum et quia quo excepturi aut ea. Veritatis odit enim id et consequatur.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(46, 'Qui voluptatibus.', 'Magnam ea ut placeat vel. Tenetur quo ut tempore qui deleniti. Expedita sed aut et.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(47, 'Earum vel.', 'Corporis eos quo nulla et facere dolorem quisquam. Consequatur id natus ut. Laboriosam omnis deserunt corrupti dolores.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(48, 'Consequatur.', 'Ad velit neque at possimus ea. Dolor sunt omnis voluptas consequatur. Sit voluptas qui qui ut totam perferendis.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(49, 'Rerum est.', 'Repellendus quis quia natus odio. Aliquam eaque neque nostrum earum. Et necessitatibus necessitatibus dolores sunt.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(50, 'Alias.', 'Accusamus reiciendis rerum qui vel voluptatem recusandae. Earum consectetur aut autem est error.', '2018-10-06 00:12:13', '2018-10-06 00:12:13'),
	(51, 'ingles', 'aprender ingles', '2018-10-06 00:24:08', '2018-10-06 00:24:08');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table librarybd.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.migrations: ~10 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2018_10_02_215833_create_categories_table', 1),
	(9, '2018_10_02_215850_create_books_table', 1),
	(10, '2018_10_04_172346_alter_users_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table librarybd.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.oauth_access_tokens: ~4 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('67c9e6a3ffa653861d335e2c59313735242ba536e6bb08dafbe8a749d0a5b1e9d6e78a3d0fff2e95', 2, 2, NULL, '[]', 0, '2018-10-06 00:13:12', '2018-10-06 00:13:12', '2019-10-06 00:13:12'),
	('a43b117b9573b6712ea17880f5b56caf30bb372c0816cf28fbdcd9e8d26fc0f6a882c39a00615f63', 2, 2, NULL, '[]', 0, '2018-10-06 00:34:04', '2018-10-06 00:34:04', '2019-10-06 00:34:04'),
	('a899ff6e0ddeadd57bccff39666a01a22f600f28467b1816f1cfcba6e6f6edc887997bfbf752dc9f', 2, 2, NULL, '[]', 0, '2018-10-06 00:23:04', '2018-10-06 00:23:04', '2019-10-06 00:23:04'),
	('af5ee23a2bb7f8a87c8f7b1ee24cda037616cc8025c5efe738cfa07fcd589830f7d204d9d406a962', 2, 2, NULL, '[]', 0, '2018-10-06 00:26:48', '2018-10-06 00:26:48', '2019-10-06 00:26:48');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table librarybd.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.oauth_auth_codes: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table librarybd.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.oauth_clients: ~2 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'jeh22DdPO92XXTO2edWv0KCYzsTabIV3IQG55KPJ', 'http://localhost', 1, 0, 0, '2018-10-06 00:12:27', '2018-10-06 00:12:27'),
	(2, NULL, 'Laravel Password Grant Client', 'JlGuUJVxBRI7ZOow13Dx2cj88pFVRtfCtaZtKUwM', 'http://localhost', 0, 1, 0, '2018-10-06 00:12:27', '2018-10-06 00:12:27');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table librarybd.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.oauth_personal_access_clients: ~1 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2018-10-06 00:12:27', '2018-10-06 00:12:27');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table librarybd.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.oauth_refresh_tokens: ~4 rows (approximately)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
	('159ad811ec8475ff0ec2dd44a3c6faaf36e2581f39796a3557515cac5e54f132ca4d047e882762b2', 'a899ff6e0ddeadd57bccff39666a01a22f600f28467b1816f1cfcba6e6f6edc887997bfbf752dc9f', 0, '2019-10-06 00:23:04'),
	('25fc971d7b8afa539c52289c8eaa0c434b11acbf9f831267c0bc4c1bc11f836c14cf2187c6b7e24f', '67c9e6a3ffa653861d335e2c59313735242ba536e6bb08dafbe8a749d0a5b1e9d6e78a3d0fff2e95', 0, '2019-10-06 00:13:12'),
	('9af4d9c7b202c2a6cab7119ed0611b521dc1aaf18f6fa1e820f38b23a875f81b55c57ee69ff9c4bd', 'af5ee23a2bb7f8a87c8f7b1ee24cda037616cc8025c5efe738cfa07fcd589830f7d204d9d406a962', 0, '2019-10-06 00:26:48'),
	('beb1736888e272b5f1348f823e930c7b793e499ec056e75bd98bfe6034db8e477e47e61e50a0f14e', 'a43b117b9573b6712ea17880f5b56caf30bb372c0816cf28fbdcd9e8d26fc0f6a882c39a00615f63', 0, '2019-10-06 00:34:04');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table librarybd.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table librarybd.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('superadmin','admin','guest') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'guest',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table librarybd.users: ~21 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `phone`, `type`) VALUES
	(1, 'Ms. Pattie Gerlach', 'roberts.brionna@example.org', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'pZrP6CZF68', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '841505775X', 'guest'),
	(2, 'Mrs. Damaris Corkery DDS', 'chester.bruen@example.net', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'aUafouT5uq', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '9908210114', 'admin'),
	(3, 'Jerrod Boyle', 'mcclure.nolan@example.org', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'ZNp3preOfO', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '6277242822', 'guest'),
	(4, 'Lisette Sauer', 'bergnaum.edwardo@example.org', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'zKynPiL25q', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '6442361462', 'admin'),
	(5, 'Pierre Shields', 'hansen.bobby@example.net', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', '2Ep6QNSoxC', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '7811372290', 'guest'),
	(6, 'Delmer Kozey', 'carissa38@example.org', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', '4le0X1yNdo', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '8366184552', 'guest'),
	(7, 'Dr. Berenice Brakus', 'fritsch.theresa@example.org', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'FhD150vNLP', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '9651997907', 'guest'),
	(8, 'Aleen Graham', 'devonte54@example.net', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'fs9FH31Tyl', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '2092736000', 'guest'),
	(9, 'Clarabelle Schamberger', 'nkuphal@example.com', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'SLXc057MAz', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '8979951388', 'guest'),
	(10, 'Green Crist', 'lbins@example.org', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'jHXekqhE4Q', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '252042902X', 'guest'),
	(11, 'Prof. Adrienne Kuhn PhD', 'baumbach.reid@example.com', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'zY1HUVrrew', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '3235038213', 'guest'),
	(12, 'Davon Hamill III', 'waters.rogelio@example.net', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'LlBp4FQKWb', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '2138655253', 'guest'),
	(13, 'Dr. Reed Bednar', 'okuphal@example.com', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'OJP3kRsls5', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '6977406798', 'guest'),
	(14, 'Hope Gottlieb', 'armstrong.theresa@example.org', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'q17gLKvhnF', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '6933233960', 'guest'),
	(15, 'Kenna Ebert PhD', 'aric.dicki@example.org', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'nuUcdogcND', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '8159535341', 'admin'),
	(16, 'Daphney Dare III', 'oconnell.lacy@example.net', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'Wd14WwtaDW', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '5799820711', 'guest'),
	(17, 'Bernadette Fahey', 'pfannerstill.quincy@example.org', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'ya95NgmPAZ', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '8621463040', 'guest'),
	(18, 'Jada Jakubowski Jr.', 'maximillia82@example.com', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'DciDQpHY87', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '5658479568', 'admin'),
	(19, 'Alyson Reichert', 'stehr.adan@example.org', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'OhFkOGDN4G', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '6653728935', 'guest'),
	(20, 'Edwardo Wunsch', 'bettye.schimmel@example.net', '$2y$10$P0w8uX9pJpZu3BNR4xBexu4uQffTjwscIzpm7FOrlovztxnstFXXO', 'QFLeAHWAyB', '2018-10-06 00:12:13', '2018-10-06 00:12:13', '5803953733', 'guest'),
	(21, 'Gerardo', 'naorrel@gmail.com', '$2y$10$CO/KLXuf8v6V1U9I9EUVsekCGUhyVMrpmjMhfLbW77ZlMOyK.YyIO', NULL, '2018-10-06 00:23:40', '2018-10-06 00:23:40', '7478965433', 'guest');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
