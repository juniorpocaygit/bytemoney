-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Ago-2023 às 22:13
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bytemoney`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `access_level`
--

CREATE TABLE `access_level` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `access_level`
--

INSERT INTO `access_level` (`id`, `name`, `level`, `created_at`, `updated_at`) VALUES
(1, 'produtor', 90, NULL, NULL),
(2, 'afiliado', 80, NULL, NULL),
(3, 'usuario', 70, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `afiliate_products`
--

CREATE TABLE `afiliate_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(70) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `afiliate_products`
--

INSERT INTO `afiliate_products` (`id`, `user_id`, `products_id`, `link`, `created_at`, `updated_at`) VALUES
(9, 2, 18, 'fe342867194d86b9a7ed6ad51031da7e', '2023-08-11 05:22:03', '2023-08-11 05:22:03'),
(10, 2, 9, '6ab30df49f1fc04e32988d265dd3bc53', '2023-08-11 05:23:05', '2023-08-11 05:23:05'),
(11, 2, 17, 'b0aa93df95052831a7784280d61ed45a', '2023-08-12 08:01:59', '2023-08-12 08:01:59'),
(13, 21, 21, '43492657f0615883aa2907396d11ff92', '2023-08-12 17:35:35', '2023-08-12 17:35:35'),
(16, 21, 13, '353c377a86f304336ed6c79f195f19ac', '2023-08-12 17:36:34', '2023-08-12 17:36:34'),
(19, 21, 11, '1585528396e5442c53375954a77abb5a', '2023-08-12 18:02:45', '2023-08-12 18:02:45'),
(20, 21, 10, '110e0b5d1c3ca02d4a9496f0fc5e4bcc', '2023-08-12 18:15:39', '2023-08-12 18:15:39'),
(22, 21, 14, '4076135921568c6783d515562700afc5', '2023-08-13 05:18:27', '2023-08-13 05:18:27'),
(29, 43, 17, '81bbe5e64507afddfa8234b8b46e0d6d', '2023-08-13 22:24:33', '2023-08-13 22:24:33'),
(31, 43, 15, '0c697efee67e72b9bc06da05b92c6056', '2023-08-13 22:30:51', '2023-08-13 22:30:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'gastronomia', NULL, NULL),
(2, 'moda & beleza', NULL, NULL),
(3, 'educação', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
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
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2023_08_03_214525_add_access_level_table_users', 2),
(9, '2023_08_05_175844_add_column_photo_table_users', 3),
(10, '2023_08_06_214816_create_table_category', 4),
(12, '2023_08_06_215306_create_table_products', 5),
(13, '2023_08_06_225657_add_photo_table_products', 6),
(14, '2023_08_07_003156_alter_column_value_for_price_products', 7),
(15, '2023_08_07_010245_remove_unique_key_from_productor_id_and_category_id_in_products_table', 8),
(16, '2023_08_07_164711_add_column_price_productor_price_afiliate_in_products', 9),
(17, '2023_08_09_021042_create_table_afiliate_products', 10),
(19, '2023_08_10_011501_alter_column_afiliate_id_user_id_in_afiliate_products', 11),
(21, '2023_08_10_222146_add_column_link_table_afiliate_products', 12),
(25, '2023_08_11_022913_create_table_sales', 13),
(26, '2023_08_12_042840_update_phone_nullable_in_users_table', 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
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
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productor_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `price_productor` decimal(8,2) NOT NULL,
  `price_afiliate` decimal(8,2) NOT NULL,
  `afiliate_rules` text NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `productor_id`, `category_id`, `title`, `price`, `price_productor`, `price_afiliate`, `afiliate_rules`, `description`, `photo`, `created_at`, `updated_at`) VALUES
(9, 4, 1, 'Torne-se um chefe Michelin', '78.90', '59.18', '19.73', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'b5f298ba07f099aac687beb4c2665778.jpg', '2023-08-08 05:46:21', '2023-08-08 05:46:21'),
(10, 4, 1, 'Aprenda a gerir sua cozinha!', '38.50', '28.88', '9.63', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', '9294c4c08d6398e647564c7b094cb063.jpg', '2023-08-08 05:47:40', '2023-08-08 05:47:40'),
(11, 4, 2, 'Curso rápido de automaquiagem.', '19.90', '14.93', '4.98', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'df5a4dbbd692bb6eeae9a29de18d8224.jpg', '2023-08-08 05:48:26', '2023-08-08 05:48:26'),
(12, 4, 3, 'Como criar planilhas no excel!', '32.40', '24.30', '8.10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'f06e8f86b841035adfcdf7d6a007c036.jpg', '2023-08-08 05:49:59', '2023-08-08 05:49:59'),
(13, 4, 3, 'Crie uma equipe de super vendedores!', '58.90', '44.18', '14.73', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'f56b44e666d1b7f6c766681e2a20fe32.jpg', '2023-08-08 05:51:03', '2023-08-13 21:02:06'),
(14, 5, 2, 'Sombrancelhas práticas e lindas.', '12.90', '9.68', '3.23', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'ed45a73b03c5c4821dc7817a52d6faea.jpg', '2023-08-08 05:54:16', '2023-08-08 05:54:16'),
(15, 5, 2, 'Peles perfeitas em 30 dias.', '68.30', '51.23', '17.08', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', '04926ce111c8222475e63bb8ab7990cb.jpg', '2023-08-08 05:54:56', '2023-08-08 05:54:56'),
(16, 5, 3, 'Coach para mulheres!', '120.90', '90.68', '30.23', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', '436c8b43466a33d9425d5681bd8aafaa.jpg', '2023-08-08 05:56:36', '2023-08-08 05:56:36'),
(17, 5, 1, 'Pratos incríveis para receber os amigos', '44.80', '33.60', '11.20', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', '2a5ae3cecb20f5b120c4a52077d79ee6.jpg', '2023-08-08 05:58:27', '2023-08-08 05:58:27'),
(18, 5, 1, 'Cozinhando no dia a dia!', '18.90', '14.18', '4.73', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'b53f724f8efbb86963daa1dcf4168661.jpg', '2023-08-08 05:59:56', '2023-08-08 05:59:56'),
(19, 6, 2, 'Os melhores produtos para seu cabelo', '29.90', '22.43', '7.48', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', '4625264923a4093bf73588e8fadce35e.jpg', '2023-08-08 06:02:23', '2023-08-08 06:02:23'),
(21, 6, 3, 'Educação financeira para mulheres', '19.90', '14.93', '4.98', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', '8b987a25ca7318df8360adf63cb4403d.jpg', '2023-08-08 06:03:52', '2023-08-08 06:03:52'),
(23, 6, 1, 'Dê um toque de chefe á seus pratos.', '89.90', '67.43', '22.48', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis tellus in metus vulputate eu. Sagittis orci a scelerisque purus semper eget duis at tellus. Sed viverra ipsum nunc aliquet bibendum enim. In nulla posuere sollicitudin aliquam. Dis parturient montes nascetur ridiculus mus mauris vitae. Augue mauris augue neque gravida in fermentum. Platea dictumst vestibulum rhoncus est pellentesque. Commodo nulla facilisi nullam vehicula ipsum a arcu. Potenti nullam ac tortor vitae purus faucibus. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Mattis ullamcorper velit sed ullamcorper morbi tincidunt.\r\n\r\nEget mauris pharetra et ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Volutpat ac tincidunt vitae semper quis. Leo urna molestie at elementum eu facilisis. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Neque ornare aenean euismod elementum nisi. Viverra nam libero justo laoreet sit amet cursus. Eget egestas purus viverra accumsan in nisl. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Netus et malesuada fames ac.\r\n\r\nAenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sollicitudin ac orci phasellus egestas tellus rutrum. Montes nascetur ridiculus mus mauris. Cras fermentum odio eu feugiat pretium nibh. Sociis natoque penatibus et magnis dis parturient. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Euismod in pellentesque massa placerat duis. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Odio morbi quis commodo odio aenean. Dui ut ornare lectus sit amet est placerat in.', 'e1bf6cba108f4ce56ea0ac5369217f6f.jpg', '2023-08-08 06:05:30', '2023-08-08 06:05:30');
INSERT INTO `products` (`id`, `productor_id`, `category_id`, `title`, `price`, `price_productor`, `price_afiliate`, `afiliate_rules`, `description`, `photo`, `created_at`, `updated_at`) VALUES
(25, 6, 1, 'O segredo de uma boa macarronada!', '29.90', '22.43', '7.48', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mattis vulputate enim nulla aliquet porttitor lacus. Arcu non odio euismod lacinia at quis. Euismod nisi porta lorem mollis aliquam ut porttitor leo a. At urna condimentum mattis pellentesque id. Ac auctor augue mauris augue neque gravida in fermentum et. Quam quisque id diam vel quam. Fames ac turpis egestas sed. Vel orci porta non pulvinar neque. Hendrerit dolor magna eget est lorem ipsum. Tincidunt eget nullam non nisi est sit.\r\n\r\nUrna cursus eget nunc scelerisque viverra mauris in aliquam. Nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices. Condimentum vitae sapien pellentesque habitant morbi tristique senectus. Eu non diam phasellus vestibulum lorem. Lectus sit amet est placerat in egestas erat. Nullam non nisi est sit. Vestibulum lectus mauris ultrices eros in cursus. Fusce ut placerat orci nulla pellentesque dignissim enim sit. Risus nullam eget felis eget. Purus non enim praesent elementum facilisis leo. Magna sit amet purus gravida quis blandit turpis cursus. Diam sollicitudin tempor id eu nisl nunc mi ipsum. Vitae tortor condimentum lacinia quis vel. Dui id ornare arcu odio ut sem.\r\n\r\nEt magnis dis parturient montes nascetur. Enim sit amet venenatis urna cursus eget nunc scelerisque viverra. Quisque non tellus orci ac auctor augue mauris augue. At tempor commodo ullamcorper a lacus vestibulum. Feugiat sed lectus vestibulum mattis ullamcorper velit. Lacus sed turpis tincidunt id aliquet risus feugiat. Purus faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Consequat mauris nunc congue nisi vitae suscipit tellus mauris a. Sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum. Tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula. Ornare arcu odio ut sem nulla pharetra diam. Ullamcorper malesuada proin libero nunc. Cras tincidunt lobortis feugiat vivamus at augue eget arcu dictum. Sit amet consectetur adipiscing elit duis tristique sollicitudin. Ultrices neque ornare aenean euismod elementum nisi quis. Dapibus ultrices in iaculis nunc.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mattis vulputate enim nulla aliquet porttitor lacus. Arcu non odio euismod lacinia at quis. Euismod nisi porta lorem mollis aliquam ut porttitor leo a. At urna condimentum mattis pellentesque id. Ac auctor augue mauris augue neque gravida in fermentum et. Quam quisque id diam vel quam. Fames ac turpis egestas sed. Vel orci porta non pulvinar neque. Hendrerit dolor magna eget est lorem ipsum. Tincidunt eget nullam non nisi est sit.\r\n\r\nUrna cursus eget nunc scelerisque viverra mauris in aliquam. Nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices. Condimentum vitae sapien pellentesque habitant morbi tristique senectus. Eu non diam phasellus vestibulum lorem. Lectus sit amet est placerat in egestas erat. Nullam non nisi est sit. Vestibulum lectus mauris ultrices eros in cursus. Fusce ut placerat orci nulla pellentesque dignissim enim sit. Risus nullam eget felis eget. Purus non enim praesent elementum facilisis leo. Magna sit amet purus gravida quis blandit turpis cursus. Diam sollicitudin tempor id eu nisl nunc mi ipsum. Vitae tortor condimentum lacinia quis vel. Dui id ornare arcu odio ut sem.\r\n\r\nEt magnis dis parturient montes nascetur. Enim sit amet venenatis urna cursus eget nunc scelerisque viverra. Quisque non tellus orci ac auctor augue mauris augue. At tempor commodo ullamcorper a lacus vestibulum. Feugiat sed lectus vestibulum mattis ullamcorper velit. Lacus sed turpis tincidunt id aliquet risus feugiat. Purus faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Consequat mauris nunc congue nisi vitae suscipit tellus mauris a. Sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum. Tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula. Ornare arcu odio ut sem nulla pharetra diam. Ullamcorper malesuada proin libero nunc. Cras tincidunt lobortis feugiat vivamus at augue eget arcu dictum. Sit amet consectetur adipiscing elit duis tristique sollicitudin. Ultrices neque ornare aenean euismod elementum nisi quis. Dapibus ultrices in iaculis nunc.', '04de6495c714389ee6bcd1602c776613.jpg', '2023-08-13 21:39:59', '2023-08-13 21:39:59');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sales`
--

INSERT INTO `sales` (`id`, `client_id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 9, 2, 9, '2023-08-12 07:43:07', '2023-08-12 07:43:07'),
(3, 10, 2, 9, '2023-08-12 07:53:55', '2023-08-12 07:53:55'),
(4, 11, 2, 9, '2023-08-12 07:57:36', '2023-08-12 07:57:36'),
(5, 12, 2, 9, '2023-08-12 07:59:29', '2023-08-12 07:59:29'),
(6, 13, 2, 17, '2023-08-12 08:12:33', '2023-08-12 08:12:33'),
(7, 14, 2, 17, '2023-08-12 08:13:50', '2023-08-12 08:13:50'),
(8, 15, 2, 17, '2023-08-12 08:15:15', '2023-08-12 08:15:15'),
(9, 16, 2, 17, '2023-08-12 08:17:01', '2023-08-12 08:17:01'),
(10, 17, 2, 17, '2023-08-12 08:18:45', '2023-08-12 08:18:45'),
(11, 18, 2, 18, '2023-08-12 08:20:31', '2023-08-12 08:20:31'),
(12, 19, 2, 18, '2023-08-12 08:22:00', '2023-08-12 08:22:00'),
(13, 20, 2, 18, '2023-08-12 08:22:57', '2023-08-12 08:22:57'),
(14, 22, 21, 21, '2023-08-12 17:46:03', '2023-08-12 17:46:03'),
(15, 23, 21, 21, '2023-08-12 17:47:15', '2023-08-12 17:47:15'),
(16, 24, 21, 21, '2023-08-12 17:47:41', '2023-08-12 17:47:41'),
(17, 25, 21, 21, '2023-08-12 17:48:17', '2023-08-12 17:48:17'),
(18, 26, 21, 21, '2023-08-12 17:48:55', '2023-08-12 17:48:55'),
(19, 27, 2, 17, '2023-08-12 17:49:41', '2023-08-12 17:49:41'),
(20, 28, 2, 17, '2023-08-12 17:50:07', '2023-08-12 17:50:07'),
(21, 29, 2, 17, '2023-08-12 17:50:47', '2023-08-12 17:50:47'),
(22, 30, 2, 17, '2023-08-12 17:51:46', '2023-08-12 17:51:46'),
(23, 31, 21, 11, '2023-08-12 18:07:58', '2023-08-12 18:07:58'),
(24, 32, 21, 11, '2023-08-12 18:08:19', '2023-08-12 18:08:19'),
(25, 33, 21, 11, '2023-08-12 18:08:41', '2023-08-12 18:08:41'),
(26, 34, 21, 11, '2023-08-12 18:09:22', '2023-08-12 18:09:22'),
(27, 35, 21, 13, '2023-08-12 18:11:54', '2023-08-12 18:11:54'),
(28, 36, 21, 13, '2023-08-12 18:12:24', '2023-08-12 18:12:24'),
(29, 37, 21, 10, '2023-08-12 18:16:31', '2023-08-12 18:16:31'),
(30, 38, 21, 11, '2023-08-13 05:00:35', '2023-08-13 05:00:35'),
(31, 39, 21, 11, '2023-08-13 05:01:37', '2023-08-13 05:01:37'),
(32, 40, 21, 10, '2023-08-13 05:16:12', '2023-08-13 05:16:12'),
(33, 41, 21, 14, '2023-08-13 05:19:23', '2023-08-13 05:19:23'),
(34, 42, 21, 10, '2023-08-13 21:30:11', '2023-08-13 21:30:11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `access_level_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `photo`, `email_verified_at`, `password`, `remember_token`, `access_level_id`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Marcos Alberto Silva', 'marcos@gmail.com', 'b43a180511524cf76642f672cd7c4093.jpg', NULL, '$2y$10$IW52evn5U4iyKngZNHB1GOQYoRAKV/h0NslemCo.XOlF8uKH1mh/m', NULL, 2, '(11) 97896-5412', '2023-08-04 04:03:19', '2023-08-08 23:46:08', NULL),
(4, 'Junior Pocay', 'juniorpocay@gmail.com', '1516cde9b85425a0002a2bfea4326d26.jpg', NULL, '$2y$10$VvGqrDAx3OSPI.HyFmZTB.Wqx/7JI58/0fuG56t9HR8ePmnBoB7Gm', NULL, 1, '(19) 98821-0779', '2023-08-06 17:17:43', '2023-08-13 22:57:28', NULL),
(5, 'Carla Maria', 'carla@gmail.com', '39e72293136092a02caa934827a9a987.jpg', NULL, '$2y$10$HCBG86zuCVB9UVO8QOsHFOtIrvNuzb54TlM1gzSleHgdN7uNNhTPO', NULL, 1, '(11) 97856-6645', '2023-08-08 05:52:30', '2023-08-08 05:52:46', NULL),
(6, 'Lucas Alberto da Silva', 'lucas@gmail.com', '0b830ef661f7358b1a1bcedcc2c36287.jpg', NULL, '$2y$10$N.WCwy5yVx8c0Juc.jbzlOc7ysBOMSXPQXW4jLFbDrWULS8NwBe3a', NULL, 1, '(12) 98563-2147', '2023-08-08 06:00:53', '2023-08-08 06:01:17', NULL),
(9, 'André Almeida', 'andre@gmail.com', NULL, NULL, '$2y$10$Sb5XyKAUINF.2jtVmls/K.YKDFNTNHprHN311JtWdsMF3mnO4uIXS', NULL, 3, NULL, '2023-08-12 07:43:07', '2023-08-12 07:43:07', NULL),
(10, 'Marcia Ferrari', 'marcia@gmail.com', NULL, NULL, '$2y$10$oQNygsEGS6GBlQkJ5YHnIupAQ4vpDZouP2zdTn703kXxtpsoxR97m', NULL, 3, NULL, '2023-08-12 07:53:55', '2023-08-12 07:53:55', NULL),
(11, 'Paulo Camaro', 'paulo@gmail.com', NULL, NULL, '$2y$10$juB9ciImC8NmkshcF.3P1.oBz16lEutfS.zofvL95wa/wXYChDJea', NULL, 3, NULL, '2023-08-12 07:57:36', '2023-08-12 07:57:36', NULL),
(12, 'Fred andrade', 'fred@gmail.com', NULL, NULL, '$2y$10$19WH8o1msKtk5D4D9dAxveRrNbkONiXH6H4aT4hfYrd7YiV4PnPTS', NULL, 3, NULL, '2023-08-12 07:59:29', '2023-08-12 07:59:29', NULL),
(13, 'Cleiton Salles', 'cleiton@gmail.com', NULL, NULL, '$2y$10$DgDvMDLg1U2Qcicsih0IEO.HQuF7fy.s7d5zP6.8MWCOqmREA0Q5e', NULL, 3, NULL, '2023-08-12 08:12:33', '2023-08-12 08:12:33', NULL),
(14, 'Juarez Fernandes', 'juarez@gmail.com', NULL, NULL, '$2y$10$OAoa/kOFP2207T969h4mrej1B6tkaiLD/mmENmU9b5L/3H2xWrmXW', NULL, 3, NULL, '2023-08-12 08:13:50', '2023-08-12 08:13:50', NULL),
(15, 'Flor de Maio', 'flor@gmail.com', NULL, NULL, '$2y$10$PSwdE5qDRzySF3whQVKEae23tlzEVVtpCOAcqZBTLKpuwzR3UJ9Hy', NULL, 3, NULL, '2023-08-12 08:15:15', '2023-08-12 08:15:15', NULL),
(16, 'Marcio Toledo', 'marcio@testedeemail.com', NULL, NULL, '$2y$10$eargT11skrTbHsfkIArJjeDmZ5wDD.Y2F4z5N7zMRpPl7XNQm7rQa', NULL, 3, NULL, '2023-08-12 08:17:01', '2023-08-12 08:17:01', NULL),
(17, 'Vivian Cristina', 'vivian@gmail.com', NULL, NULL, '$2y$10$AV7VZZSXI0JJa0VyyKi8/O2UZ.9LR9exumr5fpyQ0NUqFB9papBPi', NULL, 3, NULL, '2023-08-12 08:18:45', '2023-08-12 08:18:45', NULL),
(18, 'Fernanda Amorin', 'fernanda@gmail.com', NULL, NULL, '$2y$10$J3bW07MnEx3zUDw1z4agLe2IpFs5F9tFtDznGIKodyscQ.a8OsqkK', NULL, 3, NULL, '2023-08-12 08:20:31', '2023-08-12 08:20:31', NULL),
(19, 'Fernanda Pesaneto', 'fernanda@outlook.com', NULL, NULL, '$2y$10$qoWTrobJztNi6hkPtopeYecuDUn7JvNj9OJb3K6lzYUaU9tL4vZs.', NULL, 3, NULL, '2023-08-12 08:22:00', '2023-08-12 08:22:00', NULL),
(20, 'Aline Alencar', 'aline@outlook.com', NULL, NULL, '$2y$10$UnBS2Jyg5GXQGsIa8W3CO.eQ3i7gtJRUjIYmC.2RjBTuNt0QcO9PC', NULL, 3, NULL, '2023-08-12 08:22:57', '2023-08-12 08:22:57', NULL),
(21, 'Fabio Almeida dos Santos', 'fabio@gmail.com', '09c79142bb12eacd89fcb995e1d1d95b.jpg', NULL, '$2y$10$n4.xhHI81kv9qyNV0bHB1uvUN2Hd1RtMuBABxDL/YI2n4ghp5/1Wm', NULL, 2, '(12) 3654-7897', '2023-08-12 17:34:12', '2023-08-13 21:29:04', NULL),
(22, 'Valmir Salaro', 'valmir@gmail.com', NULL, NULL, '$2y$10$gkshhMxCluKt3rDC5PruXuvfvlg4EEE/b7INlVMZ9jpD4nb3OqMBW', NULL, 3, NULL, '2023-08-12 17:46:03', '2023-08-12 17:46:03', NULL),
(23, 'Katia Fonseca', 'katia@gmail.com', NULL, NULL, '$2y$10$3ygBLKOo0sQjotuBtu0tcufGmAgEyWnsJC.RuXQ7zzE4h6rcOJMkG', NULL, 3, NULL, '2023-08-12 17:47:15', '2023-08-12 17:47:15', NULL),
(24, 'Claudia Alves', 'claudia@gmail.com', NULL, NULL, '$2y$10$/sLp64RxNvmi1TmTtLzVXOPoEhc0TmoJt5O9yxPxW2igtTDjiOkRq', NULL, 3, NULL, '2023-08-12 17:47:41', '2023-08-12 17:47:41', NULL),
(25, 'Silvia Helena', 'silvia@gmail.com', NULL, NULL, '$2y$10$qmR9AEd7iIRiK4E29Rf5ZukAebi4PP32CQ3m.d.NNPc5kdAfNSNpm', NULL, 3, NULL, '2023-08-12 17:48:17', '2023-08-12 17:48:17', NULL),
(26, 'Priscila Nunes', 'priscila@gmail.com', NULL, NULL, '$2y$10$F56AXbsGrM0HbtF727HRguu//rG1/EBYVixG12iAtrbidUBVcX.OG', NULL, 3, NULL, '2023-08-12 17:48:55', '2023-08-12 17:48:55', NULL),
(27, 'Marta Cardoso', 'marta@gmail.com', NULL, NULL, '$2y$10$OxHuGawHlNXG.1ig/hfbYOq7OTqIoQpt4uYED2vkXhqPbkEr8e.r6', NULL, 3, NULL, '2023-08-12 17:49:41', '2023-08-12 17:49:41', NULL),
(28, 'João Marcos', 'joao@mail.com', NULL, NULL, '$2y$10$fUaS5RVuWPBFDg2pkDZ9FOqTdE5Pn.tYGZ8M59vJCZ36euXxsetNi', NULL, 3, NULL, '2023-08-12 17:50:07', '2023-08-12 17:50:07', NULL),
(29, 'Vitória Helena', 'vitoria@gmail.com', NULL, NULL, '$2y$10$tYn5Rv9rGcuIPvSkOSmFKOKmo5qiq8Rkc9UFKXZqZYKAcVR5C9iZ6', NULL, 3, NULL, '2023-08-12 17:50:47', '2023-08-12 17:50:47', NULL),
(30, 'Beto Barbosa', 'beto@gmail.com', NULL, NULL, '$2y$10$vpapDYjiYdEHdVNZDEyYEefb5CrbeOeELct4IIarwRLPLf1XW6dT2', NULL, 3, NULL, '2023-08-12 17:51:46', '2023-08-12 17:51:46', NULL),
(31, 'Viviane de Salvi', 'viviane@gmail.com', NULL, NULL, '$2y$10$iY0RVmXmofvaHLjChl0UTuoq3nhTU4/5fe/BEOhhSSqqe3cTlceGm', NULL, 3, NULL, '2023-08-12 18:07:58', '2023-08-12 18:07:58', NULL),
(32, 'Leticia Cardoso', 'leticia@gmail.com', NULL, NULL, '$2y$10$27go63LWQ9kFjXUluwh0be1pxvqClxFWLMJu.U5Zzrpx9IPsWNyk2', NULL, 3, NULL, '2023-08-12 18:08:19', '2023-08-12 18:08:19', NULL),
(33, 'Caroline Cardoso', 'caroline@gmail.com', NULL, NULL, '$2y$10$ORRIGxedCT1l4Ixc4q0reO/nKhR.WW7p3i1B4Mg9lCC9K4hV1X1CG', NULL, 3, NULL, '2023-08-12 18:08:41', '2023-08-12 18:08:41', NULL),
(34, 'Daniela Cardoso', 'dani@gmail.com', NULL, NULL, '$2y$10$WadDwzuAIhgZNnXns462zO9m/k5LXTtLlCN0RfAKFgrD15VWXY0/q', NULL, 3, NULL, '2023-08-12 18:09:22', '2023-08-12 18:09:22', NULL),
(35, 'Fabiano Thédiga', 'fabiano@gmail.com', NULL, NULL, '$2y$10$J7sPtdK5y6UeWDnGEXoNpuC945adn7ZDi11QT1mkkd1vfeTH3Z4kS', NULL, 3, NULL, '2023-08-12 18:11:54', '2023-08-12 18:11:54', NULL),
(36, 'João Vagner', 'joao@gmail.com', NULL, NULL, '$2y$10$wk1cV2I3Dp9URTjlcwKs8.EnkQd90Oz5MI2fCbHYtOgwLt.3xitJm', NULL, 3, NULL, '2023-08-12 18:12:24', '2023-08-12 18:12:24', NULL),
(37, 'Patricia Pocay', 'patricia@gmail.com', NULL, NULL, '$2y$10$Yyjtbt1qQIGGtSf0TuJoWO2PXqW0IMBey5hkSfkd1JTg4o80rx8pK', NULL, 3, NULL, '2023-08-12 18:16:31', '2023-08-12 18:16:31', NULL),
(38, 'Marila Pera', 'marilia@gmail.com', NULL, NULL, '$2y$10$/7l8s9yClApeDW6UUNc6kuGN7p.Bup9aS9gy6QtKKcRgYz9WLblTO', NULL, 3, NULL, '2023-08-13 05:00:35', '2023-08-13 05:00:35', NULL),
(39, 'Susana Cristina', 'susana@gmail.com', NULL, NULL, '$2y$10$Ym5/2z.sarWhcEnu4m/j5u/vYTASpDd5TUe9SOjx47sYPwhwrfwhK', NULL, 3, NULL, '2023-08-13 05:01:37', '2023-08-13 05:01:37', NULL),
(40, 'Bianca Andrade', 'bianca@gmail.com', NULL, NULL, '$2y$10$2MK6ykacOsbPsmjR51OoCOzMhLYDyqxMC8eUBWd8i5p90XyRBFDsC', NULL, 3, NULL, '2023-08-13 05:16:12', '2023-08-13 05:16:12', NULL),
(41, 'Glaucia Mendonça', 'glaucia@gmail.com', NULL, NULL, '$2y$10$KwngvJTZTnZA4DU9tOBJNuZEjfYhkUEnLBKvrXBuAY9mijO2UkF36', NULL, 3, NULL, '2023-08-13 05:19:23', '2023-08-13 05:19:23', NULL),
(42, 'Felipe Macedo', 'felipe@gmail.com', NULL, NULL, '$2y$10$Dvwm3GRNIdb63RN4ZFvOy.E3MVaPeFkjZfTjGdY1.wCPAxG5hmHN.', NULL, 3, NULL, '2023-08-13 21:30:11', '2023-08-13 21:30:11', NULL),
(43, 'Sandra Rosa', 'sandra@gmail.com', 'c0c6698e70fd161110c1ea9f1b32cb52.jpg', NULL, '$2y$10$5UNNVbwpWCAR/wajYo4ZZeH2VDkjtPIuhe4ryzsZj5k/IhT2K26K.', NULL, 2, '(14) 78965-4455', '2023-08-13 21:42:42', '2023-08-13 22:19:52', NULL),
(44, 'Gerson Alves', 'gerson@gmail.com', NULL, NULL, '$2y$10$9GtjzCwcbdR37DqaWsR5LerzpBtWxcdXrWydJRF9SYKBoUn.4NBNe', NULL, 1, '(12) 35645-7897', '2023-08-13 22:49:15', '2023-08-13 22:49:15', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `access_level`
--
ALTER TABLE `access_level`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `afiliate_products`
--
ALTER TABLE `afiliate_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `afiliate_products_products_id_foreign` (`products_id`),
  ADD KEY `afiliate_products_user_id_foreign` (`user_id`);

--
-- Índices para tabela `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_productor_id_foreign` (`productor_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Índices para tabela `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_user_id_foreign` (`user_id`),
  ADD KEY `sales_product_id_foreign` (`product_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_access_level_id_foreign` (`access_level_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `access_level`
--
ALTER TABLE `access_level`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `afiliate_products`
--
ALTER TABLE `afiliate_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `afiliate_products`
--
ALTER TABLE `afiliate_products`
  ADD CONSTRAINT `afiliate_products_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `afiliate_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `products_productor_id_foreign` FOREIGN KEY (`productor_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_access_level_id_foreign` FOREIGN KEY (`access_level_id`) REFERENCES `access_level` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
