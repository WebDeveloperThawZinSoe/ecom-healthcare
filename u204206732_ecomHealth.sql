-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 03, 2025 at 06:49 AM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u204206732_ecomHealth`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `icon`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Mega Care', '678279e1b92d9_images (8).jpg', NULL, '2025-01-11 14:02:09', '2025-01-11 14:02:09'),
(2, 'Fame', '678279ef41102_images (8).png', NULL, '2025-01-11 14:02:23', '2025-01-11 14:02:23'),
(3, 'medica', '678279fdd3759_images (7).png', NULL, '2025-01-11 14:02:37', '2025-01-11 14:02:37'),
(4, 'iasi', '67827a2a23fe1_iasi.jpg', NULL, '2025-01-11 14:03:22', '2025-01-11 14:03:22'),
(5, 'DECOLGEN', '67827bf5725ea_images (9).jpg', NULL, '2025-01-11 14:11:01', '2025-01-11 14:11:01'),
(6, 'BPI', '67827cbe94292_images (10).jpg', NULL, '2025-01-11 14:14:22', '2025-01-11 14:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `user_id`, `session_id`, `product_variant_id`, `qty`, `coupon_code`, `created_at`, `updated_at`) VALUES
(1, NULL, 'XOZTE8GsMJlcD0emXECFOjtPXV4qMeGSQCATGfjv', 3, 1, NULL, '2025-01-11 14:37:51', '2025-01-11 14:37:51'),
(5, 64, NULL, 3, 1, NULL, '2025-01-14 03:36:29', '2025-01-14 03:36:29'),
(6, 64, NULL, 7, 1, NULL, '2025-01-14 03:36:42', '2025-01-14 03:36:42'),
(7, 64, NULL, 5, 1, NULL, '2025-01-14 03:37:01', '2025-01-14 03:37:01'),
(8, NULL, 'Ng1ikw5ErsPOiOS4lC8xdXHAVetNbwmpSzdFzAmt', 3, 4, NULL, '2025-01-15 16:38:49', '2025-01-15 16:38:49'),
(14, 1, NULL, 5, 1, NULL, '2025-01-25 04:07:16', '2025-01-25 04:07:16'),
(18, NULL, 'ilR4SwtFs16itjK3EEcik2YarbK2lbKluAcGYopa', 4, 1, NULL, '2025-01-27 18:13:40', '2025-01-27 18:13:40'),
(20, NULL, 'VuPXqh2Y11hXrFAqzuoKr35m84q9WMC6FltLQEIo', 7, 1, NULL, '2025-01-31 19:34:18', '2025-01-31 19:34:18'),
(21, NULL, 'MLC2egblorNNSTgSOhVtpTeT9SFpQIXosmSK82Bx', 6, 1, NULL, '2025-02-03 05:07:29', '2025-02-03 05:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `cupon_codes`
--

CREATE TABLE `cupon_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cupon_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `amount` int(11) NOT NULL DEFAULT 0,
  `code_limit` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cupon_codes`
--

INSERT INTO `cupon_codes` (`id`, `cupon_code`, `name`, `type`, `amount`, `code_limit`, `description`, `status`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'NewYearDiscount', 'NewYearDiscount', 2, 3, 100, '<p>New Year Discount 3% For 100 Orders</p>', 1, '2025-01-01 20:49:00', '2025-01-31 20:49:00', '2025-01-11 14:18:47', '2025-01-11 14:18:47'),
(2, '1$Discount', '1$Discount', 1, 1, 100, '<p>1$Discount For First 100 Order</p>', 1, NULL, NULL, '2025-01-11 14:19:10', '2025-01-11 14:19:10'),
(4, '10$Discount', '10$ Discount', 1, 10, 10, NULL, 1, '2025-01-24 02:14:00', '2025-01-31 02:14:00', '2025-01-24 19:41:52', '2025-01-24 19:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `cupon_use_logs`
--

CREATE TABLE `cupon_use_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cupon_id` int(11) NOT NULL,
  `cupon_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `amount` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cupon_use_logs`
--

INSERT INTO `cupon_use_logs` (`id`, `cupon_id`, `cupon_code`, `name`, `type`, `amount`, `user_id`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 4, '10$Discount', '10$ Discount', 1, 10, 0, 7, '2025-01-24 19:44:23', '2025-01-24 19:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `customer_feedback`
--

CREATE TABLE `customer_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_types`
--

CREATE TABLE `customer_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_types`
--

INSERT INTO `customer_types` (`id`, `user_id`, `type_id`, `created_at`, `updated_at`) VALUES
(44, 61, 7, '2025-01-11 08:49:26', '2025-01-11 08:49:26'),
(45, 62, 7, '2025-01-11 09:30:47', '2025-01-11 09:30:47'),
(46, 63, 7, '2025-01-13 02:10:42', '2025-01-13 02:10:42'),
(47, 64, 7, '2025-01-14 03:25:26', '2025-01-14 03:25:26'),
(48, 65, 7, '2025-01-25 04:14:56', '2025-01-25 04:14:56'),
(49, 66, 7, '2025-01-26 02:17:54', '2025-01-26 02:17:54'),
(50, 67, 7, '2025-01-26 07:05:44', '2025-01-26 07:05:44');

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
-- Table structure for table `f_a_q_s`
--

CREATE TABLE `f_a_q_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `f_a_q_s`
--

