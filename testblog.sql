-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2022 a las 21:21:00
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `testblog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `authors`
--

INSERT INTO `authors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(8, 'Pedro Diaz', '2022-12-01 14:58:36', '2022-12-01 21:45:12'),
(10, 'Adriana', '2022-12-01 15:22:43', '2022-12-01 21:46:21'),
(11, 'Mayu', '2022-12-01 15:22:53', '2022-12-01 15:22:53'),
(12, 'Caslo', '2022-12-01 17:03:39', '2022-12-01 21:47:11'),
(13, 'Marielena', '2022-12-01 17:05:42', '2022-12-01 17:05:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2022_11_30_232148_create_authors_table', 2),
(8, '2022_11_30_233043_create_posts_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgUrl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `title`, `imgUrl`, `description`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 'Primer post', 'postImage/1669907185.png', 'Sed eleifend luctus aliquam. Duis a mi magna. Pellentesque ac bibendum turpis, et interdum tortor. Etiam tincidunt erat turpis, nec elementum leo dapibus et. Vivamus ullamcorper consequat risus, sit amet facilisis ex. Ut fermentum mi tellus, vitae sagittis elit cursus vel. Nullam aliquam vel ex eu fringilla. Curabitur iaculis nisl sit amet augue fringilla, ac placerat elit cursus. Integer lacinia consectetur nulla, vestibulum volutpat diam ultricies in. Curabitur sit amet dolor quis tortor aliquet dignissim. Nullam vehicula sem et suscipit tempus. Phasellus dictum scelerisque velit, vitae suscipit eros tempor facilisis. Integer pulvinar nulla ex, et dignissim enim efficitur non. Praesent non lorem porttitor, dictum nibh ac, auctor est.', 10, '2022-12-01 19:06:25', '2022-12-01 23:58:41'),
(3, 'Post', 'postImage/1669919836.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam magna leo, efficitur vitae erat sit amet, efficitur congue elit. Nam eu tellus nunc. Praesent blandit euismod dolor vel scelerisque. Nam nunc turpis, viverra et dictum eu, congue eget erat. In condimentum gravida nisi, tempus pharetra leo imperdiet quis. Sed sit amet turpis non ex aliquet laoreet. Cras magna nibh, dignissim ut ornare eu, sodales sit amet diam. Nunc et vestibulum felis.\r\n\r\nPellentesque sed urna at ligula semper ornare. Cras lacinia nunc ac erat lacinia interdum. Quisque congue ligula in metus pretium, ac consequat odio condimentum. Nullam egestas enim eget pellentesque pulvinar. Fusce scelerisque vel ex eget consectetur. Nam porta, augue rutrum vehicula feugiat, arcu dui consequat est, eget bibendum nibh eros quis nisl. Curabitur mauris enim, ullamcorper ut nunc at, tristique egestas leo. Phasellus sit amet eros at neque consectetur posuere. Vestibulum fermentum diam arcu, vel rhoncus diam blandit quis. Proin ullamcorper erat at massa vestibulum, sit amet mollis diam porta. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras aliquet dolor sit amet odio scelerisque, a bibendum lectus faucibus. Duis faucibus odio vel fringilla volutpat. Curabitur nec augue nulla.', 11, '2022-12-01 19:15:28', '2022-12-02 00:05:34'),
(4, 'Lorem ipsum dolor sit amet', 'postImage/1669920530.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam magna leo, efficitur vitae erat sit amet, efficitur congue elit. Nam eu tellus nunc. Praesent blandit euismod dolor vel scelerisque. Nam nunc turpis, viverra et dictum eu, congue eget erat. In condimentum gravida nisi, tempus pharetra leo imperdiet quis. Sed sit amet turpis non ex aliquet laoreet. Cras magna nibh, dignissim ut ornare eu, sodales sit amet diam. Nunc et vestibulum felis.\r\n\r\nPellentesque sed urna at ligula semper ornare. Cras lacinia nunc ac erat lacinia interdum. Quisque congue ligula in metus pretium, ac consequat odio condimentum. Nullam egestas enim eget pellentesque pulvinar. Fusce scelerisque vel ex eget consectetur. Nam porta, augue rutrum vehicula feugiat, arcu dui consequat est, eget bibendum nibh eros quis nisl. Curabitur mauris enim, ullamcorper ut nunc at, tristique egestas leo. Phasellus sit amet eros at neque consectetur posuere. Vestibulum fermentum diam arcu, vel rhoncus diam blandit quis. Proin ullamcorper erat at massa vestibulum, sit amet mollis diam porta. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras aliquet dolor sit amet odio scelerisque, a bibendum lectus faucibus. Duis faucibus odio vel fringilla volutpat. Curabitur nec augue nulla.', 8, '2022-12-01 22:48:50', '2022-12-01 22:48:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Adriana', 'adriana@blog.com', NULL, '$2y$10$tSpxDvkYcQ32x83idHkbfOafFy5emNTXKIJ6BgCQQELOV.8vLHrRO', 'LndlsQGpxxnYdowl522H6M380rkKi5sFhJ5j2hOMmYUQXCrABsQFuOIlojDg', '2022-11-30 14:14:21', '2022-11-30 14:14:21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_author_id_foreign` (`author_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
