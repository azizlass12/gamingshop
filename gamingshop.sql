-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2026 at 12:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET SESSION sql_require_primary_key = 0;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamingshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `description`, `icon`, `name`) VALUES
(2, 'Ordinateurs et composants gaming', 'monitor', 'PC Gaming'),
(3, 'Souris, claviers, casques gaming', 'headphones', 'Accessoires'),
(4, 'Jeux pour toutes plateformes', 'disc', 'Jeux Vidéo'),
(5, 'Chaises ergonomiques pour gamers', 'chair', 'Chaises Gaming'),
(6, 'Carte cadeau', 'gamepade', 'Carte cadeau'),
(8, 'ghfgh', 'monitor', 'Consols');

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `id` bigint(20) NOT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `message` text NOT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `sender_type` enum('CLIENT','ADMIN') NOT NULL,
  `sent_at` datetime(6) DEFAULT NULL,
  `session_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`id`, `is_read`, `message`, `sender_name`, `sender_type`, `sent_at`, `session_id`) VALUES
(1, b'1', 'Bonjour, je suis siwww (50744654). Je voudrais commander:\n• Xbox Series X × 1 — 549.99 DA\n\nComment puis-je payer ?', 'siwww', 'CLIENT', '2026-04-05 13:29:34.000000', 1),
(2, b'0', 'd\'accord voila mon code D1è', 'Support Gaming Shop', 'ADMIN', '2026-04-05 13:30:29.000000', 1),
(3, b'1', 'Bonjour, je suis siw (50744654). Je voudrais commander:\n• Souris Razer DeathAdder × 2 — 139.98 DA\n\nComment puis-je payer ?', 'siw', 'CLIENT', '2026-04-05 13:34:54.000000', 2),
(4, b'0', 'Bonjour voila mon code D1è hhhhhhhhhhhhhhhhh', 'Support Gaming Shop', 'ADMIN', '2026-04-05 13:35:55.000000', 2),
(5, b'1', 'Bonjour, je suis GGGGGGG (HHHHHHHH). Je voudrais commander:\n• Carte Steam 50€ × 1 — 200.00 DA\n\nComment puis-je payer ?', 'GGGGGGG', 'CLIENT', '2026-04-09 00:05:25.000000', 3),
(6, b'0', 'hhhhhhhhhhhhh', 'Support Gaming Shop', 'ADMIN', '2026-04-09 00:05:52.000000', 3),
(7, b'1', 'Bonjour, je suis aziz (50744654). Je voudrais commander:\n• Cyberpunk 2077 Ultimate × 1 — 59.99 DA\n\nComment puis-je payer ?', 'aziz', 'CLIENT', '2026-04-10 14:39:40.000000', 4),
(8, b'0', 'OK', 'Support Gaming Shop', 'ADMIN', '2026-04-10 14:40:45.000000', 4),
(9, b'1', 'Bonjour, je suis siwww (50744654). Je voudrais commander:\n• Laptop ASUS ROG × 2 — 3599.98 DA\n\nComment puis-je payer ?', 'siwww', 'CLIENT', '2026-04-10 14:42:33.000000', 5),
(10, b'0', 'HHHHHHHHHHHHHHHHHHH', 'Support Gaming Shop', 'ADMIN', '2026-04-10 14:42:48.000000', 5),
(11, b'1', 'Bonjour, je suis siwww (50744654). Je voudrais commander:\n• Laptop ASUS ROG × 2 — 3599.98 DA\n\nComment puis-je payer ?', 'siwww', 'CLIENT', '2026-04-10 14:43:10.000000', 6),
(12, b'1', 'Bonjour, je suis jdjdsjqjsd (jxsjxsjs). Je voudrais commander:\n• Laptop ASUS ROG × 1 — 1799.99 DA\n\nComment puis-je payer ?', 'jdjdsjqjsd', 'CLIENT', '2026-04-10 14:58:59.000000', 7),
(13, b'1', 'cjdcjcdj', 'Support Gaming Shop', 'ADMIN', '2026-04-10 14:59:12.000000', 7),
(14, b'1', 'ncd', 'jdjdsjqjsd', 'CLIENT', '2026-04-10 14:59:24.000000', 7),
(15, b'1', 'Bonjour, je suis sdsddsd (12). Je voudrais commander:\n• Carte Steam 50€ × 1 — 200.00 DA\n\nComment puis-je payer ?', 'sdsddsd', 'CLIENT', '2026-04-10 15:00:41.000000', 8),
(16, b'0', 'NDJND', 'Support Gaming Shop', 'ADMIN', '2026-04-10 15:00:56.000000', 8),
(17, b'1', 'Bonjour, je suis bxsbxbsx (2727272). Je voudrais commander:\n• Laptop ASUS ROG × 1 — 1799.99 DA\n\nComment puis-je payer ?', 'bxsbxbsx', 'CLIENT', '2026-04-10 15:09:26.000000', 9),
(18, b'1', 'Bonjour, je suis ggggggggggggg (1235). Je voudrais commander:\n• God of War Ragnarok × 1 — 69.99 DA\n\nComment puis-je payer ?', 'ggggggggggggg', 'CLIENT', '2026-04-10 15:15:20.000000', 10),
(19, b'1', 'HHHHHHHHH', 'Support Gaming Shop', 'ADMIN', '2026-04-10 15:15:43.000000', 10),
(20, b'1', 'HH', 'ggggggggggggg', 'CLIENT', '2026-04-10 15:15:49.000000', 10),
(21, b'1', 'Bonjour, je suis jdfjdj (1234). Je voudrais commander:\n• Carte Steam 50€ × 1 — 200.00 DA\n\nComment puis-je payer ?', 'jdfjdj', 'CLIENT', '2026-04-10 15:57:55.000000', 11),
(22, b'0', 'hhhhh', 'Support Gaming Shop', 'ADMIN', '2026-04-10 15:58:40.000000', 11),
(23, b'1', 'Bonjour, je suis siwarr (20049425). Je voudrais commander:\n• Cyberpunk 2077 Ultimate × 1 — 59.99 DA\n\nComment puis-je payer ?', 'siwarr', 'CLIENT', '2026-04-10 17:21:36.000000', 12),
(24, b'0', 'ok', 'Support Gaming Shop', 'ADMIN', '2026-04-10 17:22:09.000000', 12),
(25, b'1', 'Bonjour, je suis siwaaararara (1234566). Je voudrais commander:\n• PC Gaming RTX 4080 × 1 — 2499.99 DA\n\nComment puis-je payer ?', 'siwaaararara', 'CLIENT', '2026-04-15 17:40:46.000000', 13),
(26, b'0', 'OKIIII', 'Support Gaming Shop', 'ADMIN', '2026-04-15 17:40:53.000000', 13),
(27, b'1', 'Bonjour, je suis client (09876). Je voudrais commander:\n• Nintendo Switch OLED × 1 — 349.99 DA\n\nComment puis-je payer ?', 'client', 'CLIENT', '2026-04-15 18:27:31.000000', 14),
(28, b'1', 'HBDHH', 'client', 'CLIENT', '2026-04-15 18:27:37.000000', 14),
(29, b'0', 'HHHJJH', 'Support Gaming Shop', 'ADMIN', '2026-04-15 18:28:03.000000', 14),
(30, b'1', 'Bonjour, je suis ahlem (12345). Je voudrais commander:\n• PC Gaming RTX 4080 × 1 — 2499.99 DA\n\nComment puis-je payer ?', 'ahlem', 'CLIENT', '2026-04-16 12:36:12.000000', 15),
(31, b'0', 'DHSDHHHFJHF', 'Support Gaming Shop', 'ADMIN', '2026-04-16 12:36:55.000000', 15),
(32, b'1', 'Bonjour, je suis ahlem (12345). Je voudrais commander:\n• PC Gaming RTX 4080 × 1 — 2499.99 DA\n\nComment puis-je payer ?', 'ahlem', 'CLIENT', '2026-04-16 12:39:50.000000', 16),
(33, b'1', 'Bonjour, je suis HJJHJHJH (1234). Je voudrais commander:\n• Webcam Logitech 4K × 1 — 199.99 DA\n• Chaise DXRacer Formula × 1 — 399.99 DA\n\nComment puis-je payer ?', 'HJJHJHJH', 'CLIENT', '2026-04-16 12:54:23.000000', 17),
(34, b'1', 'Bonjour, je suis sousou (12345). Je voudrais commander:\n• PC Gaming RTX 4080 × 1 — 2499.99 DA\n\nComment puis-je payer ?', 'sousou', 'CLIENT', '2026-04-17 19:56:24.000000', 18),
(35, b'1', 'DHHD', 'sousou', 'CLIENT', '2026-04-17 19:56:30.000000', 18),
(36, b'1', 'Bonjour, je suis sousou (2345). Je voudrais commander:\n• Casque SteelSeries Arctis 7 × 1 — 149.99 DA\n\nComment puis-je payer ?', 'sousou', 'CLIENT', '2026-04-17 20:07:35.000000', 19),
(37, b'1', 'd\'accord', 'sousou', 'CLIENT', '2026-04-17 20:18:41.000000', 19),
(38, b'1', 'cdkckdf', 'Support Gaming Shop', 'ADMIN', '2026-04-17 20:19:19.000000', 19),
(39, b'1', 'ckdc', 'sousou', 'CLIENT', '2026-04-17 20:19:26.000000', 19),
(40, b'1', 'jjjjjjj', 'sousou', 'CLIENT', '2026-04-17 20:48:51.000000', 19),
(41, b'1', 'Bonjour, je suis siwaar atiya (450744654). Je voudrais commander:\n• Xbox Game Pass Ultimate 1 Mois × 2 — 170.00 DA\n\nComment puis-je payer ?', 'siwaar atiya', 'CLIENT', '2026-04-18 19:02:37.000000', 20),
(42, b'0', 'agaatat', 'Support Gaming Shop', 'ADMIN', '2026-04-18 19:08:46.000000', 20),
(43, b'1', 'Bonjour, je suis siwarttt (20049425). Je voudrais commander:\n• Laptop ASUS ROG × 1 — 1799.99 DA\n\nComment puis-je payer ?', 'siwarttt', 'CLIENT', '2026-04-18 19:11:04.000000', 21),
(44, b'0', 'JHJHHJJH', 'Support Gaming Shop', 'ADMIN', '2026-04-18 19:11:18.000000', 21),
(45, b'1', 'HGHGH', 'sousou', 'CLIENT', '2026-04-18 19:15:17.000000', 19),
(46, b'1', 'Bonjour, je suis saifff (23456). Je voudrais commander:\n• Souris Razer DeathAdder × 1 — 69.99 DA\n\nComment puis-je payer ?', 'saifff', 'CLIENT', '2026-04-18 19:20:00.000000', 22),
(47, b'0', 'JKJHKJ', 'Support Gaming Shop', 'ADMIN', '2026-04-18 19:20:18.000000', 22),
(48, b'1', 'Bonjour, je suis Siwar (123456789). Je voudrais commander:\n• Laptop ASUS ROG × 1 — 1799.99 DA\n\nComment puis-je payer ?', 'Siwar', 'CLIENT', '2026-04-19 13:21:40.000000', 23),
(49, b'0', 'hghg', 'Support Gaming Shop', 'ADMIN', '2026-04-19 13:23:34.000000', 23),
(50, b'1', 'Bonjour, je suis Nawres (09876). Je voudrais commander:\n• Souris Razer DeathAdder × 1 — 69.99 DA\n\nComment puis-je payer ?', 'Nawres', 'CLIENT', '2026-04-19 13:35:36.000000', 24),
(51, b'0', 'HJHJHJH', 'Support Gaming Shop', 'ADMIN', '2026-04-19 13:35:45.000000', 24),
(52, b'1', 'Bonjour, je suis amin (2121). Je voudrais commander:\n• Souris Razer DeathAdder × 1 — 69.99 DA\n\nComment puis-je payer ?', 'amin', 'CLIENT', '2026-04-19 13:38:49.000000', 25),
(53, b'0', 'GHGHGH', 'Support Gaming Shop', 'ADMIN', '2026-04-19 13:41:20.000000', 25),
(54, b'0', 'DHSHDHSD', 'nawres', 'CLIENT', '2026-04-19 16:18:17.000000', 24),
(55, b'0', 'jdfjjks', 'Support Gaming Shop', 'ADMIN', '2026-04-19 16:18:40.000000', 25),
(56, b'1', 'Bonjour, je suis raaaaamiii (20090494). Je voudrais commander:\n• Souris Razer DeathAdder × 1 — 69.99 DA\n\nComment puis-je payer ?', 'raaaaamiii', 'CLIENT', '2026-04-19 16:21:47.000000', 26),
(57, b'0', 'HFHHJDGJHF', 'Support Gaming Shop', 'ADMIN', '2026-04-19 16:22:09.000000', 26),
(58, b'1', 'Bonjour, je suis sourour (90000001). Je voudrais commander:\n• PC Gaming RTX 4080 × 1 — 2499.99 DA\n\nComment puis-je payer ?', 'sourour', 'CLIENT', '2026-04-19 16:24:54.000000', 27),
(59, b'0', 'DBHEDHEH', 'Support Gaming Shop', 'ADMIN', '2026-04-19 16:25:03.000000', 27);

-- --------------------------------------------------------

--
-- Table structure for table `chat_order_item`
--

CREATE TABLE `chat_order_item` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(38,2) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `session_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_session`
--

CREATE TABLE `chat_session` (
  `id` bigint(20) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_phone` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_read_by_admin` bit(1) DEFAULT NULL,
  `status` enum('PENDING','ACTIVE','CLOSED') DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_session`
