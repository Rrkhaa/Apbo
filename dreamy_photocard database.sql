-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Bulan Mei 2025 pada 06.49
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dreamy_photocard`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('owner','admin','staff') NOT NULL DEFAULT 'admin',
  `permissions` text DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`admin_id`, `email`, `password`, `full_name`, `phone`, `role`, `permissions`, `last_login`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'owner@dreamy.id', 'ownerdreamy', 'Owner Dreamy', '081234567890', 'owner', '{\"all\": true}', NULL, 1, '2025-05-22 17:06:34', '2025-05-22 17:06:34'),
(2, 'admin@dreamy.id', 'admindreamy', 'Admin Dreamy', '081234567891', 'admin', '{\"manage_products\": true, \"manage_orders\": true, \"view_reports\": true}', NULL, 1, '2025-05-22 17:06:34', '2025-05-22 17:06:34'),
(3, 'staff@dreamy.id', 'staffdreamy', 'Staff Dreamy', '081234567892', 'staff', '{\"manage_orders\": true, \"view_products\": true}', NULL, 1, '2025-05-22 17:06:34', '2025-05-22 17:06:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `preferred_groups` text DEFAULT NULL,
  `total_purchases` decimal(15,2) DEFAULT 0.00,
  `total_orders` int(11) DEFAULT 0,
  `customer_level` enum('bronze','silver','gold','platinum') DEFAULT 'bronze',
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`customer_id`, `email`, `password`, `full_name`, `phone`, `address`, `date_of_birth`, `gender`, `preferred_groups`, `total_purchases`, `total_orders`, `customer_level`, `last_login`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'selsakartika@gmail.com', 'lovely', 'Selsa Trikartika', '4523210102', 'Depok', '1995-05-15', 'female', '[\"BTS\", \"BLACKPINK\", \"ILLIT\"]', 0.00, 0, 'gold', NULL, 1, '2025-05-22 17:28:19', '2025-05-22 17:28:19'),
(2, 'rakhaabhirama@gmail.com', 'Rakhaabhirama', 'Rakha abhirama', '4523210088', 'Jakarta Pusat', '1998-08-20', 'male', '[\"BLACKPINK\", \"NewJeans\", \"IVE\"]', 0.00, 0, 'silver', NULL, 1, '2025-05-22 17:28:19', '2025-05-22 17:28:19'),
(3, 'syobaismaunun@gmail.com', 'syobaismaunun', 'Syoba Ismaunun', '4523210107', 'Jakarta Selatan', '2000-12-10', 'female', '[\"BTS\", \"SEVENTEEN\", \"NCT\"]', 0.00, 0, 'bronze', NULL, 1, '2025-05-22 17:28:19', '2025-05-22 17:28:19'),
(4, 'rifkybudiyanto@gmail.com', 'rifkybudiyanto', 'Rifky Budiyanto', '4523210094', 'Bogor', '2000-12-10', 'male', '[\"FIFTYFIFTY\", \"TWS\", \"LESSERAFIM\"]', 0.00, 0, 'gold', NULL, 1, '2025-05-22 17:28:19', '2025-05-22 17:28:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `freebies`
--

CREATE TABLE `freebies` (
  `freebie_id` int(11) NOT NULL,
  `freebie_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `minimum_purchase` decimal(12,2) DEFAULT 0.00,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `freebies`
--

