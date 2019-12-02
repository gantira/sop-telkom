-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 02, 2019 at 05:18 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diglife`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `commentable_id` bigint(20) UNSIGNED NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `body`, `user_id`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`) VALUES
(1, 'mantapp!!', 1, 6, 'App\\Post', '2019-09-23 08:40:28', '2019-09-23 08:40:28'),
(2, '#case \nuser gagal login outlook/ email client', 1, 22, 'App\\Post', '2019-10-09 10:54:28', '2019-10-09 10:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` bigint(20) UNSIGNED NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `url`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`) VALUES
(1, 'images/orkHqUixKEg09ieigblHsCADCo0kYLngiNJD6742.png', 4, 'App\\Post', '2019-09-23 07:14:03', '2019-09-23 07:14:03'),
(2, 'images/sKo14fYwewbz5xhFoODSffAyu42OZa33FkKgeOyK.png', 4, 'App\\Post', '2019-09-23 07:14:03', '2019-09-23 07:14:03'),
(3, 'images/g1b2mw4JZYTWsOvh34ITW17yP0dOeZFQ1brMWOc1.png', 4, 'App\\Post', '2019-09-23 07:14:03', '2019-09-23 07:14:03'),
(4, 'images/OjICIogr6equnZTsB3gp12qHK6kVJP2xLFHh0thQ.png', 5, 'App\\Post', '2019-09-23 07:37:51', '2019-09-23 07:37:51'),
(5, 'images/4CCCKiblLzh8sIx23YLADHd8dd2tEGrhmMWvfqth.png', 5, 'App\\Post', '2019-09-23 07:37:51', '2019-09-23 07:37:51'),
(6, 'images/LBQSTbnfs6Mehgg1MPZraq5bwRHM6jgYdfZjdlHn.png', 5, 'App\\Post', '2019-09-23 07:37:51', '2019-09-23 07:37:51'),
(7, 'images/2oeALv9UOXwfXK4M7UeaOdPTKyjRgaGZAKAdOFcE.png', 5, 'App\\Post', '2019-09-23 07:37:51', '2019-09-23 07:37:51'),
(8, 'images/E1DLLAu4xdG1qDzRrmLWLOBmRH0pwiKGoNPvUsNy.png', 5, 'App\\Post', '2019-09-23 07:37:51', '2019-09-23 07:37:51'),
(9, 'images/PF0jPH4JMBmQNfsVGc1hE14fDu6D1W9T8CnnBdCD.png', 5, 'App\\Post', '2019-09-23 07:37:51', '2019-09-23 07:37:51'),
(10, 'images/Pg21T7x59HkSdqK0Ls77gdbsyfhKvP42UhX9N4nC.png', 5, 'App\\Post', '2019-09-23 07:37:51', '2019-09-23 07:37:51'),
(11, 'images/00X7or427661rWgq7Evaf2izVbFZghLcsphZdvyy.png', 5, 'App\\Post', '2019-09-23 07:37:51', '2019-09-23 07:37:51'),
(12, 'images/ziNAJTtEMu7fGsTgchXMWmLfRjdjTicNXxVVTEeh.png', 5, 'App\\Post', '2019-09-23 07:37:51', '2019-09-23 07:37:51'),
(13, 'images/cHqewO2uJRncXfhmkPQK3cCzYoMKZpJTagbypgDk.jpeg', 6, 'App\\Post', '2019-09-23 08:38:13', '2019-09-23 08:38:13'),
(14, 'images/vMkfJnQ5UT1f7XSVGlGSjCHNetMFUJStTYecshke.jpeg', 6, 'App\\Post', '2019-09-23 08:38:13', '2019-09-23 08:38:13'),
(15, 'images/kMAYDFdCnKHt991cS6Q9uOlnbxiVplwbnFtAzPg8.jpeg', 6, 'App\\Post', '2019-09-23 08:38:13', '2019-09-23 08:38:13'),
(16, 'images/huQLTVEy40hI6cbewmQztnmwKlFM4Qq8EWTKb6kV.jpeg', 7, 'App\\Post', '2019-09-23 08:42:36', '2019-09-23 08:42:36'),
(17, 'images/JcCOVRznCFGSRN2ZRxMaMjEAtnzGF7LzYxTqxp8s.jpeg', 8, 'App\\Post', '2019-09-23 08:59:27', '2019-09-23 08:59:27'),
(18, 'images/gadJQE4IyU5FJ6KggRdMqFDZ3CkBcpcQqnuWnwqv.jpeg', 8, 'App\\Post', '2019-09-23 08:59:27', '2019-09-23 08:59:27'),
(19, 'images/qoMAbFVarzZTn4EmSBnv9snBAwmyHYslROsSZ3CJ.jpeg', 8, 'App\\Post', '2019-09-23 08:59:27', '2019-09-23 08:59:27'),
(20, 'images/OvD0IWSZEhlfkrb8VcsvKQjfuWo3jemUy34Mlgkb.jpeg', 8, 'App\\Post', '2019-09-23 08:59:27', '2019-09-23 08:59:27'),
(21, 'images/1CMiWBOARi3KyKwwjESrWbE4ObJS4LrKRofuYoVa.jpeg', 8, 'App\\Post', '2019-09-23 08:59:27', '2019-09-23 08:59:27'),
(22, 'images/wFeDDd1L1K9i7di1oQlGLTh1cpEl57L2l9Cy1Qc0.jpeg', 11, 'App\\Post', '2019-09-23 10:16:34', '2019-09-23 10:16:34'),
(23, 'images/OqDAfZldCntFdoiARvHTzr3dkhkMRF04EDSsNQj9.png', 4, 'App\\Post', '2019-09-23 10:20:39', '2019-09-23 10:20:39'),
(24, 'images/NfJ8RF9JKo7OIbB9DJ8uTQlb5qhTEx3n9aIoUnvz.png', 4, 'App\\Post', '2019-09-23 10:20:39', '2019-09-23 10:20:39'),
(25, 'images/Us3RnOAjfhlUKo39KKOWEdSKLIt9mfdMmzWOuqBr.png', 4, 'App\\Post', '2019-09-23 10:20:39', '2019-09-23 10:20:39'),
(26, 'images/lfiND2cFwi9G4cHaAagnWhRSjEHC5zvmqAg3uOuY.png', 15, 'App\\Post', '2019-09-24 05:53:47', '2019-09-24 05:53:47'),
(27, 'images/ctgZVNGWbct0Poll4OOo27oRNfNBNOpAvR06ITct.jpeg', 16, 'App\\Post', '2019-09-27 07:08:33', '2019-09-27 07:08:33'),
(28, 'images/2tKHNaC6U0BqpFUnL0O0DEPmuKfKpskXQ26Ptdl6.png', 15, 'App\\Post', '2019-09-28 07:51:35', '2019-09-28 07:51:35'),
(29, 'images/sLmO5cWRPvxncq29ceUFDZh6ToYhU2LfYZ5NTbfM.png', 17, 'App\\Post', '2019-10-06 21:43:15', '2019-10-06 21:43:15'),
(44, 'images/TYb5onOYTaVECeryzj0CwVUZKTq7BBELys5yqa4d.png', 20, 'App\\Post', '2019-10-06 23:00:26', '2019-10-06 23:00:26'),
(45, 'images/FLd6mhlau5kFLT74Ah9d9RxFzxmBJEf5JSUFGxb8.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(46, 'images/UWqJTiy3WjFZ6cVXeAWJ9qAtfLVKfRG2Yu00abwu.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(47, 'images/xEpoQg9h3zPBW93p3btdhXTbGiHR7Yaal4ImE4q6.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(48, 'images/ZgTDEP3oPhTWA5jhzqdpqpKbN86m41ZdU7rRSmt5.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(49, 'images/3MOKTpC0cOEAfIQv9lCdNFmsTGO1cqRSOSZVdAam.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(50, 'images/CizwOQ4rcKYE0vkCrqoznQ6NHpbrCBWzCScCGp78.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(51, 'images/4XywK4kwOldkm4PYgorZIFyzE2il83MGQT9FFEfX.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(52, 'images/HNEyJZvPRxRkrNYwr7X3UFrzYQHm7OiyqQED5gGq.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(53, 'images/kudz6QS2rfD9q653xO7IrzwI9znFvdUjJqxdwDjB.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(54, 'images/Fuciw6dAzx7SMswncBSX6QBRpNLQjEDjctAbtfC0.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(55, 'images/8KZaefwnFhyq3gXHYVbp7AvisJQnx8MmzgM781hk.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(56, 'images/4l3HAg0LrynMVu5OpsO8mRxYbVswJTaBEoTVVaCi.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(57, 'images/TVJHe1dTxs6C0qFiPta7TIwVKp3xZeGIXPeVuCBH.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(58, 'images/NwotHFpe7UrlKbpEflsZzIJNhjljXdI2tZe8Qdpp.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(59, 'images/4AuPGs92RY8ur68sCv27a7mNxRgqeOkonKqfXmEu.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(60, 'images/nQHIkEILTR4IhD4Wc20eI5Uau4WqbMtMll9bwham.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(61, 'images/xsDQbvJrtrjPNKnt1PaH0SYXUosGqNsRTXs9h0zB.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(62, 'images/UCYZQTVfOw7qFsnpifvzzI7KhrX82IlcscMbYk3g.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(63, 'images/qK8fLfLXwEJDsgbQiMNGzc8yMMvdrMZQ7BRBFlyi.png', 20, 'App\\Post', '2019-10-06 23:00:27', '2019-10-06 23:00:27'),
(64, 'images/uOh9EU2UtIbAbhpvF8PTi3AigWQfGauWq7LAtXqp.png', 21, 'App\\Post', '2019-10-09 01:01:18', '2019-10-09 01:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `image_temps`
--

CREATE TABLE `image_temps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `visitor` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_temps`
--

INSERT INTO `image_temps` (`id`, `visitor`, `url`, `created_at`, `updated_at`) VALUES
(30, '10.2.16.22', 'images/AUZqbFGog8cpkF2fQXjCmbIP0UCdvFkcVX44x76P.png', '2019-09-29 08:24:47', '2019-09-29 08:24:47'),
(31, '10.2.16.22', 'images/MvNo862ZikkhPDjAAZiC1gygUOz8ZFUoTmObKIad.png', '2019-09-29 08:28:50', '2019-09-29 08:28:50'),
(32, '10.2.16.22', 'images/fXM13b6QjWIGbvfNbjQ94bjTUhdYM1e0fsgetsjZ.png', '2019-09-29 08:31:31', '2019-09-29 08:31:31'),
(33, '10.2.16.22', 'images/Uw5mQhqzTHyUzidhsMYIdQDxobz63f6KJpxAwcKK.png', '2019-09-29 08:33:55', '2019-09-29 08:33:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_09_12_114832_create_posts_table', 1),
(10, '2019_09_12_114954_create_images_table', 1),
(11, '2019_09_12_130952_create_comments_table', 1),
(12, '2019_09_12_131539_create_videos_table', 1),
(13, '2019_09_12_171300_create_tags_table', 1),
(14, '2019_09_12_171522_create_taggables_table', 1),
(15, '2019_09_14_160716_create_image_temps_table', 1),
(16, '2019_09_16_131458_create_publishes_table', 1),
(17, '2019_09_18_141355_create_units_table', 1),
(18, '2019_09_21_170252_create_unitables_table', 1),
(19, '2019_09_21_180912_create_views_table', 1),
(20, '2019_09_22_143533_create_roles_table', 1),
(21, '2019_09_22_160734_create_roleables_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('83c2b6f147e26240294640b8def16b1538bb184e73eeadb88827e094fb8aeee446be2b3a7ec04106', 3, 2, NULL, '[]', 0, '2019-09-23 08:42:11', '2019-09-23 08:42:11', '2020-09-23 15:42:11'),
('96de42619b204fabf8358511f26556bb4758be95b4b20d0b4a8a4b325b1637f15aa5f4b5501e4c6d', 3, 2, NULL, '[]', 0, '2019-09-29 08:23:34', '2019-09-29 08:23:34', '2020-09-29 15:23:34'),
('c8aef1a4934d3655e7cd47e22682c6fc8b340ec098a6a5486ca92df4a40fd238cfb8aa708cafd308', 2, 2, NULL, '[]', 0, '2019-09-27 06:11:15', '2019-09-27 06:11:15', '2020-09-27 13:11:15'),
('d6ff2dfc73367b98c3f8ad25bac296b4557a4b4523284e9a3a15dc6241a6fd6ee27f11a457932cf7', 2, 2, NULL, '[]', 0, '2019-09-23 08:33:38', '2019-09-23 08:33:38', '2020-09-23 15:33:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'ZyWtls34HUkOAimCJD7iWRqUuWJdPkpnf6SJzaDU', 'http://localhost', 1, 0, 0, '2019-09-23 04:39:14', '2019-09-23 04:39:14'),
(2, NULL, 'Laravel Password Grant Client', 'MKY1SAgFptG5JjFKw67AA1jzvk3FmmK6VnvK4wBO', 'http://localhost', 0, 1, 0, '2019-09-23 04:39:14', '2019-09-23 04:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-09-23 04:39:14', '2019-09-23 04:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0a863a4f82deec2af20d96ab4d54891e8bceb68d6cc116d4f680dcffb638687d44c28e78d0891910', '61f634939adac510b549320c250dfbdbfee4a78297f2026ae05570a2cc6f3c501c6b17e059579987', 0, '2020-09-25 11:00:47'),
('0c842eaf37ea4cb02e2061af8ffeab00a56d5ffc74d4c65d687d7ef32bec6d0476f30cbe95d66b95', '17b914d64fe65a6eb7c9ed651784d18b0a023e15d5862a1544cae0988ebfcb1f5b542ad334330ba6', 0, '2020-09-23 17:19:36'),
('0da2ce625bd6bbd8425760d0ecccf43f752b3300ee972cf9e500247093d75e7e4ffbb4f9f172401f', '005114493748435d48e9eda469e73e9304f26649a1b696d800dd591d59fdb8f5a2c69b2bd8923160', 0, '2020-09-24 17:54:23'),
('0f58d940b7dbaa0091a56f04d2e57b6957fc2eed96aac4e1576b78012c477c093722ee6cbbd37faf', 'ef32534bd0050442e78ad454e4bf9967a04d17b72a09b0478486aa70539c143a8f5bb416cf5ca354', 0, '2020-10-09 07:47:11'),
('12451174fea076f6a6a0fae0c472fe4cce98d52bb47d9de75df1381aecc8b50f837a25078f2724cd', '38446805f2998e5489054e7c11bb7d688633ad8321cdd975a1b2f0d7747089562af43a5813c97f30', 0, '2020-09-23 14:00:01'),
('134c0a996129a0612a8c634a55f74ee16d8ef638988bdc57692f1d7fad2b688d6ef681bcb80a0c27', 'a11cc32a5af3224bac946c39a6d473809e7f1a1f6ece57b6296752e64db23323153cf82021733efd', 0, '2020-09-25 14:37:54'),
('16b9a17c9cac570f4b2ef2e461f61c249f35718d10a00ff89e2816cac0648a1b4dbb689a4f963045', 'd6d0cc0f7d34b4fe35fb11fbbffa011afa0c884d2599edf51de5bc74efd662449ff4b955355016d4', 0, '2020-10-06 13:17:50'),
('1a7a3f70cad674e2c83c79a21215b7781576227d862c35a7e0c4444139d1e0ec8d32bd37511dec47', 'e83f10095011b9a99a49853c2e608c1e8180d6f1011ec51f8a3b46c592cb5d18dcbed5244b3eafe4', 0, '2020-09-23 11:43:33'),
('1a7ca6324ac15b905cfcd32fd73576abf37ec2d87bed267770a0021d232145f11a5853bca5b06ad4', 'd6ff2dfc73367b98c3f8ad25bac296b4557a4b4523284e9a3a15dc6241a6fd6ee27f11a457932cf7', 0, '2020-09-23 15:33:38'),
('224fac02f027dac7962a6591e44e5b0f57579a9b333095aa49deb64ce9d2eaf865f4931851d121fd', 'fbe7b8dc5fca4f39c71a11970b5cd5e161d4110190569d416aafa05f8ca4344b93aac42010ec1c68', 0, '2020-09-25 14:48:04'),
('28d1cc9a2b2764788dd940143277d9061768ac0d08b7701ecdbac4310f518113793fc4c1921669b2', '179f1e738d61d042948af613a7eb6a960cb036ccba0d3ede4924ad78b97ae88f7c382b1b068f23e7', 0, '2020-09-23 14:22:37'),
('3e6f9b4b1d767722e879affb493a62d15978b3aa2d3f0ae9dcfabcae81aebf4c29ba00cf415c6665', '83c2b6f147e26240294640b8def16b1538bb184e73eeadb88827e094fb8aeee446be2b3a7ec04106', 0, '2020-09-23 15:42:11'),
('41878a4eba3d3d3a86f44069ae1c97fba1640b1b9b2dc8de4f0f0f12588730e11c300ae200dea639', 'c8aef1a4934d3655e7cd47e22682c6fc8b340ec098a6a5486ca92df4a40fd238cfb8aa708cafd308', 0, '2020-09-27 13:11:15'),
('565c030cd6cff2a67407734c8b6068fe25ab7d9c29cad4956638c3f2d2e6c45534c19e46aed37c5d', '5a773da3db48e0e8a15a5313422f57e058e518a536d154ea3db68d825db8e0b58af66be2654afa87', 0, '2020-10-30 12:40:01'),
('57372bbfbb7161ad09cddc1ebea487656c8bbe65245e0f4024b4ee98fe7e3d23dcaf8a4bafecd08e', '96de42619b204fabf8358511f26556bb4758be95b4b20d0b4a8a4b325b1637f15aa5f4b5501e4c6d', 0, '2020-09-29 15:23:34'),
('58e49b6be00e1665f35f460bb8aee467191e6d3ac515f68d82948853b14160070a393e3d8800f5a0', '8da4371631551c0944e1d90be53412007ba1e89d318652ab0308be37828b2f71962ce5d34a5d00fd', 0, '2020-09-23 16:09:46'),
('59b02dc1b51776c6384b25e555b50ba91b7b803d13208246aff52ff8aeb36c84fb7e2a9d8ce3dff9', '12f4eb9e28480701f467b831b73074e3022a5e4a169ded59a0bf1663774b6673f9edbbb7716c4c9a', 0, '2020-09-24 19:16:07'),
('6338e12599061d124837aefba09e53300423cf5ab83b646226f084109c9d2b3aee0532b54f68cb53', 'e9535b19309c8f4a11fd395627cb77d8a85567fb519fbd33f622b96a3089c0444e4bd08cd077646a', 0, '2020-09-28 14:40:16'),
('6e5b1c891ccd3aa249f92e616be4ae84b372ae12369a0a4e8290f52143b4a95b07a05c9ade9e116c', '916f8473bb44ff438aa6ca4739f405161b0e6d5c065ee0d482052675f1ffb061cc4c3380bb195b2e', 0, '2020-10-30 12:39:22'),
('798688a222911fa9071242e279e1ebe17e65ce37620229bc3b89ad0b319f3d8cf4640aacf59f092a', 'fc28f1e8445f34ab57f83ff19a75ee3a42babb93d187c2ade68b2bc6c9e269a8d89390ed089cce8a', 0, '2020-10-14 10:07:37'),
('805bf3b200e877a33715f37904cc61128288e637ce064dae78eab0ccb62d7a222eebff7625b267ec', 'a858d4c2c6960db5c6493f0f65b5895f4deaf3b8bf6a9180a146ce7452c62c52e0f6dff6d1167228', 0, '2020-10-06 14:24:34'),
('86f9d9c8a7b5f9648413bc89ead1a9823e93a3b6a223af11c715eaab912acb4564bf54c7d5c871a2', '116000a3d229a563eadcf6da8e04b7325247b0ec2f1b38308c38b46b0ba66e0463771f14302873fd', 0, '2020-09-23 16:32:05'),
('92c52e2456b7f26bd0abb623490e1da938dce9bdf949e61521f867bc9b376ddcb4ed32dba1122cc5', 'f7806f290f7492b6dda514436337013fb7c18ebc9327f2960966519bd4910f9b76fbbe64f83018a1', 0, '2020-09-25 14:33:53'),
('9a3690eea76e9e768944b24c7d44faf919aa0756495fbf9c90d15656beca3d873e33836b7b9cac14', 'c582279ea56799bb978dcedbba00907eeb8e7f7d94e81e44c785c73fe7b1c5e0fc66b5d1f4696de7', 0, '2020-10-06 14:35:46'),
('a45ae3dfd56dd234c9dce5ee5bcb7b6b79afe60428a74304795a68db90a250e1b8a83cae47343d07', '43e51a78217c42ee15dec4fe3d7ae00086be7ff3a29eafbd3093710cc7921cb9eac168a82e858336', 0, '2020-09-24 12:36:17'),
('a7e3532d09a170e18bc43895a37922410e1bc5a72e3dc96198c40b7c764b3d14d656b9fd0a03556e', 'cf86be50021b999b3dc55ef5dafaa3d462394e511d5da13fa9b5bba217e5dfde4d5753496f95624e', 0, '2020-09-25 14:46:25'),
('b8c7e7cb0bcfccd5612c98fbde117ba94462a62904cf5e530c33e294580ff8d8727f4ab3d230ce56', '23444de848205bce3500612991cae24808367562f8ff00e1a3ae28976d953951e8571aa043d31d55', 0, '2020-10-30 12:38:28'),
('d09c2dd4624fb36312af15d204ecbd330b3b51c868bf4abb30758c2ac2a84ca2a5d5fb08be294059', '592dc7bf6f228be09494ac8308a7457722b6f07be64bf97294e28221d0577c6f7098fbad48f70fad', 0, '2020-09-23 16:07:56'),
('d6ba54fd8529c1ed33713b4730b554c7ebf7d4351f8160df6ba6c5c1848c3354f197ebf76ff95a0e', '7962b85302b9ba6693c89e7b112a90357b78a69f8dfe5df6db3f67356d28c7be4aba42e7ea7fd99a', 0, '2020-09-23 17:14:14'),
('d7ea070113775afd4405f129595aabf70da562e912732e8fd269be2c9c730907fb15658d2005114b', '91f5c87134c45cb52812f73dd61955d3e1d0eafea437ce1c0d44595c4adeada872d2fe056a43c433', 0, '2020-09-28 00:23:27'),
('ec731c433e7937e74b1ef9625d5102def6a50428abb71fedc0a427b77d12e46980cd9ea628768cde', '6113c230782df6245c842165c026acd2dfec284c9ff48e3c714dd1f37922e7f0249518e091d80eba', 0, '2020-09-23 11:48:32'),
('f5d430857882afd4c287c1c8428d866947bfa6e8aae86c248c387b1037d1412b674291a277d5c1fa', 'aab3a3b9d127e67be7359cf4849208198289ffd4c4831f3fcf29d2f9011174706612d5e23264c5e3', 0, '2020-10-09 17:33:45'),
('f728d56201bc3c250376719dbd1cdbf9188b8eb0b58b9ae4c1c474cc0b0e817c1684077fe6dbab82', '1f606c3dfe80d287a81a0ce0cd8443e58c2b581946ec490bead163afa5943b4d83be9b8f1429e6e5', 0, '2020-09-24 12:49:23'),
('f840846e1b48df8b3ba7c0dc5f518704291fae8cd5212056af78d5187859ea913221de48e34ab4f3', 'd4eb4c08a6f054cceb07fd76caac33b920a228f26d8c8817309f084a6f8360daf07dff65088213e5', 0, '2020-09-24 17:21:52'),
('ff9c6a0244b54d5c533031f83eed627353584b3927c8981d1583ccf7f37b62f60ddf1b4a62d6e4e2', '3d9706b21539872f7f0c58f97f108c942096fde351365fe0686ae9d12dbe2617e97cca3a4d1fe5ad', 0, '2020-09-29 16:39:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `slug`, `publish_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'Release User pada Aplikasi Remedy', '<p class=\"ql-align-justify\">Support Group Assignment Configuration merupakan fungsionalitas baru pada BMC Remedy 9. Fungsi ini digunakan untuk mengkonfigurasi assignment support group yang available pada suatu company terutama yang menggunakan sistem multi-company.</p><p>Berikut adalah langkah untuk melakukan release user pada aplikasi Remedy:</p><ul><li>Login menggunakan user Administrator.</li><li>Pilih Application &gt; AR System Administration &gt; AR System Administration Console</li></ul><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/OqDAfZldCntFdoiARvHTzr3dkhkMRF04EDSsNQj9.png\"></p><ul><li>Pilih Application &gt; User/Groups/Roles &gt; License Review</li></ul><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/NfJ8RF9JKo7OIbB9DJ8uTQlb5qhTEx3n9aIoUnvz.png\"></p><p>Atau bisa langsung ke link: <a href=\"http://helpdesk.telkom.co.id/arsys/forms/applb/AR+System+Administration%3A+Manage+User+Licenses/Default+Admin+View/\" rel=\"noopener noreferrer\" target=\"_blank\">http://helpdesk.telkom.co.id/arsys/forms/applb/AR+System+Administration%3A+Manage+User+Licenses/Default+Admin+View/</a></p><ul><li> Pilih user</li><li>Klik Release User</li></ul><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/Us3RnOAjfhlUKo39KKOWEdSKLIt9mfdMmzWOuqBr.png\"></p><p><br></p>', 'release-user-pada-aplikasi-remedy', 1, 1, '2019-09-23 07:14:03', '2019-09-23 10:20:39'),
(5, 'Backup Docversion Notadinas', '<p class=\"ql-align-center\"><strong>Dilakukan Tiap Saat Docversion Diatas 50GB</strong></p><p class=\"ql-align-center\"><strong>Biasanya 2minggu sekali</strong></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/OjICIogr6equnZTsB3gp12qHK6kVJP2xLFHh0thQ.png\"></p><p>&nbsp;Docversion merupakan tempat penyimpanan data notadinas yang terletak di server nodinarch01a/srv/Telkom dan nodinarch02a/srv/Telkom pada path notadinas\\docversion.nsf</p><p>Tersimpan pada 2 server karena apabila server 1 mati, akan tersimpan di server yang 1nya lagi dan akan saling mereplicate di kedua server tersebut.</p><p>Berikut langkah-langkah backup docversion :</p><p><strong>A. Buat File Temporer Baru Untuk Docversion Baru di 01a yang nantinya akan di replicate ke 02a</strong></p><ul><li>Posisikan cursor di 01a\\notadinas\\docversion.nsf kemudian klik file &gt; application &gt; new copy<img src=\"http://10.2.16.250/newdiglife/public/storage/images/4CCCKiblLzh8sIx23YLADHd8dd2tEGrhmMWvfqth.png\"></li><li>Buat file baru di 01a dengan nama notadinas\\docversion2.nsf dan hanya mengcopy design only<img src=\"http://10.2.16.250/newdiglife/public/storage/images/LBQSTbnfs6Mehgg1MPZraq5bwRHM6jgYdfZjdlHn.png\"></li><li>Refresh page dengan menekan tombol f9 kemudian double klik docversion2.nsf lalu klik file &gt; replication &gt; new replica<img src=\"http://10.2.16.250/newdiglife/public/storage/images/2oeALv9UOXwfXK4M7UeaOdPTKyjRgaGZAKAdOFcE.png\"></li><li><img src=\"http://10.2.16.250/newdiglife/public/storage/images/E1DLLAu4xdG1qDzRrmLWLOBmRH0pwiKGoNPvUsNy.png\"><img src=\"http://10.2.16.250/newdiglife/public/storage/images/PF0jPH4JMBmQNfsVGc1hE14fDu6D1W9T8CnnBdCD.png\"></li><li>Simpan replikasi file docversion2.nsf tersebut di 02a dengan file path notadinas\\docversion2.nsf<img src=\"http://10.2.16.250/newdiglife/public/storage/images/Pg21T7x59HkSdqK0Ls77gdbsyfhKvP42UhX9N4nC.png\"></li></ul><p>Pastikan docversion2.nsf sudah ada di 02a<img src=\"http://10.2.16.250/newdiglife/public/storage/images/00X7or427661rWgq7Evaf2izVbFZghLcsphZdvyy.png\"></p><p><strong>B. Matikan Kemudian Hapus Docversion Lama dan Update jadi Docversion Baru di 02a Lalu Hidupkan Lagi</strong></p><ul><li>Masuk ke server 02a dengan user nodinarch02a</li></ul><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/ziNAJTtEMu7fGsTgchXMWmLfRjdjTicNXxVVTEeh.png\"></p><p><br></p><p>to be continue..</p><p><br></p>', 'backup-docversion-notadinas', 2, 1, '2019-09-23 07:37:51', '2019-09-24 05:59:20'),
(6, 'SOP Update Jabatan Notadinas', '<p>1. Buka ND profile &gt; Hirarki Jabatan 💋</p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/cHqewO2uJRncXfhmkPQK3cCzYoMKZpJTagbypgDk.jpeg\"></p><p>2. Search Object ID (cari di HRDWH Jabatan)</p><p>3. Ganti :</p><p>	<strong>- Nama Pemangku jabatan</strong></p><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;- NIK</strong></p><p><strong>	- Object ID (kalo beda)</strong></p><p><strong>	- Ubah nama jabatan yg bertanda dibawah ini:</strong></p><p><strong>Contoh;</strong></p><p><strong>	&nbsp;1 [/profiles.nsf/vRosyGroupLookup/44136CD8D319A9BB47257791000D55DF?OpenDocument]</strong></p><p><strong>&nbsp;	&nbsp;MGR ACCOUNTING OPERATION&nbsp;CN=Admin Point ISC/O=Telkom&nbsp;</strong></p><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;01/09/2010&nbsp;</strong></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/vMkfJnQ5UT1f7XSVGlGSjCHNetMFUJStTYecshke.jpeg\"></p><p>4. Ganti juga nama pemangku jabatan pada form profile pegawai</p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/kMAYDFdCnKHt991cS6Q9uOlnbxiVplwbnFtAzPg8.jpeg\"></p><p>5. Selesai </p>', 'sop-update-jabatan-notadinas', 2, 2, '2019-09-23 08:38:13', '2019-09-23 08:38:41'),
(8, 'SOP Compact Mail Over Quota', '<p>1. Search NIK pada <strong>Telkom Address Book</strong> &gt; Search People by NIK</p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/JcCOVRznCFGSRN2ZRxMaMjEAtnzGF7LzYxTqxp8s.jpeg\"></p><p>2. Cek Lokasi <strong>Server Mail Server</strong></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/gadJQE4IyU5FJ6KggRdMqFDZ3CkBcpcQqnuWnwqv.jpeg\"></p><p><br></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/qoMAbFVarzZTn4EmSBnv9snBAwmyHYslROsSZ3CJ.jpeg\"></p><p>3. Load Compact Mail Pada Menu <strong>Server </strong>&gt; <strong>Status </strong>&gt; <strong>Server Console</strong></p><h2>&nbsp;&nbsp;- Masukkan Command: <strong style=\"background-color: rgb(255, 255, 0);\"><u>load compact mail/nik.nsf</u></strong></h2><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/1CMiWBOARi3KyKwwjESrWbE4ObJS4LrKRofuYoVa.jpeg\"></p><p>4.  Selesai Donk</p>', 'sop-compact-mail-over-quota', 2, 2, '2019-09-23 08:59:27', '2019-09-23 09:53:12'),
(9, 'SOP Update PGS Notadinas', '<p>Update PGS</p><p><br></p><p>1. Buka ND profile &gt; hirarki jabatan</p><p>2. Search NIK</p><p>3. PGS di set yes</p><p>4. Copy nama jabatan</p><p>5. Paste nama jabatan di group</p><p>6. Tambah nama jabatan, contoh :</p><p>&nbsp;&nbsp;*PGS MGR COLLABORATION APPLICATION OPERATION ISC</p>', 'sop-update-pgs-notadinas', 2, 2, '2019-09-23 09:52:14', '2019-09-23 09:52:14'),
(10, 'SOP Update POH Notadinas', '<p>Update POH</p><p><br></p><p><br></p><p>1. Masuk ke user yg punya jabatan</p><p>2. Pilhi nota dinas &gt; Tools &gt; Delegasi :</p><p>				- Buat delegasi</p><p>				- isi pejabat pengganti</p><p>				- pastikan jabatannya yg akn di delegasi</p><p>				- isi tanggal&nbsp;</p><p>3. Tekan Aktifkan&nbsp;</p><p>4. Selesai</p>', 'sop-update-poh-notadinas', 2, 2, '2019-09-23 09:52:53', '2019-09-23 09:52:53'),
(15, 'Daftar User DropUp', '<p>1.Login admin di link <a href=\"https://telkom.dropup.id/admin/login.html#/signin\" rel=\"noopener noreferrer\" target=\"_blank\">https://telkom.dropup.id/admin/login.html#/signin</a> ( admin/Sigma2016)</p><p>2.Pilih menu <strong>Users </strong>&gt; klik <strong>New User</strong>, lalu isi form berikut</p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/2tKHNaC6U0BqpFUnL0O0DEPmuKfKpskXQ26Ptdl6.png\"></p><p>		</p>', 'daftar-user-dropup', 1, 1, '2019-09-24 05:53:47', '2019-10-09 01:14:30'),
(16, 'SOP Penyediaan & Update Dropup Telkom', '<p>1. login ke https://telkom.dropup.id/admin/#/telkom/dashboard menggunakan password admin</p><p>2. Create User - New User</p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/ctgZVNGWbct0Poll4OOo27oRNfNBNOpAvR06ITct.jpeg\"></p>', 'sop-penyediaan-update-dropup-telkom', 2, 2, '2019-09-27 07:08:33', '2019-09-27 07:08:33'),
(20, 'Instalasi Domino 8.5', '<p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/TYb5onOYTaVECeryzj0CwVUZKTq7BBELys5yqa4d.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/FLd6mhlau5kFLT74Ah9d9RxFzxmBJEf5JSUFGxb8.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/UWqJTiy3WjFZ6cVXeAWJ9qAtfLVKfRG2Yu00abwu.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/xEpoQg9h3zPBW93p3btdhXTbGiHR7Yaal4ImE4q6.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/ZgTDEP3oPhTWA5jhzqdpqpKbN86m41ZdU7rRSmt5.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/3MOKTpC0cOEAfIQv9lCdNFmsTGO1cqRSOSZVdAam.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/CizwOQ4rcKYE0vkCrqoznQ6NHpbrCBWzCScCGp78.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/4XywK4kwOldkm4PYgorZIFyzE2il83MGQT9FFEfX.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/HNEyJZvPRxRkrNYwr7X3UFrzYQHm7OiyqQED5gGq.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/kudz6QS2rfD9q653xO7IrzwI9znFvdUjJqxdwDjB.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/Fuciw6dAzx7SMswncBSX6QBRpNLQjEDjctAbtfC0.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/8KZaefwnFhyq3gXHYVbp7AvisJQnx8MmzgM781hk.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/4l3HAg0LrynMVu5OpsO8mRxYbVswJTaBEoTVVaCi.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/TVJHe1dTxs6C0qFiPta7TIwVKp3xZeGIXPeVuCBH.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/NwotHFpe7UrlKbpEflsZzIJNhjljXdI2tZe8Qdpp.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/4AuPGs92RY8ur68sCv27a7mNxRgqeOkonKqfXmEu.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/nQHIkEILTR4IhD4Wc20eI5Uau4WqbMtMll9bwham.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/xsDQbvJrtrjPNKnt1PaH0SYXUosGqNsRTXs9h0zB.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/UCYZQTVfOw7qFsnpifvzzI7KhrX82IlcscMbYk3g.png\"></p><p><img src=\"http://10.2.16.250/newdiglife/public/storage/images/qK8fLfLXwEJDsgbQiMNGzc8yMMvdrMZQ7BRBFlyi.png\"></p>', 'instalasi-domino-8-5', 1, 1, '2019-10-06 23:00:26', '2019-10-09 01:09:15'),
(21, 'Cek OID user', '<ol><li>login ke <a href=\"http://poskodit.telkom.co.id/telkompresensi/index.php\" rel=\"noopener noreferrer\" target=\"_blank\">http://poskodit.telkom.co.id/telkompresensi/index.php</a></li><li>klik menu cek user LDAP</li><li>search nik, lalu enter <img src=\"http://10.2.16.250/newdiglife/public/storage/images/uOh9EU2UtIbAbhpvF8PTi3AigWQfGauWq7LAtXqp.png\"></li></ol><p><br></p><p><br></p>', 'cek-oid-user', 1, 1, '2019-10-09 01:01:18', '2019-10-09 01:01:25'),
(22, 'Update Perdition', '<p>Login dengan putty (perdition/perdition12) :</p><ol><li>perdition 1 =&gt; 10.1.64.27 </li><li>perdition 2 =&gt; 10.1.64.28</li><li>perdition 3 =&gt; 10.1.64.29</li></ol>', 'update-perdition', 1, 1, '2019-10-09 10:53:40', '2019-10-09 10:53:55');

-- --------------------------------------------------------

--
-- Table structure for table `publishes`
--

CREATE TABLE `publishes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publishes`
--

INSERT INTO `publishes` (`id`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Public', 'Public', '2019-09-23 04:39:04', '2019-09-23 04:39:04'),
(2, 'Team', 'Team', '2019-09-23 04:39:04', '2019-09-23 04:39:04'),
(3, 'Private', 'Private', '2019-09-23 04:39:05', '2019-09-23 04:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `roleables`
--

CREATE TABLE `roleables` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `roleable_id` bigint(20) UNSIGNED NOT NULL,
  `roleable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', '2019-09-23 04:39:02', '2019-09-23 04:39:02'),
(2, 'User', 'User', '2019-09-23 04:39:03', '2019-09-23 04:39:03');

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taggables`
--

INSERT INTO `taggables` (`tag_id`, `taggable_id`, `taggable_type`) VALUES
(2, 4, 'App\\Post'),
(3, 5, 'App\\Post'),
(3, 6, 'App\\Post'),
(1, 8, 'App\\Post'),
(4, 8, 'App\\Post'),
(3, 9, 'App\\Post'),
(3, 10, 'App\\Post'),
(5, 15, 'App\\Post'),
(5, 16, 'App\\Post'),
(4, 20, 'App\\Post'),
(6, 21, 'App\\Post'),
(7, 22, 'App\\Post');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Email', 'email', 1, '2019-09-23 04:44:52', '2019-09-23 04:44:52'),
(2, 'Remedy', 'remedy', 1, '2019-09-23 07:09:25', '2019-09-23 07:09:25'),
(3, 'Notadinas', 'notadinas', 1, '2019-09-23 07:31:01', '2019-09-23 07:31:01'),
(4, 'Domino', 'domino', 2, '2019-09-23 08:48:55', '2019-09-23 08:48:55'),
(5, 'Dropup', 'dropup', 1, '2019-09-24 05:49:51', '2019-09-24 05:49:51'),
(6, 'Oid', 'oid', 1, '2019-10-09 00:47:35', '2019-10-09 00:47:35'),
(7, 'Putty', 'putty', 1, '2019-10-09 10:42:15', '2019-10-09 10:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `unitables`
--

CREATE TABLE `unitables` (
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `unitable_id` bigint(20) UNSIGNED NOT NULL,
  `unitable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'New', '2019-09-23 04:39:03', '2019-09-23 04:39:03'),
(2, 'DCO', '2019-09-23 04:44:38', '2019-09-23 04:44:38'),
(3, 'HCM', '2019-09-23 04:44:43', '2019-09-23 04:44:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT '2',
  `unit_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `unit_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'angga', '400780@telkom.co.id', NULL, '$2y$10$jA/f16eSLnUNxWQ2BAFb/ebcwQ7tS3vPG06q6xndPLfLQ6g.fqsja', 1, 2, NULL, '2019-09-23 04:43:14', '2019-09-25 04:01:22'),
(2, 'Rachmat Setiaji', '009028@telkom.co.id', NULL, '$2y$10$Tbb7pCpCgt/BlQFJBBpLkeI1.2XhTCcHA.RETndZtKKCnrOSV6eqy', 2, 2, NULL, '2019-09-23 08:33:28', '2019-09-23 08:39:09'),
(3, 'triadi', 'triadi.nasher@gmail.com', NULL, '$2y$10$f4Q3VY8bfTl4MuxxSPJ.YePs6rLTfjNaDOpgGvKswf5Ym6lqvqFN2', 2, 2, NULL, '2019-09-23 08:41:58', '2019-09-23 09:32:25'),
(4, 'Acep Husny', '009031@telkom.co.id', NULL, '$2y$10$ZOtssRlGjjxFtTsGaQRBQuaFXJCkqoUMd.s1caAMD8.Zd59Fh7VFS', 2, 3, NULL, '2019-09-23 09:09:32', '2019-09-23 09:32:36');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `count` int(11) NOT NULL,
  `viewable_id` bigint(20) UNSIGNED NOT NULL,
  `viewable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `count`, `viewable_id`, `viewable_type`, `created_at`, `updated_at`) VALUES
(2, 122, 4, 'App\\Post', '2019-09-23 07:14:10', '2019-11-06 18:20:49'),
(3, 51, 5, 'App\\Post', '2019-09-23 07:38:03', '2019-10-09 01:09:38'),
(4, 32, 6, 'App\\Post', '2019-09-23 08:39:31', '2019-09-29 08:24:23'),
(6, 32, 8, 'App\\Post', '2019-09-23 08:59:55', '2019-10-09 01:09:41'),
(7, 20, 9, 'App\\Post', '2019-09-23 09:52:27', '2019-10-14 03:08:28'),
(8, 10, 10, 'App\\Post', '2019-09-23 10:15:22', '2019-10-14 03:07:46'),
(10, 33, 15, 'App\\Post', '2019-09-24 05:53:54', '2019-11-04 02:36:56'),
(11, 13, 16, 'App\\Post', '2019-09-27 17:23:33', '2019-10-09 01:09:29'),
(13, 15, 20, 'App\\Post', '2019-10-06 23:00:32', '2019-11-06 18:32:04'),
(14, 12, 21, 'App\\Post', '2019-10-09 01:01:28', '2019-11-04 02:24:44'),
(15, 15, 22, 'App\\Post', '2019-10-09 10:53:45', '2019-11-09 15:17:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_temps`
--
ALTER TABLE `image_temps`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publishes`
--
ALTER TABLE `publishes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `image_temps`
--
ALTER TABLE `image_temps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `publishes`
--
ALTER TABLE `publishes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
