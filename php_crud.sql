-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-09-2025 a las 11:31:57
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(255) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `id` int(255) NOT NULL,
  `usuario_id` int(255) NOT NULL,
  `categoria_id` int(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` mediumtext DEFAULT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entrada_usuario` (`usuario_id`),
  ADD KEY `fk_entrada_categoria` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `fk_entrada_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `fk_entrada_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
--
-- Base de datos: `crud_php`
--
CREATE DATABASE IF NOT EXISTS `crud_php` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud_php`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `id` int(30) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `dni` int(30) NOT NULL,
  `date` date NOT NULL,
  `email` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`id`, `name`, `lastname`, `dni`, `date`, `email`) VALUES
(0, 'sofia', 'lopez', 987543322, '2015-09-08', 'rakel90@hotmail.com'),
(1, 'sofia', 'lopez', 67890221, '2015-09-15', 'sofi89@gmail.com'),
(NULL, 'manuel', 'huaman', 89765433, '2015-02-25', 'manuel89@gmail.com'),
(NULL, 'manuel', 'huaman', 89765433, '2015-02-25', 'manuel89@gmail.com'),
(NULL, 'manuel', 'huaman', 89765433, '2015-02-25', 'manuel89@gmail.com'),
(NULL, 'jurgen', '', 21323232, '2011-02-10', 'juribader55@gmail.com'),
(NULL, 'jurgen', 'bader', 21323232, '2011-02-10', 'juribader55@gmail.com'),
(NULL, 'harold', 'eggen', 830443, '2001-02-10', 'harold90@hoymail.com'),
(NULL, 'harold', 'eggen', 830443, '2001-02-10', 'harold90@hoymail.com'),
(NULL, 'emiliano', 'cardenas', 2147483647, '1991-02-10', 'emi803@hoymail.com'),
(NULL, 'ines', 'silva', 2147483647, '1991-02-10', 'ines56921@hoymail.com'),
(NULL, 'vendedor', 'saenz', 223456789, '1991-03-22', 'hyu78@gmail.com'),
(NULL, 'andreina', 'Ramirez', 678900, '1998-09-21', 'andrin78@gmail.com');
--
-- Base de datos: `dbsistemas1`
--
CREATE DATABASE IF NOT EXISTS `dbsistemas1` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `dbsistemas1`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:18:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:9:\"user-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:11:\"user-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:9:\"user-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:11:\"user-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:13:\"user-activate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:8:\"rol-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:10:\"rol-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:8:\"rol-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:10:\"rol-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:13:\"producto-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:15:\"producto-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:13:\"producto-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:15:\"producto-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:11:\"pedido-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:14:\"pedido-anulate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:11:\"pedido-view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:13:\"pedido-cancel\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:6:\"perfil\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}}s:5:\"roles\";a:3:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:6:\"Seller\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:8:\"Costumer\";s:1:\"c\";s:3:\"web\";}}}', 1758305316),
('sistemadogge-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:18:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:9:\"user-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:11:\"user-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:9:\"user-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:11:\"user-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:13:\"user-activate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:8:\"rol-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:10:\"rol-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:8:\"rol-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:10:\"rol-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:13:\"producto-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:15:\"producto-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:13:\"producto-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:15:\"producto-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:11:\"pedido-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:14:\"pedido-anulate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:11:\"pedido-view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:13:\"pedido-cancel\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:6:\"perfil\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}}s:5:\"roles\";a:3:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:6:\"Seller\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:8:\"Costumer\";s:1:\"c\";s:3:\"web\";}}}', 1758883349);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(11, '0001_01_01_000000_create_users_table', 1),
(12, '0001_01_01_000001_create_cache_table', 1),
(13, '0001_01_01_000002_create_jobs_table', 1),
(14, '2025_09_11_171352_add_activo_to_users_table', 1),
(15, '2025_09_14_170439_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('alejo34@hotmail.com', 'LViI6XSQBZoEGEB6WVgcGkGRzv8JJlVfDZguukgrANKNk9H08PcBleTvdLD8', '2025-09-19 07:03:44'),
('congnity@pro.com', 'YtQo5BntyuEIHSqEkAGPec04FYJ0alo9ZnKD8bVEAT31yMuWzf6F9X3KwUCI', '2025-09-19 07:59:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user-list', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(2, 'user-create', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(3, 'user-edit', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(4, 'user-delete', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(5, 'user-activate', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(6, 'rol-list', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(7, 'rol-create', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(8, 'rol-edit', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(9, 'rol-delete', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(10, 'producto-list', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(11, 'producto-create', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(12, 'producto-edit', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(13, 'producto-delete', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(14, 'pedido-list', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(15, 'pedido-anulate', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(16, 'pedido-view', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(17, 'pedido-cancel', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(18, 'perfil', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-09-14 15:47:47', '2025-09-14 15:47:47'),
(4, 'Seller', 'web', '2025-09-18 16:07:43', '2025-09-18 16:07:43'),
(5, 'Costumer', 'web', '2025-09-18 16:08:35', '2025-09-18 16:08:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 4),
(2, 5),
(3, 1),
(3, 4),
(3, 5),
(4, 1),
(4, 4),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(10, 5),
(11, 1),
(11, 4),
(11, 5),
(12, 1),
(12, 4),
(12, 5),
(13, 1),
(13, 4),
(13, 5),
(14, 1),
(14, 4),
(14, 5),
(15, 1),
(15, 5),
(16, 5),
(17, 5),
(18, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('EX3doTu5INiVtwRgrJ6wFH3vbEu2XiY1pXpF9V0q', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:143.0) Gecko/20100101 Firefox/143.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2VqZE9QUjI3QTJ0d2R1YVJta0x2MVVnZ05xVGEwVnpyRXVXbUo0TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYXNzd29yZC9yZXNldCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1758275987),
('fFdOTIrkBU7GJ5fff7V4CNKeMoRHuzhL0chDwIO4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:143.0) Gecko/20100101 Firefox/143.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR3B4Q0pxeGtnbENZRzF0MU85bElHQmRNcFhIbnRSd1lRY0QweWlCNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yb2xlcyI7fX0=', 1758221562),
('jwN0yWpoSM4afCS1P7FGao3oT2JqTBA1f6g5zKsT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:143.0) Gecko/20100101 Firefox/143.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXI2UGVTR0VSWXJ0MHpmaEg4RHJPTFNTY0F4ZDAyMUM3eTZpTGI1byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYXNzd29yZC9yZXNldCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1758270981),
('ZhPtUe8lWAMakM8wOCRqGyES5g0aCMI7rU2DsFRM', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:143.0) Gecko/20100101 Firefox/143.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibnRhNzI3TnByaml3a0pTWEJXUFJjNEFyeHVvYmlNeFdPM21TREY4ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c3VhcmlvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1758796994);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `activo`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@prueba.com', 1, NULL, '$2y$12$ECMsBCrIj/iXIBUgmdcCLOotJ6JrCnD9sGwAAqIwWxG/tB79emWOu', NULL, '2025-09-14 15:47:48', '2025-09-14 15:47:48'),
(2, 'Cliente', 'cliente@prueba.com', 1, NULL, '$2y$12$q7H5D2sCNKi63HNPDUPxWebqAhZxpf3vMz9E3.Cvxiv03zVcta58u', NULL, '2025-09-14 15:47:48', '2025-09-17 06:45:44'),
(3, 'Alejandra Marin', 'Alejs90@hotmail.com', 1, NULL, '$2y$12$rX5CmRGDAkeR76.IwSgOwuqXpVI84npw/xERjHYgOXJD6.9T/NA4e', NULL, '2025-09-17 06:43:59', '2025-09-17 06:43:59'),
(4, 'juancarlos cliente1', 'cliente1@prueba.com', 1, NULL, '$2y$12$y2/k9ABkfUAEmAo7nhUSpuMDfMy/oSGPiKK/lTxdGsi1wgFKaWcKS', NULL, '2025-09-17 12:18:58', '2025-09-17 12:18:58'),
(5, 'emiliano Lopez2', 'Emi@prueba.com', 1, NULL, '$2y$12$j90E/JqZ8gRfOqrXkvacIujviY88wRkndbmV4o7hTRlnkK.PO640S', NULL, '2025-09-17 13:32:44', '2025-09-17 13:43:37'),
(10, 'esgue', 'Esgue12@prueba.com', 1, NULL, '$2y$12$6LLBmmv6XKthPzWOO1N4COPE/7uaV9U8kMsqaOeuGm.jMe7t37/Di', NULL, '2025-09-17 13:42:15', '2025-09-17 13:42:15'),
(12, 'Cecilia', 'ceculia90@gmail.com', 1, NULL, '$2y$12$NVImrdzP19dxJPs/jo09ve3teWT0E3Mgh4cgF9dUMzAHkUQHDq6zC', NULL, '2025-09-17 14:00:08', '2025-09-17 14:00:08'),
(13, 'Alejandro Ferreira modificado prfil', 'alejo34@hotmail.com', 1, NULL, '$2y$12$AHY5iHkGZwYclg.BsOEAA.tR2GtchuEPAOCl5tFw410/92PLJQIuO', NULL, '2025-09-17 14:15:53', '2025-09-17 15:02:28'),
(18, 'karolcliente', 'karol@prueba.com', 1, NULL, '$2y$12$8K5sjOeJX7arItohlX5cIOwDTJTIt8dWsUAwNYp17Noige3bW06aC', NULL, '2025-09-17 15:20:45', '2025-09-17 15:20:45'),
(19, 'Alirio mendez csmi', 'ali89@gmail.com', 0, NULL, '$2y$12$.2WSfeLdCcMfHZQLpZnt/eWapCvVWdysK9KjW8dmFJO.wyeeLKf5C', NULL, '2025-09-18 11:20:41', '2025-09-18 16:03:56'),
(21, 'carlos', 'congnity@pro.com', 1, NULL, '$2y$12$irgPe4hnq0oUBz2tR4JRUu/2XqT5zn0VKn8ZSPTAElCSXjsAFakuy', NULL, '2025-09-19 06:35:55', '2025-09-19 06:35:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
--
-- Base de datos: `ecommerce_2024`
--
CREATE DATABASE IF NOT EXISTS `ecommerce_2024` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce_2024`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
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
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Echo Dev', 'rakel030@gmail.com', NULL, '$2y$12$JZ.IfCb6Wzm6RofZ3l3n6.Z.4RKT6aLILkIoypa3wkUTluF86tNnC', NULL, '2024-11-21 15:20:22', '2024-11-21 15:20:22');

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"ecommerce_2024\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-09-04 11:36:51', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `php_crud`
--
CREATE DATABASE IF NOT EXISTS `php_crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `php_crud`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `dni` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`id`, `name`, `lastname`, `dni`, `date`, `email`) VALUES
(6, 'Jurguen mario', 'bader', '92283080922', '2001-09-01', 'bder8@gmail.com'),
(7, 'Emiliano', 'Lopez', '898654321', '2006-11-19', 'emilito56@gmail.com'),
(9, 'Fatima', 'Aguirre', '7801223333', '1998-07-12', 'fatima89@gmail.com'),
(10, 'Mario', 'Alejandro', '56578989', '1999-02-12', 'mario89@hotmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `person`
--
ALTER TABLE `person`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Base de datos: `snake_game`
--
CREATE DATABASE IF NOT EXISTS `snake_game` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `snake_game`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plays`
--

CREATE TABLE `plays` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_name` varchar(60) NOT NULL,
  `number_input` int(10) UNSIGNED NOT NULL,
  `multiples_count` int(10) UNSIGNED NOT NULL,
  `results_json` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plays`
--

INSERT INTO `plays` (`id`, `player_name`, `number_input`, `multiples_count`, `results_json`, `created_at`) VALUES
(1, 'emilio', 11, 9, '[11,22,33,44,55,66,77,88,99]', '2025-09-08 10:06:28'),
(2, 'emiliano', 12, 8, '[12,24,36,48,60,72,84,96]', '2025-09-08 10:09:27'),
(3, 'emiliano', 45, 2, '[45,90]', '2025-09-08 10:10:16'),
(4, 'emiliano', 45, 22, '[45,90,135,180,225,270,315,360,405,450,495,540,585,630,675,720,765,810,855,900,945,990]', '2025-09-08 10:10:40'),
(5, 'emiliano', 45, 22, '[45,90,135,180,225,270,315,360,405,450,495,540,585,630,675,720,765,810,855,900,945,990]', '2025-09-08 10:29:08'),
(6, 'emiliano', 45, 22, '[45,90,135,180,225,270,315,360,405,450,495,540,585,630,675,720,765,810,855,900,945,990]', '2025-09-08 10:29:30'),
(7, 'emiliano', 45, 22, '[45,90,135,180,225,270,315,360,405,450,495,540,585,630,675,720,765,810,855,900,945,990]', '2025-09-08 10:30:45'),
(8, 'emiliano', 45, 22, '[45,90,135,180,225,270,315,360,405,450,495,540,585,630,675,720,765,810,855,900,945,990]', '2025-09-08 10:31:39'),
(9, 'emiliano', 45, 22, '[45,90,135,180,225,270,315,360,405,450,495,540,585,630,675,720,765,810,855,900,945,990]', '2025-09-08 10:33:16'),
(10, 'emiliano', 45, 22, '[45,90,135,180,225,270,315,360,405,450,495,540,585,630,675,720,765,810,855,900,945,990]', '2025-09-08 10:33:20'),
(11, 'emiliano', 45, 22, '[45,90,135,180,225,270,315,360,405,450,495,540,585,630,675,720,765,810,855,900,945,990]', '2025-09-08 10:37:54'),
(12, 'emiliano', 45, 22, '[45,90,135,180,225,270,315,360,405,450,495,540,585,630,675,720,765,810,855,900,945,990]', '2025-09-08 10:38:15'),
(13, 'emiliano', 41, 24, '[41,82,123,164,205,246,287,328,369,410,451,492,533,574,615,656,697,738,779,820,861,902,943,984]', '2025-09-08 10:38:27'),
(14, 'emiliano', 41, 24, '[41,82,123,164,205,246,287,328,369,410,451,492,533,574,615,656,697,738,779,820,861,902,943,984]', '2025-09-08 10:43:23'),
(15, 'luz', 12, 83, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192,204,216,228,240,252,264,276,288,300,312,324,336,348,360,372,384,396,408,420,432,444,456,468,480,492,504,516,528,540,552,564,576,588,600,612,624,636,648,660,672,684,696,708,720,732,744,756,768,780,792,804,816,828,840,852,864,876,888,900,912,924,936,948,960,972,984,996]', '2025-09-08 10:44:27'),
(16, 'camilo', 4, 250, '[4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128,132,136,140,144,148,152,156,160,164,168,172,176,180,184,188,192,196,200,204,208,212,216,220,224,228,232,236,240,244,248,252,256,260,264,268,272,276,280,284,288,292,296,300,304,308,312,316,320,324,328,332,336,340,344,348,352,356,360,364,368,372,376,380,384,388,392,396,400,404,408,412,416,420,424,428,432,436,440,444,448,452,456,460,464,468,472,476,480,484,488,492,496,500,504,508,512,516,520,524,528,532,536,540,544,548,552,556,560,564,568,572,576,580,584,588,592,596,600,604,608,612,616,620,624,628,632,636,640,644,648,652,656,660,664,668,672,676,680,684,688,692,696,700,704,708,712,716,720,724,728,732,736,740,744,748,752,756,760,764,768,772,776,780,784,788,792,796,800,804,808,812,816,820,824,828,832,836,840,844,848,852,856,860,864,868,872,876,880,884,888,892,896,900,904,908,912,916,920,924,928,932,936,940,944,948,952,956,960,964,968,972,976,980,984,988,992,996,1000]', '2025-09-08 10:44:35'),
(17, 'Angel', 34, 29, '[34,68,102,136,170,204,238,272,306,340,374,408,442,476,510,544,578,612,646,680,714,748,782,816,850,884,918,952,986]', '2025-09-08 10:44:45'),
(18, 'Angelica', 34, 29, '[34,68,102,136,170,204,238,272,306,340,374,408,442,476,510,544,578,612,646,680,714,748,782,816,850,884,918,952,986]', '2025-09-08 10:44:55'),
(19, 'Andrea', 23, 43, '[23,46,69,92,115,138,161,184,207,230,253,276,299,322,345,368,391,414,437,460,483,506,529,552,575,598,621,644,667,690,713,736,759,782,805,828,851,874,897,920,943,966,989]', '2025-09-08 10:45:37'),
(20, 'ariel', 34, 29, '[34,68,102,136,170,204,238,272,306,340,374,408,442,476,510,544,578,612,646,680,714,748,782,816,850,884,918,952,986]', '2025-09-08 10:45:48'),
(21, 'ariel', 34, 29, '[34,68,102,136,170,204,238,272,306,340,374,408,442,476,510,544,578,612,646,680,714,748,782,816,850,884,918,952,986]', '2025-09-08 10:47:35'),
(22, 'Madian', 67, 14, '[67,134,201,268,335,402,469,536,603,670,737,804,871,938]', '2025-09-08 10:47:46'),
(23, 'Carla', 5, 200, '[5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,250,255,260,265,270,275,280,285,290,295,300,305,310,315,320,325,330,335,340,345,350,355,360,365,370,375,380,385,390,395,400,405,410,415,420,425,430,435,440,445,450,455,460,465,470,475,480,485,490,495,500,505,510,515,520,525,530,535,540,545,550,555,560,565,570,575,580,585,590,595,600,605,610,615,620,625,630,635,640,645,650,655,660,665,670,675,680,685,690,695,700,705,710,715,720,725,730,735,740,745,750,755,760,765,770,775,780,785,790,795,800,805,810,815,820,825,830,835,840,845,850,855,860,865,870,875,880,885,890,895,900,905,910,915,920,925,930,935,940,945,950,955,960,965,970,975,980,985,990,995,1000]', '2025-09-08 10:48:05'),
(24, 'Carla', 5, 200, '[5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,250,255,260,265,270,275,280,285,290,295,300,305,310,315,320,325,330,335,340,345,350,355,360,365,370,375,380,385,390,395,400,405,410,415,420,425,430,435,440,445,450,455,460,465,470,475,480,485,490,495,500,505,510,515,520,525,530,535,540,545,550,555,560,565,570,575,580,585,590,595,600,605,610,615,620,625,630,635,640,645,650,655,660,665,670,675,680,685,690,695,700,705,710,715,720,725,730,735,740,745,750,755,760,765,770,775,780,785,790,795,800,805,810,815,820,825,830,835,840,845,850,855,860,865,870,875,880,885,890,895,900,905,910,915,920,925,930,935,940,945,950,955,960,965,970,975,980,985,990,995,1000]', '2025-09-08 10:49:19'),
(25, 'Carla', 5, 200, '[5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,250,255,260,265,270,275,280,285,290,295,300,305,310,315,320,325,330,335,340,345,350,355,360,365,370,375,380,385,390,395,400,405,410,415,420,425,430,435,440,445,450,455,460,465,470,475,480,485,490,495,500,505,510,515,520,525,530,535,540,545,550,555,560,565,570,575,580,585,590,595,600,605,610,615,620,625,630,635,640,645,650,655,660,665,670,675,680,685,690,695,700,705,710,715,720,725,730,735,740,745,750,755,760,765,770,775,780,785,790,795,800,805,810,815,820,825,830,835,840,845,850,855,860,865,870,875,880,885,890,895,900,905,910,915,920,925,930,935,940,945,950,955,960,965,970,975,980,985,990,995,1000]', '2025-09-08 10:49:56'),
(26, 'Carla', 5, 200, '[5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,250,255,260,265,270,275,280,285,290,295,300,305,310,315,320,325,330,335,340,345,350,355,360,365,370,375,380,385,390,395,400,405,410,415,420,425,430,435,440,445,450,455,460,465,470,475,480,485,490,495,500,505,510,515,520,525,530,535,540,545,550,555,560,565,570,575,580,585,590,595,600,605,610,615,620,625,630,635,640,645,650,655,660,665,670,675,680,685,690,695,700,705,710,715,720,725,730,735,740,745,750,755,760,765,770,775,780,785,790,795,800,805,810,815,820,825,830,835,840,845,850,855,860,865,870,875,880,885,890,895,900,905,910,915,920,925,930,935,940,945,950,955,960,965,970,975,980,985,990,995,1000]', '2025-09-08 10:49:57'),
(27, 'Carla', 90, 11, '[90,180,270,360,450,540,630,720,810,900,990]', '2025-09-08 11:02:33'),
(28, 'florian', 12, 83, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192,204,216,228,240,252,264,276,288,300,312,324,336,348,360,372,384,396,408,420,432,444,456,468,480,492,504,516,528,540,552,564,576,588,600,612,624,636,648,660,672,684,696,708,720,732,744,756,768,780,792,804,816,828,840,852,864,876,888,900,912,924,936,948,960,972,984,996]', '2025-09-08 11:02:46'),
(29, 'florian', 34, 29, '[34,68,102,136,170,204,238,272,306,340,374,408,442,476,510,544,578,612,646,680,714,748,782,816,850,884,918,952,986]', '2025-09-08 11:03:01'),
(30, 'floriana', 56, 17, '[56,112,168,224,280,336,392,448,504,560,616,672,728,784,840,896,952]', '2025-09-08 11:03:09'),
(31, 'floriana', 56, 17, '[56,112,168,224,280,336,392,448,504,560,616,672,728,784,840,896,952]', '2025-09-08 11:03:17'),
(32, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:05:02'),
(33, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:09:03'),
(34, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:09:18'),
(35, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:09:26'),
(36, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:09:32'),
(37, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:09:45'),
(38, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:15:04'),
(39, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:15:33'),
(40, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:15:43'),
(41, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:16:42'),
(42, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:16:43'),
(43, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:16:44'),
(44, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:17:28'),
(45, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:17:29'),
(46, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:17:30'),
(47, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:17:30'),
(48, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:17:30'),
(49, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:17:31'),
(50, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:17:31'),
(51, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:17:35'),
(52, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:18:42'),
(53, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:18:58'),
(54, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:20:02'),
(55, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:22:39'),
(56, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:22:56'),
(57, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:23:46'),
(58, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:24:08'),
(59, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:24:30'),
(60, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:24:57'),
(61, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:25:00'),
(62, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:25:21'),
(63, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:25:41'),
(64, 'floriana', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:26:02'),
(65, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:26:28'),
(66, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:27:12'),
(67, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:27:54'),
(68, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:27:59'),
(69, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:28:00'),
(70, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:28:02'),
(71, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:29:19'),
(72, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:34:50'),
(73, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:35:30'),
(74, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:36:53'),
(75, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:37:10'),
(76, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:37:28'),
(77, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:37:29'),
(78, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:37:44'),
(79, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:37:46'),
(80, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:37:47'),
(81, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:37:47'),
(82, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:37:47'),
(83, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:37:59'),
(84, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:39:59'),
(85, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:00'),
(86, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:01'),
(87, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:01'),
(88, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:01'),
(89, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:01'),
(90, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:02'),
(91, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:02'),
(92, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:02'),
(93, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:02'),
(94, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:02'),
(95, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:47'),
(96, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:40:48'),
(97, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:41:58'),
(98, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:42:10'),
(99, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:42:43'),
(100, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:43:07'),
(101, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:43:08'),
(102, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:43:29'),
(103, 'Kamilo', 89, 11, '[89,178,267,356,445,534,623,712,801,890,979]', '2025-09-08 11:48:55'),
(104, 'raquel', 21, 4, '[21,42,63,84]', '2025-09-08 12:25:28'),
(105, 'emi', 10, 10, '[10,20,30,40,50,60,70,80,90,100]', '2025-09-08 12:30:48'),
(106, 'juan', 10, 10, '[10,20,30,40,50,60,70,80,90,100]', '2025-09-08 12:31:50'),
(107, 'juan', 20, 5, '[20,40,60,80,100]', '2025-09-08 12:31:54'),
(108, 'leydy', 40, 2, '[40,80]', '2025-09-08 12:32:08'),
(109, 'jurguen', 50, 2, '[50,100]', '2025-09-08 12:32:22'),
(110, 'esgue', 15, 6, '[15,30,45,60,75,90]', '2025-09-08 12:32:41'),
(111, 'Alejandra', 32, 3, '[32,64,96]', '2025-09-08 12:32:52'),
(112, 'Andrea', 24, 4, '[24,48,72,96]', '2025-09-08 12:33:01'),
(113, 'Maria Camilia', 98, 1, '[98]', '2025-09-08 12:33:12'),
(114, 'Maria Camilia', 98, 2, '[98,196]', '2025-09-08 12:33:39'),
(115, 'Maria Camilia', 98, 2, '[98,196]', '2025-09-08 12:33:42'),
(116, 'Maria Camilia', 34, 5, '[34,68,102,136,170]', '2025-09-08 12:33:48'),
(117, 'Maria Camilia', 34, 5, '[34,68,102,136,170]', '2025-09-08 12:37:31'),
(118, 'America', 43, 4, '[43,86,129,172]', '2025-09-08 12:37:42'),
(119, 'America', 43, 4, '[43,86,129,172]', '2025-09-08 12:38:21'),
(120, 'America', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 12:38:26'),
(121, 'America', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 12:38:34'),
(122, 'America', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 12:40:50'),
(123, 'America', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 12:41:17'),
(124, 'America', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 12:41:28'),
(125, 'America', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 12:41:30'),
(126, 'America', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 12:41:50'),
(127, 'America', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 12:42:36'),
(128, 'Andreina', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 12:42:45'),
(129, 'Andreina', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 12:46:32'),
(130, 'Andreina', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 15:37:00'),
(131, 'Andreina', 24, 8, '[24,48,72,96,120,144,168,192]', '2025-09-08 15:37:06'),
(132, 'Andreina', 24, 8, '[24,48,72,96,120,144,168,192]', '2025-09-08 15:37:19'),
(133, 'Andreina', 24, 8, '[24,48,72,96,120,144,168,192]', '2025-09-08 15:37:30'),
(134, 'Andreina', 24, 8, '[24,48,72,96,120,144,168,192]', '2025-09-08 15:37:55'),
(135, 'Andreina', 24, 8, '[24,48,72,96,120,144,168,192]', '2025-09-08 15:40:23'),
(136, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 15:40:36'),
(137, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 15:41:30'),
(138, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 15:59:06'),
(139, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:05:48'),
(140, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:17:36'),
(141, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:19:09'),
(142, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:20:24'),
(143, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:22:25'),
(144, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:22:45'),
(145, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:24:24'),
(146, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:24:50'),
(147, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:24:58'),
(148, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:28:46'),
(149, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:29:24'),
(150, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:29:57'),
(151, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:31:16'),
(152, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:31:17'),
(153, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:31:42'),
(154, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:31:47'),
(155, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:32:26'),
(156, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:37:08'),
(157, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:38:45'),
(158, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:40:13'),
(159, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:41:39'),
(160, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:42:22'),
(161, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:42:40'),
(162, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:43:31'),
(163, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:44:01'),
(164, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:44:18'),
(165, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:45:01'),
(166, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:45:17'),
(167, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:45:38'),
(168, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:46:11'),
(169, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:46:18'),
(170, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:46:37'),
(171, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:46:55'),
(172, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:47:12'),
(173, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:47:26'),
(174, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:47:56'),
(175, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:53:17'),
(176, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:53:49'),
(177, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:54:12'),
(178, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:54:29'),
(179, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:54:43'),
(180, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:54:59'),
(181, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:55:17'),
(182, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:55:59'),
(183, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:56:35'),
(184, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:56:49'),
(185, 'karime', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-08 16:57:01'),
(186, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 16:57:15'),
(187, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 16:57:36'),
(188, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 16:57:55'),
(189, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 16:58:06'),
(190, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 16:58:22'),
(191, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 16:58:35'),
(192, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 17:04:33'),
(193, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 17:05:40'),
(194, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 17:06:16'),
(195, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 17:06:34'),
(196, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 17:07:04'),
(197, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 17:07:43'),
(198, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 17:07:55'),
(199, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 17:11:22'),
(200, 'karime', 33, 6, '[33,66,99,132,165,198]', '2025-09-08 17:11:54'),
(201, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:12:12'),
(202, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:12:21'),
(203, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:13:10'),
(204, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:19:33'),
(205, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:21:56'),
(206, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:26:59'),
(207, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:27:19'),
(208, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:27:37'),
(209, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:28:09'),
(210, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:28:28'),
(211, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:28:37'),
(212, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:29:15'),
(213, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:29:27'),
(214, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:29:41'),
(215, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:29:57'),
(216, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:30:12'),
(217, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:30:23'),
(218, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:30:35'),
(219, 'maria juliana', 55, 3, '[55,110,165]', '2025-09-08 17:30:48'),
(220, 'joseph', 20, 10, '[20,40,60,80,100,120,140,160,180,200]', '2025-09-08 17:31:32'),
(221, 'joseph', 20, 10, '[20,40,60,80,100,120,140,160,180,200]', '2025-09-08 17:31:53'),
(222, 'joseph', 20, 10, '[20,40,60,80,100,120,140,160,180,200]', '2025-09-08 17:32:02'),
(223, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:32:17'),
(224, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:35:20'),
(225, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:36:13'),
(226, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:37:31'),
(227, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:39:03'),
(228, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:39:37'),
(229, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:40:09'),
(230, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:40:36'),
(231, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:41:25'),
(232, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:42:15'),
(233, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:43:38'),
(234, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:44:24'),
(235, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:46:59'),
(236, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:47:16'),
(237, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:47:18'),
(238, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:48:52'),
(239, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:49:09'),
(240, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:51:50'),
(241, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:52:00'),
(242, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:56:21'),
(243, 'joseph', 15, 13, '[15,30,45,60,75,90,105,120,135,150,165,180,195]', '2025-09-08 17:57:40'),
(244, 'thomas', 21, 9, '[21,42,63,84,105,126,147,168,189]', '2025-09-08 18:07:40'),
(245, 'thomas', 21, 9, '[21,42,63,84,105,126,147,168,189]', '2025-09-08 18:08:12'),
(246, 'thomas', 21, 9, '[21,42,63,84,105,126,147,168,189]', '2025-09-08 18:10:33'),
(247, 'thomas', 21, 9, '[21,42,63,84,105,126,147,168,189]', '2025-09-08 18:11:21'),
(248, 'thomas', 21, 9, '[21,42,63,84,105,126,147,168,189]', '2025-09-08 18:11:37'),
(249, 'thomas', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 18:11:53'),
(250, 'thomas', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-08 18:12:06'),
(251, 'emiliano', 34, 5, '[34,68,102,136,170]', '2025-09-08 18:15:31'),
(252, 'emiliano', 34, 5, '[34,68,102,136,170]', '2025-09-09 07:18:37'),
(253, 'emiliano', 34, 5, '[34,68,102,136,170]', '2025-09-09 07:19:32'),
(254, 'emiliano', 34, 5, '[34,68,102,136,170]', '2025-09-09 07:19:36'),
(255, 'emiliano', 1, 200, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200]', '2025-09-09 07:19:54'),
(256, 'emiliano', 1, 200, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200]', '2025-09-09 07:20:13'),
(257, 'floriana', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-09 10:17:48'),
(258, 'emiliano', 1, 200, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200]', '2025-09-09 10:24:57'),
(259, 'emiliano', 55, 3, '[55,110,165]', '2025-09-09 10:25:04'),
(260, 'floriana', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-09 10:25:37'),
(261, 'floriana', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-09 10:25:50'),
(262, 'camila', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-09 10:25:59'),
(263, 'thomas', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-09 16:57:46'),
(264, 'thomas', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-09 17:04:17'),
(265, 'thomas', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-09 17:04:24'),
(266, 'thomas', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-09 17:04:38'),
(267, 'thomas', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-09 17:05:09'),
(268, 'thomas', 12, 16, '[12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192]', '2025-09-09 17:05:32'),
(269, 'thomas', 23, 8, '[23,46,69,92,115,138,161,184]', '2025-09-09 17:05:41'),
(270, 'Kamila', 98, 2, '[98,196]', '2025-09-09 17:06:04'),
(271, 'Kamila', 98, 2, '[98,196]', '2025-09-09 17:06:13'),
(272, 'Kamila', 98, 2, '[98,196]', '2025-09-09 17:08:00'),
(273, 'Kamila', 98, 2, '[98,196]', '2025-09-09 17:08:47'),
(274, 'Kamila', 98, 2, '[98,196]', '2025-09-09 17:10:39'),
(275, 'Kamila', 98, 2, '[98,196]', '2025-09-09 17:11:01'),
(276, 'Kamila', 98, 2, '[98,196]', '2025-09-09 17:11:14'),
(277, 'Kamila', 98, 2, '[98,196]', '2025-09-09 17:11:41'),
(278, 'camila', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-09 17:11:47'),
(279, 'esgue', 22, 9, '[22,44,66,88,110,132,154,176,198]', '2025-09-09 17:12:33'),
(280, 'Angie', 34, 5, '[34,68,102,136,170]', '2025-09-09 17:12:45'),
(281, 'Kamila', 98, 2, '[98,196]', '2025-09-09 17:15:16'),
(282, 'Angie', 34, 5, '[34,68,102,136,170]', '2025-09-09 17:15:27'),
(283, 'sol', 21, 9, '[21,42,63,84,105,126,147,168,189]', '2025-09-09 17:15:55'),
(284, 'sol', 34, 5, '[34,68,102,136,170]', '2025-09-09 17:16:07'),
(285, 'Kamila', 98, 2, '[98,196]', '2025-09-09 17:16:16'),
(286, 'sol', 34, 2, '[34,68]', '2025-09-09 17:56:20'),
(287, 'Kamila', 98, 1, '[98]', '2025-09-10 15:46:06'),
(288, 'Kamila', 98, 1, '[98]', '2025-09-10 15:46:19'),
(289, 'wilson', 12, 8, '[12,24,36,48,60,72,84,96]', '2025-09-10 16:16:36'),
(290, 'wilson', 12, 8, '[12,24,36,48,60,72,84,96]', '2025-09-10 16:17:28'),
(291, 'Maria eugenia', 23, 4, '[23,46,69,92]', '2025-09-10 16:17:47'),
(292, 'Maria eugenia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:19:28'),
(293, 'Maria eugenia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:25:14'),
(294, 'Maria eugenia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:25:56'),
(295, 'Maria eugenia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:26:32'),
(296, 'Maria eugenia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:28:00'),
(297, 'Maria eugenia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:28:27'),
(298, 'Maria eugenia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:28:44'),
(299, 'Maria eugenia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:33:35'),
(300, 'Maria eugenia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:34:29'),
(301, 'sofia', 4, 25, '[4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100]', '2025-09-10 16:35:47'),
(302, 'Maria eugenia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:37:08'),
(303, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 16:37:23'),
(304, 'sofia', 42, 2, '[42,84]', '2025-09-10 16:39:15'),
(305, 'sofia', 42, 2, '[42,84]', '2025-09-10 16:42:09'),
(306, 'sofia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 16:42:18'),
(307, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 16:51:23'),
(308, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 16:51:28'),
(309, 'Kamila', 98, 1, '[98]', '2025-09-10 16:52:00'),
(310, 'Kamila', 23, 4, '[23,46,69,92]', '2025-09-10 16:52:20'),
(311, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 16:52:30'),
(312, 'Kamila', 23, 4, '[23,46,69,92]', '2025-09-10 16:52:37'),
(313, 'Kamila', 23, 4, '[23,46,69,92]', '2025-09-10 16:52:44'),
(314, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 16:52:46'),
(315, 'Kamila', 23, 4, '[23,46,69,92]', '2025-09-10 16:53:25'),
(316, 'Kamila', 23, 4, '[23,46,69,92]', '2025-09-10 16:53:34'),
(317, 'emiliano', 23, 4, '[23,46,69,92]', '2025-09-10 16:53:46'),
(318, 'emiliano', 23, 4, '[23,46,69,92]', '2025-09-10 16:54:58'),
(319, 'emiliano', 23, 4, '[23,46,69,92]', '2025-09-10 16:57:06'),
(320, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 16:57:23'),
(321, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 16:58:21'),
(322, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 16:58:28'),
(323, 'emiliano', 23, 4, '[23,46,69,92]', '2025-09-10 16:58:33'),
(324, 'emiliano', 1, 100, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]', '2025-09-10 16:58:37'),
(325, 'emiliano', 1, 100, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]', '2025-09-10 17:00:54'),
(326, 'sofia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:01:20'),
(327, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:04:52'),
(328, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:05:02'),
(329, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:05:51'),
(330, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:09:04'),
(331, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:12:46'),
(332, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:13:13'),
(333, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:13:32'),
(334, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:14:34'),
(335, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:14:41'),
(336, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:15:45'),
(337, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:15:48'),
(338, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:17:04'),
(339, 'Maria eugenia', 6, 16, '[6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]', '2025-09-10 17:18:12'),
(340, 'harold', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:18:29'),
(341, 'harold', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:19:16'),
(342, 'harold', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:19:41'),
(343, 'harold', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:19:48'),
(344, 'harold', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:20:01'),
(345, 'harold', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:20:07'),
(346, 'emiliano', 1, 100, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]', '2025-09-10 17:20:16'),
(347, 'emiliano', 1, 100, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]', '2025-09-10 17:21:25'),
(348, 'emiliano', 1, 100, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]', '2025-09-10 17:24:29'),
(349, 'emiliano', 1, 100, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]', '2025-09-10 17:24:42'),
(350, 'emiliano', 1, 100, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]', '2025-09-10 17:24:57'),
(351, 'emiliano', 1, 100, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]', '2025-09-10 17:25:06'),
(352, 'emiliano', 1, 100, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]', '2025-09-10 17:25:37'),
(353, 'emiliano', 1, 100, '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]', '2025-09-10 17:25:40'),
(354, 'sofia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:26:12'),
(355, 'sofia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:27:04'),
(356, 'sofia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:27:31'),
(357, 'sofia', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:28:05'),
(358, 'harold', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:28:12'),
(359, 'harold', 2, 50, '[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]', '2025-09-10 17:28:20'),
(360, 'harold', 23, 4, '[23,46,69,92]', '2025-09-10 17:28:27'),
(361, 'harold', 23, 4, '[23,46,69,92]', '2025-09-10 17:28:37'),
(362, 'harold', 23, 4, '[23,46,69,92]', '2025-09-10 17:28:42'),
(363, 'harold', 23, 4, '[23,46,69,92]', '2025-09-10 17:28:44'),
(364, 'harold', 23, 4, '[23,46,69,92]', '2025-09-10 17:28:48'),
(365, 'harold', 23, 4, '[23,46,69,92]', '2025-09-10 17:28:53'),
(366, 'harold', 26, 3, '[26,52,78]', '2025-09-10 17:29:49'),
(367, 'emiliano', 23, 4, '[23,46,69,92]', '2025-09-10 17:35:16'),
(368, 'emiliano', 23, 4, '[23,46,69,92]', '2025-09-10 17:36:52'),
(369, 'emiliano', 23, 4, '[23,46,69,92]', '2025-09-10 17:36:54'),
(370, 'juan david', 21, 4, '[21,42,63,84]', '2025-09-10 17:37:09'),
(371, 'juan david', 21, 4, '[21,42,63,84]', '2025-09-10 17:38:43'),
(372, 'juan david', 21, 4, '[21,42,63,84]', '2025-09-10 17:40:42'),
(373, 'juan david', 21, 4, '[21,42,63,84]', '2025-09-10 17:40:52'),
(374, 'emiliano', 34, 2, '[34,68]', '2025-09-10 17:41:12'),
(375, 'juan david', 21, 4, '[21,42,63,84]', '2025-09-10 17:41:23'),
(376, 'juan david', 21, 4, '[21,42,63,84]', '2025-09-10 17:41:29'),
(377, 'emiliano', 34, 2, '[34,68]', '2025-09-10 17:41:40'),
(378, 'emiliano', 34, 2, '[34,68]', '2025-09-10 17:41:42'),
(379, 'emiliano', 34, 2, '[34,68]', '2025-09-10 17:42:06'),
(380, 'emiliano', 34, 2, '[34,68]', '2025-09-10 17:42:14'),
(381, 'emiliano', 34, 2, '[34,68]', '2025-09-10 17:42:31'),
(382, 'emiliano', 34, 2, '[34,68]', '2025-09-10 17:42:34'),
(383, 'emiliano', 34, 2, '[34,68]', '2025-09-10 17:43:31'),
(384, 'emiliano', 34, 2, '[34,68]', '2025-09-10 17:44:18'),
(385, 'emiliano', 34, 2, '[34,68]', '2025-09-10 17:44:22'),
(386, 'juan david', 21, 4, '[21,42,63,84]', '2025-09-10 17:44:27'),
(387, 'juan david', 21, 4, '[21,42,63,84]', '2025-09-10 17:44:58'),
(388, 'juan david', 21, 4, '[21,42,63,84]', '2025-09-10 17:45:46'),
(389, 'juan david', 21, 4, '[21,42,63,84]', '2025-09-10 17:45:48'),
(390, 'juan david', 10, 10, '[10,20,30,40,50,60,70,80,90,100]', '2025-09-10 17:45:52'),
(391, 'juan david', 10, 10, '[10,20,30,40,50,60,70,80,90,100]', '2025-09-10 17:46:59'),
(392, 'juan david', 20, 5, '[20,40,60,80,100]', '2025-09-10 17:47:04'),
(393, 'emiliano', 20, 5, '[20,40,60,80,100]', '2025-09-10 17:47:27'),
(394, 'emiliano', 20, 5, '[20,40,60,80,100]', '2025-09-10 17:49:48'),
(395, 'emiliano', 20, 5, '[20,40,60,80,100]', '2025-09-10 17:50:46'),
(396, 'emiliano', 20, 5, '[20,40,60,80,100]', '2025-09-10 17:56:38'),
(397, 'emiliano', 20, 5, '[20,40,60,80,100]', '2025-09-10 17:56:41'),
(398, 'emiliano', 23, 4, '[23,46,69,92]', '2025-09-10 17:56:45'),
(399, 'karime', 23, 4, '[23,46,69,92]', '2025-09-10 17:57:00'),
(400, 'karime', 23, 4, '[23,46,69,92]', '2025-09-10 17:59:02'),
(401, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:01:06'),
(402, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:01:15'),
(403, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:01:52'),
(404, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:02:44'),
(405, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:03:42'),
(406, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:05:10'),
(407, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:05:25'),
(408, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:05:59'),
(409, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:07:12'),
(410, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:10:00'),
(411, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:10:35'),
(412, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:13:05'),
(413, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:14:24'),
(414, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:16:07'),
(415, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:17:25'),
(416, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:18:17'),
(417, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:19:32'),
(418, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:20:49'),
(419, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:29:44'),
(420, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:30:07'),
(421, 'camilo', 34, 2, '[34,68]', '2025-09-10 18:30:39'),
(422, 'camilo', 34, 2, '[34,68]', '2025-09-11 06:59:54'),
(423, 'camilo', 34, 2, '[34,68]', '2025-09-11 07:00:37'),
(424, 'floriana', 21, 4, '[21,42,63,84]', '2025-09-11 07:01:38'),
(425, 'floriana', 21, 4, '[21,42,63,84]', '2025-09-11 07:01:50'),
(426, 'floriana', 21, 4, '[21,42,63,84]', '2025-09-11 07:02:00'),
(427, 'floriana', 21, 4, '[21,42,63,84]', '2025-09-11 07:02:02'),
(428, 'floriana', 21, 4, '[21,42,63,84]', '2025-09-11 07:02:05'),
(429, 'camilo', 34, 2, '[34,68]', '2025-09-11 07:02:24'),
(430, 'camilo', 34, 2, '[34,68]', '2025-09-11 07:02:59'),
(431, 'camilo', 34, 2, '[34,68]', '2025-09-11 07:03:08'),
(432, 'camilo', 34, 2, '[34,68]', '2025-09-11 07:03:17'),
(433, 'floriana', 21, 4, '[21,42,63,84]', '2025-09-11 08:34:18'),
(434, 'floriana', 21, 4, '[21,42,63,84]', '2025-09-11 08:35:06'),
(435, 'floriana', 21, 4, '[21,42,63,84]', '2025-09-11 08:35:29'),
(436, 'floriana', 21, 4, '[21,42,63,84]', '2025-09-11 08:35:39'),
(437, 'jorge', 12, 8, '[12,24,36,48,60,72,84,96]', '2025-09-11 08:35:53'),
(438, 'jorge', 12, 8, '[12,24,36,48,60,72,84,96]', '2025-09-11 18:17:31');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `plays`
--
ALTER TABLE `plays`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `plays`
--
ALTER TABLE `plays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=439;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
