-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2017 at 01:04 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hkapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `imageid` text COLLATE utf8_unicode_ci,
  `kitchenid` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image_id` int(11) DEFAULT NULL,
  `kitchenid` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imageid` int(11) DEFAULT NULL,
  `kitchenid` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(8, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(9, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(10, '2016_06_01_000004_create_oauth_clients_table', 2),
(11, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(13, '2017_06_13_164544_create_register_kitchens_table', 3),
(18, '2017_06_14_024241_add_role_to_users', 4),
(20, '2017_06_14_152508_create_dishes_table', 5),
(21, '2017_06_14_163506_create_images_table', 6),
(22, '2017_06_15_051955_create_events_table', 7),
(24, '2017_06_15_081111_create_galleries_table', 8),
(25, '2017_06_16_075300_create_ratings_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('3e82ed4e6e8d5a4a55acba3aaecf800c8d00c4aba545e0e4bfe11c36ef9933f6635bb11da9731454', NULL, 2, NULL, '[]', 0, '2017-06-15 11:11:33', '2017-06-15 11:11:33', '2018-06-15 16:56:33'),
('54e02bacb0a7f7b9cb11b04ad99c924eb65beeef17148aa4f7ce0fdc193e47ef9e09749993f72961', NULL, 2, NULL, '[]', 0, '2017-06-15 10:45:46', '2017-06-15 10:45:46', '2018-06-15 16:30:46'),
('82dc65441096134c193be0589da6813572eb34b8ebb444b58f479ddb0226d9764f4404e3cdac99ee', 1, 1, 'mahesh', '[]', 0, '2017-06-16 00:46:34', '2017-06-16 00:46:34', '2027-06-16 06:31:34'),
('88ec170a094ae6b92bce72768a5c89c8e7f718806161638e428140f50db2a8de0f5168f0266c2aac', NULL, 2, NULL, '[]', 0, '2017-06-15 10:44:09', '2017-06-15 10:44:09', '2097-06-15 16:29:09'),
('8f42b66b8ed5d61deda692fd2d062eea78f82de4761297ade7888eaa4e46a94a803a4c1d1ce0bf59', NULL, 2, NULL, '[]', 0, '2017-06-15 11:08:02', '2017-06-15 11:08:02', '2097-06-15 16:53:02'),
('972a98d03e01ebae01ebda4f219b0db3198770bddd4a9ef4304344b8145c9061b6feb2da4b88f919', NULL, 2, NULL, '[]', 0, '2017-06-15 11:11:08', '2017-06-15 11:11:08', '2097-06-15 16:56:08'),
('9fcc4f144e97ec3ebe93d8622597b22d0c4a16c0d0ac49942997f35d0e19931ecb9d6f53a89f4f5f', 1, 1, 'admin', '[]', 1, '2017-06-15 10:43:03', '2017-06-15 10:43:03', '2027-06-15 16:28:03'),
('a2745411a8f3bc312909c70d052f09345cd083f0a9fd02a58bd78e5150c042ec9cbfb16a15e99dda', 1, 1, 's3xs3x', '[]', 1, '2017-06-14 10:15:12', '2017-06-14 10:15:12', '2027-06-14 16:00:12'),
('bb42ac9645a32a765a19e3e3e5a6cac4f66689cd5473764d41ee7f41ae9a032f5456cdd05184addc', NULL, 2, NULL, '[]', 0, '2017-06-15 10:46:06', '2017-06-15 10:46:06', '2097-06-15 16:31:06'),
('d5d58287ea80d156089c2360b942ba1dfc4ca1eb9d57772123a80f211640291d0ac53f5e4d1d3f2a', 1, 1, 'mahesh', '[]', 1, '2017-06-13 11:55:52', '2017-06-13 11:55:52', '2027-06-13 17:40:52'),
('ec1de5aa69b031ba959db92ad9e377d676a0591fd456fde7f430a14e4bf81c9087507517ad132cf2', 3, 1, 'asmin', '[]', 0, '2017-06-15 11:13:57', '2017-06-15 11:13:57', '2027-06-15 16:58:57'),
('f907c1410966b073923cbd54e6509afd76913bf3f1a8bb3a4581bb2edc5007556a1c29ab81d71c1f', NULL, 2, NULL, '[]', 0, '2017-06-15 11:10:28', '2017-06-15 11:10:28', '2097-06-15 16:55:28'),
('fa7ebad0ba677922327e5fc2dfb35c7146f53fa7000bd1d5e849969486813a935f2070431d2249dc', NULL, 2, NULL, '[]', 0, '2017-06-15 10:45:57', '2017-06-15 10:45:57', '2018-06-15 16:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'VhEufUS5AzizIOpM4A66daQWs6sI2JkO5a7Qz5Gy', 'http://localhost', 1, 0, 0, '2017-05-05 10:44:01', '2017-05-05 10:44:01'),
(2, NULL, 'Laravel Password Grant Client', 'OZ9mfVtZIgIHzj2drg5uwzySAKOuQaBe8tuDm0Es', 'http://localhost', 0, 1, 0, '2017-05-05 10:44:01', '2017-05-05 10:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-05-05 10:44:01', '2017-05-05 10:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `kitchen_id` int(10) UNSIGNED NOT NULL,
  `rating` double(8,2) NOT NULL,
  `review` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `kitchen_id`, `rating`, `review`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 3.50, NULL, '2017-06-16 02:41:50', '2017-06-16 02:41:50'),
(4, 2, 1, 4.00, NULL, '2017-06-16 02:42:09', '2017-06-16 02:42:09'),
(5, 3, 1, 4.50, NULL, '2017-06-16 02:42:31', '2017-06-16 02:42:31');

-- --------------------------------------------------------

--
-- Table structure for table `register_kitchens`
--

CREATE TABLE `register_kitchens` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expirydate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expirytime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `register_kitchens`
--

INSERT INTO `register_kitchens` (`id`, `name`, `contact`, `address`, `path`, `email`, `website`, `expirydate`, `expirytime`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'butwal darbar', '071995853', 'butwal-8', NULL, 'butwaldarbar@gmail.com', NULL, '2018-05-20', '1526774400', 1, '2017-06-13 12:17:48', '2017-06-13 12:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contact`, `password`, `image`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'mahesh', 'mahesh@gmail.com', '986779277', '$2y$10$aE2q6nnebQi8aP4wDmqt3eKc1kffCWhKZJ/LVhUNwmyTOwOcgBNwS', NULL, 'p1RlbkkGr0JJ7Xh5kFYHjQlk9O1BCzPLIBaKWMiwUJuuHcdnIHxYw8wx0pHT', '2017-05-05 11:46:40', '2017-06-15 10:52:31', NULL),
(2, 'mahesh', 'mahesh123@gmail.com', '071505167', '$2y$10$zFkZGcwphqlz54r8Drk1de0J9.u9oa7azgdF3Gy/l95oe5lotre2S', NULL, NULL, '2017-06-15 11:06:20', '2017-06-15 11:06:20', 'user'),
(3, 'asmin', 'asminbudha@gmail.com', '071505167', '$2y$10$0co.O5fMn8n5hG8PsvFfw.AJa79qbagR5TOnFkmIYrMjfucMXE7Fe', NULL, NULL, '2017-06-15 11:13:22', '2017-06-15 11:13:22', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dishes_kitchenid_foreign` (`kitchenid`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_kitchenid_foreign` (`kitchenid`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_kitchenid_foreign` (`kitchenid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
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
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_kitchen_id_foreign` (`kitchen_id`),
  ADD KEY `ratings_user_id_foreign` (`user_id`);

--
-- Indexes for table `register_kitchens`
--
ALTER TABLE `register_kitchens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `register_kitchens_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
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
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `register_kitchens`
--
ALTER TABLE `register_kitchens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `dishes_kitchenid_foreign` FOREIGN KEY (`kitchenid`) REFERENCES `register_kitchens` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_kitchenid_foreign` FOREIGN KEY (`kitchenid`) REFERENCES `register_kitchens` (`id`);

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_kitchenid_foreign` FOREIGN KEY (`kitchenid`) REFERENCES `register_kitchens` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_kitchen_id_foreign` FOREIGN KEY (`kitchen_id`) REFERENCES `register_kitchens` (`id`),
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `register_kitchens`
--
ALTER TABLE `register_kitchens`
  ADD CONSTRAINT `register_kitchens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