INSERT INTO `freebies` (`freebie_id`, `freebie_name`, `description`, `stock_quantity`, `minimum_purchase`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Sticker Pack', 'Paket sticker', 50, 50000.00, 1, '2025-05-22 17:41:39', '2025-05-22 17:41:39'),
(2, 'Photocard Sleeve Protector', 'Pelindung photocard transparan', 100, 25000.00, 1, '2025-05-22 17:41:39', '2025-05-22 17:41:39'),
(3, 'K-Pop Bookmark', 'Bookmark dengan design K-Pop', 30, 75000.00, 1, '2025-05-22 17:41:39', '2025-05-22 17:41:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `idols`
--

CREATE TABLE `idols` (
  `idol_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `member_name` varchar(100) NOT NULL,
  `stage_name` varchar(100) DEFAULT NULL,
  `debut_date` date DEFAULT NULL,
  `agency` varchar(100) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `position_in_group` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `idols`
--

INSERT INTO `idols` (`idol_id`, `group_name`, `member_name`, `stage_name`, `debut_date`, `agency`, `nationality`, `position_in_group`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'BTS', 'Kim Namjoon', 'RM', '2013-06-13', 'HYBE', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(2, 'BTS', 'Kim Seokjin', 'Jin', '2013-06-13', 'HYBE', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(3, 'BTS', 'Min Yoongi', 'Suga', '2013-06-13', 'HYBE', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(4, 'BTS', 'Jung Hoseok', 'J-Hope', '2013-06-13', 'HYBE', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(5, 'BTS', 'Park Jimin', 'Jimin', '2013-06-13', 'HYBE', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(6, 'BTS', 'Kim Taehyung', 'V', '2013-06-13', 'HYBE', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(7, 'BTS', 'Jeon Jungkook', 'Jungkook', '2013-06-13', 'HYBE', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(8, 'BLACKPINK', 'Kim Jisoo', 'Jisoo', '2016-08-08', 'YG Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(9, 'BLACKPINK', 'Jennie Kim', 'Jennie', '2016-08-08', 'YG Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(10, 'BLACKPINK', 'Park Chaeyoung', 'Rosé', '2016-08-08', 'YG Entertainment', 'New Zealand', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(11, 'BLACKPINK', 'Lalisa Manoban', 'Lisa', '2016-08-08', 'YG Entertainment', 'Thailand', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(12, 'NewJeans', 'Kim Minji', 'Minji', '2022-07-22', 'ADOR', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(13, 'NewJeans', 'Phạm Ngọc Hân', 'Hanni', '2022-07-22', 'ADOR', 'Vietnam', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(14, 'NewJeans', 'Danielle Marsh', 'Danielle', '2022-07-22', 'ADOR', 'Australia', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(15, 'NewJeans', 'Kang Haerin', 'Haerin', '2022-07-22', 'ADOR', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(16, 'NewJeans', 'Lee Hyein', 'Hyein', '2022-07-22', 'ADOR', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(17, 'NCT DREAM', 'Mark Lee', 'Mark', '2016-08-25', 'SM Entertainment', 'Canada', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(18, 'NCT DREAM', 'Huang Renjun', 'Renjun', '2016-08-25', 'SM Entertainment', 'China', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(19, 'NCT DREAM', 'Lee Jeno', 'Jeno', '2016-08-25', 'SM Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(20, 'NCT DREAM', 'Lee Donghyuck', 'Haechan', '2016-08-25', 'SM Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(21, 'NCT DREAM', 'Na Jaemin', 'Jaemin', '2016-08-25', 'SM Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(22, 'NCT DREAM', 'Zhong Chenle', 'Chenle', '2016-08-25', 'SM Entertainment', 'China', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(23, 'NCT DREAM', 'Park Jisung', 'Jisung', '2016-08-25', 'SM Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(24, 'ILLIT', 'Noh Yunah', 'Yunah', '2024-03-25', 'Belift Lab', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(25, 'ILLIT', 'Park Minju', 'Minju', '2024-03-25', 'Belift Lab', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(26, 'ILLIT', 'Sakai Moka', 'Moka', '2024-03-25', 'Belift Lab', 'Japan', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(27, 'ILLIT', 'Lee Wonhee', 'Wonhee', '2024-03-25', 'Belift Lab', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(28, 'ILLIT', 'Hokazono Iroha', 'Iroha', '2024-03-25', 'Belift Lab', 'Japan', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(29, 'IVE', 'Kim Gaeul', 'Gaeul', '2021-12-01', 'Starship Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(30, 'IVE', 'An Yujin', 'Yujin', '2021-12-01', 'Starship Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(31, 'IVE', 'Naoi Rei', 'Rei', '2021-12-01', 'Starship Entertainment', 'Japan', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(32, 'IVE', 'Jang Wonyoung', 'Wonyoung', '2021-12-01', 'Starship Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(33, 'IVE', 'Kim Jiwon', 'Liz', '2021-12-01', 'Starship Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(34, 'IVE', 'Lee Hyunseo', 'Leeseo', '2021-12-01', 'Starship Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(35, 'SEVENTEEN', 'Choi Seungcheol', 'S.Coups', '2015-05-26', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(36, 'SEVENTEEN', 'Yoon Jeonghan', 'Jeonghan', '2015-05-26', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(37, 'SEVENTEEN', 'Joshua Hong', 'Joshua', '2015-05-26', 'Pledis Entertainment', 'United States', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(38, 'SEVENTEEN', 'Wen Junhui', 'Jun', '2015-05-26', 'Pledis Entertainment', 'China', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(39, 'SEVENTEEN', 'Kwon Soonyoung', 'Hoshi', '2015-05-26', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(40, 'SEVENTEEN', 'Jeon Wonwoo', 'Wonwoo', '2015-05-26', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(41, 'SEVENTEEN', 'Lee Jihoon', 'Woozi', '2015-05-26', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(42, 'SEVENTEEN', 'Xu Minghao', 'The8', '2015-05-26', 'Pledis Entertainment', 'China', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(43, 'SEVENTEEN', 'Kim Mingyu', 'Mingyu', '2015-05-26', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(44, 'SEVENTEEN', 'Lee Seokmin', 'DK', '2015-05-26', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(45, 'SEVENTEEN', 'Boo Seungkwan', 'Seungkwan', '2015-05-26', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(46, 'SEVENTEEN', 'Choi Hansol', 'Vernon', '2015-05-26', 'Pledis Entertainment', 'United States', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(47, 'SEVENTEEN', 'Lee Chan', 'Dino', '2015-05-26', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(48, 'FIFTY FIFTY', 'Keena', 'Keena', '2022-11-18', 'Attrakt', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(49, 'FIFTY FIFTY', 'Chanelle Moon', 'Chanelle', '2024-09-20', 'Attrakt', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(50, 'FIFTY FIFTY', 'Yewon', 'Yewon', '2024-09-20', 'Attrakt', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(51, 'FIFTY FIFTY', 'Hana', 'Hana', '2024-09-20', 'Attrakt', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(52, 'FIFTY FIFTY', 'Athena', 'Athena', '2024-09-20', 'Attrakt', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(53, 'TWS', 'Shinyu', 'Shinyu', '2024-01-22', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(54, 'TWS', 'Dohoon', 'Dohoon', '2024-01-22', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(55, 'TWS', 'Youngjae', 'Youngjae', '2024-01-22', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(56, 'TWS', 'Hanjin', 'Hanjin', '2024-01-22', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(57, 'TWS', 'Jihoon', 'Jihoon', '2024-01-22', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(58, 'TWS', 'Kyungmin', 'Kyungmin', '2024-01-22', 'Pledis Entertainment', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(59, 'LE SSERAFIM', 'Miyawaki Sakura', 'Sakura', '2022-05-02', 'Source Music', 'Japan', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(60, 'LE SSERAFIM', 'Kim Chaewon', 'Chaewon', '2022-05-02', 'Source Music', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(61, 'LE SSERAFIM', 'Huh Yunjin', 'Yunjin', '2022-05-02', 'Source Music', 'United States', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(62, 'LE SSERAFIM', 'Nakamura Kazuha', 'Kazuha', '2022-05-02', 'Source Music', 'Japan', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12'),
(63, 'LE SSERAFIM', 'Hong Eunchae', 'Eunchae', '2022-05-02', 'Source Music', 'South Korea', NULL, 1, '2025-05-22 17:32:12', '2025-05-22 17:32:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory_transactions`
--

CREATE TABLE `inventory_transactions` (
  `transaction_id` int(11) NOT NULL,
  `photocard_id` int(11) NOT NULL,
  `transaction_type` enum('stock_in','stock_out','adjustment','return') NOT NULL,
  `quantity` int(11) NOT NULL,
  `reference_type` enum('purchase','sale','adjustment','return','damage') NOT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `unit_cost` decimal(12,2) DEFAULT 0.00,
  `total_cost` decimal(12,2) DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_items` int(11) DEFAULT 0,
  `subtotal` decimal(12,2) DEFAULT 0.00,
  `discount_amount` decimal(12,2) DEFAULT 0.00,
  `shipping_cost` decimal(12,2) DEFAULT 0.00,
  `total_amount` decimal(12,2) NOT NULL,
  `payment_method` enum('qris','bank_transfer','e_wallet','credit_card') NOT NULL,
  `payment_status` enum('pending','paid','failed','refunded') DEFAULT 'pending',
  `order_status` enum('pending','confirmed','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `shipping_address` text NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `order_number`, `customer_id`, `order_date`, `total_items`, `subtotal`, `discount_amount`, `shipping_cost`, `total_amount`, `payment_method`, `payment_status`, `order_status`, `shipping_address`, `tracking_number`, `notes`, `promotion_id`, `created_at`, `updated_at`) VALUES
(1, 'DRM-20241201-0001', 1, '2025-05-22 17:46:14', 0, 0.00, 0.00, 0.00, 95000.00, 'qris', 'paid', 'delivered', 'Jl. Merdeka No. 12, Pancoran Mas, Depok 16436', NULL, NULL, NULL, '2025-05-22 17:46:14', '2025-05-22 17:46:14'),
(2, 'DRM-20241202-0002', 2, '2025-05-22 17:46:14', 0, 0.00, 0.00, 0.00, 155000.00, 'bank_transfer', 'paid', 'shipped', 'Jl. Kebon Sirih No. 45, Jakarta Pusat 10340', NULL, NULL, NULL, '2025-05-22 17:46:14', '2025-05-22 17:46:14'),
(3, 'DRM-20241203-0003', 3, '2025-05-22 17:46:14', 0, 0.00, 0.00, 0.00, 35000.00, 'e_wallet', 'paid', 'processing', 'Jl. Prapanca No. 33, Jakarta Selatan 12160', NULL, NULL, NULL, '2025-05-22 17:46:14', '2025-05-22 17:46:14'),
(4, 'DRM-20241204-0004', 4, '2025-05-22 17:46:14', 0, 0.00, 0.00, 0.00, 67000.00, '', '', 'pending', 'Jl. Raya Pajajaran No. 88, Bogor 16143', NULL, NULL, NULL, '2025-05-22 17:46:14', '2025-05-22 17:46:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_freebies`
--

CREATE TABLE `order_freebies` (
  `order_freebie_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `freebie_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `photocard_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(12,2) NOT NULL,
  `total_price` decimal(12,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `photocards`
--

CREATE TABLE `photocards` (
  `photocard_id` int(11) NOT NULL,
  `photocard_name` varchar(200) NOT NULL,
  `idol_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `album_name` varchar(150) DEFAULT NULL,
  `series` varchar(100) DEFAULT NULL,
  `rarity_level` enum('common','uncommon','rare','ultra_rare','limited') DEFAULT 'common',
  `condition_status` enum('mint','near_mint','good','fair') DEFAULT 'mint',
  `purchase_price` decimal(12,2) DEFAULT 0.00,
  `selling_price` decimal(12,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `minimum_stock` int(11) DEFAULT 1,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_authentic` tinyint(1) DEFAULT 1,
  `is_available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `photocards`
--

INSERT INTO `photocards` (`photocard_id`, `photocard_name`, `idol_id`, `category_id`, `supplier_id`, `album_name`, `series`, `rarity_level`, `condition_status`, `purchase_price`, `selling_price`, `stock_quantity`, `minimum_stock`, `description`, `image_url`, `is_authentic`, `is_available`, `created_at`, `updated_at`) VALUES
(1, 'ILLIT Yunah - Super Real Me', 34, 1, 3, 'Super Real Me', NULL, 'uncommon', 'mint', 0.00, 27000.00, 4, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(2, 'ILLIT Minju - Super Real Me', 35, 1, 3, 'Super Real Me', NULL, 'rare', 'mint', 0.00, 30000.00, 2, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(3, 'ILLIT Moka - Super Real Me', 36, 1, 3, 'Super Real Me', NULL, 'common', 'mint', 0.00, 22000.00, 6, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(4, 'ILLIT Wonhee - Super Real Me', 37, 1, 3, 'Super Real Me', NULL, 'ultra_rare', 'mint', 0.00, 50000.00, 1, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(5, 'ILLIT Iroha - Super Real Me', 38, 1, 3, 'Super Real Me', NULL, 'rare', 'mint', 0.00, 32000.00, 3, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(6, 'FIFTY FIFTY Athena - Pookie', 48, 1, 1, 'Pookie', NULL, 'common', 'mint', 0.00, 20000.00, 5, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(7, 'FIFTY FIFTY Yewon - Pookie', 49, 1, 1, 'Pookie', NULL, 'uncommon', 'mint', 0.00, 26000.00, 4, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(8, 'TWS Shinyu - Sparkling Blue', 50, 1, 2, 'Sparkling Blue', NULL, 'rare', 'mint', 0.00, 33000.00, 3, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(9, 'TWS Dohoon - Sparkling Blue', 51, 1, 2, 'Sparkling Blue', NULL, 'uncommon', 'mint', 0.00, 29000.00, 4, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(10, 'NCT DREAM Mark - Glitch Mode', 22, 1, 2, 'Glitch Mode', NULL, 'rare', 'mint', 0.00, 40000.00, 3, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(11, 'NCT DREAM Renjun - Glitch Mode', 23, 1, 2, 'Glitch Mode', NULL, 'uncommon', 'mint', 0.00, 35000.00, 4, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(12, 'NCT DREAM Jeno - Glitch Mode', 24, 1, 2, 'Glitch Mode', NULL, 'common', 'mint', 0.00, 25000.00, 5, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(13, 'NCT DREAM Haechan - Glitch Mode', 25, 1, 2, 'Glitch Mode', NULL, 'rare', 'mint', 0.00, 42000.00, 2, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(14, 'NCT DREAM Jaemin - Glitch Mode', 26, 1, 2, 'Glitch Mode', NULL, 'ultra_rare', 'mint', 0.00, 60000.00, 1, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(15, 'NCT DREAM Chenle - Glitch Mode', 27, 1, 2, 'Glitch Mode', NULL, 'uncommon', 'mint', 0.00, 30000.00, 4, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28'),
(16, 'NCT DREAM Jisung - Glitch Mode', 28, 1, 2, 'Glitch Mode', NULL, 'common', 'mint', 0.00, 23000.00, 6, 1, NULL, NULL, 1, 1, '2025-05-22 17:39:28', '2025-05-22 17:39:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `photocard_categories`
--

CREATE TABLE `photocard_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `photocard_categories`
--

INSERT INTO `photocard_categories` (`category_id`, `category_name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Album Official', 'Photocard resmi dari album', 1, '2025-05-22 17:32:43', '2025-05-22 17:32:43'),
(2, 'Merchandise', 'Photocard dari merchandise official', 1, '2025-05-22 17:32:43', '2025-05-22 17:32:43'),
(3, 'Event Benefit', 'Photocard dari event khusus', 1, '2025-05-22 17:32:43', '2025-05-22 17:32:43'),
(4, 'Limited Edition', 'Photocard edisi terbatas', 1, '2025-05-22 17:32:43', '2025-05-22 17:32:43'),
(5, 'Polaroid', 'Photocard format polaroid', 1, '2025-05-22 17:32:43', '2025-05-22 17:32:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `promotions`
--

CREATE TABLE `promotions` (
  `promotion_id` int(11) NOT NULL,
  `promotion_name` varchar(150) NOT NULL,
  `promotion_type` enum('discount_percentage','discount_fixed','buy_one_get_one','free_shipping') NOT NULL,
  `discount_value` decimal(10,2) DEFAULT 0.00,
  `minimum_purchase` decimal(12,2) DEFAULT 0.00,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `max_usage` int(11) DEFAULT NULL,
  `current_usage` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `promotions`
--

INSERT INTO `promotions` (`promotion_id`, `promotion_name`, `promotion_type`, `discount_value`, `minimum_purchase`, `start_date`, `end_date`, `max_usage`, `current_usage`, `is_active`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Diskon Akhir Tahun', 'discount_percentage', 15.00, 100000.00, '2024-12-01', '2024-12-31', NULL, 0, 1, 'Diskon 15% untuk pembelian minimal 100rb', '2025-05-22 17:40:37', '2025-05-22 17:40:37'),
(2, 'Buy 5 Get 1 Free', '', 0.00, 50000.00, '2024-11-01', '2024-11-30', NULL, 0, 1, 'Beli 5 photocard gratis 1', '2025-05-22 17:40:37', '2025-05-22 17:40:37'),
(3, 'Free Ongkir', 'free_shipping', 0.00, 75000.00, '2024-10-01', '2024-12-31', NULL, 0, 1, 'Gratis ongkir untuk pembelian minimal 75rb', '2025-05-22 17:40:37', '2025-05-22 17:40:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `promotion_photocards`
--

CREATE TABLE `promotion_photocards` (
  `promotion_photocard_id` int(11) NOT NULL,
  `promotion_id` int(11) NOT NULL,
  `photocard_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `supplier_type` enum('local','international') DEFAULT 'local',
  `is_trusted` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `contact_person`, `email`, `phone`, `address`, `supplier_type`, `is_trusted`, `created_at`, `updated_at`) VALUES
(1, 'K-Pop Store Jakarta', 'John Doe', 'john@kpopstore.com', '081234567893', NULL, 'local', 1, '2025-05-22 17:34:15', '2025-05-22 17:34:15'),
(2, 'Seoul Music Shop', 'Kim Min-jun', 'kim@seoulmusic.kr', '+82-10-1234-5678', NULL, 'international', 1, '2025-05-22 17:34:15', '2025-05-22 17:34:15'),
(3, 'Photocard Paradise', 'Lisa Wong', 'lisa@photocardparadise.com', '081234567894', NULL, 'local', 1, '2025-05-22 17:34:15', '2025-05-22 17:34:15'),
(4, 'Hanteo Global', 'Vicenzo', 'contact@hanteo.com', '+82-2-1234-5678', NULL, '', 1, '2025-05-22 17:34:15', '2025-05-22 17:34:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `email_verified` tinyint(1) DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_customer_level` (`customer_level`),
  ADD KEY `idx_total_purchases` (`total_purchases`);

--
-- Indeks untuk tabel `freebies`
--
ALTER TABLE `freebies`
  ADD PRIMARY KEY (`freebie_id`);

--
-- Indeks untuk tabel `idols`
--
ALTER TABLE `idols`
  ADD PRIMARY KEY (`idol_id`),
  ADD KEY `idx_group_name` (`group_name`),
  ADD KEY `idx_member_name` (`member_name`);

--
-- Indeks untuk tabel `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_photocard_id` (`photocard_id`),
  ADD KEY `idx_transaction_type` (`transaction_type`),
  ADD KEY `idx_transaction_date` (`transaction_date`),
  ADD KEY `idx_reference` (`reference_type`,`reference_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `promotion_id` (`promotion_id`),
  ADD KEY `idx_order_number` (`order_number`),
  ADD KEY `idx_customer_id` (`customer_id`),
  ADD KEY `idx_order_date` (`order_date`),
  ADD KEY `idx_order_status` (`order_status`),
  ADD KEY `idx_payment_status` (`payment_status`);

--
-- Indeks untuk tabel `order_freebies`
--
ALTER TABLE `order_freebies`
  ADD PRIMARY KEY (`order_freebie_id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_freebie_id` (`freebie_id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_photocard_id` (`photocard_id`);

--
-- Indeks untuk tabel `photocards`
--
ALTER TABLE `photocards`
  ADD PRIMARY KEY (`photocard_id`),
  ADD KEY `idol_id` (`idol_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `idx_photocard_name` (`photocard_name`),
  ADD KEY `idx_rarity` (`rarity_level`),
  ADD KEY `idx_price` (`selling_price`),
  ADD KEY `idx_stock` (`stock_quantity`);

--
-- Indeks untuk tabel `photocard_categories`
--
ALTER TABLE `photocard_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indeks untuk tabel `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`promotion_id`),
  ADD KEY `idx_promotion_dates` (`start_date`,`end_date`),
  ADD KEY `idx_promotion_active` (`is_active`);

--
-- Indeks untuk tabel `promotion_photocards`
--
ALTER TABLE `promotion_photocards`
  ADD PRIMARY KEY (`promotion_photocard_id`),
  ADD UNIQUE KEY `unique_promotion_photocard` (`promotion_id`,`photocard_id`),
  ADD KEY `idx_promotion_id` (`promotion_id`),
  ADD KEY `idx_photocard_id` (`photocard_id`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `freebies`
--
ALTER TABLE `freebies`
  MODIFY `freebie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `idols`
--
ALTER TABLE `idols`
  MODIFY `idol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `order_freebies`
--
ALTER TABLE `order_freebies`
  MODIFY `order_freebie_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `photocards`
--
ALTER TABLE `photocards`
  MODIFY `photocard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `photocard_categories`
--
ALTER TABLE `photocard_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `promotions`
--
ALTER TABLE `promotions`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `promotion_photocards`
--
ALTER TABLE `promotion_photocards`
  MODIFY `promotion_photocard_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD CONSTRAINT `inventory_transactions_ibfk_1` FOREIGN KEY (`photocard_id`) REFERENCES `photocards` (`photocard_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventory_transactions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`promotion_id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `order_freebies`
--
ALTER TABLE `order_freebies`
  ADD CONSTRAINT `order_freebies_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_freebies_ibfk_2` FOREIGN KEY (`freebie_id`) REFERENCES `freebies` (`freebie_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`photocard_id`) REFERENCES `photocards` (`photocard_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `photocards`
--
ALTER TABLE `photocards`
  ADD CONSTRAINT `photocards_ibfk_1` FOREIGN KEY (`idol_id`) REFERENCES `idols` (`idol_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `photocards_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `photocard_categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `photocards_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `promotion_photocards`
--
ALTER TABLE `promotion_photocards`
  ADD CONSTRAINT `promotion_photocards_ibfk_1` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`promotion_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotion_photocards_ibfk_2` FOREIGN KEY (`photocard_id`) REFERENCES `photocards` (`photocard_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
