-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 23, 2021 at 08:59 PM
-- Server version: 5.7.34-cll-lve
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enmsunyg_bhatt_sound`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `redispatch_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `party_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `party_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('assigned','dispatch','deliver','return','reach','redispatch') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assigned',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_inventories`
--

CREATE TABLE `cart_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `inventory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_sub_inventories`
--

CREATE TABLE `cart_sub_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_inventory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_users`
--

CREATE TABLE `cart_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `qrcode` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive','deleted','repairing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `category_id`, `name`, `description`, `image`, `qrcode`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(261, 6, '1 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710008_VRX932LAP_vert_medium.jpg', 'qrcode_261.png', 'active', '2021-07-19 10:23:28', '2021-08-16 11:12:49', 1, 1),
(262, 6, '2 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710008_VRX932LAP_vert_medium.jpg', 'qrcode_262.png', 'active', '2021-07-19 10:23:28', '2021-08-13 09:57:52', 1, 1),
(263, 6, '3 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710008_VRX932LAP_vert_medium.jpg', 'qrcode_263.png', 'active', '2021-07-19 10:23:28', '2021-08-13 09:57:52', 1, 1),
(264, 6, '4 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710008_VRX932LAP_vert_medium.jpg', 'qrcode_264.png', 'active', '2021-07-19 10:23:28', '2021-08-13 09:57:52', 1, 1),
(265, 6, '5 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710008_VRX932LAP_vert_medium.jpg', 'qrcode_265.png', 'active', '2021-07-19 10:23:28', '2021-08-13 09:57:52', 1, 1),
(266, 6, '6 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710009_VRX932LAP_vert_medium.jpg', 'qrcode_266.png', 'active', '2021-07-19 10:23:29', '2021-08-13 09:57:52', 1, 1),
(267, 6, '7 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710009_VRX932LAP_vert_medium.jpg', 'qrcode_267.png', 'active', '2021-07-19 10:23:29', '2021-08-13 09:57:52', 1, 1),
(268, 6, '8 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710009_VRX932LAP_vert_medium.jpg', 'qrcode_268.png', 'active', '2021-07-19 10:23:29', '2021-08-13 09:57:53', 1, 1),
(269, 6, '9 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710009_VRX932LAP_vert_medium.jpg', 'qrcode_269.png', 'active', '2021-07-19 10:23:29', '2021-08-13 09:57:53', 1, 1),
(270, 6, '10 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710009_VRX932LAP_vert_medium.jpg', 'qrcode_270.png', 'active', '2021-07-19 10:23:29', '2021-08-13 09:57:53', 1, 1),
(271, 6, '11 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710009_VRX932LAP_vert_medium.jpg', 'qrcode_271.png', 'active', '2021-07-19 10:23:29', '2021-08-13 09:57:53', 1, 1),
(272, 6, '12 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710010_VRX932LAP_vert_medium.jpg', 'qrcode_272.png', 'active', '2021-07-19 10:23:30', '2021-08-13 09:57:53', 1, 1),
(273, 6, '13 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710010_VRX932LAP_vert_medium.jpg', 'qrcode_273.png', 'active', '2021-07-19 10:23:30', '2021-08-13 09:57:53', 1, 1),
(274, 6, '14 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710010_VRX932LAP_vert_medium.jpg', 'qrcode_274.png', 'active', '2021-07-19 10:23:30', '2021-08-13 09:57:54', 1, 1),
(275, 6, '15 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710011_VRX932LAP_vert_medium.jpg', 'qrcode_275.png', 'active', '2021-07-19 10:23:31', '2021-08-13 09:57:54', 1, 1),
(276, 6, '16 - VRX932LA-1', '12 in. Two-Way Line Array Loudspeaker System', '1626710011_VRX932LAP_vert_medium.jpg', 'qrcode_276.png', 'active', '2021-07-19 10:23:31', '2021-08-13 09:57:54', 1, 1),
(277, 6, '1 - SRX722', 'Dual 12\" High-Power Two-Way Loudspeaker', '1626710337_srx722_front_z_vert_medium.jpg', 'qrcode_277.png', 'active', '2021-07-19 10:28:57', '2021-08-13 09:57:54', 1, 1),
(278, 6, '2 - SRX722', 'Dual 12\" High-Power Two-Way Loudspeaker', '1626710337_srx722_front_z_vert_medium.jpg', 'qrcode_278.png', 'active', '2021-07-19 10:28:57', '2021-08-13 09:57:54', 1, 1),
(279, 6, '1 - SRX 728S', 'Dual 18 in. High-Power Subwoofer', '1626710494_srx728_front_z_vert_medium.jpg', 'qrcode_279.png', 'active', '2021-07-19 10:31:34', '2021-08-13 09:57:54', 1, 1),
(280, 6, '2 - SRX 728S', 'Dual 18 in. High-Power Subwoofer', '1626710495_srx728_front_z_vert_medium.jpg', 'qrcode_280.png', 'active', '2021-07-19 10:31:35', '2021-08-13 09:57:55', 1, 1),
(281, 6, '1 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711219_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_281.png', 'active', '2021-07-19 10:43:39', '2021-08-13 09:57:55', 1, 1),
(282, 6, '2 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711219_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_282.png', 'active', '2021-07-19 10:43:39', '2021-08-13 09:57:55', 1, 1),
(283, 6, '3 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711219_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_283.png', 'active', '2021-07-19 10:43:39', '2021-08-13 09:57:55', 1, 1),
(284, 6, '4 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711219_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_284.png', 'active', '2021-07-19 10:43:39', '2021-08-13 09:57:55', 1, 1),
(285, 6, '5 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711220_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_285.png', 'active', '2021-07-19 10:43:40', '2021-08-13 09:57:55', 1, 1),
(286, 6, '6 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711220_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_286.png', 'active', '2021-07-19 10:43:40', '2021-08-13 09:57:55', 1, 1),
(287, 6, '7 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711220_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_287.png', 'active', '2021-07-19 10:43:40', '2021-08-13 09:57:56', 1, 1),
(288, 6, '8 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711221_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_288.png', 'active', '2021-07-19 10:43:41', '2021-08-13 09:57:56', 1, 1),
(289, 6, '9 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711221_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_289.png', 'active', '2021-07-19 10:43:41', '2021-08-13 09:57:56', 1, 1),
(290, 6, '10 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711221_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_290.png', 'active', '2021-07-19 10:43:41', '2021-08-13 09:57:56', 1, 1),
(291, 6, '11 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711221_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_291.png', 'active', '2021-07-19 10:43:41', '2021-08-13 09:57:56', 1, 1),
(292, 6, '12 - 21\" Bass', 'Single 21 in. High-Power Subwoofer', '1626711222_single-18-inch-speaker-cabinet-500x500.jpg', 'qrcode_292.png', 'active', '2021-07-19 10:43:42', '2021-08-13 09:57:56', 1, 1),
(293, 6, '1 - SRX815P', '15\" Two-Way Bass Reflex Self-Powered System', '1626711591_srx815p_angle_z_vert_medium.jpg', 'qrcode_293.png', 'active', '2021-07-19 10:49:51', '2021-08-13 09:57:57', 1, 1),
(294, 6, '1 - SRX815P', '15\" Two-Way Bass Reflex Self-Powered System', '1626711591_srx815p_angle_z_vert_medium.jpg', 'qrcode_294.png', 'active', '2021-07-19 10:49:51', '2021-08-13 09:57:57', 1, 1),
(299, 6, '1 - Dynatech DEL 115', 'High Performance Full Range Passive Stage Monitoring Systems', '1626711834_del-115-5.jpg', 'qrcode_299.png', 'active', '2021-07-19 10:53:54', '2021-08-13 09:57:57', 1, 1),
(300, 6, '1 - Dynatech DEL 115', 'High Performance Full Range Passive Stage Monitoring Systems', '1626711834_del-115-5.jpg', 'qrcode_300.png', 'active', '2021-07-19 10:53:54', '2021-08-13 09:57:57', 1, 1),
(301, 6, '1 - Dynatech DEL 115', 'High Performance Full Range Passive Stage Monitoring Systems', '1626711834_del-115-5.jpg', 'qrcode_301.png', 'active', '2021-07-19 10:53:54', '2021-08-13 09:57:57', 1, 1),
(302, 6, '1 - Dynatech DEL 115', 'High Performance Full Range Passive Stage Monitoring Systems', '1626711834_del-115-5.jpg', 'qrcode_302.png', 'active', '2021-07-19 10:53:54', '2021-08-13 09:57:57', 1, 1),
(303, 6, '1 - 18+ SOUND CAPITEL', '15\" STAGE MONITORING SYSTEM M1000', '1626712878_20210616_173048 1111111111.jpg', 'qrcode_303.png', 'active', '2021-07-19 11:11:18', '2021-08-13 09:57:58', 1, 1),
(304, 6, '2 - 18+ SOUND CAPITEL', '15\" STAGE MONITORING SYSTEM M1000', '1626712879_20210616_173048 1111111111.jpg', 'qrcode_304.png', 'active', '2021-07-19 11:11:19', '2021-08-13 09:57:58', 1, 1),
(305, 6, '3 - 18+ SOUND CAPITEL', '15\" STAGE MONITORING SYSTEM M1000', '1626712880_20210616_173048 1111111111.jpg', 'qrcode_305.png', 'active', '2021-07-19 11:11:20', '2021-08-13 09:57:58', 1, 1),
(306, 6, '4 - 18+ SOUND CAPITEL', '15\" STAGE MONITORING SYSTEM M1000', '1626712881_20210616_173048 1111111111.jpg', 'qrcode_306.png', 'active', '2021-07-19 11:11:21', '2021-08-13 09:57:58', 1, 1),
(307, 6, '1 - STX 825', 'Dual 15\" Two-Way, Bass-Reflex', '1626713268_stx825_front_z_vert_medium 11111.jpg', 'qrcode_307.png', 'active', '2021-07-19 11:17:48', '2021-08-13 09:57:58', 1, 1),
(308, 6, '1 - STX 825', 'Dual 15\" Two-Way, Bass-Reflex', '1626713269_stx825_front_z_vert_medium 11111.jpg', 'qrcode_308.png', 'active', '2021-07-19 11:17:49', '2021-08-13 09:57:58', 1, 1),
(309, 6, '1 - STX 825', 'Dual 15\" Two-Way, Bass-Reflex', '1626713269_stx825_front_z_vert_medium 11111.jpg', 'qrcode_309.png', 'active', '2021-07-19 11:17:49', '2021-08-13 09:57:59', 1, 1),
(310, 6, '1 - STX 825', 'Dual 15\" Two-Way, Bass-Reflex', '1626713269_stx825_front_z_vert_medium 11111.jpg', 'qrcode_310.png', 'active', '2021-07-19 11:17:49', '2021-08-13 09:57:59', 1, 1),
(311, 6, '1 - AHUJA VIVA 10\"', 'Stage Monitor VIVA 10\"', '1626785414_31ACTsxFW6L.jpg', 'qrcode_311.png', 'active', '2021-07-20 07:20:14', '2021-08-13 09:57:59', 1, 1),
(312, 6, '2 - AHUJA VIVA 10\"', 'Stage Monitor VIVA 10\"', '1626785414_31ACTsxFW6L.jpg', 'qrcode_312.png', 'active', '2021-07-20 07:20:14', '2021-08-13 09:57:59', 1, 1),
(313, 6, '1 - AHUJA VIVA 15\"', 'VIVA 15\" Stage Monitoring', '1626785711_download.jpg', 'qrcode_313.png', 'active', '2021-07-20 07:25:11', '2021-08-13 09:57:59', 1, 1),
(314, 6, '2 - AHUJA VIVA 15\"', 'VIVA 15\" Stage Monitoring', '1626785712_download.jpg', 'qrcode_314.png', 'active', '2021-07-20 07:25:12', '2021-08-13 09:57:59', 1, 1),
(315, 6, '1 - W-BIN BASS', 'Single 18 in. High-Power Subwoofer', '1626786145_20210624_191931 11111.jpg', 'qrcode_315.png', 'active', '2021-07-20 07:32:25', '2021-08-13 09:58:00', 1, 1),
(316, 6, '2 - W-BIN BASS', 'Single 18 in. High-Power Subwoofer', '1626786145_20210624_191931 11111.jpg', 'qrcode_316.png', 'active', '2021-07-20 07:32:25', '2021-08-13 09:58:00', 1, 1),
(317, 6, '3 - W-BIN BASS', 'Single 18 in. High-Power Subwoofer', '1626786145_20210624_191931 11111.jpg', 'qrcode_317.png', 'active', '2021-07-20 07:32:25', '2021-08-13 09:58:00', 1, 1),
(318, 6, '4 - W-BIN BASS', 'Single 18 in. High-Power Subwoofer', '1626786146_20210624_191931 11111.jpg', 'qrcode_318.png', 'active', '2021-07-20 07:32:26', '2021-08-13 09:58:00', 1, 1),
(319, 6, '1 - RK MID', '15\" Three Way Mid 350w+350w', '1626795840_images.jpg', 'qrcode_319.png', 'active', '2021-07-20 10:14:00', '2021-08-13 09:58:00', 1, 1),
(320, 6, '2 - RK MID', '15\" Three Way Mid 350w+350w', '1626795841_images.jpg', 'qrcode_320.png', 'active', '2021-07-20 10:14:01', '2021-08-13 09:58:00', 1, 1),
(321, 6, '3 - RK MID', '15\" Three Way Mid 350w+350w', '1626795841_images.jpg', 'qrcode_321.png', 'active', '2021-07-20 10:14:01', '2021-08-13 09:58:01', 1, 1),
(322, 6, '4 - RK MID', '15\" Three Way Mid 350w+350w', '1626795842_images.jpg', 'qrcode_322.png', 'active', '2021-07-20 10:14:02', '2021-08-13 09:58:01', 1, 1),
(323, 6, '1 - Ahuja 150W', '15\" Ahuja 150w Speakers', '1626795994_download.jpg', 'qrcode_323.png', 'active', '2021-07-20 10:16:34', '2021-08-13 09:58:01', 1, 1),
(324, 6, '2 - Ahuja 150W', '15\" Ahuja 150w Speakers', '1626795994_download.jpg', 'qrcode_324.png', 'active', '2021-07-20 10:16:34', '2021-08-13 09:58:01', 1, 1),
(325, 6, '1 - EON 315 P', 'Portable Self-Powered15\", Two-Way,Bass-Reflex Design', '1626796137_eon315_front_z_large.jpg', 'qrcode_325.png', 'active', '2021-07-20 10:18:57', '2021-08-13 09:58:01', 1, 1),
(326, 6, '1 - EON 315 P', 'Portable Self-Powered15\", Two-Way,Bass-Reflex Design', '1626796137_eon315_front_z_large.jpg', 'qrcode_326.png', 'active', '2021-07-20 10:18:57', '2021-08-13 09:58:01', 1, 1),
(327, 6, '1 - AHUJA 200W', 'Single 15\" Full Range Stage Monitoring', 'default.png', 'qrcode_327.png', 'active', '2021-07-20 10:20:45', '2021-08-13 09:58:02', 1, 1),
(328, 6, '2 - AHUJA 200W', 'Single 15\" Full Range Stage Monitoring', 'default.png', 'qrcode_328.png', 'active', '2021-07-20 10:20:46', '2021-08-13 09:58:02', 1, 1),
(329, 6, '1 - Ahuja 90w', 'SMX-902/SMX-902T AHUJA Pa Wall Speaker, 90 Watts', '1626796441_images.jpg', 'qrcode_329.png', 'active', '2021-07-20 10:24:01', '2021-08-13 09:58:02', 1, 1),
(330, 6, '2 - Ahuja 90w', 'SMX-902/SMX-902T AHUJA Pa Wall Speaker, 90 Watts', '1626796442_images.jpg', 'qrcode_330.png', 'active', '2021-07-20 10:24:02', '2021-08-13 09:58:02', 1, 1),
(331, 6, '3 - Ahuja 90w', 'SMX-902/SMX-902T AHUJA Pa Wall Speaker, 90 Watts', '1626796442_images.jpg', 'qrcode_331.png', 'active', '2021-07-20 10:24:02', '2021-08-13 09:58:02', 1, 1),
(332, 6, '4 - Ahuja 90w', 'SMX-902/SMX-902T AHUJA Pa Wall Speaker, 90 Watts', '1626796442_images.jpg', 'qrcode_332.png', 'active', '2021-07-20 10:24:02', '2021-08-13 09:58:03', 1, 1),
(333, 6, '5 - Ahuja 90w', 'SMX-902/SMX-902T AHUJA Pa Wall Speaker, 90 Watts', '1626796443_images.jpg', 'qrcode_333.png', 'active', '2021-07-20 10:24:03', '2021-08-13 09:58:03', 1, 1),
(334, 6, '6 - Ahuja 90w', 'SMX-902/SMX-902T AHUJA Pa Wall Speaker, 90 Watts', '1626796443_images.jpg', 'qrcode_334.png', 'active', '2021-07-20 10:24:03', '2021-08-13 09:58:03', 1, 1),
(335, 6, '1 - B&8', 'Dual 12\'\' Stage Monitoring System', '1626796616_20210620_150249.jpg', 'qrcode_335.png', 'active', '2021-07-20 10:26:56', '2021-08-13 09:58:03', 1, 1),
(336, 6, '1 - B&8', 'Dual 12\'\' Stage Monitoring System', '1626796616_20210620_150249.jpg', 'qrcode_336.png', 'active', '2021-07-20 10:26:56', '2021-08-13 09:58:03', 1, 1),
(337, 6, '1 - B - 5&6', 'Dual 12\'\' Stage Monitoring System', '1626796766_20210620_150249.jpg', 'qrcode_337.png', 'active', '2021-07-20 10:29:26', '2021-08-13 09:58:03', 1, 1),
(338, 6, '2 - B - 5&6', 'Dual 12\'\' Stage Monitoring System', '1626796767_20210620_150249.jpg', 'qrcode_338.png', 'active', '2021-07-20 10:29:27', '2021-08-13 09:58:04', 1, 1),
(339, 6, '1 - B - 11&12', 'Dual 12\'\' Stage Monitoring System', '1626796826_20210620_150249.jpg', 'qrcode_339.png', 'active', '2021-07-20 10:30:26', '2021-08-13 09:58:04', 1, 1),
(340, 6, '2 - B - 11&12', 'Dual 12\'\' Stage Monitoring System', '1626796826_20210620_150249.jpg', 'qrcode_340.png', 'active', '2021-07-20 10:30:26', '2021-08-13 09:58:04', 1, 1),
(341, 6, '1 - Celestion Cross Monitor', 'Celestion Cross Monitor', '1626797083_20210620_153404.jpg', 'qrcode_341.png', 'active', '2021-07-20 10:34:43', '2021-08-13 09:58:04', 1, 1),
(342, 6, '2 - Celestion Cross Monitor', 'Celestion Cross Monitor', '1626797084_20210620_153404.jpg', 'qrcode_342.png', 'active', '2021-07-20 10:34:44', '2021-08-13 09:58:04', 1, 1),
(343, 6, '1 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797779_20210620_154111.jpg', 'qrcode_343.png', 'active', '2021-07-20 10:46:19', '2021-08-13 09:58:04', 1, 1),
(344, 6, '2 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797780_20210620_154111.jpg', 'qrcode_344.png', 'active', '2021-07-20 10:46:20', '2021-08-13 09:58:04', 1, 1),
(345, 6, '3 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797780_20210620_154111.jpg', 'qrcode_345.png', 'active', '2021-07-20 10:46:20', '2021-08-13 09:58:05', 1, 1),
(346, 6, '4 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797781_20210620_154111.jpg', 'qrcode_346.png', 'active', '2021-07-20 10:46:21', '2021-08-13 09:58:05', 1, 1),
(347, 6, '5 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797781_20210620_154111.jpg', 'qrcode_347.png', 'active', '2021-07-20 10:46:21', '2021-08-13 09:58:05', 1, 1),
(348, 6, '6 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797782_20210620_154111.jpg', 'qrcode_348.png', 'active', '2021-07-20 10:46:22', '2021-08-13 09:58:05', 1, 1),
(349, 6, '7 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797783_20210620_154111.jpg', 'qrcode_349.png', 'active', '2021-07-20 10:46:23', '2021-08-13 09:58:05', 1, 1),
(350, 6, '8 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797783_20210620_154111.jpg', 'qrcode_350.png', 'active', '2021-07-20 10:46:23', '2021-08-13 09:58:05', 1, 1),
(351, 6, '9 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797784_20210620_154111.jpg', 'qrcode_351.png', 'active', '2021-07-20 10:46:24', '2021-08-13 09:58:06', 1, 1),
(352, 6, '10 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797785_20210620_154111.jpg', 'qrcode_352.png', 'active', '2021-07-20 10:46:25', '2021-08-13 09:58:06', 1, 1),
(353, 6, '11 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797785_20210620_154111.jpg', 'qrcode_353.png', 'active', '2021-07-20 10:46:25', '2021-08-13 09:58:06', 1, 1),
(354, 6, '12 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797786_20210620_154111.jpg', 'qrcode_354.png', 'active', '2021-07-20 10:46:26', '2021-08-13 09:58:06', 1, 1),
(355, 6, '13 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797787_20210620_154111.jpg', 'qrcode_355.png', 'active', '2021-07-20 10:46:27', '2021-08-13 09:58:06', 1, 1),
(356, 6, '14 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797787_20210620_154111.jpg', 'qrcode_356.png', 'active', '2021-07-20 10:46:27', '2021-08-13 09:58:06', 1, 1),
(357, 6, '15 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797788_20210620_154111.jpg', 'qrcode_357.png', 'active', '2021-07-20 10:46:28', '2021-08-13 09:58:07', 1, 1),
(358, 6, '16 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797789_20210620_154111.jpg', 'qrcode_358.png', 'active', '2021-07-20 10:46:29', '2021-08-13 09:58:07', 1, 1),
(359, 6, '17 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797789_20210620_154111.jpg', 'qrcode_359.png', 'active', '2021-07-20 10:46:29', '2021-08-13 09:58:07', 1, 1),
(360, 6, '18 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797790_20210620_154111.jpg', 'qrcode_360.png', 'active', '2021-07-20 10:46:30', '2021-08-13 09:58:07', 1, 1),
(361, 6, '19 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797791_20210620_154111.jpg', 'qrcode_361.png', 'active', '2021-07-20 10:46:31', '2021-08-13 09:58:07', 1, 1),
(362, 6, '20 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797791_20210620_154111.jpg', 'qrcode_362.png', 'active', '2021-07-20 10:46:31', '2021-08-13 09:58:07', 1, 1),
(363, 6, '21 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797792_20210620_154111.jpg', 'qrcode_363.png', 'active', '2021-07-20 10:46:32', '2021-08-13 09:58:08', 1, 1),
(364, 6, '22 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797793_20210620_154111.jpg', 'qrcode_364.png', 'active', '2021-07-20 10:46:33', '2021-08-13 09:58:08', 1, 1),
(365, 6, '23 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797793_20210620_154111.jpg', 'qrcode_365.png', 'active', '2021-07-20 10:46:33', '2021-08-13 09:58:08', 1, 1),
(366, 6, '24 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797794_20210620_154111.jpg', 'qrcode_366.png', 'active', '2021-07-20 10:46:34', '2021-08-13 09:58:08', 1, 1),
(367, 6, '25 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797795_20210620_154111.jpg', 'qrcode_367.png', 'active', '2021-07-20 10:46:35', '2021-08-13 09:58:08', 1, 1),
(368, 6, '26 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797795_20210620_154111.jpg', 'qrcode_368.png', 'active', '2021-07-20 10:46:35', '2021-08-13 09:58:08', 1, 1),
(369, 6, '27 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797796_20210620_154111.jpg', 'qrcode_369.png', 'active', '2021-07-20 10:46:36', '2021-08-13 09:58:09', 1, 1),
(370, 6, '28 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797796_20210620_154111.jpg', 'qrcode_370.png', 'active', '2021-07-20 10:46:36', '2021-08-13 09:58:09', 1, 1),
(371, 6, '29 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797797_20210620_154111.jpg', 'qrcode_371.png', 'active', '2021-07-20 10:46:37', '2021-08-13 09:58:09', 1, 1),
(372, 6, '30 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797798_20210620_154111.jpg', 'qrcode_372.png', 'active', '2021-07-20 10:46:38', '2021-08-13 09:58:09', 1, 1),
(373, 6, '31 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797798_20210620_154111.jpg', 'qrcode_373.png', 'active', '2021-07-20 10:46:38', '2021-08-13 09:58:09', 1, 1),
(374, 6, '32 - Dubble Speaakers', 'Dual 12\" Ground Surrounding Speaker System', '1626797799_20210620_154111.jpg', 'qrcode_374.png', 'active', '2021-07-20 10:46:39', '2021-08-14 11:01:29', 1, 1),
(375, 7, '1 - Crown Xti 6002', 'Two-channel, 2100W @ 4Ω Power Amplifier', '1626798281_XTi2_6002_front_no_top_shadow_full_width.png', 'qrcode_375.png', 'active', '2021-07-20 10:54:41', '2021-08-13 09:58:10', 1, 1),
(376, 7, '1 - Crown Xti 6002', 'Two-channel, 2100W @ 4Ω Power Amplifier', '1626798281_XTi2_6002_front_no_top_shadow_full_width.png', 'qrcode_376.png', 'active', '2021-07-20 10:54:41', '2021-08-13 09:58:10', 1, 1),
(377, 7, '1 - Crown Xti 6002', 'Two-channel, 2100W @ 4Ω Power Amplifier', '1626798281_XTi2_6002_front_no_top_shadow_full_width.png', 'qrcode_377.png', 'active', '2021-07-20 10:54:41', '2021-08-13 09:58:10', 1, 1),
(378, 7, '1 - Crown Xti 6002', 'Two-channel, 2100W @ 4Ω Power Amplifier', '1626798282_XTi2_6002_front_no_top_shadow_full_width.png', 'qrcode_378.png', 'active', '2021-07-20 10:54:42', '2021-08-13 09:58:10', 1, 1),
(379, 7, '1 - Crown Xti 6002', 'Two-channel, 2100W @ 4Ω Power Amplifier', '1626798282_XTi2_6002_front_no_top_shadow_full_width.png', 'qrcode_379.png', 'active', '2021-07-20 10:54:42', '2021-08-13 09:58:10', 1, 1),
(380, 7, '1 - Crown Xti 6000', 'Crown Audio XTi 6000 Stereo Power Amplifier with DSP (1200W/Channel @ 8 Ohms)', '1626798410_1245256610_IMG_100281.jpg', 'qrcode_380.png', 'active', '2021-07-20 10:56:50', '2021-08-13 09:58:10', 1, 1),
(381, 7, '1 - QSC RMX 5050', 'Power Amplifier 5000w', '1626798568_51T9Ia+f+7L._AC_SL1000_.jpg', 'qrcode_381.png', 'active', '2021-07-20 10:59:28', '2021-08-13 09:58:11', 1, 1),
(382, 7, '1 - QSC MX 2020', 'Power Amplifier 2000w', '1626798658_download.jpg', 'qrcode_382.png', 'active', '2021-07-20 11:00:58', '2021-08-13 09:58:11', 1, 1),
(383, 7, '1 - DYNATECH V7000', 'Dynatech Power Amplifier - V-7000', '1626798857_download.jpg', 'qrcode_383.png', 'active', '2021-07-20 11:04:17', '2021-08-13 09:58:11', 1, 1),
(384, 7, '1 - DYNATECH PD 2500', 'Power Amplifier 2500w', '1626799034_Dynatech-PD-2500-001.jpg', 'qrcode_384.png', 'active', '2021-07-20 11:07:14', '2021-08-13 09:58:11', 1, 1),
(385, 7, '1 - DYNATECH PD 2500', 'Power Amplifier 2500w', '1626799035_Dynatech-PD-2500-001.jpg', 'qrcode_385.png', 'active', '2021-07-20 11:07:15', '2021-08-13 09:58:11', 1, 1),
(386, 7, '1 - DYNATECH PD 2500', 'Power Amplifier 2500w', '1626799035_Dynatech-PD-2500-001.jpg', 'qrcode_386.png', 'active', '2021-07-20 11:07:15', '2021-08-13 09:58:11', 1, 1),
(387, 7, '1 - Zypher Z 7', 'Zypher DS-Z7 Amplifier', '1626799202_81X5hMBwBwL._SL1500_.jpg', 'qrcode_387.png', 'active', '2021-07-20 11:10:02', '2021-08-13 09:58:12', 1, 1),
(388, 7, '1 - Zypher Z 7', 'Zypher DS-Z7 Amplifier', '1626799203_81X5hMBwBwL._SL1500_.jpg', 'qrcode_388.png', 'active', '2021-07-20 11:10:03', '2021-08-13 09:58:12', 1, 1),
(389, 7, '1 - P-Audio HD 80', 'HD 80 Power Amplifier 8000w', '1626799619_b1.jpg', 'qrcode_389.png', 'active', '2021-07-20 11:16:59', '2021-08-13 09:58:12', 1, 1),
(390, 7, '1 - Techno 5', 'Power Amplifier 5000w', '1626799800_images.jpg', 'qrcode_390.png', 'active', '2021-07-20 11:20:00', '2021-08-13 09:58:12', 1, 1),
(392, 8, '1 - BTZ 7000', 'Ahuja BTZ 350w+350w', '1626800061_download.jpg', 'qrcode_392.png', 'active', '2021-07-20 11:24:21', '2021-08-13 09:58:12', 1, 1),
(393, 8, '1 - BTZ 7000', 'Ahuja BTZ 350w+350w', '1626800061_download.jpg', 'qrcode_393.png', 'active', '2021-07-20 11:24:21', '2021-08-13 09:58:12', 1, 1),
(394, 8, '1 - BTZ 7000', 'Ahuja BTZ 350w+350w', '1626800061_download.jpg', 'qrcode_394.png', 'active', '2021-07-20 11:24:21', '2021-08-13 09:58:13', 1, 1),
(395, 8, '1 - Ahuja 250w8', '250w Amplifier', '1626800810_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_395.png', 'active', '2021-07-20 11:36:50', '2021-08-13 09:58:13', 1, 1),
(396, 8, '1 - Ahuja 250w7', '250w Amplifier', '1626800811_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_396.png', 'active', '2021-07-20 11:36:51', '2021-08-13 09:58:13', 1, 1),
(397, 8, '1 - Ahuja 250w6', '250w Amplifier', '1626800811_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_397.png', 'active', '2021-07-20 11:36:51', '2021-08-13 09:58:13', 1, 1),
(398, 8, '1 - Ahuja 250w5', '250w Amplifier', '1626800811_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_398.png', 'active', '2021-07-20 11:36:51', '2021-08-13 09:58:13', 1, 1),
(399, 8, '1 - Ahuja 250w4', '250w Amplifier', '1626800811_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_399.png', 'active', '2021-07-20 11:36:51', '2021-08-13 09:58:13', 1, 1),
(400, 8, '1 - Ahuja 250w3', '250w Amplifier', '1626800811_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_400.png', 'active', '2021-07-20 11:36:51', '2021-08-13 09:58:14', 1, 1),
(401, 8, '1 - Ahuja 250w2', '250w Amplifier', '1626800812_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_401.png', 'active', '2021-07-20 11:36:52', '2021-08-13 09:58:14', 1, 1),
(402, 8, '1 - Ahuja 250w1', '250w Amplifier', '1626800812_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_402.png', 'active', '2021-07-20 11:36:52', '2021-08-13 09:58:14', 1, 1),
(403, 8, '1 - Ahuja 250w0', '250w Amplifier', '1626800812_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_403.png', 'active', '2021-07-20 11:36:52', '2021-08-13 09:58:14', 1, 1),
(404, 8, '1 - Ahuja 250w', '250w Amplifier', '1626800812_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_404.png', 'active', '2021-07-20 11:36:52', '2021-08-13 09:58:14', 1, 1),
(405, 8, '1 - Ahuja 250w', '250w Amplifier', '1626800813_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_405.png', 'active', '2021-07-20 11:36:53', '2021-08-13 09:58:14', 1, 1),
(406, 8, '1 - Ahuja 250w', '250w Amplifier', '1626800813_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_406.png', 'active', '2021-07-20 11:36:53', '2021-08-13 09:58:15', 1, 1),
(407, 8, '1 - Ahuja 250w', '250w Amplifier', '1626800813_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_407.png', 'active', '2021-07-20 11:36:53', '2021-08-13 09:58:15', 1, 1),
(408, 8, '1 - Ahuja 250w', '250w Amplifier', '1626800813_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_408.png', 'active', '2021-07-20 11:36:53', '2021-08-13 09:58:15', 1, 1),
(409, 8, '1 - Ahuja 250w', '250w Amplifier', '1626800813_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_409.png', 'active', '2021-07-20 11:36:53', '2021-08-13 09:58:15', 1, 1),
(410, 8, '1 - Ahuja 250w', '250w Amplifier', '1626800814_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_410.png', 'active', '2021-07-20 11:36:54', '2021-08-13 09:58:15', 1, 1),
(411, 8, '1 - Ahuja 250w', '250w Amplifier', '1626800814_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_411.png', 'active', '2021-07-20 11:36:54', '2021-08-13 09:58:15', 1, 1),
(412, 8, '1 - Ahuja 250w', '250w Amplifier', '1626800814_0040966_ahuja-high-power-pa-amplfiers-br-250m.jpg', 'qrcode_412.png', 'active', '2021-07-20 11:36:54', '2021-08-13 09:58:16', 1, 1),
(413, 9, '1 - SOUNDCRAFT VI1', 'A complete standalone console package with 48 channels of analogue inputs', '1626859545_angle_white_background_vert_medium.png', 'qrcode_413.png', 'active', '2021-07-21 03:55:45', '2021-08-13 09:58:16', 1, 1),
(414, 9, '1 - SOUND CRAFT SI IMPACT', '40-input Digital Mixing Console and 32-in/32-out USB Interface and iPad Control', '1626859692_71p1T9m7emL._SL1500_.jpg', 'qrcode_414.png', 'active', '2021-07-21 03:58:12', '2021-08-13 09:58:16', 1, 1),
(415, 9, '1 - LX7ii SOUND CRAFT', '32 channel audio mixing console', '1626859916_download.jpg', 'qrcode_415.png', 'active', '2021-07-21 04:01:56', '2021-08-13 09:58:16', 1, 1),
(416, 9, '1 - Notepad-8FX Sound craft', 'Small-format Analog Mixing Console with USB I/O and Lexicon Effects', '1626860107_Soundcraft-NP-8FX-01_vert_medium.jpg', 'qrcode_416.png', 'active', '2021-07-21 04:05:07', '2021-08-13 09:58:16', 1, 1),
(418, 10, '1 - DriveRack 260', 'Loudspeaker Management System', '1626860529_260Front_lg_full_width.jpg', 'qrcode_418.png', 'active', '2021-07-21 04:12:09', '2021-08-13 09:58:16', 1, 1),
(419, 10, '1 - DriveRack 260', 'Loudspeaker Management System', '1626860529_260Front_lg_full_width.jpg', 'qrcode_419.png', 'active', '2021-07-21 04:12:09', '2021-08-13 09:58:17', 1, 1),
(420, 10, '1 - DriveRack 260', 'Loudspeaker Management System', '1626860529_260Front_lg_full_width.jpg', 'qrcode_420.png', 'active', '2021-07-21 04:12:09', '2021-08-13 09:58:17', 1, 1),
(421, 10, '1 - DriveRack 260', 'Loudspeaker Management System', '1626860530_260Front_lg_full_width.jpg', 'qrcode_421.png', 'active', '2021-07-21 04:12:10', '2021-08-13 09:58:17', 1, 1),
(422, 10, '1 - DriveRack 260', 'Loudspeaker Management System', '1626860530_260Front_lg_full_width.jpg', 'qrcode_422.png', 'active', '2021-07-21 04:12:10', '2021-08-13 09:58:17', 1, 1),
(423, 10, '1 - DriveRack 260', 'Loudspeaker Management System', '1626860530_260Front_lg_full_width.jpg', 'qrcode_423.png', 'active', '2021-07-21 04:12:10', '2021-08-13 09:58:17', 1, 1),
(424, 10, '1 - DriveRack VENU360', 'Complete Loudspeaker Management System', '1626860635_dbxDriveRack_VENU360_Front_Panel_full_width.jpg', 'qrcode_424.png', 'active', '2021-07-21 04:13:55', '2021-08-13 09:58:17', 1, 1),
(425, 11, '1 - LEXICON MX 400', '4-in/4-out Reverb/Effects Processor with USB \"Hardware Plug-In\" Capability', '1626860877_127_original.jpg', 'qrcode_425.png', 'active', '2021-07-21 04:17:57', '2021-08-13 09:58:18', 1, 1),
(426, 11, '1 - YAMAHA REV 100', 'Sound Effect Processor', '1626861465_download.jpg', 'qrcode_426.png', 'active', '2021-07-21 04:27:45', '2021-08-13 09:58:18', 1, 1),
(427, 11, '1 - BOSS RE20', 'Sound Effect Processor', '1626861576_download.jpg', 'qrcode_427.png', 'active', '2021-07-21 04:29:36', '2021-08-13 09:58:18', 1, 1),
(428, 12, '1 - BLACK PANNEL BOARD', '110Kva Pannel Board', '1626873149_20210618_184251.jpg', 'qrcode_428.png', 'active', '2021-07-21 07:42:29', '2021-08-13 09:58:18', 1, 1),
(429, 12, '1 - MINI PANNEL BOARD', '70Kva POWER SUPPLY PANNEL BOARD', '1626873620_20210618_184411.jpg', 'qrcode_429.png', 'active', '2021-07-21 07:50:20', '2021-08-13 09:58:18', 1, 1),
(431, 13, '1 - 10KVA STABILIZER', '10KVA Stabilizer - 3', '1626874443_unnamed.jpg', 'qrcode_431.png', 'active', '2021-07-21 08:04:03', '2021-08-13 09:58:18', 1, 1),
(432, 13, '1 - 10KVA STABILIZER', '10KVA Stabilizer - 2', '1626874444_unnamed.jpg', 'qrcode_432.png', 'active', '2021-07-21 08:04:04', '2021-08-13 09:58:19', 1, 1),
(433, 13, '1 - 10KVA STABILIZER', '10KVA Stabilizer - 1', '1626874445_unnamed.jpg', 'qrcode_433.png', 'active', '2021-07-21 08:04:05', '2021-08-13 09:58:19', 1, 1),
(434, 13, '1 - 6KVA STABILIZER', '6KVA Keprej Stabilizer - 2', 'default.png', 'qrcode_434.png', 'active', '2021-07-21 08:07:08', '2021-08-13 09:58:19', 1, 1),
(435, 13, '1 - 6KVA STABILIZER', '6KVA Keprej Stabilizer - 1', 'default.png', 'qrcode_435.png', 'active', '2021-07-21 08:07:08', '2021-08-13 09:58:19', 1, 1),
(436, 13, '1 - 5KVA STABILIZER', '5KVA Manual Stabilizer', 'default.png', 'qrcode_436.png', 'active', '2021-07-21 08:08:03', '2021-08-13 09:58:19', 1, 1),
(437, 14, '1 - UPS', 'UPS 2', '1626875028_41yrbiciuhl._sx425_.jpg', 'qrcode_437.png', 'active', '2021-07-21 08:13:48', '2021-08-13 09:58:19', 1, 1),
(438, 14, '1 - UPS', 'UPS 1', '1626875029_41yrbiciuhl._sx425_.jpg', 'qrcode_438.png', 'active', '2021-07-21 08:13:49', '2021-08-13 09:58:20', 1, 1),
(439, 15, '1 - 16-Chennal Drum', '16 Chennal Drum', '1626875320_598090-1.png', 'qrcode_439.png', 'active', '2021-07-21 08:18:40', '2021-08-13 09:58:20', 1, 1),
(440, 15, '1 - 4-Chennal Drum', '4 Chennal Xlr Drum', 'default.png', 'qrcode_440.png', 'active', '2021-07-21 08:20:29', '2021-08-15 03:58:17', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items_categories`
--

CREATE TABLE `items_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive','deleted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items_categories`
--

INSERT INTO `items_categories` (`id`, `title`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(6, 'SPEAKERS', NULL, 'active', '2021-07-19 10:20:36', '2021-07-19 10:20:36', 1, 1),
(7, 'POWER AMPLIFIRES', NULL, 'active', '2021-07-20 10:52:21', '2021-07-20 10:52:21', 1, 1),
(8, 'AMPLIFIERS', NULL, 'active', '2021-07-20 11:22:22', '2021-07-20 11:22:22', 1, 1),
(9, 'CONSOLE', NULL, 'active', '2021-07-21 03:48:34', '2021-07-21 03:48:34', 1, 1),
(10, 'SOUND MANAGEMENT PROCESSORS', NULL, 'active', '2021-07-21 04:11:05', '2021-07-21 04:11:05', 1, 1),
(11, 'EFFECT PROCESSORS', NULL, 'active', '2021-07-21 04:16:17', '2021-07-21 04:16:17', 1, 1),
(12, 'Power Pannel Board', NULL, 'active', '2021-07-21 07:39:09', '2021-07-21 07:39:09', 1, 1),
(13, 'STABILIZER', NULL, 'active', '2021-07-21 07:54:54', '2021-07-21 07:54:54', 1, 1),
(14, 'UPS', NULL, 'active', '2021-07-21 08:09:27', '2021-07-21 08:09:27', 1, 1),
(15, 'STAGE XLR DRUM', NULL, 'active', '2021-07-21 08:16:15', '2021-07-21 08:16:15', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items_inventories`
--

CREATE TABLE `items_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `qrcode` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items_inventories`
--

INSERT INTO `items_inventories` (`id`, `title`, `description`, `image`, `qrcode`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Gg', 'o', '1628681025_user-avatar.jpg', 'qrcode_1.png', 'active', '2021-08-11 09:23:45', '2021-08-13 10:18:35', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items_inventories_items`
--

CREATE TABLE `items_inventories_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_inventory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items_inventories_items`
--

INSERT INTO `items_inventories_items` (`id`, `item_inventory_id`, `item_id`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 261, 'active', '2021-08-11 09:23:45', '2021-08-11 09:23:45', 1, 1),
(2, 1, 262, 'active', '2021-08-11 09:23:45', '2021-08-11 09:23:45', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_type` enum('cart','items','sub_items') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('order','repair') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('dispatch','deliver','return','reach','redispatch') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(21, '2021_07_01_170000_create_items_categories_table', 1),
(22, '2021_07_01_180000_create_items_table', 1),
(23, '2021_07_01_190000_create_items_inventories_table', 1),
(24, '2021_07_01_200000_create_items_inventories_items_table', 1),
(25, '2021_07_02_170000_create_sub_items_categories_table', 1),
(26, '2021_07_02_180000_create_sub_items_table', 1),
(27, '2021_07_02_190000_create_sub_items_inventories_table', 1),
(28, '2021_07_02_200000_create_sub_items_inventories_items_table', 1),
(29, '2021_07_04_210000_create_cart_table', 1),
(30, '2021_07_04_210030_create_cart_users_table', 1),
(31, '2021_07_04_220000_create_cart_inventories_table', 1),
(32, '2021_07_04_230000_create_cart_sub_inventories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mitul@yopmail.com', 'ZmA3SRElftA4unKxaDucWdUgGzLG8SyqEF1ywb4LdYspVQEv2VDuth01F9ew', '2021-08-04 08:21:06'),
('mitul@yopmail.com', 'doScQ4K5pPPR8WQTtOeLC3UYZJYOLJnLp1RFIiGOumlwXYlQDlqV8BwrRl28', '2021-08-04 08:21:56'),
('mitul@yopmail.com', '0zlSQxrS81XAUj9hjbg5nfJo86gM3CQzKiKov6dIus7ZsZ3tjutoKME6bAyx', '2021-08-04 08:23:17'),
('mitul@yopmail.com', 'VaW9sJkfgyUwR0mGMEwvYyMiCUHVeiycnQ9BUNP0xLiJO3q0Nrr0gStS2Igc', '2021-08-04 08:25:41'),
('mitul@yopmail.com', 'SH7AZhtC9Vk9xgsUmr7zxZ3WTmzNinUP3BpgqEzjKldptvXkRHkcK4Qx0H4V', '2021-08-04 08:27:16'),
('mitul@yopmail.com', 'erS9kJBSEEI7ReVm3FI8UxjSAuvjDk4oY6t8sYIYAJ1YYPjHhNJYPKzDcLSt', '2021-08-04 08:27:37'),
('mitul@yopmail.com', 'rwZRPOAgiTpR9tHLravBSny5RyrU3wcValjQxUhakyJnlQjEv3kMEAaQn2xD', '2021-08-04 08:28:38'),
('mitul@yopmail.com', 'BWWXyd2alhmC2ZH5npJEBGD44X4SfChJVv3t8LJjMf6lJZ2DRB9tXca2ZXvs', '2021-08-04 08:29:02'),
('mitul@yopmail.com', '4qD78U2QGZCdX7ysRumvU1TJoN6VKpGP2AHvue4E2ZnCSJoqFWBDBBaCxWVl', '2021-08-04 08:52:11'),
('mitul@yopmail.com', 'qiUQLK3t0yupaB78vJUyXYUG7OZ8AsvjzHRjzQ9il7dnqbbIQ015F3N08qtv', '2021-08-04 08:52:59'),
('mitul@yopmail.com', 'BZDWeuOdwZK5YtBWsvpoNir4NT1AVEzssd3TJkApfmtCHktkeVocipGBg0qH', '2021-08-04 08:53:45'),
('mitul@yopmail.com', 'FnWNhy3UxOxACYobTd9LsbIj5tdAzr1Qz8pCOCre8V9SzypMbbBPfum009FI', '2021-08-04 08:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_items`
--

CREATE TABLE `sub_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `qrcode` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive','deleted','repairing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_items`
--

INSERT INTO `sub_items` (`id`, `category_id`, `name`, `description`, `image`, `qrcode`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, '1 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951729_download.jpg', 'qrcode_1.png', 'active', '2021-07-22 05:32:09', '2021-08-13 10:09:01', 1, 1),
(2, 1, '2 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951729_download.jpg', 'qrcode_2.png', 'active', '2021-07-22 05:32:09', '2021-08-13 10:09:01', 1, 1),
(3, 1, '3 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951730_download.jpg', 'qrcode_3.png', 'active', '2021-07-22 05:32:10', '2021-08-13 10:09:01', 1, 1),
(4, 1, '4 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951730_download.jpg', 'qrcode_4.png', 'active', '2021-07-22 05:32:10', '2021-08-13 10:09:02', 1, 1),
(5, 1, '5 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951730_download.jpg', 'qrcode_5.png', 'active', '2021-07-22 05:32:10', '2021-08-13 10:09:02', 1, 1),
(6, 1, '6 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951730_download.jpg', 'qrcode_6.png', 'active', '2021-07-22 05:32:10', '2021-08-13 10:09:02', 1, 1),
(7, 1, '7 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951731_download.jpg', 'qrcode_7.png', 'active', '2021-07-22 05:32:11', '2021-08-13 10:09:02', 1, 1),
(8, 1, '8 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951731_download.jpg', 'qrcode_8.png', 'active', '2021-07-22 05:32:11', '2021-08-13 10:09:02', 1, 1),
(9, 1, '9 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951731_download.jpg', 'qrcode_9.png', 'active', '2021-07-22 05:32:11', '2021-08-13 10:09:03', 1, 1),
(10, 1, '10 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951732_download.jpg', 'qrcode_10.png', 'active', '2021-07-22 05:32:12', '2021-08-13 10:09:03', 1, 1),
(11, 1, '11 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951732_download.jpg', 'qrcode_11.png', 'active', '2021-07-22 05:32:12', '2021-08-13 10:09:03', 1, 1),
(12, 1, '12 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951732_download.jpg', 'qrcode_12.png', 'active', '2021-07-22 05:32:12', '2021-08-13 10:09:03', 1, 1),
(13, 1, '13 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951733_download.jpg', 'qrcode_13.png', 'active', '2021-07-22 05:32:13', '2021-08-13 10:09:03', 1, 1),
(14, 1, '14 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951733_download.jpg', 'qrcode_14.png', 'active', '2021-07-22 05:32:13', '2021-08-13 10:09:03', 1, 1),
(15, 1, '15 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951733_download.jpg', 'qrcode_15.png', 'active', '2021-07-22 05:32:13', '2021-08-13 10:09:04', 1, 1),
(16, 1, '16 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951734_download.jpg', 'qrcode_16.png', 'active', '2021-07-22 05:32:14', '2021-08-13 10:09:04', 1, 1),
(17, 1, '17 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951734_download.jpg', 'qrcode_17.png', 'active', '2021-07-22 05:32:14', '2021-08-13 10:09:04', 1, 1),
(18, 1, '18 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951734_download.jpg', 'qrcode_18.png', 'active', '2021-07-22 05:32:14', '2021-08-13 10:09:04', 1, 1),
(19, 1, '19 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951735_download.jpg', 'qrcode_19.png', 'active', '2021-07-22 05:32:15', '2021-08-13 10:09:04', 1, 1),
(20, 1, '20 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951735_download.jpg', 'qrcode_20.png', 'active', '2021-07-22 05:32:15', '2021-08-13 10:09:04', 1, 1),
(21, 1, '21 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951735_download.jpg', 'qrcode_21.png', 'active', '2021-07-22 05:32:15', '2021-08-13 10:09:05', 1, 1),
(22, 1, '22 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951736_download.jpg', 'qrcode_22.png', 'active', '2021-07-22 05:32:16', '2021-08-13 10:09:05', 1, 1),
(23, 1, '23 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951736_download.jpg', 'qrcode_23.png', 'active', '2021-07-22 05:32:16', '2021-08-13 10:09:05', 1, 1),
(24, 1, '24 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951736_download.jpg', 'qrcode_24.png', 'active', '2021-07-22 05:32:16', '2021-08-13 10:09:05', 1, 1),
(25, 1, '25 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951736_download.jpg', 'qrcode_25.png', 'active', '2021-07-22 05:32:16', '2021-08-13 10:09:05', 1, 1),
(26, 1, '26 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951737_download.jpg', 'qrcode_26.png', 'active', '2021-07-22 05:32:17', '2021-08-13 10:09:05', 1, 1),
(27, 1, '27 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951737_download.jpg', 'qrcode_27.png', 'active', '2021-07-22 05:32:17', '2021-08-13 10:09:06', 1, 1),
(28, 1, '28 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951738_download.jpg', 'qrcode_28.png', 'active', '2021-07-22 05:32:18', '2021-08-13 10:09:06', 1, 1),
(29, 1, '29 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951738_download.jpg', 'qrcode_29.png', 'active', '2021-07-22 05:32:18', '2021-08-13 10:09:06', 1, 1),
(30, 1, '30 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951738_download.jpg', 'qrcode_30.png', 'active', '2021-07-22 05:32:18', '2021-08-13 10:09:06', 1, 1),
(31, 1, '31 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951739_download.jpg', 'qrcode_31.png', 'active', '2021-07-22 05:32:19', '2021-08-13 10:09:06', 1, 1),
(32, 1, '32 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951739_download.jpg', 'qrcode_32.png', 'active', '2021-07-22 05:32:19', '2021-08-13 10:09:06', 1, 1),
(33, 1, '33 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951740_download.jpg', 'qrcode_33.png', 'active', '2021-07-22 05:32:20', '2021-08-13 10:09:07', 1, 1),
(34, 1, '34 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951740_download.jpg', 'qrcode_34.png', 'active', '2021-07-22 05:32:20', '2021-08-13 10:09:07', 1, 1),
(35, 1, '35 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951740_download.jpg', 'qrcode_35.png', 'active', '2021-07-22 05:32:20', '2021-08-13 10:09:07', 1, 1),
(36, 1, '36 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951741_download.jpg', 'qrcode_36.png', 'active', '2021-07-22 05:32:21', '2021-08-13 10:09:07', 1, 1),
(37, 1, '37 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951741_download.jpg', 'qrcode_37.png', 'active', '2021-07-22 05:32:21', '2021-08-13 10:09:07', 1, 1),
(38, 1, '38 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951741_download.jpg', 'qrcode_38.png', 'active', '2021-07-22 05:32:21', '2021-08-13 10:09:07', 1, 1),
(39, 1, '39 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951742_download.jpg', 'qrcode_39.png', 'active', '2021-07-22 05:32:22', '2021-08-13 10:09:08', 1, 1),
(40, 1, '40 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951742_download.jpg', 'qrcode_40.png', 'active', '2021-07-22 05:32:22', '2021-08-13 10:09:08', 1, 1),
(41, 1, '41 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951742_download.jpg', 'qrcode_41.png', 'active', '2021-07-22 05:32:22', '2021-08-13 10:09:08', 1, 1),
(42, 1, '42 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951742_download.jpg', 'qrcode_42.png', 'active', '2021-07-22 05:32:22', '2021-08-13 10:09:08', 1, 1),
(43, 1, '43 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951743_download.jpg', 'qrcode_43.png', 'active', '2021-07-22 05:32:23', '2021-08-13 10:09:08', 1, 1),
(44, 1, '44 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951743_download.jpg', 'qrcode_44.png', 'active', '2021-07-22 05:32:23', '2021-08-13 10:09:08', 1, 1),
(45, 1, '45 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951743_download.jpg', 'qrcode_45.png', 'active', '2021-07-22 05:32:23', '2021-08-13 10:09:09', 1, 1),
(46, 1, '46 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951744_download.jpg', 'qrcode_46.png', 'active', '2021-07-22 05:32:24', '2021-08-13 10:09:09', 1, 1),
(47, 1, '47 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951744_download.jpg', 'qrcode_47.png', 'active', '2021-07-22 05:32:24', '2021-08-13 10:09:09', 1, 1),
(48, 1, '48 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951744_download.jpg', 'qrcode_48.png', 'active', '2021-07-22 05:32:24', '2021-08-13 10:09:09', 1, 1),
(49, 1, '49 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951745_download.jpg', 'qrcode_49.png', 'active', '2021-07-22 05:32:25', '2021-08-13 10:09:09', 1, 1),
(50, 1, '50 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951745_download.jpg', 'qrcode_50.png', 'active', '2021-07-22 05:32:25', '2021-08-13 10:09:09', 1, 1),
(51, 1, '51 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951745_download.jpg', 'qrcode_51.png', 'active', '2021-07-22 05:32:25', '2021-08-13 10:09:10', 1, 1),
(52, 1, '52 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951745_download.jpg', 'qrcode_52.png', 'active', '2021-07-22 05:32:25', '2021-08-13 10:09:10', 1, 1),
(53, 1, '53 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951746_download.jpg', 'qrcode_53.png', 'active', '2021-07-22 05:32:26', '2021-08-13 10:09:10', 1, 1),
(54, 1, '54 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951746_download.jpg', 'qrcode_54.png', 'active', '2021-07-22 05:32:26', '2021-08-13 10:09:10', 1, 1),
(55, 1, '55 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951746_download.jpg', 'qrcode_55.png', 'active', '2021-07-22 05:32:26', '2021-08-13 10:09:10', 1, 1),
(56, 1, '56 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951746_download.jpg', 'qrcode_56.png', 'active', '2021-07-22 05:32:26', '2021-08-13 10:09:11', 1, 1),
(57, 1, '57 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951747_download.jpg', 'qrcode_57.png', 'active', '2021-07-22 05:32:27', '2021-08-13 10:09:11', 1, 1),
(58, 1, '58 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951747_download.jpg', 'qrcode_58.png', 'active', '2021-07-22 05:32:27', '2021-08-13 10:09:11', 1, 1),
(59, 1, '59 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951747_download.jpg', 'qrcode_59.png', 'active', '2021-07-22 05:32:27', '2021-08-13 10:09:12', 1, 1),
(60, 1, '60 - XLR TO XLR', 'XLR MAIL FEMAIl Small cables for Booth wiring', '1626951748_download.jpg', 'qrcode_60.png', 'active', '2021-07-22 05:32:28', '2021-08-13 10:09:12', 1, 1),
(121, 1, '1 - 1 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970793_black_jack_to_female_xlr_1.jpg', 'qrcode_121.png', 'active', '2021-07-22 10:49:53', '2021-08-13 10:09:12', 1, 1),
(122, 1, '2 - 2 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970793_black_jack_to_female_xlr_1.jpg', 'qrcode_122.png', 'active', '2021-07-22 10:49:53', '2021-08-13 10:09:12', 1, 1),
(123, 1, '3 - 3 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970793_black_jack_to_female_xlr_1.jpg', 'qrcode_123.png', 'active', '2021-07-22 10:49:53', '2021-08-13 10:09:12', 1, 1),
(124, 1, '4 - 4 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970793_black_jack_to_female_xlr_1.jpg', 'qrcode_124.png', 'active', '2021-07-22 10:49:53', '2021-08-13 10:09:12', 1, 1),
(125, 1, '5 - 5 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970794_black_jack_to_female_xlr_1.jpg', 'qrcode_125.png', 'active', '2021-07-22 10:49:54', '2021-08-13 10:09:13', 1, 1),
(126, 1, '6 - 6 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970794_black_jack_to_female_xlr_1.jpg', 'qrcode_126.png', 'active', '2021-07-22 10:49:54', '2021-08-13 10:09:13', 1, 1),
(127, 1, '7 - 7 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970794_black_jack_to_female_xlr_1.jpg', 'qrcode_127.png', 'active', '2021-07-22 10:49:54', '2021-08-13 10:09:13', 1, 1),
(128, 1, '8 - 8 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970794_black_jack_to_female_xlr_1.jpg', 'qrcode_128.png', 'active', '2021-07-22 10:49:54', '2021-08-13 10:09:13', 1, 1),
(129, 1, '9 - 9 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970794_black_jack_to_female_xlr_1.jpg', 'qrcode_129.png', 'active', '2021-07-22 10:49:54', '2021-08-13 10:09:13', 1, 1),
(130, 1, '10 - 10 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970795_black_jack_to_female_xlr_1.jpg', 'qrcode_130.png', 'active', '2021-07-22 10:49:55', '2021-08-13 10:09:13', 1, 1),
(131, 1, '11 - 11 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970795_black_jack_to_female_xlr_1.jpg', 'qrcode_131.png', 'active', '2021-07-22 10:49:55', '2021-08-13 10:09:14', 1, 1),
(132, 1, '12 - 12 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970795_black_jack_to_female_xlr_1.jpg', 'qrcode_132.png', 'active', '2021-07-22 10:49:55', '2021-08-13 10:09:14', 1, 1),
(133, 1, '13 - 13 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970795_black_jack_to_female_xlr_1.jpg', 'qrcode_133.png', 'active', '2021-07-22 10:49:55', '2021-08-13 10:09:14', 1, 1),
(134, 1, '14 - 14 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970796_black_jack_to_female_xlr_1.jpg', 'qrcode_134.png', 'active', '2021-07-22 10:49:56', '2021-08-13 10:09:14', 1, 1),
(135, 1, '15 - 15 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970796_black_jack_to_female_xlr_1.jpg', 'qrcode_135.png', 'active', '2021-07-22 10:49:56', '2021-08-13 10:09:14', 1, 1),
(136, 1, '16 - 16 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970796_black_jack_to_female_xlr_1.jpg', 'qrcode_136.png', 'active', '2021-07-22 10:49:56', '2021-08-13 10:09:14', 1, 1),
(137, 1, '17 - 17 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970796_black_jack_to_female_xlr_1.jpg', 'qrcode_137.png', 'active', '2021-07-22 10:49:56', '2021-08-13 10:09:15', 1, 1),
(138, 1, '18 - 18 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970797_black_jack_to_female_xlr_1.jpg', 'qrcode_138.png', 'active', '2021-07-22 10:49:57', '2021-08-13 10:09:15', 1, 1),
(139, 1, '19 - 19 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970797_black_jack_to_female_xlr_1.jpg', 'qrcode_139.png', 'active', '2021-07-22 10:49:57', '2021-08-13 10:09:15', 1, 1),
(140, 1, '20 - 20 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970797_black_jack_to_female_xlr_1.jpg', 'qrcode_140.png', 'active', '2021-07-22 10:49:57', '2021-08-13 10:09:15', 1, 1),
(141, 1, '21 - 21 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970797_black_jack_to_female_xlr_1.jpg', 'qrcode_141.png', 'active', '2021-07-22 10:49:57', '2021-08-13 10:09:16', 1, 1),
(142, 1, '22 - 22 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970798_black_jack_to_female_xlr_1.jpg', 'qrcode_142.png', 'active', '2021-07-22 10:49:58', '2021-08-13 10:09:16', 1, 1),
(143, 1, '23 - 23 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970798_black_jack_to_female_xlr_1.jpg', 'qrcode_143.png', 'active', '2021-07-22 10:49:58', '2021-08-13 10:09:18', 1, 1),
(144, 1, '24 - 24 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970798_black_jack_to_female_xlr_1.jpg', 'qrcode_144.png', 'active', '2021-07-22 10:49:58', '2021-08-13 10:09:19', 1, 1),
(145, 1, '25 - 25 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970798_black_jack_to_female_xlr_1.jpg', 'qrcode_145.png', 'active', '2021-07-22 10:49:58', '2021-08-13 10:09:21', 1, 1),
(146, 1, '26 - 26 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970799_black_jack_to_female_xlr_1.jpg', 'qrcode_146.png', 'active', '2021-07-22 10:49:59', '2021-08-13 10:09:22', 1, 1),
(147, 1, '27 - 27 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970799_black_jack_to_female_xlr_1.jpg', 'qrcode_147.png', 'active', '2021-07-22 10:49:59', '2021-08-13 10:09:24', 1, 1),
(148, 1, '28 - 28 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970799_black_jack_to_female_xlr_1.jpg', 'qrcode_148.png', 'active', '2021-07-22 10:49:59', '2021-08-13 10:09:25', 1, 1),
(149, 1, '29 - 29 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970799_black_jack_to_female_xlr_1.jpg', 'qrcode_149.png', 'active', '2021-07-22 10:49:59', '2021-08-13 10:09:27', 1, 1),
(150, 1, '30 - 30 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970800_black_jack_to_female_xlr_1.jpg', 'qrcode_150.png', 'active', '2021-07-22 10:50:00', '2021-08-13 10:09:29', 1, 1),
(151, 1, '31 - 31 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970800_black_jack_to_female_xlr_1.jpg', 'qrcode_151.png', 'active', '2021-07-22 10:50:00', '2021-08-13 10:09:30', 1, 1),
(152, 1, '32 - 32 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970800_black_jack_to_female_xlr_1.jpg', 'qrcode_152.png', 'active', '2021-07-22 10:50:00', '2021-08-13 10:09:32', 1, 1),
(153, 1, '33 - 33 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970801_black_jack_to_female_xlr_1.jpg', 'qrcode_153.png', 'active', '2021-07-22 10:50:01', '2021-08-13 10:09:33', 1, 1),
(154, 1, '34 - 34 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970801_black_jack_to_female_xlr_1.jpg', 'qrcode_154.png', 'active', '2021-07-22 10:50:01', '2021-08-13 10:09:35', 1, 1),
(155, 1, '35 - 35 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970802_black_jack_to_female_xlr_1.jpg', 'qrcode_155.png', 'active', '2021-07-22 10:50:02', '2021-08-13 10:09:37', 1, 1),
(156, 1, '36 - 36 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970802_black_jack_to_female_xlr_1.jpg', 'qrcode_156.png', 'active', '2021-07-22 10:50:02', '2021-08-13 10:09:38', 1, 1),
(157, 1, '37 - 37 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970803_black_jack_to_female_xlr_1.jpg', 'qrcode_157.png', 'active', '2021-07-22 10:50:03', '2021-08-13 10:09:39', 1, 1),
(158, 1, '38 - 38 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970804_black_jack_to_female_xlr_1.jpg', 'qrcode_158.png', 'active', '2021-07-22 10:50:04', '2021-08-13 10:09:39', 1, 1),
(159, 1, '39 - 39 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970805_black_jack_to_female_xlr_1.jpg', 'qrcode_159.png', 'active', '2021-07-22 10:50:05', '2021-08-13 10:09:40', 1, 1),
(160, 1, '40 - 40 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970806_black_jack_to_female_xlr_1.jpg', 'qrcode_160.png', 'active', '2021-07-22 10:50:06', '2021-08-13 10:09:40', 1, 1),
(161, 1, '41 - 41 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970806_black_jack_to_female_xlr_1.jpg', 'qrcode_161.png', 'active', '2021-07-22 10:50:06', '2021-08-13 10:09:40', 1, 1),
(162, 1, '42 - 42 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970807_black_jack_to_female_xlr_1.jpg', 'qrcode_162.png', 'active', '2021-07-22 10:50:07', '2021-08-13 10:09:41', 1, 1),
(163, 1, '43 - 43 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970808_black_jack_to_female_xlr_1.jpg', 'qrcode_163.png', 'active', '2021-07-22 10:50:08', '2021-08-13 10:09:41', 1, 1),
(164, 1, '44 - 44 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970808_black_jack_to_female_xlr_1.jpg', 'qrcode_164.png', 'active', '2021-07-22 10:50:08', '2021-08-13 10:09:42', 1, 1),
(165, 1, '45 - 45 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970809_black_jack_to_female_xlr_1.jpg', 'qrcode_165.png', 'active', '2021-07-22 10:50:09', '2021-08-13 10:09:42', 1, 1),
(166, 1, '46 - 46 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970809_black_jack_to_female_xlr_1.jpg', 'qrcode_166.png', 'active', '2021-07-22 10:50:09', '2021-08-13 10:09:42', 1, 1),
(167, 1, '47 - 47 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970810_black_jack_to_female_xlr_1.jpg', 'qrcode_167.png', 'active', '2021-07-22 10:50:10', '2021-08-13 10:09:43', 1, 1),
(168, 1, '48 - 48 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970810_black_jack_to_female_xlr_1.jpg', 'qrcode_168.png', 'active', '2021-07-22 10:50:10', '2021-08-13 10:09:43', 1, 1),
(169, 1, '49 - 49 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970810_black_jack_to_female_xlr_1.jpg', 'qrcode_169.png', 'active', '2021-07-22 10:50:10', '2021-08-13 10:09:44', 1, 1),
(170, 1, '50 - 50 - Femail XLR to Jeck', 'Femail XLR to Jecks', '1626970811_black_jack_to_female_xlr_1.jpg', 'qrcode_170.png', 'active', '2021-07-22 10:50:11', '2021-08-13 10:09:44', 1, 1),
(171, 1, '51 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971196_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_171.png', 'active', '2021-07-22 10:56:36', '2021-08-13 10:09:44', 1, 1),
(172, 1, '52 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971196_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_172.png', 'active', '2021-07-22 10:56:36', '2021-08-13 10:09:45', 1, 1),
(173, 1, '53 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971197_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_173.png', 'active', '2021-07-22 10:56:37', '2021-08-13 10:09:45', 1, 1),
(174, 1, '54 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971197_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_174.png', 'active', '2021-07-22 10:56:37', '2021-08-13 10:09:46', 1, 1),
(175, 1, '55 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971197_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_175.png', 'active', '2021-07-22 10:56:37', '2021-08-13 10:09:46', 1, 1),
(176, 1, '56 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971197_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_176.png', 'active', '2021-07-22 10:56:37', '2021-08-13 10:09:46', 1, 1),
(177, 1, '57 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971197_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_177.png', 'active', '2021-07-22 10:56:37', '2021-08-13 10:09:47', 1, 1),
(178, 1, '58 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971198_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_178.png', 'active', '2021-07-22 10:56:38', '2021-08-13 10:09:47', 1, 1),
(179, 1, '59 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971198_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_179.png', 'active', '2021-07-22 10:56:38', '2021-08-13 10:09:48', 1, 1),
(180, 1, '60 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971198_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_180.png', 'active', '2021-07-22 10:56:38', '2021-08-13 10:09:48', 1, 1),
(181, 1, '61 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971198_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_181.png', 'active', '2021-07-22 10:56:38', '2021-08-13 10:09:48', 1, 1),
(182, 1, '62 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971199_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_182.png', 'active', '2021-07-22 10:56:39', '2021-08-13 10:09:49', 1, 1),
(183, 1, '63 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971199_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_183.png', 'active', '2021-07-22 10:56:39', '2021-08-13 10:09:49', 1, 1),
(184, 1, '64 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971199_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_184.png', 'active', '2021-07-22 10:56:39', '2021-08-13 10:09:49', 1, 1),
(185, 1, '65 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971199_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_185.png', 'active', '2021-07-22 10:56:39', '2021-08-13 10:09:50', 1, 1),
(186, 1, '66 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971199_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_186.png', 'active', '2021-07-22 10:56:39', '2021-08-13 10:09:50', 1, 1),
(187, 1, '67 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971200_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_187.png', 'active', '2021-07-22 10:56:40', '2021-08-13 10:09:51', 1, 1),
(188, 1, '68 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971200_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_188.png', 'active', '2021-07-22 10:56:40', '2021-08-13 10:09:51', 1, 1),
(189, 1, '69 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971200_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_189.png', 'active', '2021-07-22 10:56:40', '2021-08-13 10:09:51', 1, 1),
(190, 1, '70 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971200_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_190.png', 'active', '2021-07-22 10:56:40', '2021-08-13 10:09:52', 1, 1),
(191, 1, '71 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971201_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_191.png', 'active', '2021-07-22 10:56:41', '2021-08-13 10:09:52', 1, 1),
(192, 1, '72 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971201_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_192.png', 'active', '2021-07-22 10:56:41', '2021-08-13 10:09:53', 1, 1),
(193, 1, '73 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971201_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_193.png', 'active', '2021-07-22 10:56:41', '2021-08-13 10:09:53', 1, 1),
(194, 1, '74 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971201_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_194.png', 'active', '2021-07-22 10:56:41', '2021-08-13 10:09:53', 1, 1),
(195, 1, '75 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971202_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_195.png', 'active', '2021-07-22 10:56:42', '2021-08-13 10:09:54', 1, 1),
(196, 1, '76 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971202_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_196.png', 'active', '2021-07-22 10:56:42', '2021-08-13 10:09:54', 1, 1),
(197, 1, '77 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971202_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_197.png', 'active', '2021-07-22 10:56:42', '2021-08-13 10:09:54', 1, 1),
(198, 1, '78 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971202_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_198.png', 'active', '2021-07-22 10:56:42', '2021-08-13 10:09:55', 1, 1),
(199, 1, '79 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971202_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_199.png', 'active', '2021-07-22 10:56:42', '2021-08-13 10:09:55', 1, 1),
(200, 1, '80 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971203_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_200.png', 'active', '2021-07-22 10:56:43', '2021-08-13 10:09:55', 1, 1),
(201, 1, '81 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971203_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_201.png', 'active', '2021-07-22 10:56:43', '2021-08-13 10:09:56', 1, 1),
(202, 1, '82 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971203_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_202.png', 'active', '2021-07-22 10:56:43', '2021-08-13 10:09:56', 1, 1),
(203, 1, '83 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971203_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_203.png', 'active', '2021-07-22 10:56:43', '2021-08-13 10:09:57', 1, 1),
(204, 1, '84 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971204_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_204.png', 'active', '2021-07-22 10:56:44', '2021-08-13 10:09:57', 1, 1),
(205, 1, '85 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971204_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_205.png', 'active', '2021-07-22 10:56:44', '2021-08-13 10:09:57', 1, 1),
(206, 1, '86 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971204_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_206.png', 'active', '2021-07-22 10:56:44', '2021-08-13 10:09:58', 1, 1),
(207, 1, '87 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971204_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_207.png', 'active', '2021-07-22 10:56:44', '2021-08-13 10:09:58', 1, 1),
(208, 1, '88 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971205_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_208.png', 'active', '2021-07-22 10:56:45', '2021-08-13 10:09:58', 1, 1),
(209, 1, '89 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971205_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_209.png', 'active', '2021-07-22 10:56:45', '2021-08-13 10:09:59', 1, 1),
(210, 1, '90 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971205_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_210.png', 'active', '2021-07-22 10:56:45', '2021-08-13 10:09:59', 1, 1),
(211, 1, '91 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971206_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_211.png', 'active', '2021-07-22 10:56:46', '2021-08-13 10:09:59', 1, 1),
(212, 1, '92 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971206_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_212.png', 'active', '2021-07-22 10:56:46', '2021-08-13 10:10:00', 1, 1),
(213, 1, '93 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971206_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_213.png', 'active', '2021-07-22 10:56:46', '2021-08-13 10:10:00', 1, 1),
(214, 1, '94 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971207_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_214.png', 'active', '2021-07-22 10:56:47', '2021-08-13 10:10:01', 1, 1),
(215, 1, '95 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971207_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_215.png', 'active', '2021-07-22 10:56:47', '2021-08-13 10:10:01', 1, 1),
(216, 1, '96 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971207_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_216.png', 'active', '2021-07-22 10:56:47', '2021-08-13 10:10:02', 1, 1),
(217, 1, '97 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971207_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_217.png', 'active', '2021-07-22 10:56:47', '2021-08-13 10:10:02', 1, 1),
(218, 1, '98 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971208_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_218.png', 'active', '2021-07-22 10:56:48', '2021-08-13 10:10:03', 1, 1),
(219, 1, '99 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971208_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_219.png', 'active', '2021-07-22 10:56:48', '2021-08-13 10:10:03', 1, 1),
(220, 1, '100 - Mail XLR to Jeck', 'Mail XLR to Jecks', '1626971208_81Dp2Jz0uHL._SL1500_.jpg', 'qrcode_220.png', 'active', '2021-07-22 10:56:48', '2021-08-13 10:10:04', 1, 1),
(221, 2, '1 - 61 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971474_download.jpg', 'qrcode_221.png', 'active', '2021-07-22 11:01:14', '2021-08-13 10:10:04', 1, 1),
(222, 2, '2 - 62 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971475_download.jpg', 'qrcode_222.png', 'active', '2021-07-22 11:01:15', '2021-08-13 10:10:04', 1, 1),
(223, 2, '3 - 63 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971475_download.jpg', 'qrcode_223.png', 'active', '2021-07-22 11:01:15', '2021-08-13 10:10:05', 1, 1),
(224, 2, '4 - 64 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971475_download.jpg', 'qrcode_224.png', 'active', '2021-07-22 11:01:15', '2021-08-13 10:10:05', 1, 1),
(225, 2, '5 - 65 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971475_download.jpg', 'qrcode_225.png', 'active', '2021-07-22 11:01:15', '2021-08-13 10:10:05', 1, 1),
(226, 2, '6 - 66 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971476_download.jpg', 'qrcode_226.png', 'active', '2021-07-22 11:01:16', '2021-08-13 10:10:06', 1, 1),
(227, 2, '7 - 67 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971476_download.jpg', 'qrcode_227.png', 'active', '2021-07-22 11:01:16', '2021-08-13 10:10:06', 1, 1),
(228, 2, '8 - 68 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971476_download.jpg', 'qrcode_228.png', 'active', '2021-07-22 11:01:16', '2021-08-13 10:10:06', 1, 1),
(229, 2, '9 - 69 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971477_download.jpg', 'qrcode_229.png', 'active', '2021-07-22 11:01:17', '2021-08-13 10:10:07', 1, 1),
(230, 2, '10 - 70 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971477_download.jpg', 'qrcode_230.png', 'active', '2021-07-22 11:01:17', '2021-08-13 10:10:07', 1, 1),
(231, 2, '11 - 71 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971477_download.jpg', 'qrcode_231.png', 'active', '2021-07-22 11:01:17', '2021-08-13 10:10:07', 1, 1),
(232, 2, '12 - 72 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971477_download.jpg', 'qrcode_232.png', 'active', '2021-07-22 11:01:17', '2021-08-13 10:10:08', 1, 1),
(233, 2, '13 - 73 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971478_download.jpg', 'qrcode_233.png', 'active', '2021-07-22 11:01:18', '2021-08-13 10:10:08', 1, 1),
(234, 2, '14 - 74 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971478_download.jpg', 'qrcode_234.png', 'active', '2021-07-22 11:01:18', '2021-08-13 10:10:09', 1, 1),
(235, 2, '15 - 75 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971478_download.jpg', 'qrcode_235.png', 'active', '2021-07-22 11:01:18', '2021-08-13 10:10:09', 1, 1),
(236, 2, '16 - 76 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971478_download.jpg', 'qrcode_236.png', 'active', '2021-07-22 11:01:18', '2021-08-13 10:10:10', 1, 1),
(237, 2, '17 - 77 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971479_download.jpg', 'qrcode_237.png', 'active', '2021-07-22 11:01:19', '2021-08-13 10:10:10', 1, 1),
(238, 2, '18 - 78 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971479_download.jpg', 'qrcode_238.png', 'active', '2021-07-22 11:01:19', '2021-08-13 10:10:10', 1, 1),
(239, 2, '19 - 79 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971479_download.jpg', 'qrcode_239.png', 'active', '2021-07-22 11:01:19', '2021-08-13 10:10:11', 1, 1),
(240, 2, '20 - 80 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971479_download.jpg', 'qrcode_240.png', 'active', '2021-07-22 11:01:19', '2021-08-13 10:10:11', 1, 1),
(241, 2, '21 - 81 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971480_download.jpg', 'qrcode_241.png', 'active', '2021-07-22 11:01:20', '2021-08-13 10:10:11', 1, 1),
(242, 2, '22 - 82 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971480_download.jpg', 'qrcode_242.png', 'active', '2021-07-22 11:01:20', '2021-08-13 10:10:12', 1, 1),
(243, 2, '23 - 83 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971480_download.jpg', 'qrcode_243.png', 'active', '2021-07-22 11:01:20', '2021-08-13 10:10:12', 1, 1),
(244, 2, '24 - 84 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971480_download.jpg', 'qrcode_244.png', 'active', '2021-07-22 11:01:20', '2021-08-13 10:10:12', 1, 1),
(245, 2, '25 - 85 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971481_download.jpg', 'qrcode_245.png', 'active', '2021-07-22 11:01:21', '2021-08-13 10:10:13', 1, 1),
(246, 2, '26 - 86 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971481_download.jpg', 'qrcode_246.png', 'active', '2021-07-22 11:01:21', '2021-08-13 10:10:13', 1, 1),
(247, 2, '27 - 87 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971481_download.jpg', 'qrcode_247.png', 'active', '2021-07-22 11:01:21', '2021-08-13 10:10:13', 1, 1),
(248, 2, '28 - 88 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971482_download.jpg', 'qrcode_248.png', 'active', '2021-07-22 11:01:22', '2021-08-13 10:10:14', 1, 1),
(249, 2, '29 - 89 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971482_download.jpg', 'qrcode_249.png', 'active', '2021-07-22 11:01:22', '2021-08-13 10:10:14', 1, 1),
(250, 2, '30 - 90 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971482_download.jpg', 'qrcode_250.png', 'active', '2021-07-22 11:01:22', '2021-08-13 10:10:15', 1, 1),
(251, 2, '31 - 91 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971482_download.jpg', 'qrcode_251.png', 'active', '2021-07-22 11:01:22', '2021-08-13 10:10:15', 1, 1),
(252, 2, '32 - 92 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971483_download.jpg', 'qrcode_252.png', 'active', '2021-07-22 11:01:23', '2021-08-13 10:10:15', 1, 1),
(253, 2, '33 - 93 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971483_download.jpg', 'qrcode_253.png', 'active', '2021-07-22 11:01:23', '2021-08-13 10:10:16', 1, 1),
(254, 2, '34 - 94 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971483_download.jpg', 'qrcode_254.png', 'active', '2021-07-22 11:01:23', '2021-08-13 10:10:16', 1, 1),
(255, 2, '35 - 95 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971484_download.jpg', 'qrcode_255.png', 'active', '2021-07-22 11:01:24', '2021-08-13 10:10:17', 1, 1),
(256, 2, '36 - 96 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971484_download.jpg', 'qrcode_256.png', 'active', '2021-07-22 11:01:24', '2021-08-13 10:10:17', 1, 1),
(257, 2, '37 - 97 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971484_download.jpg', 'qrcode_257.png', 'active', '2021-07-22 11:01:24', '2021-08-13 10:10:17', 1, 1),
(258, 2, '38 - 98 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971485_download.jpg', 'qrcode_258.png', 'active', '2021-07-22 11:01:25', '2021-08-13 10:10:18', 1, 1),
(259, 2, '39 - 99 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971485_download.jpg', 'qrcode_259.png', 'active', '2021-07-22 11:01:25', '2021-08-13 10:10:18', 1, 1),
(260, 2, '40 - 100 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971485_download.jpg', 'qrcode_260.png', 'active', '2021-07-22 11:01:25', '2021-08-13 10:10:19', 1, 1),
(261, 2, '41 - 101 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971485_download.jpg', 'qrcode_261.png', 'active', '2021-07-22 11:01:25', '2021-08-13 10:10:19', 1, 1),
(262, 2, '42 - 102 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971486_download.jpg', 'qrcode_262.png', 'active', '2021-07-22 11:01:26', '2021-08-13 10:10:19', 1, 1),
(263, 2, '43 - 103 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971486_download.jpg', 'qrcode_263.png', 'active', '2021-07-22 11:01:26', '2021-08-13 10:10:20', 1, 1),
(264, 2, '44 - 104 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971486_download.jpg', 'qrcode_264.png', 'active', '2021-07-22 11:01:26', '2021-08-13 10:10:20', 1, 1),
(265, 2, '45 - 105 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971487_download.jpg', 'qrcode_265.png', 'active', '2021-07-22 11:01:27', '2021-08-13 10:10:20', 1, 1),
(266, 2, '46 - 106 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971487_download.jpg', 'qrcode_266.png', 'active', '2021-07-22 11:01:27', '2021-08-13 10:10:21', 1, 1),
(267, 2, '47 - 107 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971488_download.jpg', 'qrcode_267.png', 'active', '2021-07-22 11:01:28', '2021-08-13 10:10:21', 1, 1),
(268, 2, '48 - 108 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971488_download.jpg', 'qrcode_268.png', 'active', '2021-07-22 11:01:28', '2021-08-13 10:10:22', 1, 1),
(269, 2, '49 - 109 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971488_download.jpg', 'qrcode_269.png', 'active', '2021-07-22 11:01:28', '2021-08-13 10:10:22', 1, 1),
(270, 2, '50 - 110 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971489_download.jpg', 'qrcode_270.png', 'active', '2021-07-22 11:01:29', '2021-08-13 10:10:22', 1, 1),
(271, 2, '51 - 111 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971489_download.jpg', 'qrcode_271.png', 'active', '2021-07-22 11:01:29', '2021-08-13 10:10:23', 1, 1),
(272, 2, '52 - 112 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971490_download.jpg', 'qrcode_272.png', 'active', '2021-07-22 11:01:30', '2021-08-13 10:10:23', 1, 1),
(273, 2, '53 - 113 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971490_download.jpg', 'qrcode_273.png', 'active', '2021-07-22 11:01:30', '2021-08-13 10:10:24', 1, 1),
(274, 2, '54 - 114 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971491_download.jpg', 'qrcode_274.png', 'active', '2021-07-22 11:01:31', '2021-08-13 10:10:24', 1, 1),
(275, 2, '55 - 115 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971491_download.jpg', 'qrcode_275.png', 'active', '2021-07-22 11:01:31', '2021-08-13 10:10:24', 1, 1),
(276, 2, '56 - 116 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971492_download.jpg', 'qrcode_276.png', 'active', '2021-07-22 11:01:32', '2021-08-13 10:10:25', 1, 1),
(277, 2, '57 - 117 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971493_download.jpg', 'qrcode_277.png', 'active', '2021-07-22 11:01:33', '2021-08-13 10:10:25', 1, 1),
(278, 2, '58 - 118 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971493_download.jpg', 'qrcode_278.png', 'active', '2021-07-22 11:01:33', '2021-08-13 10:10:25', 1, 1),
(279, 2, '59 - 119 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971494_download.jpg', 'qrcode_279.png', 'active', '2021-07-22 11:01:34', '2021-08-13 10:10:26', 1, 1),
(280, 2, '60 - 120 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971494_download.jpg', 'qrcode_280.png', 'active', '2021-07-22 11:01:34', '2021-08-13 10:10:26', 1, 1),
(281, 2, '61 - 121 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971495_download.jpg', 'qrcode_281.png', 'active', '2021-07-22 11:01:35', '2021-08-13 10:10:27', 1, 1),
(282, 2, '62 - 122 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971495_download.jpg', 'qrcode_282.png', 'active', '2021-07-22 11:01:35', '2021-08-13 10:10:27', 1, 1),
(283, 2, '63 - 123 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971495_download.jpg', 'qrcode_283.png', 'active', '2021-07-22 11:01:35', '2021-08-13 10:10:27', 1, 1),
(284, 2, '64 - 124 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971496_download.jpg', 'qrcode_284.png', 'active', '2021-07-22 11:01:36', '2021-08-13 10:10:28', 1, 1),
(285, 2, '65 - 125 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971496_download.jpg', 'qrcode_285.png', 'active', '2021-07-22 11:01:36', '2021-08-13 10:10:28', 1, 1),
(286, 2, '66 - 126 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971497_download.jpg', 'qrcode_286.png', 'active', '2021-07-22 11:01:37', '2021-08-13 10:10:29', 1, 1),
(287, 2, '67 - 127 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971497_download.jpg', 'qrcode_287.png', 'active', '2021-07-22 11:01:37', '2021-08-13 10:10:29', 1, 1),
(288, 2, '68 - 128 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971497_download.jpg', 'qrcode_288.png', 'active', '2021-07-22 11:01:37', '2021-08-13 10:10:29', 1, 1),
(289, 2, '69 - 129 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971498_download.jpg', 'qrcode_289.png', 'active', '2021-07-22 11:01:38', '2021-08-13 10:10:30', 1, 1),
(290, 2, '70 - 130 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971498_download.jpg', 'qrcode_290.png', 'active', '2021-07-22 11:01:38', '2021-08-13 10:10:30', 1, 1),
(291, 2, '71 - 131 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971499_download.jpg', 'qrcode_291.png', 'active', '2021-07-22 11:01:39', '2021-08-13 10:10:30', 1, 1),
(292, 2, '72 - 132 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971499_download.jpg', 'qrcode_292.png', 'active', '2021-07-22 11:01:39', '2021-08-13 10:10:31', 1, 1),
(293, 2, '73 - 133 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971499_download.jpg', 'qrcode_293.png', 'active', '2021-07-22 11:01:39', '2021-08-13 10:10:31', 1, 1),
(294, 2, '74 - 134 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971500_download.jpg', 'qrcode_294.png', 'active', '2021-07-22 11:01:40', '2021-08-13 10:10:31', 1, 1),
(295, 2, '75 - 135 - XLR TO XLR CABLE', 'MICROPHONE CABLE XLR TO XLR', '1626971500_download.jpg', 'qrcode_295.png', 'active', '2021-07-22 11:01:40', '2021-08-13 10:10:32', 1, 1),
(296, 3, '1 - AKG  Gooseneck', 'AKG GOOSENECK MIC', '1626971679_AKG_cgn331e-w196h196.jpg', 'qrcode_296.png', 'active', '2021-07-22 11:04:39', '2021-08-13 10:10:32', 1, 1),
(297, 3, '2 - AKG  Gooseneck', 'AKG GOOSENECK MIC', '1626971679_AKG_cgn331e-w196h196.jpg', 'qrcode_297.png', 'active', '2021-07-22 11:04:39', '2021-08-13 10:10:33', 1, 1),
(298, 3, '1 - EV  Gooseneck', 'EV GOOSENECK MIC', '1626971841_image.png', 'qrcode_298.png', 'active', '2021-07-22 11:07:21', '2021-08-13 10:10:33', 1, 1),
(299, 3, '2 - EV  Gooseneck', 'EV GOOSENECK MIC', '1626971841_image.png', 'qrcode_299.png', 'active', '2021-07-22 11:07:21', '2021-08-13 10:10:33', 1, 1),
(300, 3, '1 - JTS  Gooseneck', 'JTS 15\" Gooseneck Mic SMALL', '1626972033_download.png', 'qrcode_300.png', 'active', '2021-07-22 11:10:33', '2021-08-13 10:10:34', 1, 1),
(301, 3, '2 - JTS  Gooseneck', 'JTS 15\" Gooseneck Mic SMALL', '1626972034_download.png', 'qrcode_301.png', 'active', '2021-07-22 11:10:34', '2021-08-13 10:10:34', 1, 1),
(302, 3, '3 - JTS  Gooseneck', 'JTS 18\" GOOSENECK MIC', '1626972091_download.png', 'qrcode_302.png', 'active', '2021-07-22 11:11:31', '2021-08-13 10:10:35', 1, 1),
(303, 3, '1 - AKG D880', 'AKG D880 Microphone', '1626972406_Qq59oF1k1585841170-420x420.jpg', 'qrcode_303.png', 'active', '2021-07-22 11:16:46', '2021-08-13 10:10:35', 1, 1),
(304, 3, '1 - AKG D770', 'AKG D770 Microphone', '1626972470_download.jpg', 'qrcode_304.png', 'active', '2021-07-22 11:17:50', '2021-08-13 10:10:35', 1, 1),
(305, 3, '1 - Shure PG 58', 'Shure PG 58 Microphone', '1626972686_download.jpg', 'qrcode_305.png', 'active', '2021-07-22 11:21:26', '2021-08-13 10:10:36', 1, 1),
(306, 3, '2 - Shure PG 58', 'Shure PG 58 Microphone', '1626972687_download.jpg', 'qrcode_306.png', 'active', '2021-07-22 11:21:27', '2021-08-13 10:10:36', 1, 1),
(307, 3, '3 - Shure PG 58', 'Shure PG 58 Microphone', '1626972689_download.jpg', 'qrcode_307.png', 'active', '2021-07-22 11:21:29', '2021-08-13 10:10:36', 1, 1),
(308, 3, '1 - Shure 14a', 'Shure 14a Microphone', '1626973133_download.jpg', 'qrcode_308.png', 'active', '2021-07-22 11:28:53', '2021-08-13 10:10:37', 1, 1),
(309, 3, '2 - Shure 14a', 'Shure 14a Microphone', '1626973134_download.jpg', 'qrcode_309.png', 'active', '2021-07-22 11:28:54', '2021-08-13 10:10:37', 1, 1),
(310, 3, '3 - Shure 14a', 'Shure 14a Microphone', '1626973134_download.jpg', 'qrcode_310.png', 'active', '2021-07-22 11:28:54', '2021-08-13 10:10:38', 1, 1),
(311, 3, '4 - Shure 14a', 'Shure 14a Microphone', '1626973134_download.jpg', 'qrcode_311.png', 'active', '2021-07-22 11:28:54', '2021-08-13 10:10:38', 1, 1),
(312, 3, '1 - Shure SM58', 'Shure SM58 Microphone', '1626973266_download.jpg', 'qrcode_312.png', 'active', '2021-07-22 11:31:06', '2021-08-13 10:10:38', 1, 1),
(313, 3, '2 - Shure SM58', 'Shure SM58 Microphone', '1626973266_download.jpg', 'qrcode_313.png', 'active', '2021-07-22 11:31:06', '2021-08-13 10:10:39', 1, 1),
(314, 3, '3 - Shure SM58', 'Shure SM58 Microphone', '1626973267_download.jpg', 'qrcode_314.png', 'active', '2021-07-22 11:31:07', '2021-08-13 10:10:39', 1, 1),
(315, 3, '1 - Sennheiser e835', 'Sennheiser e835 Microphone', '1626973388_download.jpg', 'qrcode_315.png', 'active', '2021-07-22 11:33:08', '2021-08-13 10:10:39', 1, 1),
(316, 3, '2 - Sennheiser e835', 'Sennheiser e835 Microphone', '1626973388_download.jpg', 'qrcode_316.png', 'active', '2021-07-22 11:33:08', '2021-08-13 10:10:40', 1, 1),
(317, 3, '1 - Shure Beta58', 'Shure Beta58 Microphone', '1626973538_717pE587QkL._SL1500_.jpg', 'qrcode_317.png', 'active', '2021-07-22 11:35:38', '2021-08-13 10:10:40', 1, 1),
(318, 3, '1 - 4 - Shure SM58 With Switch', 'Shure SM58 with Switch', '1626973681_610ORaIbODL._SL1264_.jpg', 'qrcode_318.png', 'active', '2021-07-22 11:38:01', '2021-08-13 10:10:41', 1, 1),
(319, 3, '2 - 5 - Shure SM58 With Switch', 'Shure SM58 with Switch', '1626973682_610ORaIbODL._SL1264_.jpg', 'qrcode_319.png', 'active', '2021-07-22 11:38:02', '2021-08-13 10:10:41', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_items_categories`
--

CREATE TABLE `sub_items_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive','deleted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_items_categories`
--

INSERT INTO `sub_items_categories` (`id`, `title`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'XLR and JECKS', NULL, 'active', '2021-07-22 05:28:36', '2021-07-22 05:28:36', 1, 1),
(2, 'MICROPHONE XLR CABLES', NULL, 'active', '2021-07-22 10:59:31', '2021-07-22 10:59:31', 1, 1),
(3, 'MICROPHONES', NULL, 'active', '2021-07-22 11:02:48', '2021-07-22 11:02:48', 1, 1),
(4, 'Spikon', NULL, 'active', '2021-07-23 11:12:36', '2021-07-23 11:12:36', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_items_inventories`
--

CREATE TABLE `sub_items_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `qrcode` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_items_inventories_items`
--

CREATE TABLE `sub_items_inventories_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_item_inventory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `is_admin` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `status` enum('active','inactive','deleted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `image`, `is_admin`, `status`, `remember_token`, `device_id`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Super Admin', '1234567890', 'superadmin@mail.com', '$2y$10$svJMWMO7BlUrGYw1DdqGTOumWmKmJmUaZ.s.XlT1Y1N82eLoq90iq', NULL, 'y', 'active', NULL, NULL, '2021-07-07 15:16:50', '2021-07-07 15:16:50', 1, 1),
(2, 'Mitul Gajjar', '9879879871', 'mitul@yopmail.com', '$2y$10$ZeWpkN8GIlaMnnPQycC0e.Sx34sLY1jafjcRFGZN49o4K1UOsKz3y', NULL, 'n', 'active', NULL, NULL, '2021-07-07 15:16:51', '2021-07-07 15:16:51', 1, 1),
(3, 'HardIk Patel', '9879879872', 'hardik@yopmail.com', '$2y$10$AEmtkMUS4JcorTB1Tutx0uwbq97.pnXuwiHIeO5bP5jfinSkXIcqi', NULL, 'n', 'active', NULL, NULL, '2021-07-07 15:16:51', '2021-07-07 15:16:51', 1, 1),
(4, 'Mustan', '9879879873', 'mustan@yopmail.com', '$2y$10$Wqq5RB.zXHHttOiDddq98OxqppND4zuQGyryjE5VdmWC9lT.OWNs2', NULL, 'n', 'active', NULL, NULL, '2021-07-07 15:16:51', '2021-07-07 15:16:51', 1, 1),
(5, 'Raju Bhai', '9879879874', 'rajubhai@yopmail.com', '$2y$10$EvXPlQkBCR/alfhQrrsvzuv0za/Vwh8cGeNt2WdagNUOrP12PbcXO', NULL, 'n', 'active', NULL, NULL, '2021-07-07 15:16:51', '2021-07-07 15:16:51', 1, 1),
(6, 'Kiran', '9879879875', 'kiran@yopmail.com', '$2y$10$gnygJz/ssKAc.e7jEI5o6OPJ5n2rSwZ4BABWxQwz.6HuXrfxeDdsO', NULL, 'n', 'active', NULL, NULL, '2021-07-07 15:16:51', '2021-07-07 15:16:51', 1, 1),
(7, 'Manish', '9879879876', 'manish@yopmail.com', '$2y$10$Sco/1ABSBZi9yZrv5N0P0O96vOYTVf3LTB5AaTQz2hTvubZg2dNLu', NULL, 'n', 'active', NULL, NULL, '2021-07-07 15:16:51', '2021-07-07 15:16:51', 1, 1),
(8, 'Vipul', '9879879877', 'vipul@yopmail.com', '$2y$10$voXjXHF8T3ZulSbA.PALDuFE4tG4Zmve9LKg2naQE.WIf5qjPWuGK', NULL, 'n', 'active', NULL, NULL, '2021-07-07 15:16:51', '2021-07-07 15:16:51', 1, 1),
(9, 'Pritesh', '98798798778', 'pritesh@yopmail.com', '$2y$10$3Id5AutTgGFuEagWRcYSYuotlL4aRX3eSJDvssIBF2wR33YEFa4XK', NULL, 'n', 'active', NULL, NULL, '2021-07-07 15:16:51', '2021-07-07 15:16:51', 1, 1),
(10, 'Chinjal', '98798798779', 'chinjal@yopmail.com', '$2y$10$Jnxz9CjPzTO8Nlbb3U3Znuen4TadAb3e6g7Vn57TMEwnTji38QyDm', NULL, 'n', 'active', NULL, NULL, '2021-07-07 15:16:51', '2021-07-07 15:16:51', 1, 1),
(11, 'Niranjan', '98798798710', 'niranjan@yopmail.com', '$2y$10$BE/EIrsM/Hy3n/VNX845Du0s3gwzMv4awtx6lgcqwA71XX3lh3gj6', NULL, 'n', 'active', NULL, NULL, '2021-07-07 15:16:51', '2021-07-07 15:16:51', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_inventories`
--
ALTER TABLE `cart_inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_inventories_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_inventories_inventory_id_foreign` (`inventory_id`);

--
-- Indexes for table `cart_sub_inventories`
--
ALTER TABLE `cart_sub_inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_sub_inventories_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_sub_inventories_sub_inventory_id_foreign` (`sub_inventory_id`);

--
-- Indexes for table `cart_users`
--
ALTER TABLE `cart_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_users_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Indexes for table `items_categories`
--
ALTER TABLE `items_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_inventories`
--
ALTER TABLE `items_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_inventories_items`
--
ALTER TABLE `items_inventories_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_inventories_items_item_inventory_id_foreign` (`item_inventory_id`),
  ADD KEY `items_inventories_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_user_id_foreign` (`user_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sub_items`
--
ALTER TABLE `sub_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_items_category_id_foreign` (`category_id`);

--
-- Indexes for table `sub_items_categories`
--
ALTER TABLE `sub_items_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_items_inventories`
--
ALTER TABLE `sub_items_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_items_inventories_items`
--
ALTER TABLE `sub_items_inventories_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_items_inventories_items_sub_item_inventory_id_foreign` (`sub_item_inventory_id`),
  ADD KEY `sub_items_inventories_items_sub_item_id_foreign` (`sub_item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_inventories`
--
ALTER TABLE `cart_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_sub_inventories`
--
ALTER TABLE `cart_sub_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_users`
--
ALTER TABLE `cart_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;

--
-- AUTO_INCREMENT for table `items_categories`
--
ALTER TABLE `items_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `items_inventories`
--
ALTER TABLE `items_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items_inventories_items`
--
ALTER TABLE `items_inventories_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_items`
--
ALTER TABLE `sub_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT for table `sub_items_categories`
--
ALTER TABLE `sub_items_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_items_inventories`
--
ALTER TABLE `sub_items_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_items_inventories_items`
--
ALTER TABLE `sub_items_inventories_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_inventories`
--
ALTER TABLE `cart_inventories`
  ADD CONSTRAINT `cart_inventories_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_inventories_inventory_id_foreign` FOREIGN KEY (`inventory_id`) REFERENCES `items_inventories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_sub_inventories`
--
ALTER TABLE `cart_sub_inventories`
  ADD CONSTRAINT `cart_sub_inventories_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_sub_inventories_sub_inventory_id_foreign` FOREIGN KEY (`sub_inventory_id`) REFERENCES `sub_items_inventories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_users`
--
ALTER TABLE `cart_users`
  ADD CONSTRAINT `cart_users_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `items_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items_inventories_items`
--
ALTER TABLE `items_inventories_items`
  ADD CONSTRAINT `items_inventories_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_inventories_items_item_inventory_id_foreign` FOREIGN KEY (`item_inventory_id`) REFERENCES `items_inventories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_items`
--
ALTER TABLE `sub_items`
  ADD CONSTRAINT `sub_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `sub_items_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_items_inventories_items`
--
ALTER TABLE `sub_items_inventories_items`
  ADD CONSTRAINT `sub_items_inventories_items_sub_item_id_foreign` FOREIGN KEY (`sub_item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_items_inventories_items_sub_item_inventory_id_foreign` FOREIGN KEY (`sub_item_inventory_id`) REFERENCES `sub_items_inventories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
