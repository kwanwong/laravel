-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 19, 2017 at 10:30 AM
-- Server version: 5.7.16-log
-- PHP Version: 7.0.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(8, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(9, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(10, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(11, '2016_06_01_000004_create_oauth_clients_table', 2),
(12, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_auth_codes`
--

INSERT INTO `oauth_auth_codes` (`id`, `user_id`, `client_id`, `scopes`, `revoked`, `expires_at`) VALUES
('abdeed862db9f0338b4c55cc049c9067f3ffdf58c3ca6deb522c88214805a71780b392ce3ae60d8e', 1, 3, '[]', 0, '2017-07-19 18:28:51'),
('d36ec119ed5a1e84da0caf72182c62e3fe2a8207a333adc5857ab2ebc54b0f1cc633eda1e437744d', 1, 3, '[]', 0, '2017-07-19 18:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Ief8m0EPyzta4jOmEMYEqqReXfglG9pdXua4tub4', 'http://laravel.local.com/callback', 1, 0, 0, '2017-07-19 08:12:06', '2017-07-19 08:12:06'),
(2, NULL, 'Laravel Password Grant Client', 'ukJa9nKHvJ6t4HqVNMgfS0bZ1LDx2XYS9FTsGNlH', 'http://localhost', 0, 1, 0, '2017-07-19 08:12:06', '2017-07-19 08:12:06'),
(3, 1, 'client0', 'Gj1DcYJrZLfyKHCCHG4Psa0xAf6Ly4q9TWaXCxV7', 'http://laravel.local.com/callback', 0, 0, 0, '2017-07-19 08:42:53', '2017-07-19 08:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-07-19 08:12:06', '2017-07-19 08:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kwan Wong', 'kopiteken@163.com', '$2y$10$o0MmUQD56uK.Bu2NH2rVMOe/xglN0F25lSfSwppgt6BB4mqWh4EG.', NULL, NULL, NULL),
(2, 'Horace Klein', 'sydney20@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '9AmWKnOuzH', '2017-05-20 04:22:21', '2017-05-20 04:22:21'),
(3, 'Devan Howe', 'ruby30@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'GyjZ6GBHjY', '2017-05-20 04:22:21', '2017-05-20 04:22:21'),
(4, 'Ruth Wolf', 'kade96@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'yvDTw4HU1j', '2017-05-20 04:22:21', '2017-05-20 04:22:21'),
(5, 'Susie Dietrich', 'pspencer@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'NvrGK594jL', '2017-05-20 04:22:22', '2017-05-20 04:22:22'),
(6, 'Ms. Lucinda Wilderman MD', 'hauck.toney@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'X5mU1nQaFd', '2017-05-20 04:22:22', '2017-05-20 04:22:22'),
(7, 'Jackeline Funk', 'mariane.prosacco@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'GnJ4EDp8JS', '2017-05-20 04:22:22', '2017-05-20 04:22:22'),
(8, 'Peter Ebert III', 'craig23@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '89n481i9NL', '2017-05-20 04:22:22', '2017-05-20 04:22:22'),
(9, 'Rhett Cartwright', 'goodwin.durward@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '4r5yirivNf', '2017-05-20 04:22:22', '2017-05-20 04:22:22'),
(10, 'Mr. Rigoberto Grady DVM', 'uriel28@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'MEgBZJbCIi', '2017-05-20 04:22:22', '2017-05-20 04:22:22'),
(11, 'Amelia Hackett DDS', 'freida.champlin@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'JS4sxjwUS4', '2017-05-20 04:22:22', '2017-05-20 04:22:22'),
(12, 'Mckenzie Parisian', 'toconner@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '4X1aNRYS5r', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(13, 'Dr. Dudley Nikolaus', 'nlang@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'Z2K3ZpfCl8', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(14, 'Kenny Lind', 'xrenner@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '6aAAIiq70S', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(15, 'Laney Bode', 'ujast@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'CcG2iXfmhn', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(16, 'Mrs. Ashly Wehner IV', 'javon.krajcik@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'LbIClojU4m', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(17, 'Prof. Declan Heaney II', 'johan.hoppe@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'npYqwMEz7B', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(18, 'Sierra Schowalter', 'frederic.anderson@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'DSGsYtTk2D', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(19, 'Shania Beier II', 'lesch.thaddeus@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'ozybWkjute', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(20, 'Jairo Pouros', 'mable70@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'w6dOPQm3gP', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(21, 'Monroe Harber', 'kunze.gerard@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'Y4pToHMNQx', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(22, 'Mr. Alphonso Gusikowski DVM', 'barton.jamie@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '2GiQsZ6eK6', '2017-05-20 04:23:40', '2017-05-20 04:23:40'),
(23, 'Boyd Kreiger', 'jeremy64@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'mJbtiTL4lQ', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(24, 'Dr. Uriel Renner', 'rbins@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'N2RXsIT87V', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(25, 'Juliet Ullrich', 'judah64@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'A962BUeQvQ', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(26, 'Justus Yost', 'nankunding@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '0JiM4Xszr8', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(27, 'Sigrid Feeney', 'keeley47@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'C0NJvX4Vza', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(28, 'Jammie Wolff', 'oconnell.tomasa@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'Urpk9mrgir', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(29, 'Gia Ziemann Sr.', 'dcummerata@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'BIKkEhaOVZ', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(30, 'Bethel Stark', 'tristin.tromp@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'zyvYmMLCay', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(31, 'Marguerite Olson I', 'mcdermott.marianna@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'FGCAKzX5eh', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(32, 'Sam Daugherty', 'cbruen@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '8IaTnFobGi', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(33, 'Miss Oceane Stehr I', 'bridget.hand@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'JA9Q6DMvMy', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(34, 'Deven Crona', 'anastacio22@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'gLZwMGwC2e', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(35, 'Jaleel Swaniawski', 'judson.stark@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'gJHQ74D90f', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(36, 'Blair Jacobs', 'feeney.moses@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'MpPLwVtCGA', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(37, 'Mr. Tracey Eichmann DDS', 'mraz.lafayette@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'cACGQi9ItT', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(38, 'Mrs. Libby Durgan', 'cristian.lynch@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'ObmtdW5tSc', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(39, 'Frankie Zemlak DDS', 'brown.pink@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'L8TcHZOW9R', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(40, 'Conor Hagenes', 'pgoldner@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'HbWHPfHwcr', '2017-05-20 04:23:41', '2017-05-20 04:23:41'),
(41, 'Mr. Arely Auer Sr.', 'streich.eddie@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'qJPDPB4acs', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(42, 'Yoshiko Waters', 'maybelle30@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'Az9PDwaBkw', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(43, 'Desiree Lesch', 'kassulke.alyce@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'wrzzG75Kf3', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(44, 'Adell Olson Sr.', 'emerald.schmidt@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'a0bRkIbeR1', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(45, 'Jamir Murray', 'melyssa32@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '0dCvX107Sx', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(46, 'Deonte Rempel III', 'plarson@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'xlbHxEY4nC', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(47, 'Prof. Abner Pfeffer V', 'yvette08@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '6mwUXjKOqw', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(48, 'Foster Ruecker', 'elda99@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'P7QfZqRFqk', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(49, 'Anita Windler', 'peffertz@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'DsSRgBj6vi', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(50, 'Louvenia Gutmann', 'watsica.aracely@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'kkmbkwIC0p', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(51, 'Barbara Torphy', 'jconsidine@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'd3Se0GYzt9', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(52, 'Mr. Justice Kilback', 'israel.zulauf@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'TzgfQSvh1r', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(53, 'Modesta Larson', 'koelpin.julia@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'FkUkXLqMDU', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(54, 'Golda Mohr', 'zzulauf@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '512aqxw6UX', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(55, 'Johann Hermann', 'marisa.ankunding@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'l2uTKpYawj', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(56, 'Prof. Payton Johnston', 'lenny35@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'oxtIhP7hcy', '2017-05-20 04:23:42', '2017-05-20 04:23:42'),
(57, 'Prof. Mariam Cremin', 'sjohnson@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'whnw2Ub6oe', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(58, 'Dr. Blaise Leffler DDS', 'will.ava@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'XDHlMFYuiH', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(59, 'Grady Stokes Jr.', 'olson.madilyn@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'n4VIWRWXdB', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(60, 'Everette Prohaska DVM', 'kaylah.mayert@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'J6Nm28dqfd', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(61, 'Rubye Stracke', 'archibald.howe@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'dCGlAIMg6A', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(62, 'Mr. Elian Dach II', 'qkuphal@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'GI9pFb0CYb', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(63, 'Rubie Hirthe', 'dalton71@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'kngfK6xzdL', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(64, 'Martina Kuvalis', 'sweber@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '0BCrtrSN0U', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(65, 'Rahsaan Hyatt', 'tjaskolski@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '1tkNxFqltV', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(66, 'Zakary Krajcik', 'wgaylord@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'nwuxu3hg7N', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(67, 'Wilfredo Metz Jr.', 'manuel.effertz@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'mA5dor9B9o', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(68, 'Prof. Ada Thiel', 'nstehr@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'iYrH43QHLL', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(69, 'Cleo Cronin', 'kayley.kiehn@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '08aR4uAHNS', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(70, 'Prof. Terrell Ruecker MD', 'tressa18@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'ksfzsWTWZ9', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(71, 'Maximus Cartwright', 'ramiro92@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '4oS68E925f', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(72, 'Novella Jenkins', 'bernadine04@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'g4eJrPcYLG', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(73, 'Kattie Schultz Jr.', 'ymorissette@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'zjcnl12NYE', '2017-05-20 04:23:43', '2017-05-20 04:23:43'),
(74, 'Prof. Kristina Olson Sr.', 'gutmann.amani@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'mJGrcItzR9', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(75, 'Prof. Lew Schamberger', 'vreilly@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'uSpH5ogBQj', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(76, 'Janessa Abshire', 'olson.marielle@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'omwg94BX7F', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(77, 'Mr. Henry Grady', 'stan17@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'XmXDYzKCSd', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(78, 'Breana Von', 'abagail.mcglynn@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'uOWvSSA1WF', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(79, 'Reta Rolfson III', 'leffler.shemar@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'llyNzQxNJ0', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(80, 'Mrs. Shany Osinski Sr.', 'alexa98@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'mMsII4p4NS', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(81, 'Antonio Steuber MD', 'jessika.murazik@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'JtjLQ8el8h', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(82, 'Douglas Davis', 'ahills@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'vEeBAs6vwK', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(83, 'Vern Cassin', 'lea47@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'tvW90y4UA4', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(84, 'Mr. Isai Hayes Jr.', 'quitzon.madisyn@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'iYY8AscHus', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(85, 'Freida Hammes', 'larkin.gianni@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'jg7sxFjvSE', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(86, 'Nicholaus King', 'bartell.lorenz@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'tAigiWsEn1', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(87, 'Prof. Ariane Simonis III', 'eve.hoppe@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'AtyIivzvbh', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(88, 'Danyka Veum', 'ggraham@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'c26EbnDckm', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(89, 'Isabel Fritsch', 'adell79@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'GwvddbiUqq', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(90, 'Roselyn Schaden', 'emmett77@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'j2MqLXY9tV', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(91, 'Naomie Streich', 'uzulauf@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'BdbopGBG87', '2017-05-20 04:23:44', '2017-05-20 04:23:44'),
(92, 'Christine Funk', 'vhammes@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'mjAzarytFr', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(93, 'Rosa Beier', 'emilio90@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '1bZMFXKDDE', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(94, 'Dixie Auer', 'wmaggio@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'uCqJtZYRyu', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(95, 'Dr. Ellsworth Zboncak', 'thelma.jacobs@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'kbpMPWRJS4', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(96, 'Stefan Rath', 'ole.west@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'CiHUDd4l6t', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(97, 'Enid Wisozk', 'raoul.dickens@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'RFyqoFirMF', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(98, 'Alyce Paucek', 'aufderhar.oswaldo@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'DIaR9Du0nl', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(99, 'Prof. Christy Spencer', 'lily93@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'fTf4hkLcxG', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(100, 'Hadley Sipes', 'nelle.stamm@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '9KQIfzJruM', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(101, 'Prof. Winston Marvin III', 'milo.murray@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'jnddgWUNy5', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(102, 'Eusebio Emard', 'desiree.russel@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'nrpza3DBxP', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(103, 'Mrs. Marcelina Doyle Sr.', 'keith20@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'kLzmsILgKG', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(104, 'Kellen Toy', 'schaefer.jazmyn@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'eTqWcF7PeZ', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(105, 'Dr. Brennan Harber', 'anderson.don@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'kUQHE8HNYC', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(106, 'Dr. Eden Friesen', 'tressa.mccullough@example.com', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', '5p0zTE5Sw2', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(107, 'Golda Mayer', 'merritt04@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'sf1DLJyWHT', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(108, 'Hazel Barrows', 'mstiedemann@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'vHXQMkPnft', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(109, 'Treva Reichel Sr.', 'jamar19@example.org', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'KuHfo7dbMq', '2017-05-20 04:23:45', '2017-05-20 04:23:45'),
(110, 'Trudie Howell MD', 'sincere33@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'oI0Xx7SUod', '2017-05-20 04:23:46', '2017-05-20 04:23:46'),
(111, 'Dr. Mitchell Walsh', 'wwiza@example.net', '$2y$10$vs5L337n0JSmpunP.0lUBuJJjdTwAaDedFWGuOHlxvze/AL6h/lK.', 'WIllUEcTAA', '2017-05-20 04:23:46', '2017-05-20 04:23:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=112;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
