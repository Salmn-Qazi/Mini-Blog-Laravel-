-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 08:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'admin@demo.com', '$2y$12$uWdbELXQEnJJc1hAXs3NqOI8vvQyBP6JdHzYPbPC/Fw11y6xs/xPq', '2024-06-20 05:11:30', '2024-06-20 05:11:30');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `name`, `slug`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'My first blog', 'my-first-blog', '<p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2024-06-20 02:48:30', '2024-06-20 04:05:31'),
(2, 1, 'Second Blog', 'second-blog', '<p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2024-06-20 03:48:53', '2024-06-20 03:48:53'),
(4, 1, 'testing', 'testing', '<p>Text editor</p>', '2024-06-20 03:54:42', '2024-06-20 03:54:42'),
(10, 1, 'Email Testing', 'email-testing', '<p>Text editor</p>', '2024-06-20 13:01:42', '2024-06-20 13:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sports', NULL, NULL),
(2, 'Jobs', NULL, NULL),
(3, 'News', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_has_blogs`
--

CREATE TABLE `category_has_blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_has_blogs`
--

INSERT INTO `category_has_blogs` (`id`, `category_id`, `blog_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2024-06-20 04:07:09', '2024-06-20 04:07:09'),
(2, 2, 2, '2024-06-20 04:19:58', '2024-06-20 04:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\Blog', 2, 'd9c9bda3-3382-4558-93f0-e9cbaa878315', 'blog', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 7465, '[]', '[]', '[]', '[]', 1, '2024-06-20 03:48:53', '2024-06-20 03:48:53'),
(3, 'App\\Models\\Blog', 3, 'd11f2566-2710-42d1-9332-1c6806aaa7fa', 'blog', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 7465, '[]', '[]', '[]', '[]', 1, '2024-06-20 03:51:42', '2024-06-20 03:51:42'),
(4, 'App\\Models\\Blog', 4, '265a2627-2137-4934-ae77-e2ac0b22a3a4', 'blog', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 7465, '[]', '[]', '[]', '[]', 1, '2024-06-20 03:54:42', '2024-06-20 03:54:42'),
(5, 'App\\Models\\Blog', 5, '549b9263-8aee-4465-969c-368456ab451a', 'blog', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 7465, '[]', '[]', '[]', '[]', 1, '2024-06-20 03:55:53', '2024-06-20 03:55:53'),
(6, 'App\\Models\\Blog', 6, '7d19cbf8-d86a-403d-8e53-acd7c185ecd0', 'blog', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 7465, '[]', '[]', '[]', '[]', 1, '2024-06-20 03:57:30', '2024-06-20 03:57:30'),
(7, 'App\\Models\\Blog', 7, 'e5eefa39-2039-45d6-be24-19b279bd3cb1', 'blog', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 7465, '[]', '[]', '[]', '[]', 1, '2024-06-20 03:59:25', '2024-06-20 03:59:25'),
(8, 'App\\Models\\Blog', 8, '56d4ebdb-1031-409c-91be-894a01acce17', 'blog', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 7465, '[]', '[]', '[]', '[]', 1, '2024-06-20 04:01:30', '2024-06-20 04:01:30'),
(10, 'App\\Models\\Blog', 1, '42576fd2-ef03-42fb-aa0a-8b84a2c9f799', 'blog', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 7465, '[]', '[]', '[]', '[]', 1, '2024-06-20 04:05:31', '2024-06-20 04:05:31'),
(11, 'App\\Models\\Blog', 9, '96d0135c-9a5a-4e80-8ad4-8623a16f5023', 'blog', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 7465, '[]', '[]', '[]', '[]', 1, '2024-06-20 13:00:47', '2024-06-20 13:00:47'),
(12, 'App\\Models\\Blog', 10, 'be4ff829-6c09-4484-84ed-81ac7fd5c6fd', 'blog', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 7465, '[]', '[]', '[]', '[]', 1, '2024-06-20 13:01:42', '2024-06-20 13:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2024_04_28_063806_create_users_table', 1),
(5, '2024_05_08_173438_create_media_table', 1),
(6, '2024_06_13_095934_create_blogs_table', 1),
(7, '2024_06_14_045157_create_admins_table', 1),
(8, '2024_06_14_054328_create_categories_table', 1),
(9, '2024_06_14_054342_create_tags_table', 1),
(10, '2024_06_14_060805_create_category_has_blogs_table', 1),
(11, '2024_06_14_060819_create_tag_has_blogs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cricket', NULL, NULL),
(2, 'Football', NULL, NULL),
(3, 'Tennis', NULL, NULL),
(4, 'Laravel Developer', NULL, NULL),
(5, 'Vue JS Developer', NULL, NULL),
(6, 'Data Entry Operatpr', NULL, NULL),
(7, 'Weather', NULL, NULL),
(8, 'Sports', NULL, NULL),
(9, 'Educational', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tag_has_blogs`
--

CREATE TABLE `tag_has_blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag_has_blogs`
--

INSERT INTO `tag_has_blogs` (`id`, `tag_id`, `blog_id`, `created_at`, `updated_at`) VALUES
(1, 9, 1, '2024-06-20 04:07:09', '2024-06-20 04:07:09'),
(2, 8, 1, '2024-06-20 04:07:09', '2024-06-20 04:07:09'),
(3, 7, 2, '2024-06-20 04:19:58', '2024-06-20 04:19:58'),
(4, 6, 2, '2024-06-20 04:19:58', '2024-06-20 04:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Salman Qazi', 'salmannqqazi@gmail.com', '$2y$12$/03O5ytz5yfGNuuO0nQ6Me1JzmLboGuDAizJrXDC206.8CHurnvpa', '2024-06-20 02:45:37', '2024-06-20 02:45:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_name_unique` (`name`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_name_unique` (`name`),
  ADD KEY `blogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `category_has_blogs`
--
ALTER TABLE `category_has_blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_has_blogs_category_id_foreign` (`category_id`),
  ADD KEY `category_has_blogs_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `tag_has_blogs`
--
ALTER TABLE `tag_has_blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_has_blogs_tag_id_foreign` (`tag_id`),
  ADD KEY `tag_has_blogs_blog_id_foreign` (`blog_id`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category_has_blogs`
--
ALTER TABLE `category_has_blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tag_has_blogs`
--
ALTER TABLE `tag_has_blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `category_has_blogs`
--
ALTER TABLE `category_has_blogs`
  ADD CONSTRAINT `category_has_blogs_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  ADD CONSTRAINT `category_has_blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `tag_has_blogs`
--
ALTER TABLE `tag_has_blogs`
  ADD CONSTRAINT `tag_has_blogs_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  ADD CONSTRAINT `tag_has_blogs_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