INSERT INTO `f_a_q_s` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'Is it safe?', 'Yes, our service is 99.99% safe, however you have to take the RMT into consideration, because the game author company might be taking steps to avoid this kind of service as much as possible. Currently we can state that this is the safest POE shop today, we do the highest level of security pre-cautions in game and in general to avoid issues with the orders.\r\nSo this is considered as safe, as long as you are not talking about your order in the game, and trade back some useless or free items.', '2024-08-20 09:26:08', '2024-08-20 09:26:08'),
(2, 'How do I know if my order is ready?', 'We can prepare the order within a short time. Please just keep online in the game and waiting for the trade. If you are not online in game when we are ready for your order , we will notify you via email to come online for the trade. You can also contact us by live chat to inform us when you are free to get delivery.', '2024-08-20 09:26:22', '2024-08-20 09:26:22'),
(3, 'How can I become a VIP?', 'You can sign up on our website in the upper right corner of the home page with email address or other social methods, you are promoted to the next VIP level by reaching the goal of each rank. Your current rank depends on the number of your total orders and the money you have spent. every rank has different discounts.', '2024-08-20 09:26:37', '2024-08-20 09:26:37'),
(4, 'How do I place my path of exile order?', 'Select Path of Exile platform from the menu and choose your server. Look for the POE items you would like to receive.\r\nBy using the search field, you can find the items faster.\r\nWhen you choose the products, you can add to your shopping cart immediately, which is located under on the top right corner, then you can click on the check-out button.\r\nAt this point, you have to leave your character name and read the notes. After that, you just have to choose from a wide variety of payment methods and complete the purchase.', '2024-08-20 09:26:47', '2024-08-20 09:26:47'),
(5, 'What forms of payment do you accept?', 'We accept a wide variety of payments, including payments via Paypal, Skrill, Visa and Mastercard , and many local payment methods. All of these payment gateways are safe to use. You can find the fees of the different payment methods when checking out. The fee depends on the total amount of payment.', '2024-08-20 09:27:01', '2024-08-20 09:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `type`, `image`, `name`, `sort`, `created_at`, `updated_at`) VALUES
(4, 'banner', 'images/photos/1736310654-banner.jpg', 'Home Banner', '1', '2025-01-07 22:00:54', '2025-01-07 22:00:54');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'banner_image', '66cb4114334e6_202407240905041979 (1).jpg', '2024-08-20 09:11:42', '2024-08-25 08:05:00'),
(2, 'about_image', '671dee4b26368_66c4b9362fc5b_202407240905041979.jpg', '2024-08-20 09:11:42', '2024-10-27 07:39:55'),
(3, 'contact_image', '671dee4b26b76_66c4b9362fc5b_202407240905041979.jpg', '2024-08-20 09:11:42', '2024-10-27 07:39:55'),
(4, 'banner_link', NULL, '2024-08-20 09:11:42', '2024-11-22 08:39:25'),
(5, 'phone_number_1', '09403077739', '2024-08-20 09:11:42', '2025-01-07 21:19:07'),
(6, 'phone_number_2', '09403077739', '2024-08-20 09:11:42', '2025-01-07 21:19:07'),
(7, 'phone_number_3', NULL, '2024-08-20 09:11:42', '2024-08-20 09:11:42'),
(8, 'email_1', 'info@ecom-healthcare.com', '2024-08-20 09:11:42', '2025-01-07 21:19:07'),
(9, 'email_2', NULL, '2024-08-20 09:11:42', '2024-11-22 08:39:25'),
(10, 'email_3', NULL, '2024-08-20 09:11:42', '2024-08-20 09:11:42'),
(11, 'facebook', 'https://ecom-healthcare.com', '2024-08-20 09:11:42', '2025-01-07 21:19:07'),
(12, 'telegram', 'https://ecom-healthcare.com', '2024-08-20 09:11:42', '2025-01-07 21:19:07'),
(13, 'discord', 'https://ecom-healthcare.com', '2024-08-20 09:11:42', '2025-01-07 21:19:07'),
(14, 'about_us', NULL, '2024-08-20 09:11:42', '2024-11-22 08:39:25'),
(15, 'how_to_sell_us', NULL, '2024-08-20 09:11:42', '2024-11-22 08:39:25'),
(16, 'viber', '09403077739', NULL, '2025-01-07 21:19:07'),
(17, 'skype', '09403077739', NULL, '2025-01-07 21:19:07'),
(18, 'logo', '6789d4955213d_Ecom Healthcare Logo Design_FA-01.png', NULL, '2025-01-17 03:55:01'),
(19, 'contact_us', NULL, '2024-10-25 17:13:35', '2024-11-22 08:39:25'),
(20, 'address', 'Singapore', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_category_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(29, '2014_10_12_000000_create_users_table', 1),
(30, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(31, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(32, '2019_08_19_000000_create_failed_jobs_table', 1),
(33, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(34, '2024_08_17_020015_create_sessions_table', 1),
(35, '2024_08_17_021031_create_permission_tables', 1),
(36, '2024_08_17_021328_create_types_table', 1),
(37, '2024_08_17_021329_create_customer_types_table', 1),
(38, '2024_08_17_021329_create_product_categories_table', 1),
(39, '2024_08_17_021330_create_products_table', 1),
(43, '2024_08_20_135812_create_sub_categories_table', 2),
(44, '2024_08_20_144227_create_general_settings_table', 3),
(45, '2024_08_20_145317_create_f_a_q_s_table', 4),
(46, '2024_09_10_133106_create_payment_methods_table', 5),
(48, '2024_09_11_140712_create_v_i_p_requests_table', 6),
(49, '2024_09_12_132152_create_customer_feedback_table', 7),
(50, '2024_10_28_033441_add_provider_columns_to_users_table', 8),
(51, '2024_10_28_035858_create_product_variants_table', 9),
(52, '2024_10_30_142204_create_brands_table', 10),
(53, '2024_11_01_012137_add_new_column_to_products_and_product_variants_tables', 11),
(54, '2024_08_17_021331_create_cards_table', 12),
(55, '2024_08_17_021331_create_orders_table', 13),
(56, '2024_08_17_021332_create_order_details_table', 13),
(57, '2024_11_12_025218_create_galleries_table', 14),
(58, '2024_11_12_040509_create_goals_table', 15),
(60, '2024_11_12_082329_create_supplies_table', 16),
(62, '2024_12_25_025902_create_cupon_codes_table', 17),
(63, '2024_12_25_125400_create_cupon_use_logs_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 44),
(1, 'App\\Models\\User', 49),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 24),
(2, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 26),
(2, 'App\\Models\\User', 27),
(2, 'App\\Models\\User', 28),
(2, 'App\\Models\\User', 29),
(2, 'App\\Models\\User', 30),
(2, 'App\\Models\\User', 31),
(2, 'App\\Models\\User', 33),
(2, 'App\\Models\\User', 34),
(2, 'App\\Models\\User', 35),
(2, 'App\\Models\\User', 36),
(2, 'App\\Models\\User', 37),
(2, 'App\\Models\\User', 38),
(2, 'App\\Models\\User', 39),
(2, 'App\\Models\\User', 40),
(2, 'App\\Models\\User', 41),
(2, 'App\\Models\\User', 42),
(2, 'App\\Models\\User', 43),
(2, 'App\\Models\\User', 45),
(2, 'App\\Models\\User', 46),
(2, 'App\\Models\\User', 47),
(2, 'App\\Models\\User', 48),
(2, 'App\\Models\\User', 50),
(2, 'App\\Models\\User', 51),
(2, 'App\\Models\\User', 52),
(2, 'App\\Models\\User', 53),
(2, 'App\\Models\\User', 54),
(2, 'App\\Models\\User', 55),
(2, 'App\\Models\\User', 58),
(2, 'App\\Models\\User', 59),
(2, 'App\\Models\\User', 60),
(2, 'App\\Models\\User', 61),
(2, 'App\\Models\\User', 62),
(2, 'App\\Models\\User', 63),
(2, 'App\\Models\\User', 64),
(2, 'App\\Models\\User', 65),
(2, 'App\\Models\\User', 66),
(2, 'App\\Models\\User', 67),
(3, 'App\\Models\\User', 57);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_slip` varchar(255) DEFAULT NULL,
  `payment_account_name` varchar(255) DEFAULT NULL,
  `total_price` decimal(8,1) NOT NULL,
  `note` text DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `payment_status` varchar(255) NOT NULL DEFAULT '0',
  `cupon_code_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `name`, `email`, `phone`, `region`, `address`, `payment_method`, `payment_slip`, `payment_account_name`, `total_price`, `note`, `status`, `payment_status`, `cupon_code_id`, `created_at`, `updated_at`) VALUES
(1, 'ORD-6785DB8CB17FE', 64, 'MSCOUS Apex', 'mscousapex@gmail.com', '09403077739', 'Yangon', 'No 9/689 , Shwe Padar Street , East Dagon , Yangon', '0', NULL, NULL, 20.8, NULL, 2, '0', NULL, '2025-01-14 03:35:40', '2025-01-14 03:54:15'),
(2, 'ORD-6793EA2CDF95E', NULL, 'Lance Figueroa', 'mycef@mailinator.com', '+1 (224) 313-5773', 'Mandalay', 'Anim error saepe rec', 'stripe', NULL, NULL, 9.8, NULL, 4, 'succeeded', NULL, '2025-01-24 19:29:48', '2025-01-24 19:33:14'),
(3, 'ORD-6793EA30CD0F5', NULL, 'Lance Figueroa', 'mycef@mailinator.com', '+1 (224) 313-5773', 'Mandalay', 'Anim error saepe rec', 'stripe', NULL, NULL, 9.8, NULL, 2, 'succeeded', NULL, '2025-01-24 19:29:52', '2025-01-24 19:32:51'),
(4, 'ORD-6793EBB5CE2A7', NULL, 'dd', 'aungmyatmoe834@gmail.com', 'dkid', 'Yangon', 'Letpadan\r\nLetpadan', 'stripe', NULL, NULL, 20.0, NULL, 1, 'succeeded', NULL, '2025-01-24 19:36:21', '2025-01-24 19:36:22'),
(5, 'ORD-6793EBB6D2B3A', NULL, 'dd', 'aungmyatmoe834@gmail.com', 'dkid', 'Yangon', 'Letpadan\r\nLetpadan', 'stripe', NULL, NULL, 20.0, NULL, 1, 'succeeded', NULL, '2025-01-24 19:36:22', '2025-01-24 19:36:24'),
(6, 'ORD-6793EC1C44201', NULL, 'Aung Myat Moe', 'aungmyatmoe834@gmail.com', '4444', 'Yangon', 'Letpadan\r\nLetpadan', 'stripe', NULL, NULL, 20.0, NULL, 1, 'succeeded', NULL, '2025-01-24 19:38:04', '2025-01-24 19:38:05'),
(7, 'ORD-6793ED968031E', NULL, 'Aung Myat Moe', 'aungmyatmoe834@gmail.com', '233333333333333', 'Yangon', 'Letpadan\r\nLetpadan', 'stripe', NULL, NULL, 10.0, NULL, 1, 'succeeded', '4', '2025-01-24 19:44:22', '2025-01-24 19:44:23'),
(8, 'ORD-6793EFD44C428', 63, 'User Tester', 'usertester@gmail.com', '09251016449', 'Yangon', 'Hello world', 'stripe', NULL, NULL, 5.0, NULL, 1, 'succeeded', NULL, '2025-01-24 19:53:56', '2025-01-24 19:53:57'),
(9, 'ORD-67959B84C0DC0', 66, 'Aung Myat Moe', 'aungmyatmoe834@gmail.com', '09756221585', 'Yangon', 'Jdkfifi', 'stripe', NULL, NULL, 9.8, NULL, 1, 'succeeded', NULL, '2025-01-26 02:18:44', '2025-01-26 02:18:45'),
(10, 'ORD-6796BFF19DD25', 63, 'User Tester', 'usertester@gmail.com', '09251016449', 'Yangon', '334, yangoon', 'stripe', NULL, NULL, 20.0, NULL, 1, 'succeeded', NULL, '2025-01-26 23:06:25', '2025-01-26 23:06:26'),
(11, 'ORD-6796BFF50694E', 63, 'User Tester', 'usertester@gmail.com', '09251016449', 'Yangon', '334, yangoon', 'stripe', NULL, NULL, 20.0, NULL, 1, 'succeeded', NULL, '2025-01-26 23:06:29', '2025-01-26 23:06:30'),
(12, 'ORD-679822BB47D6C', 63, 'User Tester', 'usertester@gmail.com', '09251016449', 'Yangon', '1234 Yangoon', 'stripe', NULL, NULL, 10.0, NULL, 1, 'succeeded', NULL, '2025-01-28 00:20:11', '2025-01-28 00:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,1) NOT NULL,
  `discount_type` varchar(255) NOT NULL DEFAULT '0',
  `discount_amount` varchar(255) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_number`, `order_id`, `product_variant_id`, `price`, `discount_type`, `discount_amount`, `qty`, `created_at`, `updated_at`) VALUES
(1, 'ORD-6785DB8CB17FE', 1, 7, 10.0, '2', '2', 1, '2025-01-14 03:35:40', '2025-01-14 03:35:40'),
(2, 'ORD-6785DB8CB17FE', 1, 3, 1.0, '0', '0', 1, '2025-01-14 03:35:40', '2025-01-14 03:35:40'),
(3, 'ORD-6785DB8CB17FE', 1, 1, 10.0, '0', '0', 1, '2025-01-14 03:35:40', '2025-01-14 03:35:40'),
(4, 'ORD-6793EA2CDF95E', 2, 7, 10.0, '2', '2', 1, '2025-01-24 19:29:50', '2025-01-24 19:29:50'),
(5, 'ORD-6793EA30CD0F5', 3, 7, 10.0, '2', '2', 1, '2025-01-24 19:29:53', '2025-01-24 19:29:53'),
(6, 'ORD-6793EBB5CE2A7', 4, 5, 25.0, '1', '5', 1, '2025-01-24 19:36:22', '2025-01-24 19:36:22'),
(7, 'ORD-6793EBB6D2B3A', 5, 5, 25.0, '1', '5', 1, '2025-01-24 19:36:24', '2025-01-24 19:36:24'),
(8, 'ORD-6793EC1C44201', 6, 4, 20.0, '0', '0', 1, '2025-01-24 19:38:05', '2025-01-24 19:38:05'),
(9, 'ORD-6793ED968031E', 7, 4, 20.0, '0', '0', 1, '2025-01-24 19:44:23', '2025-01-24 19:44:23'),
(10, 'ORD-6793EFD44C428', 8, 6, 5.0, '0', '0', 1, '2025-01-24 19:53:57', '2025-01-24 19:53:57'),
(11, 'ORD-67959B84C0DC0', 9, 7, 10.0, '2', '2', 1, '2025-01-26 02:18:45', '2025-01-26 02:18:45'),
(12, 'ORD-6796BFF19DD25', 10, 4, 20.0, '0', '0', 1, '2025-01-26 23:06:26', '2025-01-26 23:06:26'),
(13, 'ORD-6796BFF50694E', 11, 4, 20.0, '0', '0', 1, '2025-01-26 23:06:30', '2025-01-26 23:06:30'),
(14, 'ORD-679822BB47D6C', 12, 1, 10.0, '0', '0', 1, '2025-01-28 00:20:12', '2025-01-28 00:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('pyaephyoaungktt@gmail.com', '$2y$12$x4VFK01MC7fXWSMNK/Ikc.yK9NtFz5SF22xWu.U90EDGpZJqab1Hu', '2024-10-07 18:09:11'),
('thawzinsoe.dev@gmail.com', '$2y$12$c2fLXh7zgQafYhBCbh4Fp.dOw3t3mkW/DU5QQxivB5lxzzjA3ejMu', '2024-10-27 07:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(255) NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `icon` varchar(225) DEFAULT NULL,
  `account_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `account_no`, `icon`, `account_name`, `created_at`, `updated_at`) VALUES
(1, 'KBZ Pay', '09403077739', '1726587802.png', 'Thaw Zin Soe', '2024-09-10 07:08:52', '2024-09-17 09:13:22'),
(2, 'Wave Money', '09403077739', '1726587821.png', 'Thaw Zin Soe', '2024-09-10 07:09:03', '2024-09-17 09:13:41'),
(8, 'Skrill', 'ppaktt@outlook.com', '1729844501.png', 'Pyae Phyo Aung', '2024-10-25 08:21:41', '2024-10-25 08:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,1) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `min_stock` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` int(11) NOT NULL DEFAULT 1,
  `pre_order` int(11) NOT NULL DEFAULT 0,
  `discount_type` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) DEFAULT 0,
  `images` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stock`, `min_stock`, `image`, `category_id`, `sub_category_id`, `brand_id`, `status`, `short_description`, `description`, `created_at`, `updated_at`, `product_type`, `pre_order`, `discount_type`, `discount_amount`, `images`) VALUES
(1, 'II Care Eye Supplement Softgel Cap 10’s', 10.0, 999, NULL, 'product_images/67827afb9c79b_images (6).jpg', 8, NULL, 1, 1, '<p><strong>Usage Instruction</strong></p><p>One capsule once or twice daily or as directed by physician.</p><p><strong>Warning / Storage Instruction</strong></p><p>Store below 30’C</p>', '<p><strong>Product Benefit</strong></p><p>အီတလီနိုင်ငံမှBilberryသီးLutein နဲ့Betacaroteneတို့ပေါင်းစပ်ထားတဲ့သဘာဝမျက်စိအားဆေးမျက်စိညောင်းညာခြင်း၊ မျက်ရိုးကိုက်ခြင်း၊ မျက်ရည်ပူကျခြင်း စတာတွေလည်း သက်သာစေနိုင်ပါသည်။</p><p><strong>Country of Origin</strong></p><p>&nbsp;</p><p><strong>Usage Instruction</strong></p><p>One capsule once or twice daily or as directed by physician.</p><p><strong>Warning / Storage Instruction</strong></p><p>Store below 30’C</p>', '2025-01-11 14:06:51', '2025-01-14 03:54:15', 1, 0, 0, 0, '[\"product_images\\/67827afb9ca11_images (7).jpg\",\"product_images\\/67827afb9cbdb_1712839568975-II-CARE-1.webp\",\"product_images\\/67827afb9cda4_images (6).jpg\"]'),
(2, 'Ferrovit', 5.0, 100, NULL, 'product_images/67827b3fd97bf_189979.jpg', 9, NULL, 1, 1, '<h2>Ferrovit</h2>', '<h2>Ferrovit</h2>', '2025-01-11 14:07:59', '2025-01-11 14:07:59', 1, 0, 0, 0, '[\"product_images\\/67827b3fd9a41_189979.jpg\"]'),
(3, 'DECOLGEN FORTE 10`S', 1.0, 999, NULL, 'product_images/67827c901b95b_189887 (1).jpg', 10, NULL, 5, 1, '<p>Product Benefit</p><p>DECOLGEN FORTE က နှာချေခြင်း၊ နှာရည်ယိုနှာပိတ်ခြင်း၊ ခေါင်းကိုက်ခြင်း၊ ဖျားနာခြင်း ၊ကိုယ်လက်နာကျင်ကိုက်ခဲခြင်းစတဲ့ အအေးမိဖျားနာလက္ခဏာများကို သက်သာ ပျောက်ကင်းစေပါသည်။</p>', '<p>Product Benefit</p><p>DECOLGEN FORTE က နှာချေခြင်း၊ နှာရည်ယိုနှာပိတ်ခြင်း၊ ခေါင်းကိုက်ခြင်း၊ ဖျားနာခြင်း ၊ကိုယ်လက်နာကျင်ကိုက်ခဲခြင်းစတဲ့ အအေးမိဖျားနာလက္ခဏာများကို သက်သာ ပျောက်ကင်းစေပါသည်။</p><p>Country Of Origin</p><p>Usage instructions</p><p>လူကြီး- တစ်နေ့လျှင် ဆေးပြား တစ်ပြား ကို တစ်နေ့လျှင် ၃ ကြိမ် မှ ၄ ကြိမ် အထိ သောက်သုံးနိုင်သည်။</p><p>Warning/ Storage Instructions</p><p>ထားသိုရန်အညွှန်း ။ အခန်းအပူချိန် ၃၀ ဒီဂရီစင်တီဂရိတ်အောက်ခြောက်သွေ့ သောနေရာ၊ နေရောင်ခြည်နှင့် တိုက်ရိုက်မထိတွေ့သောနေရာတွင်သိမ်းဆည်းပါ။ ကလေးများလက်လှမ်းမမှိနိုင်သောနေရာတွင်ထားပါ။</p>', '2025-01-11 14:13:36', '2025-01-14 03:54:15', 1, 0, 0, 0, '[]'),
(4, '21st Century Mega Vision Cap 60’s', 20.0, 100, NULL, 'product_images/67827d94344f7_images (11).jpg', 8, NULL, 3, 1, '<ul><li>Mega Vision တွင် Lutein(3mg) , Zeaxanthin(600mcg) &amp; Ginkgo BiLoba(20mg) တို့ ပါဝင်‌သောကြောင့်&nbsp; ပုံမှန်သောက်သုံးခြင်းဖြင့် မျက်စိတစ်ရှူးများကို ပြန်လည်အားဖြည့်ပေးပြီး အမြင်အာရုံကို ကြည်လင်စေပါသည်။</li><li>အသက်အရွယ်ကြီးရင့်လာလျှင်ဖြစ်လေ့ ရှိသော အမြင်အာရုံချို့ယွင်းမှုကိုလည်း ကာကွယ်ပေးပါသည်။</li><li>မျက်စိအတွင်းတိမ် (Cataract) ရောဂါနှင့် မျက်စိတွင်း Pressureများ၍ ဖြစ်တတ်သည့် (Glaucoma) ရောဂါအား ကာကွယ်ပေးနိုင်ပါသည်။</li></ul><p>မျက်လုံးကြွက်သားများ ညောင်းညာပင်ပန်းခြင်းမှလည်း ကာကွယ်ပေးပြီး Mobile Phone ၊ Computer&nbsp; နှင့် Tablet များအား အချိန်ကြာကြာကြည့်ခြင်းတို့ကြောင့် ဖြစ်တတ်သော</p><p>Digital Eye Strain နှင့် Computer Vision Syndrome ဖြစ်သည် မျက်လုံးကြွက်သားများ ညောင်းညာပင်ပန်းခြင်း၊ အမြင်ဝေဝါးခြင်း၊ မျက်လုံးခြောက်ခြင်း၊ မျက်လုံးယားယံခြင်း၊ ခေါင်းကိုက်ခြင်း၊ ပုခုံးကြောနှင့် ဇက်ကြောတတ်ခြင်းတို့ကို လျော့ချပေးနိုင်ပါသည်။<br>အမြင်အာရုံကြည်လင်၍ မျက်စိအားကောင်းမွန်ချင်သူများ သောက်သုံးနိုင်ပြီး နေ့စဉ် (၁)လုံး (သို့) ဆရာဝန်၏ ညွှန်ကြားချက်အတိုင်း သောက်သုံးနိုင်ပါသည်။</p><p>&nbsp;</p>', '<ul><li>Mega Vision တွင် Lutein(3mg) , Zeaxanthin(600mcg) &amp; Ginkgo BiLoba(20mg) တို့ ပါဝင်‌သောကြောင့်&nbsp; ပုံမှန်သောက်သုံးခြင်းဖြင့် မျက်စိတစ်ရှူးများကို ပြန်လည်အားဖြည့်ပေးပြီး အမြင်အာရုံကို ကြည်လင်စေပါသည်။</li><li>အသက်အရွယ်ကြီးရင့်လာလျှင်ဖြစ်လေ့ ရှိသော အမြင်အာရုံချို့ယွင်းမှုကိုလည်း ကာကွယ်ပေးပါသည်။</li><li>မျက်စိအတွင်းတိမ် (Cataract) ရောဂါနှင့် မျက်စိတွင်း Pressureများ၍ ဖြစ်တတ်သည့် (Glaucoma) ရောဂါအား ကာကွယ်ပေးနိုင်ပါသည်။</li></ul><p>မျက်လုံးကြွက်သားများ ညောင်းညာပင်ပန်းခြင်းမှလည်း ကာကွယ်ပေးပြီး Mobile Phone ၊ Computer&nbsp; နှင့် Tablet များအား အချိန်ကြာကြာကြည့်ခြင်းတို့ကြောင့် ဖြစ်တတ်သော</p><p>Digital Eye Strain နှင့် Computer Vision Syndrome ဖြစ်သည် မျက်လုံးကြွက်သားများ ညောင်းညာပင်ပန်းခြင်း၊ အမြင်ဝေဝါးခြင်း၊ မျက်လုံးခြောက်ခြင်း၊ မျက်လုံးယားယံခြင်း၊ ခေါင်းကိုက်ခြင်း၊ ပုခုံးကြောနှင့် ဇက်ကြောတတ်ခြင်းတို့ကို လျော့ချပေးနိုင်ပါသည်။<br>အမြင်အာရုံကြည်လင်၍ မျက်စိအားကောင်းမွန်ချင်သူများ သောက်သုံးနိုင်ပြီး နေ့စဉ် (၁)လုံး (သို့) ဆရာဝန်၏ ညွှန်ကြားချက်အတိုင်း သောက်သုံးနိုင်ပါသည်။</p><p>&nbsp;</p>', '2025-01-11 14:17:56', '2025-01-11 14:17:56', 1, 0, 0, 0, '[]'),
(5, 'FAME Phototec Natural Antioxidant for eyes (60`s)', 25.0, 100, NULL, 'product_images/67827e2b40daf_172608-1.jpg', 10, NULL, 2, 1, '<h2>FAME Phototec Natural Antioxidant for eyes (60`s)</h2>', '<h2>FAME Phototec Natural Antioxidant for eyes (60`s)</h2>', '2025-01-11 14:20:27', '2025-01-11 14:20:27', 1, 0, 1, 5, '[\"product_images\\/67827e2b410a3_172608-1.jpg\"]'),
(6, 'FAME Herbicough Herbal Cough Relief Syrup (120ml)', 5.0, 100, NULL, 'product_images/67827e61744bb_172584-1.jpg', 10, NULL, 2, 1, '<h2>FAME Herbicough Herbal Cough Relief Syrup (120ml)</h2><p>&nbsp;</p>', '<h2>FAME Herbicough Herbal Cough Relief Syrup (120ml)</h2>', '2025-01-11 14:21:21', '2025-01-11 14:21:21', 1, 0, 0, 0, '[]'),
(7, 'FAME – Green Tea EGCG 150mg (60`s)', 10.0, 198, NULL, 'product_images/67827e8f19e77_176096-1.jpg', 10, NULL, 2, 1, '<h2>FAME – Green Tea EGCG 150mg (60`s)</h2>', '<p>FAME – Green Tea EGCG 150mg (60`s)</p>', '2025-01-11 14:22:07', '2025-01-24 19:32:51', 1, 0, 2, 2, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `icon`, `description`, `created_at`, `updated_at`) VALUES
(2, 'Body Care', NULL, NULL, '2025-01-11 14:03:45', '2025-01-11 14:03:45'),
(3, 'Accessories', NULL, NULL, '2025-01-11 14:03:57', '2025-01-11 14:03:57'),
(4, 'Facial Powder', NULL, NULL, '2025-01-11 14:04:14', '2025-01-11 14:04:14'),
(5, 'Lip', NULL, NULL, '2025-01-11 14:04:21', '2025-01-11 14:04:21'),
(6, 'Nail', NULL, NULL, '2025-01-11 14:04:24', '2025-01-11 14:04:24'),
(7, 'Adult Diaper', NULL, NULL, '2025-01-11 14:04:37', '2025-01-11 14:04:37'),
(8, 'Eye Supplements', NULL, NULL, '2025-01-11 14:05:42', '2025-01-11 14:05:42'),
(9, 'Vitamins & Minerals', NULL, NULL, '2025-01-11 14:07:12', '2025-01-11 14:07:12'),
(10, 'Nervous System & Mental Wellness', NULL, NULL, '2025-01-11 14:10:38', '2025-01-11 14:10:38');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  `price` decimal(8,1) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_type` int(11) DEFAULT 0,
  `discount_amount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `attribute_name`, `attribute_value`, `price`, `stock`, `image`, `status`, `created_at`, `updated_at`, `discount_type`, `discount_amount`) VALUES
(1, 1, NULL, NULL, 10.0, 999, 'product_images/67827afb9c79b_images (6).jpg', 1, '2025-01-11 14:06:51', '2025-01-14 03:54:15', 0, 0),
(2, 2, NULL, NULL, 5.0, 100, 'product_images/67827b3fd97bf_189979.jpg', 1, '2025-01-11 14:07:59', '2025-01-11 14:07:59', 0, 0),
(3, 3, NULL, NULL, 1.0, 999, 'product_images/67827c901b95b_189887 (1).jpg', 1, '2025-01-11 14:13:36', '2025-01-14 03:54:15', 0, 0),
(4, 4, NULL, NULL, 20.0, 100, 'product_images/67827d94344f7_images (11).jpg', 1, '2025-01-11 14:17:56', '2025-01-11 14:17:56', 0, 0),
(5, 5, NULL, NULL, 25.0, 100, 'product_images/67827e2b40daf_172608-1.jpg', 1, '2025-01-11 14:20:27', '2025-01-11 14:20:27', 1, 5),
(6, 6, NULL, NULL, 5.0, 100, 'product_images/67827e61744bb_172584-1.jpg', 1, '2025-01-11 14:21:21', '2025-01-11 14:21:21', 0, 0),
(7, 7, NULL, NULL, 10.0, 198, 'product_images/67827e8f19e77_176096-1.jpg', 1, '2025-01-11 14:22:07', '2025-01-24 19:32:51', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2024-08-19 07:15:19', '2024-08-19 07:15:19'),
(2, 'Customer', 'web', '2024-08-19 07:15:19', '2024-08-19 07:15:19'),
(3, 'Manager', 'web', '2024-08-19 07:15:19', '2024-08-19 07:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('00cfvnloWuiDTBh42P6TVb7RPENIc2emCIFe2Zln', NULL, '47.128.45.4', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienlkZ0phZzQ4dHVCdXloQ05OYVdUdWpZUnFzQmdjcE5zNnJXZ1BERSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9icmFuZHMvMDk0MDMwNzc3MzkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738553783),
('0t7nxELxXRjHucMyNU4xcV7bAQByZ57aKV6s4zJ9', NULL, '103.215.192.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjZjd1J2OEFNMmpOejVERkNIRHNIbUl0bWc5TFNxRGRyR3VXeTBsVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738554839),
('1lhCdIM6uLvCWrCLIxoJKUELjYBp4rV7flrwACLL', NULL, '115.60.164.90', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnJNU0JvMzRpS1ZDUjhKcVFOOHRJVU9CbVpWM1dQclJNTFB1TG5lUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738510901),
('5qocfHVFOKJNOxnuTINfxez1j9fl0xpEW1PLjXZC', NULL, '2a02:4780:3:8::7', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWm1HWWxLcFhDMU1HYjBBa21BcTEwY1d3eElJdnZ0QUlXOFkzQzFwRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738557904),
('9QQJosfO2aDuIbwJX6R504YiMX6sNsjcDhCEinMD', NULL, '47.128.63.74', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTNyRzhobVpEOXZzREZFRzQySDY1bWZRV1FjSHgyYldDcUpiclVxciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9wcm9kdWN0cy82L2RldGFpbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738506023),
('9XEyDWXGOIOuYLfRmVUpmANwAm7HmsaE98m6FHOE', NULL, '52.10.179.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3YxZ0QyT3JlRExSb2I1Y205aG4wQlM1c1F4UXg5UVRBcmszSGZ1bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738493079),
('C6hQWYzbhntoKaUPkZjqInhzIZvWprzcY6MXSNvh', NULL, '2a02:4780:3:8::7', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWhoV0tUZW5QaDJKUERId1h2b3F2V1pqbEJwZlNWaTFBeXlNN2VzWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738460850),
('E5xVj0csucKzaDxc4prX6f0Ld46D5FpJMwzlclYh', NULL, '47.128.55.246', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXNCRWp6YjlJcmhLcHp5c25COVVQb0Ixb1R1bExzeGVvbmcwYjkxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9wcm9kdWN0cy9jYXRlZ29yeS80Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738482223),
('EbK9YdhA4BDTZsYZEJxI8ZGV22GgP2IklRoUIRTH', NULL, '125.120.63.192', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODRaYzZIckRkWDkxSXNlbTd1ZWpUcU5SRjdZOWN6eTBLc2tFM3NMaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738535271),
('ELsGIgaJwG4Lty9q0oaq3iK1VUoqhnKK2kzq7xcY', NULL, '116.16.216.103', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjdRWWRjWENJMzltMXRFSFFtbE1PeEx2bDBCMEVicU5ZSEFQMEx1bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738514467),
('F4qiugOdDrnJK9vyyoztF289822GKNwCufr0KvLL', NULL, '47.128.40.233', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUFZbFhYQU1GbXYyYlhXc1FOc1ExenpKRU5oYnRGSTJiaHNRU2tPNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9wcm9kdWN0cy9jYXRlZ29yeS83Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738481984),
('FifIs1gnfGdEmtsOj4mmnsPRWcNfQFiwqfITtw4t', NULL, '58.44.237.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVB1UlYxN2ZwSDNLVFRsSUoxbmNiRlk3QWs4WmI1V2w1Qk53T0lDbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738510876),
('G7tpnlBt11D13K2Uo5AQzylTYIG9QxYX5McuFkEr', NULL, '42.229.129.18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmJiWmhIa2RMR2dIRkZ1ZTRWdE9pRlJ4UjhDT1NDdEhKdUhBZ0kzVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738510829),
('gc8aTLE8kFYqpvZqcROUfvyvbenQBxGe2LGpMust', NULL, '47.128.120.186', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWVDRTBLb002UFA1akNZN29WVnF5YmdCWTVoZWlRNlBnVDdaWXNPTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9jaGVja291dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738462313),
('hLicsqMvK3yS2g1Ta4b4MVqE0BfigopLo2i7ECbW', NULL, '47.128.45.236', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTVvZkFxcmg2UVFoUzdERUhWR0ptRlh3bmp3VDlFZVB2Um81Y1c4UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9wcm9kdWN0cy8yL2RldGFpbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738468897),
('hz1iGDsaV1hLw5eMKUoXtCuECwpcqtH8OIxhLHJg', NULL, '5.255.231.58', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUZwQ3hyQjBqb3IxNEg1UWF6aEZoSEtkVkRicGdVZE1lcE92VkFTRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738523944),
('i2kT2uWh40LPBRQ5zkii6alpIneSlvczLpNitNVo', NULL, '2001:bc8:1201:2b:ba2a:72ff:fed9:efeb', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkRpU1ljekpFWG5sb0N6UHRkT3RDMndDbmU5WmVveFZFRXcxaUZ1ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738518568),
('j9BGxyiKdHWRuxfQfZ7e6EQsgtLkKvFgO46JBbYA', NULL, '116.28.176.76', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUtLQUxRbHQ0b0NaZjRuUzl3SjBCTmtWMFNjckpsdkN4SUFwbWltYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738510835),
('Jxd7ELJuatSFNIYYpYDW5PEUYNg1wBCJ8HPGdtVs', NULL, '52.10.179.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUlZNDBkR2VaRk1xQ1p0eVdQdHg5dU8weXVYQU5jbEpqVXM4QWNTdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738493081),
('KliIgVlxUFBHqj2khrLfgJqnwJq7pKalhd3sNm4m', NULL, '47.128.28.151', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEVOOEJpTko4aTNUM3NTZHV5NU9kU3hRemF4OGhab3VaeUlvelRsVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9wcm9kdWN0cy83L2RldGFpbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738473626),
('MBAD2i6qU5AIRiwZfeM0FRmMJBHDk3jD6ADTJyn5', NULL, '47.128.40.218', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFNrMmtMSUV6ZW1GVEozbW5lRFk0cDR1T24zMm4zUUlvV09WYjQ5byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9jYXJ0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738478053),
('MLC2egblorNNSTgSOhVtpTeT9SFpQIXosmSK82Bx', NULL, '103.215.192.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0ZpWGdSamJ2cWJzczQ2eEVYZGRpNE9qYWJ3Q1Z2ajdiZGRNT1d5biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9jaGVja291dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738559252),
('mLlaGaWH6kaIsDPqiCrgU8ehySlPepwOWJtNOK2Y', NULL, '46.17.174.172', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko/20100101 Firefox/98.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclVycFp5b3lOTml2VGhoN2tSM1h5SDFSWEdjSUNZbFBZaFVCNTZiMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738467647),
('mlRcO77PyoOwxef3UCMbiphC3GeLOvmRspt8BKXm', NULL, '47.128.21.115', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmdRU085ckptZWZKRTg2TDBUZk9XU1ZEdUNOV1NoNWk1QkZkVU90SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9icmFuZHMvMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738511199),
('MYdma1GX2AfW7Ko7LTtYcxskCojZVhNf7PR1rtMH', NULL, '2600:1900:0:4004::1600', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) EdgiOS/120.0.2210.150 Version/17.0 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGdScXFpZ09PQWdQelM1cU5vMkthVDk0VTN4WG9lVkxOeHg0RmFSOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738491685),
('OwOt8ycAQAGFbPn7NsIe4pzOpxDgFFpBpsLBc5lG', NULL, '47.128.33.31', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzVYaXdFZzhBUHdjdmF2S0JMb1VSdEtXSkcxQTgwYVB5RUZMckYzZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9wcm9kdWN0cy8xL2RldGFpbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738503872),
('Q5YNSSf5lKalW6E01r7nyuFyoEPCeNLwQrYBQHTc', NULL, '35.92.192.164', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXlZdFZDcFUwMjRDc0JiUG1adTVxUUdCOXFqSmM0OXhKN3VQY3hZRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738493083),
('sDLrPhoqCc6l9SReJEXWAUlM5uJmCbNap9a708IS', NULL, '2a0c:b641:3a1:1002::ea1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDVPbTNmc3B4NlcxRTEwVmpYR1JreWV5dTlBWnAzSmJZb3M3Wm1UaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738465203),
('siUyMeHPmZMkAQN7NA1lSgv9RLQiSPfTGEfSMrvw', NULL, '47.128.47.198', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHpvRmVWeTVLRWZHYnlLb01ON25RUmM1clVNR0M5aWdWNEhIMjRYdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738497550),
('TYRwuqEDClf67lSQAunfo4UNLIEq10gtyC6Qambc', NULL, '47.128.115.130', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEVvWmRGZ01nRGVTaGZDcTJnT0NQUHVySHlNOE9UYXFVY2lyT2NPNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9vcmRlcl90cmFjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738485749),
('U6sXNmHhri9oKmNXTS0uq476iNeiRHICQxmH7PoA', NULL, '39.184.35.205', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnc3cnczNUREeXlMN0Zqc2Z2Y1RzTnpRZjJod1lNZ0NJSGpENE1KRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738535269),
('UdXclL6cN6RNGs8xGebaFThfZQleNhAu70o4Ri07', NULL, '47.128.40.235', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2VDWnhGVmVsQjVtU3J0TE0zWjViMWIzdmx0blZ2bE1sVlZuc2tRaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9icmFuZHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738486673),
('WBvvnLNXlmwXJk5HPqpvmxL4IzD05ErdQC9GfIlf', NULL, '160.30.212.235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlQ5bVdMbndxdFVuYkUxSEFMZlROcXZTcWd3VkhYeWtrUTdrbG1kRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738554784),
('wJ6onIU4L5hd2FNmhdLBOTGOAKnKwU5zCEk26V1t', NULL, '112.22.208.136', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODdzYmpEeHd5ZzNXZFR1Q3BLRWVtTkVIamNsdERKeXV6WE1RN2dWbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738518278),
('y6WsTATlubuTcd9VgGIpp6n3C67aeJHXul41818r', NULL, '47.128.44.78', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREZCS29QdUhlTUpsWFlrSFp3N3FzV2s3Nm5FV2dROFJ1YnBQRmRDVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9wcm9kdWN0cy9jYXRlZ29yeS84Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738494863),
('zjqXZDkaTyoU0rH0efb3oTcyaRjmAyWgXak5nCYp', NULL, '47.128.34.105', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN256WVM2ZzRMcGRPVVVuZDN6NGFNdVBLb3ZQcms0WGVJVmltQ2I4QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vZWNvbS1oZWFsdGhjYXJlLmNvbS9icmFuZHMvNiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738510959);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `varaint_product_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplies`
--

INSERT INTO `supplies` (`id`, `product_id`, `varaint_product_id`, `type`, `qty`, `description`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1000, 'Product Create', '2025-01-11 00:00:00', '2025-01-11 14:06:51', '2025-01-11 14:06:51'),
(2, 2, 2, 1, 100, 'Product Create', '2025-01-11 00:00:00', '2025-01-11 14:07:59', '2025-01-11 14:07:59'),
(3, 3, 3, 1, 1000, 'Product Create', '2025-01-11 00:00:00', '2025-01-11 14:13:36', '2025-01-11 14:13:36'),
(4, 4, 4, 1, 100, 'Product Create', '2025-01-11 00:00:00', '2025-01-11 14:17:56', '2025-01-11 14:17:56'),
(5, 5, 5, 1, 100, 'Product Create', '2025-01-11 00:00:00', '2025-01-11 14:20:27', '2025-01-11 14:20:27'),
(6, 6, 6, 1, 100, 'Product Create', '2025-01-11 00:00:00', '2025-01-11 14:21:21', '2025-01-11 14:21:21'),
(7, 7, 7, 1, 200, 'Product Create', '2025-01-11 00:00:00', '2025-01-11 14:22:07', '2025-01-11 14:22:07');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(8,2) NOT NULL,
  `amount_limit` varchar(225) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `icon`, `discount_amount`, `amount_limit`, `created_at`, `updated_at`) VALUES
(1, 'Gold', 'icons/7Xr1E3TXDX.png', 5.00, '1000', '2024-08-19 07:15:19', '2024-10-01 07:29:44'),
(2, 'Silver', 'icons/HQ6lDyN8wh.png', 3.00, '500', '2024-08-19 07:15:19', '2024-10-01 07:29:14'),
(3, 'Diamonds', 'icons/NgCUTUgd0m.png', 10.00, '3000', '2024-08-19 09:14:08', '2024-10-01 07:30:04'),
(6, 'Super', 'icons/wUR29uz2hy.png', 20.00, '15000', '2024-09-24 07:19:25', '2024-09-24 07:23:58'),
(7, 'Normal', 'icons/MwWQRXkgcL.jfif', 0.00, '0', '2024-10-01 07:28:41', '2024-10-01 07:28:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(225) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 2,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider_name` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `role`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `provider_name`, `provider_id`) VALUES
(1, 'Admin User', 'admin@example.com', '', NULL, '$2y$12$mlM1loNcGVh6jJuQI4IzIeznF5QNHY1Ta1O910Qkqm/aFcbFw6IVi', NULL, NULL, NULL, 1, 'm3WWHTk8qwOCJX5VSDHSk77o6ltqKxVZSTvarYaGCtejLE3TnZzDIjlSmnuJ', NULL, NULL, '2024-08-19 07:15:20', '2024-08-19 07:15:20', NULL, NULL),
(2, 'Guest User For Admin Order', 'tzs1@gmail.com', '', NULL, '$2y$12$GUFjt1bKHSv31.vORcy5cOP/CFe0jV4wAyrNGAQ0xXTir8aQ2july', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-08-19 08:47:02', '2024-08-19 08:47:08', NULL, NULL),
(61, 'thawzinsoe', 'thawzinsoe.business.mm@gmail.com', '09403077739', NULL, '$2y$12$eAGkxKtw3G2ujF4GKOgGqOtO1ZaqVIQUujaKzwT5M9g.NpKRv/dMi', NULL, NULL, NULL, 2, 'vbWERziMGqesWYzEPum7tjq7df8lkFwJusSvP2Fd55HMcQZJuKatUYIx9she', NULL, NULL, '2025-01-11 08:49:26', '2025-01-11 09:14:34', NULL, NULL),
(62, 'MySpace Developers', 'developers.myspace@gmail.com', NULL, NULL, '$2y$12$FhGQlIOBEKkVrcysROYPqecRj9m84l/KkbYRb.51WMrHphRgoebly', NULL, NULL, NULL, 2, NULL, NULL, NULL, '2025-01-11 09:30:47', '2025-01-11 09:30:47', NULL, NULL),
(63, 'User Tester', 'usertester@gmail.com', '09251016449', NULL, '$2y$12$hM89fcmxdKE3rYafOW69jOsYssBAE8qMNBmaIu7GfiBPPZxXz8Du.', NULL, NULL, NULL, 2, NULL, NULL, NULL, '2025-01-13 02:10:42', '2025-01-13 02:10:42', NULL, NULL),
(64, 'MSCOUS Apex', 'mscousapex@gmail.com', '09403077739', NULL, '$2y$12$FCkfXA4DRDGrBBl3/uHC9eR8uK25K3pDMDvIEuu5a/Pg425aLAFoa', NULL, NULL, NULL, 2, 'zvis0wnpIsGLjYYMv1V93FjMjZMRhrZ8kVKhXfdviSyeWzYJgowbOhwrYdyt', NULL, NULL, '2025-01-14 03:25:26', '2025-01-14 03:31:40', NULL, NULL),
(65, 'YGL Technology', 'ygltechnology@gmail.com', NULL, NULL, '$2y$12$AoevLNbFZSyf4cCzx0LtvuMqZEkf9VxBAZdc2h7sVMTcoRtdl6Ag6', NULL, NULL, NULL, 2, NULL, NULL, NULL, '2025-01-25 04:14:56', '2025-01-25 04:14:56', NULL, NULL),
(66, 'Aung Myat Moe', 'aungmyatmoe834@gmail.com', NULL, NULL, '$2y$12$NmMg6BfSFmjFNY4LPlugk.NXR6w/38jkSgShw17ZafZUuMsQarw/u', NULL, NULL, NULL, 2, NULL, NULL, NULL, '2025-01-26 02:17:53', '2025-01-26 02:17:53', NULL, NULL),
(67, 'sWdCHlcNCv', 'kvaaeo6gql@yahoo.com', '7464157354', NULL, '$2y$12$nAxPdObzO7zipV3.V4w6PuKw0z5WITkP9Svc9knDAmEdmfTfuV6cW', NULL, NULL, NULL, 2, NULL, NULL, NULL, '2025-01-26 07:05:44', '2025-01-26 07:05:44', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `v_i_p_requests`
--

CREATE TABLE `v_i_p_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cards_user_id_foreign` (`user_id`),
  ADD KEY `cards_product_variant_id_foreign` (`product_variant_id`);

--
-- Indexes for table `cupon_codes`
--
ALTER TABLE `cupon_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cupon_codes_cupon_code_unique` (`cupon_code`);

--
-- Indexes for table `cupon_use_logs`
--
ALTER TABLE `cupon_use_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_types`
--
ALTER TABLE `customer_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_types_user_id_foreign` (`user_id`),
  ADD KEY `customer_types_type_id_foreign` (`type_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_variant_id_foreign` (`product_variant_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `v_i_p_requests`
--
ALTER TABLE `v_i_p_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cupon_codes`
--
ALTER TABLE `cupon_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cupon_use_logs`
--
ALTER TABLE `cupon_use_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_types`
--
ALTER TABLE `customer_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplies`
--
ALTER TABLE `supplies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `v_i_p_requests`
--
ALTER TABLE `v_i_p_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_types`
--
ALTER TABLE `customer_types`
  ADD CONSTRAINT `customer_types_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_types_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