--

INSERT INTO `chat_session` (`id`, `client_name`, `client_phone`, `created_at`, `is_read_by_admin`, `status`, `updated_at`) VALUES
(1, 'siwww', '50744654', '2026-04-05 13:29:34.000000', b'1', 'ACTIVE', '2026-04-05 13:30:29.000000'),
(2, 'siw', '50744654', '2026-04-05 13:34:54.000000', b'1', 'CLOSED', '2026-04-09 14:37:46.000000'),
(3, 'GGGGGGG', 'HHHHHHHH', '2026-04-09 00:05:25.000000', b'1', 'ACTIVE', '2026-04-09 00:05:52.000000'),
(4, 'aziz', '50744654', '2026-04-10 14:39:40.000000', b'1', 'ACTIVE', '2026-04-10 14:40:45.000000'),
(5, 'siwww', '50744654', '2026-04-10 14:42:33.000000', b'1', 'ACTIVE', '2026-04-10 14:42:48.000000'),
(6, 'siwww', '50744654', '2026-04-10 14:43:10.000000', b'1', 'PENDING', '2026-04-18 19:05:20.000000'),
(7, 'jdjdsjqjsd', 'jxsjxsjs', '2026-04-10 14:58:59.000000', b'1', 'ACTIVE', '2026-04-10 14:59:33.000000'),
(8, 'sdsddsd', '12', '2026-04-10 15:00:41.000000', b'1', 'ACTIVE', '2026-04-10 15:00:56.000000'),
(9, 'bxsbxbsx', '2727272', '2026-04-10 15:09:26.000000', b'1', 'PENDING', '2026-04-18 19:16:53.000000'),
(10, 'ggggggggggggg', '1235', '2026-04-10 15:15:20.000000', b'1', 'ACTIVE', '2026-04-15 17:37:15.000000'),
(11, 'jdfjdj', '1234', '2026-04-10 15:57:55.000000', b'1', 'ACTIVE', '2026-04-10 15:58:40.000000'),
(12, 'siwarr', '20049425', '2026-04-10 17:21:36.000000', b'1', 'ACTIVE', '2026-04-10 17:22:09.000000'),
(13, 'siwaaararara', '1234566', '2026-04-15 17:40:46.000000', b'1', 'ACTIVE', '2026-04-15 17:40:53.000000'),
(14, 'client', '09876', '2026-04-15 18:27:31.000000', b'1', 'ACTIVE', '2026-04-15 18:28:01.000000'),
(15, 'ahlem', '12345', '2026-04-16 12:36:11.000000', b'1', 'ACTIVE', '2026-04-16 12:36:55.000000'),
(16, 'ahlem', '12345', '2026-04-16 12:39:50.000000', b'1', 'PENDING', '2026-04-17 20:31:56.000000'),
(17, 'HJJHJHJH', '1234', '2026-04-16 12:54:23.000000', b'1', 'PENDING', '2026-04-17 20:26:15.000000'),
(18, 'sousou', '12345', '2026-04-17 19:56:24.000000', b'1', 'ACTIVE', '2026-04-17 20:19:53.000000'),
(19, 'sousou', '2345', '2026-04-17 20:07:35.000000', b'1', 'ACTIVE', '2026-04-18 19:16:58.000000'),
(20, 'siwaar atiya', '450744654', '2026-04-18 19:02:37.000000', b'1', 'ACTIVE', '2026-04-18 19:08:46.000000'),
(21, 'siwarttt', '20049425', '2026-04-18 19:11:04.000000', b'1', 'ACTIVE', '2026-04-18 19:11:18.000000'),
(22, 'saifff', '23456', '2026-04-18 19:20:00.000000', b'1', 'ACTIVE', '2026-04-18 19:20:18.000000'),
(23, 'Siwar', '123456789', '2026-04-19 13:21:40.000000', b'1', 'ACTIVE', '2026-04-19 13:23:34.000000'),
(24, 'Nawres', '09876', '2026-04-19 13:35:36.000000', b'0', 'ACTIVE', '2026-04-19 16:18:17.000000'),
(25, 'amin', '2121', '2026-04-19 13:38:49.000000', b'1', 'ACTIVE', '2026-04-19 13:41:20.000000'),
(26, 'raaaaamiii', '20090494', '2026-04-19 16:21:47.000000', b'1', 'ACTIVE', '2026-04-19 16:22:09.000000'),
(27, 'sourour', '90000001', '2026-04-19 16:24:54.000000', b'1', 'ACTIVE', '2026-04-19 16:25:03.000000');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `regions` text DEFAULT NULL,
  `values_available` text DEFAULT NULL,
  `prices_by_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `created_at`, `description`, `image_url`, `name`, `price`, `stock`, `updated_at`, `category_id`, `regions`, `values_available`, `prices_by_value`) VALUES
(4, NULL, 'PC gaming ultra avec RTX 4080, Intel i9, 32GB RAM, 2TB NVMe', 'https://images.unsplash.com/photo-1587202372634-32705e3bf49c?w=400', 'PC Gaming RTX 4080', 2499.99, 5, NULL, 2, NULL, NULL, NULL),
(5, NULL, 'Laptop gaming 165Hz, RTX 4070, AMD Ryzen 9, 16GB RAM', 'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=400', 'Laptop ASUS ROG', 1799.99, 8, NULL, 2, NULL, NULL, NULL),
(6, NULL, 'Souris gaming 20000 DPI, RGB, ergonomique, optique', 'https://images.unsplash.com/photo-1527814050087-3793815479db?w=400', 'Souris Razer DeathAdder', 69.99, 50, NULL, 3, NULL, NULL, NULL),
(7, NULL, 'Clavier mécanique gaming Cherry MX Speed, RGB, aluminium', 'https://images.unsplash.com/photo-1595225476474-87563907a212?w=400', 'Clavier Corsair K100', 199.99, 30, NULL, 3, NULL, NULL, NULL),
(8, NULL, 'Casque gaming sans fil, son surround 7.1, 24h autonomie', 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400', 'Casque SteelSeries Arctis 7', 149.99, 20, NULL, 3, NULL, NULL, NULL),
(9, NULL, 'Jeu PS5/PS4 - Aventure épique nordique de Kratos et Atreus', 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=400', 'God of War Ragnarok', 69.99, 40, NULL, 4, NULL, NULL, NULL),
(10, NULL, 'RPG futuriste PC/Consoles avec extension Phantom Liberty', 'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=400', 'Cyberpunk 2077 Ultimate', 59.99, 35, NULL, 4, NULL, NULL, NULL),
(11, NULL, 'Chaise gaming ergonomique, accoudoirs 4D, mousse haute densité', 'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=400', 'Chaise DXRacer Formula', 399.99, 10, NULL, 5, NULL, NULL, NULL),
(12, NULL, 'Moniteur IPS 2K 165Hz, 1ms, G-Sync compatible, HDR400', 'https://images.unsplash.com/photo-1547119957-637f8679db1e?w=400', 'Écran ASUS 27\" 165Hz', 449.99, 15, NULL, 2, NULL, NULL, NULL),
(13, NULL, 'Manette pro Xbox/PC, palettes ajustables, stick tension réglable', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Xbox_one_logo.svg/200px-Xbox_one_logo.svg.png', 'Manette Xbox Elite V2', 179.99, 22, NULL, 3, NULL, NULL, NULL),
(14, NULL, 'Manette pro PS5 ultra personnalisable, back buttons, profilés', 'https://images.unsplash.com/photo-1607853202273-797f1c22a38e?w=400', 'PS5 DualSense Edge', 199.99, 18, NULL, 3, NULL, NULL, NULL),
(15, NULL, 'Webcam streaming 4K HDR, autofocus IA, parfaite pour streaming', 'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=400', 'Webcam Logitech 4K', 199.99, 25, NULL, 3, NULL, NULL, NULL),
(16, NULL, 'Carte PlayStation Network 10€ région France', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/200px-Playstation_logo_colour.svg.png', 'Carte PSN 10€ - France', 40.00, 50, NULL, 6, NULL, NULL, NULL),
(17, NULL, 'Carte PlayStation Network 20€ région France', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/200px-Playstation_logo_colour.svg.png', 'Carte PSN 20€ - France', 80.00, 50, NULL, 6, NULL, NULL, NULL),
(18, NULL, 'Carte PlayStation Network 50€ région France', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/200px-Playstation_logo_colour.svg.png', 'Carte PSN 50€ - France', 195.00, 30, NULL, 6, NULL, NULL, NULL),
(19, NULL, 'Abonnement PS Plus Essential 1 mois - France', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/200px-Playstation_logo_colour.svg.png', 'PS Plus Essential 1 Mois', 40.00, 99, NULL, 6, NULL, NULL, NULL),
(20, NULL, 'Abonnement PS Plus Extra 1 mois - France', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/200px-Playstation_logo_colour.svg.png', 'PS Plus Extra 1 Mois', 65.00, 99, NULL, 6, NULL, NULL, NULL),
(21, NULL, 'Carte cadeau Xbox 15€ - Global', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Xbox_one_logo.svg/200px-Xbox_one_logo.svg.png', 'Carte Xbox 15€', 60.00, 50, NULL, 6, NULL, NULL, NULL),
(22, NULL, 'Carte cadeau Xbox 25€ - Global', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Xbox_one_logo.svg/200px-Xbox_one_logo.svg.png', 'Carte Xbox 25€', 99.00, 50, NULL, 6, NULL, NULL, NULL),
(23, NULL, 'Abonnement Xbox Game Pass Ultimate 1 mois', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Xbox_one_logo.svg/200px-Xbox_one_logo.svg.png', 'Xbox Game Pass Ultimate 1 Mois', 85.00, 99, NULL, 6, NULL, NULL, NULL),
(24, NULL, 'Carte Nintendo eShop 15€ - Europe', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Nintendo.svg/200px-Nintendo.svg.png', 'Carte Nintendo eShop 15€', 60.00, 50, NULL, 6, NULL, NULL, NULL),
(25, NULL, 'Carte Nintendo eShop 25€ - Europe', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Nintendo.svg/200px-Nintendo.svg.png', 'Carte Nintendo eShop 25€', 99.00, 50, NULL, 6, NULL, NULL, NULL),
(26, NULL, 'Carte Steam 10€ - Global', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Steam_icon_logo.svg/200px-Steam_icon_logo.svg.png', 'Carte Steam 10€', 40.00, 50, NULL, 6, NULL, NULL, NULL),
(27, NULL, 'Carte Steam 20€ - Global', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Steam_icon_logo.svg/200px-Steam_icon_logo.svg.png', 'Carte Steam 20€', 80.00, 50, NULL, 6, NULL, NULL, NULL),
(28, NULL, 'Carte Steam 50€ - Global', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Steam_icon_logo.svg/200px-Steam_icon_logo.svg.png', 'Carte Steam 50€', 200.00, 30, NULL, 6, NULL, NULL, NULL),
(29, NULL, 'Carte Robux 10$ pour Roblox - USA', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Roblox_logo_2022.svg/200px-Roblox_logo_2022.svg.png', 'Carte Robux 10$ - Roblox', 40.00, 99, NULL, 6, NULL, NULL, NULL),
(30, NULL, '1000 V-Bucks pour Fortnite - Global', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Fortnite_logo.png/200px-Fortnite_logo.png', 'Carte V-Bucks 1000 - Fortnite', 40.00, 99, NULL, 6, NULL, NULL, NULL),
(32, NULL, 'Riot Points 10€ - Europe', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/LoL_icon.svg/200px-LoL_icon.svg.png', 'Carte League of Legends 10€', 40.00, 99, NULL, 6, NULL, NULL, NULL),
(33, NULL, 'Carte cadeau Netflix 25€', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Netflix_2015_logo.svg/200px-Netflix_2015_logo.svg.png', 'Carte Netflix 25€', 99.00, 30, NULL, 6, NULL, NULL, NULL),
(34, NULL, 'Abonnement Discord Nitro 1 mois - Global', 'https://upload.wikimedia.org/wikipedia/fr/thumb/4/4f/Discord_Logo_sans_texte.svg/200px-Discord_Logo_sans_texte.svg.png', 'Discord Nitro 1 Mois', 60.00, 99, NULL, 6, NULL, NULL, NULL),
(35, NULL, 'Carte Battle.net Blizzard 20€ - Europe', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Blizzard_Entertainment_Logo_2015.svg/200px-Blizzard_Entertainment_Logo_2015.svg.png', 'Carte Blizzard 20€', 80.00, 50, NULL, 6, NULL, NULL, NULL),
(37, '2026-04-19 16:41:36.000000', 'hjsjhs dhsuhj', 'https://image.api.playstation.com/vulcan/ap/rnd/202203/1004/mTugZ2VioGmxOVxWBcetvgWu.png', 'coins Efootbol', 1500.00, 3, '2026-04-19 16:41:36.000000', 6, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','CLIENT') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'client', NULL, '$2a$10$ifHW7/FG2h0NRY2j/OTuJuquSpCmZWeOHPUrkM9VM2pCdnhd1PkG2', 'CLIENT', '2026-04-15 17:36:41'),
(2, 'admin', 'admin@gamingshop.com', '$2a$10$SEhaFet8wtHNFV0NRnMhLe3jwPBRDtHw6XOr7/lG1bFsQ0y0.nQ.K', 'ADMIN', '2026-04-15 19:39:41'),
(3, 'sousou', NULL, '$2a$10$bM2ajkR99MjMQPo6oDexq.3.p8eKtnQ9Gve2dRksZRzxCMfEAr7zC', 'CLIENT', '2026-04-17 19:55:31'),
(4, 'nawres', NULL, '$2a$10$nqWwX7NlH.TSsL1qlbJftu8FO62zYNs/IrgMyHRYH464zv.qGek0a', 'CLIENT', '2026-04-18 19:01:47'),
(5, 'amin', NULL, '$2a$10$3621U4rXyywGuAlsc6RpoOv84yLGwiOgf9/3dVN3psUxcM437U.w2', 'CLIENT', '2026-04-19 13:38:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgtjn4wh83q8ohixkwcotpoob9` (`session_id`);

--
-- Indexes for table `chat_order_item`
--
ALTER TABLE `chat_order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtnybna7w195kb0j3tlarqpymg` (`product_id`),
  ADD KEY `FK62yjrup3i14ctn7r6kn7nyo3u` (`session_id`);

--
-- Indexes for table `chat_session`
--
ALTER TABLE `chat_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `chat_order_item`
--
ALTER TABLE `chat_order_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_session`
--
ALTER TABLE `chat_session`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD CONSTRAINT `FKgtjn4wh83q8ohixkwcotpoob9` FOREIGN KEY (`session_id`) REFERENCES `chat_session` (`id`);

--
-- Constraints for table `chat_order_item`
--
ALTER TABLE `chat_order_item`
  ADD CONSTRAINT `FK62yjrup3i14ctn7r6kn7nyo3u` FOREIGN KEY (`session_id`) REFERENCES `chat_session` (`id`),
  ADD CONSTRAINT `FKtnybna7w195kb0j3tlarqpymg` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
