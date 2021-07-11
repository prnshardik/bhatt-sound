-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 11, 2021 at 09:02 PM
-- Server version: 5.7.32-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enmsunyg_music_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qrcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive','deleted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `title`, `description`, `qrcode`, `file`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(6, 'VRX 932LA-1 Case 1', 'JBL VRX 932LA-1 TOP \r\n12 in. Two-Way Line Array Loudspeaker System', 'qrcode_6.png', '1623835125_vrx932la-1_front_z_vert_medium.jpg', 'active', '2021-06-16 03:48:45', '2021-06-25 11:14:43', 1, 1),
(7, 'VRX 932LA-1 Case 2', 'JBL VRX 932LA-1 TOPs\r\n12 in. Two-Way Line Array Loudspeaker System', 'qrcode_7.png', '1623836635_vrx932la-1_front_z_vert_medium.jpg', 'active', '2021-06-16 04:13:55', '2021-06-20 01:03:52', 1, 1),
(8, 'VRX 932LA-1 Case 3', 'JBL VRX 932LA-1 TOPs\r\n12 in. Two-Way Line Array Loudspeaker System', 'qrcode_8.png', '1623836758_vrx932la-1_front_z_vert_medium.jpg', 'active', '2021-06-16 04:15:58', '2021-06-24 01:27:03', 1, 1),
(9, 'VRX 932LA-1 Case 4', 'JBL VRX 932LA-1 TOPs\r\n12 in. Two-Way Line Array Loudspeaker System', 'qrcode_9.png', '1623837323_vrx932la-1_front_z_vert_medium.jpg', 'active', '2021-06-16 04:25:23', '2021-06-21 05:08:22', 1, 1),
(10, 'VRX 932LA-1 Case 5', 'JBL VRX 932LA-1 TOPs\r\n12 in. Two-Way Line Array Loudspeaker System', 'qrcode_10.png', '1623837473_vrx932la-1_front_z_vert_medium.jpg', 'active', '2021-06-16 04:27:53', '2021-06-25 01:10:11', 1, 1),
(11, 'VRX 932LA-1 Case 6', 'JBL VRX 932LA-1 TOPs\r\n12 in. Two-Way Line Array Loudspeaker System', 'qrcode_11.png', '1623838777_vrx932la-1_front_z_vert_medium.jpg', 'active', '2021-06-16 04:49:37', '2021-06-16 04:49:38', 1, 1),
(12, 'VRX 932LA-1 Case 7', 'JBL VRX 932LA-1 TOPs\r\n12 in. Two-Way Line Array Loudspeaker System', 'qrcode_12.png', '1623840713_vrx932la-1_front_z_vert_medium.jpg', 'active', '2021-06-16 05:21:53', '2021-06-16 05:21:53', 1, 1),
(13, 'VRX 932LA-1 Case 8', 'JBL VRX 932LA-1 TOPs\r\n12 in. Two-Way Line Array Loudspeaker System', 'qrcode_13.png', '1623840905_vrx932la-1_front_z_vert_medium.jpg', 'active', '2021-06-16 05:25:05', '2021-06-16 05:25:23', 1, 1),
(14, 'SRX 722 - 1', 'JBL SRX 722\r\nDual 12\" High-Power Two-Way Loudspeaker\r\nSerial no. P0413-14187', 'qrcode_14.png', '1623841454_srx722_front_z_vert_medium.jpg', 'active', '2021-06-16 05:31:11', '2021-06-25 01:10:28', 1, 1),
(15, 'SRX 722 - 2', 'JBL SRX 722\r\nDual 12\" High-Power Two-Way Loudspeaker\r\nSerial no. TP0413 2015', 'qrcode_15.png', '1623841551_srx722_front_z_vert_medium.jpg', 'active', '2021-06-16 05:35:51', '2021-06-20 01:39:22', 1, 1),
(16, 'STX 825 - 1', 'JBL STX 825\r\nDual 15\" Two-Way, Bass-Reflex\r\nSerial no. P1231-04916', 'qrcode_16.png', '1623842407_stx825_front_z_original.jpg', 'active', '2021-06-16 05:50:07', '2021-06-16 05:53:07', 1, 1),
(17, 'STX 825 - 2', 'JBL STX 825\r\nDual 15\" Two-Way, Bass-Reflex\r\nSerial no, P1231-13998', 'qrcode_17.png', '1623842467_stx825_front_z_original.jpg', 'active', '2021-06-16 05:51:07', '2021-06-16 05:53:34', 1, 1),
(18, 'STX 825 - 3', 'JBL STX 825\r\nDual 15\" Two-Way, Bass-Reflex\r\nSerial no. P1231-14123', 'qrcode_18.png', '1623842696_stx825_front_z_original.jpg', 'active', '2021-06-16 05:54:56', '2021-06-16 05:54:56', 1, 1),
(19, 'STX 825 - 4', 'JBL STX 825\r\nDual 15\" Two-Way, Bass-Reflex\r\nSerial no. P1231-03515', 'qrcode_19.png', '1623842804_stx825_front_z_original.jpg', 'active', '2021-06-16 05:56:44', '2021-06-16 05:57:32', 1, 1),
(21, 'SRX 728 - 1 BASS', 'JBL SRX 728 BASS\r\nDual 18 in. High-Power Subwoofer\r\nSerial no. P0417-70104', 'qrcode_21.png', '1623843561_srx728_front1_z_original.jpg', 'active', '2021-06-16 06:09:21', '2021-06-16 06:19:36', 1, 1),
(22, 'SRX 728 - 2 BASS', 'JBL SRX 728 BASS\r\nDual 18 in. High-Power Subwoofer\r\nSerial no. P0417-24651', 'qrcode_22.png', '1623844195_srx728_front1_z_original.jpg', 'active', '2021-06-16 06:19:55', '2021-06-16 06:19:55', 1, 1),
(23, 'SOUND CAPITAL M1000 (18+) CASE 1', 'SOUND CAPITAL M1000\r\nSTAGE MONITOR\r\nPOWER RATING 800RMS\r\nSerial no. 112\r\nSreial no. 037', 'qrcode_23.png', '1624181507_20210616_173048 111111111111111111111111111111.jpg', 'active', '2021-06-16 06:34:55', '2021-06-20 06:43:49', 1, 1),
(24, 'SOUND CAPITAL M1000 (18+) CASE 2', 'SOUND CAPITAL M1000\r\nSTAGE MONITOR\r\nPOWER RATING 800RMS\r\nSerial no. 113\r\nSerial no. 055', 'qrcode_24.png', '1624181536_20210616_173048 111111111111111111111111111111.jpg', 'active', '2021-06-16 06:39:50', '2021-06-20 04:02:16', 1, 1),
(25, 'SRX815P - 1', 'JBL SRX 815P\r\nStage Monitor\r\n15\" Two-Way Bass Reflex Self-Powered System', 'qrcode_25.png', '1623852459_srx815p_angle_z_vert_medium.jpg', 'active', '2021-06-16 08:37:39', '2021-06-20 04:03:17', 1, 1),
(26, 'SRX815P - 2', 'JBL SRX 815P\r\nStage Monitor\r\n15\" Two-Way Bass Reflex Self-Powered System', 'qrcode_26.png', '1623852538_srx815p_angle_z_vert_medium.jpg', 'active', '2021-06-16 08:38:58', '2021-06-16 08:38:58', 1, 1),
(27, 'DEL 115 - 1', 'Dynatech DEL115 PASSIVE\r\nHIGH PERFORMANCE FULL RANGE SPEAKER SYSTEM\r\nSerial no. 1', 'qrcode_27.png', '1623855817_del-115-5.jpg', 'active', '2021-06-16 09:33:37', '2021-06-20 06:45:10', 1, 1),
(28, 'DEL 115 - 2', 'Dynatech DEL115 PASSIVE\r\nHIGH PERFORMANCE FULL RANGE SPEAKER SYSTEM\r\nSerial no. 2', 'qrcode_28.png', '1623855891_del-115-5.jpg', 'active', '2021-06-16 09:34:51', '2021-06-16 09:35:57', 1, 1),
(29, 'DEL 115 - 3', 'Dynatech DEL115 PASSIVE\r\nHIGH PERFORMANCE FULL RANGE SPEAKER SYSTEM\r\nSerial no. 3', 'qrcode_29.png', '1623855933_del-115-5.jpg', 'active', '2021-06-16 09:35:33', '2021-06-16 09:35:33', 1, 1),
(30, 'DEL 115 - 4', 'Dynatech DEL115\r\nHIGH PERFORMANCE FULL RANGE SPEAKER SYSTEM\r\nSerial no. 4', 'qrcode_30.png', '1623856016_del-115-5.jpg', 'active', '2021-06-16 09:36:56', '2021-06-16 09:36:56', 1, 1),
(31, 'VIVA 10\'\' - 1', 'AHUJA VIVA 10\'\'\r\nMONITORING SPEAKER\r\nSerial no. 1', 'qrcode_31.png', 'default.png', 'active', '2021-06-16 10:24:25', '2021-06-20 04:04:04', 1, 1),
(32, 'VIVA 10\'\' - 2', 'AHUJA VIVA 10\'\'\r\nMONITORING SPEAKER\r\nSerial no. 1', 'qrcode_32.png', 'default.png', 'active', '2021-06-16 10:25:20', '2021-06-16 10:25:20', 1, 1),
(33, '21\'\' BASS - 1', '21\'\' Bass', 'qrcode_33.png', '1624541741_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-16 11:10:51', '2021-06-24 08:05:54', 1, 1),
(34, '21\'\' BASS - 2', '21\'\' Bass', 'qrcode_34.png', '1624541790_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-17 08:50:21', '2021-06-24 08:06:30', 1, 1),
(35, '21\'\' BASS - 3', '21\'\' Bass', 'qrcode_35.png', '1624541815_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-17 08:51:35', '2021-06-24 08:06:55', 1, 1),
(36, '21\'\' BASS - 4', '21\'\' BASS', 'qrcode_36.png', '1624541843_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-17 09:24:43', '2021-06-24 08:07:23', 1, 1),
(37, '21\'\' BASS - 5', '21\'\' BASS', 'qrcode_37.png', '1624541876_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-17 09:25:47', '2021-06-24 08:08:08', 1, 1),
(38, '21\'\' BASS - 6', '21\'\' BASS', 'qrcode_38.png', '1624541913_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-17 09:26:11', '2021-06-24 08:08:33', 1, 1),
(39, '21\'\' BASS - 7', '21\'\' BASS', 'qrcode_39.png', '1624541934_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-17 10:09:55', '2021-06-24 08:08:54', 1, 1),
(40, '21\'\' BASS - 8', '21\'\' BASS', 'qrcode_40.png', '1624541958_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-17 10:10:28', '2021-06-24 08:09:18', 1, 1),
(41, '21\'\' BASS - 9', '21\'\' BASS', 'qrcode_41.png', '1624541991_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-17 10:10:48', '2021-06-24 08:09:51', 1, 1),
(42, '21\'\' BASS - 10', '21\'\' BASS', 'qrcode_42.png', '1624542022_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-17 10:11:10', '2021-06-24 08:10:22', 1, 1),
(43, '21\'\' BASS - 11', '21\'\' BASS', 'qrcode_43.png', '1624542059_Bishop_BB121-004_59bcb6ae-57ee-4ea8-b91b-633c44b81bd5_250x.jpg', 'active', '2021-06-17 10:11:33', '2021-06-24 08:10:59', 1, 1),
(44, '21\'\' BASS - 12', '21\'\' BASS', 'qrcode_44.png', 'default.png', 'active', '2021-06-17 10:12:00', '2021-06-17 10:12:00', 1, 1),
(45, 'Wbin Bass - 1', 'P-Audio Bass \r\nR.K. vali bass', 'qrcode_45.png', 'default.png', 'active', '2021-06-17 10:14:25', '2021-06-17 10:15:03', 1, 1),
(46, 'Wbin Bass - 2', 'P-Audio Bass \r\nR.K. vali bass', 'qrcode_46.png', 'default.png', 'active', '2021-06-17 10:15:29', '2021-06-17 10:15:29', 1, 1),
(47, 'Wbin Bass - 3', 'P-Audio Bass \r\nR.K. vali bass', 'qrcode_47.png', 'default.png', 'active', '2021-06-17 10:15:57', '2021-06-17 10:15:57', 1, 1),
(48, 'Wbin Bass - 4', 'P-Audio Bass \r\nR.K. vali bass', 'qrcode_48.png', 'default.png', 'active', '2021-06-17 10:16:21', '2021-06-17 10:16:21', 1, 1),
(49, 'P-Audio Mid - 1', 'P-Audio Mid 350+350\r\nR.K. vali mid', 'qrcode_49.png', 'default.png', 'active', '2021-06-17 11:26:34', '2021-06-17 11:27:53', 1, 1),
(50, 'P-Audio Mid - 2', 'P-Audio Mid 350+350\r\nR.K. vali mid', 'qrcode_50.png', 'default.png', 'active', '2021-06-17 11:33:50', '2021-06-17 11:33:50', 1, 1),
(51, 'P-Audio Mid - 3', 'P-Audio Mid 350+350\r\nR.K. vali mid', 'qrcode_51.png', 'default.png', 'active', '2021-06-17 11:42:49', '2021-06-17 11:42:49', 1, 1),
(52, 'P-Audio Mid - 4', 'P-Audio Mid 350+350\r\nR.K. vali mid', 'qrcode_52.png', 'default.png', 'active', '2021-06-17 11:43:08', '2021-06-17 11:43:08', 1, 1),
(53, 'Bungiya 7 and 8', 'Stage dubble monitoring', 'qrcode_53.png', '1624182250_20210620_150249.jpg', 'active', '2021-06-18 06:24:56', '2021-06-20 04:14:10', 1, 1),
(54, 'Bungiya 5 and 6', 'Stage dubble monitoring', 'qrcode_54.png', '1624183322_20210620_150249.jpg', 'active', '2021-06-18 06:27:38', '2021-06-20 04:32:02', 1, 1),
(55, 'Bungiya 11 and 12', 'Stage dubble monitoring', 'qrcode_55.png', '1624183347_20210620_150249.jpg', 'active', '2021-06-18 06:28:23', '2021-06-20 04:32:27', 1, 1),
(56, 'EON 315 - 1', 'JBL EON 315\r\nPortable Self-Powered15\", Two-Way,Bass-Reflex Design', 'qrcode_56.png', '1624017794_eon315_front_z_large.jpg', 'active', '2021-06-18 06:33:14', '2021-06-18 06:35:21', 1, 1),
(57, 'EON 315 - 2', 'JBL EON 315\r\nPortable Self-Powered15\", Two-Way,Bass-Reflex Design', 'qrcode_57.png', 'default.png', 'active', '2021-06-18 06:34:55', '2021-06-18 06:34:55', 1, 1),
(58, '200 W - 1', '200W STAGE MONITORING', 'qrcode_58.png', 'default.png', 'active', '2021-06-18 06:36:48', '2021-06-18 06:36:48', 1, 1),
(59, '200 W - 2', '200W STAGE MONITORING', 'qrcode_59.png', 'default.png', 'active', '2021-06-18 06:38:07', '2021-06-18 06:38:07', 1, 1),
(60, 'Celestion cross moni - 1', 'Celestion cross stage mini monitor', 'qrcode_60.png', '1624183622_20210620_153404.jpg', 'active', '2021-06-18 06:40:57', '2021-06-20 04:39:17', 1, 1),
(61, 'Celestion cross moni - 2', 'Celestion cross stage monitor', 'qrcode_61.png', '1624183651_20210620_153404.jpg', 'active', '2021-06-18 06:41:54', '2021-06-20 04:39:00', 1, 1),
(62, '15\" Viva - 1', '15\" Viva stage Monitor', 'qrcode_62.png', '1624183271_20210620_151437.jpg', 'active', '2021-06-18 06:43:03', '2021-06-20 06:43:24', 1, 1),
(63, '15\" Viva - 2', '15\" Viva Stage Monitor', 'qrcode_63.png', '1624183722_20210620_151437.jpg', 'active', '2021-06-18 06:44:28', '2021-06-20 04:38:42', 1, 1),
(64, 'SP cross moni - 1', 'SP Cross stage monitor', 'qrcode_64.png', 'default.png', 'active', '2021-06-18 06:46:49', '2021-06-18 06:46:49', 1, 1),
(65, 'SP cross moni - 2', 'SP Cross stage monitor', 'qrcode_65.png', 'default.png', 'active', '2021-06-18 06:47:11', '2021-06-18 06:47:11', 1, 1),
(66, 'Ahuja 90w - 1', 'SMX-902/SMX-902T AHUJA\r\nTwo way compact PA wall speakers\r\nAhuja 90w mini speaker system for hall', 'qrcode_66.png', '1624018891_ahuja-pa-wall-speakers-smx-902t-500x500.png', 'active', '2021-06-18 06:48:36', '2021-06-18 11:21:52', 1, 1),
(67, 'Ahuja 90w - 2', 'SMX-902/SMX-902T AHUJA\r\nTwo way compact PA wall speakers\r\nAhuja 90w mini speaker system for hall', 'qrcode_67.png', '1624018944_ahuja-pa-wall-speakers-smx-902t-500x500.png', 'active', '2021-06-18 06:52:24', '2021-06-18 06:52:24', 1, 1),
(68, 'Ahuja 90w - 3', 'SMX-902/SMX-902T AHUJA\r\nTwo way compact PA wall speakers\r\nAhuja 90w mini speaker system for hall', 'qrcode_68.png', '1624018977_ahuja-pa-wall-speakers-smx-902t-500x500.png', 'active', '2021-06-18 06:52:57', '2021-06-18 06:52:57', 1, 1),
(69, 'Ahuja 90w - 4', 'SMX-902/SMX-902T AHUJA\r\nTwo way compact PA wall speakers\r\nAhuja 90w mini speaker system for hall', 'qrcode_69.png', '1624019019_ahuja-pa-wall-speakers-smx-902t-500x500.png', 'active', '2021-06-18 06:53:39', '2021-06-18 06:54:21', 1, 1),
(70, 'Ahuja 90w - 5', 'SMX-902/SMX-902T AHUJA\r\nTwo way compact PA wall speakers\r\nAhuja 90w mini speaker system for hall', 'qrcode_70.png', '1624019050_ahuja-pa-wall-speakers-smx-902t-500x500.png', 'active', '2021-06-18 06:54:10', '2021-06-18 06:54:11', 1, 1),
(71, 'Ahuja 90w - 6', 'SMX-902/SMX-902T AHUJA\r\nTwo way compact PA wall speakers\r\nAhuja 90w mini speaker system for hall', 'qrcode_71.png', '1624019116_ahuja-pa-wall-speakers-smx-902t-500x500.png', 'active', '2021-06-18 06:55:16', '2021-06-18 06:55:16', 1, 1),
(72, 'Dubble Speaker case - 1', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_72.png', '1624184009_20210620_154111.jpg', 'active', '2021-06-18 06:58:34', '2021-06-20 04:43:29', 1, 1),
(73, 'Dubble Speaker case 2', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_73.png', '1624184046_20210620_154111.jpg', 'active', '2021-06-18 07:00:57', '2021-06-20 04:44:59', 1, 1),
(74, 'Dubble Speaker case - 3', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_74.png', '1624184086_20210620_154111.jpg', 'active', '2021-06-18 07:01:57', '2021-06-20 04:44:46', 1, 1),
(75, 'Dubble Speaker case - 4', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_75.png', '1624184138_20210620_154111.jpg', 'active', '2021-06-18 07:02:48', '2021-06-20 04:45:38', 1, 1),
(76, 'Dubble Speaker case - 5', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_76.png', '1624184186_20210620_154111.jpg', 'active', '2021-06-18 07:04:58', '2021-06-20 04:46:26', 1, 1),
(77, 'Dubble Speaker case - 6', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_77.png', '1624184224_20210620_154111.jpg', 'active', '2021-06-18 07:06:11', '2021-06-20 04:47:04', 1, 1),
(78, 'Dubble Speaker case - 7', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_78.png', '1624184258_20210620_154111.jpg', 'active', '2021-06-18 07:07:28', '2021-06-20 04:47:38', 1, 1),
(79, 'Dubble Speaker case - 8', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_79.png', '1624184301_20210620_154111.jpg', 'active', '2021-06-18 07:08:35', '2021-06-20 04:48:21', 1, 1),
(80, 'Dubble Speaker case - 9', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_80.png', '1624184348_20210620_154111.jpg', 'active', '2021-06-18 07:10:13', '2021-06-20 04:49:08', 1, 1),
(81, 'Dubble Speaker case - 10', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_81.png', '1624184395_20210620_154111.jpg', 'active', '2021-06-18 07:10:57', '2021-06-20 04:49:55', 1, 1),
(82, 'Dubble Speaker case - 11', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_82.png', '1624184539_20210620_154111.jpg', 'active', '2021-06-18 07:12:15', '2021-06-20 04:52:19', 1, 1),
(83, 'Dubble Speaker case - 12', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_83.png', '1624184653_20210620_154111.jpg', 'active', '2021-06-18 07:16:25', '2021-06-20 04:54:13', 1, 1),
(84, 'Dubble Speaker case - 13', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_84.png', '1624184832_20210620_154111.jpg', 'active', '2021-06-18 07:17:51', '2021-06-20 04:57:12', 1, 1),
(85, 'Dubble Speaker case - 14', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_85.png', '1624184903_20210620_154111.jpg', 'active', '2021-06-18 07:18:36', '2021-06-20 04:58:23', 1, 1),
(86, 'Dubble Speaker case - 15', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_86.png', 'default.png', 'active', '2021-06-18 07:19:30', '2021-06-18 07:19:30', 1, 1),
(87, 'Dubble Speaker case - 16', 'Dubble Speakers for Ground surrounding delay system', 'qrcode_87.png', '1624184948_20210620_154111.jpg', 'active', '2021-06-18 07:20:51', '2021-06-20 04:59:31', 1, 1),
(88, 'VI 1', 'Sound Craft VI 1\r\nA complete standalone console 48 channels of analogue inputs and 16 outputs', 'qrcode_88.png', '1624020959_angle_white_background_original.png', 'active', '2021-06-18 07:25:59', '2021-06-18 07:26:00', 1, 1),
(89, 'Si IMPACT', 'Sound Craft SI IMPACT\r\nDigital Mixing Console and 32-in/16-out', 'qrcode_89.png', '1624021137_si-impact-front_original.jpg', 'active', '2021-06-18 07:28:57', '2021-06-18 07:28:57', 1, 1),
(90, 'L x 7', 'Soundcraft LX7ii console\r\nmanual console', 'qrcode_90.png', '1624021351_lx7ii_original.png', 'active', '2021-06-18 07:32:31', '2021-06-18 07:32:31', 1, 1),
(91, 'Notepad 8FX mini console', 'Sound craft Notepad 8FX\r\nSmall-format Analog Mixing Console with USB I/O and Lexicon Effects', 'qrcode_91.png', '1624021585_Soundcraft-NP-8FX-01_original.jpg', 'active', '2021-06-18 07:36:25', '2021-06-18 07:36:25', 1, 1),
(92, 'AKG Hadephone', 'AKG K44 Perception Studio Headphones', 'qrcode_92.png', '1624021850_1f669beedac0bc6b864c0633b46c6116.jpg', 'active', '2021-06-18 07:40:50', '2021-06-18 07:40:50', 1, 1),
(93, 'Crown Xti 6002 RACK - 1', 'Crown\'s XTi 2 Series \r\nXTi 6002 x 3 RACK\r\nTwo-channel, 2100W @ 4Ω Power Amplifier', 'qrcode_93.png', '1624032399_g859XTi6002-o_front.jpg', 'active', '2021-06-18 10:36:39', '2021-06-18 10:41:27', 1, 1),
(94, 'Crown Xti 6002 RACK - 2', 'Crown\'s XTi 2 Series\r\nRACK \r\nXTi 6002 x 2  , XTi 6000 x 1\r\nTwo-channel, 2100W @ 4Ω Power Amplifier', 'qrcode_94.png', '1624032752_g859XTi6002-o_front.jpg', 'active', '2021-06-18 10:42:32', '2021-06-18 10:42:32', 1, 1),
(95, 'QSC 5050', 'QSC RMX 5050a', 'qrcode_95.png', '1624032917_51T9Ia+f+7L._AC_SX425_.jpg', 'active', '2021-06-18 10:45:17', '2021-06-18 10:45:17', 1, 1),
(96, 'QSC 2000', 'QSC MX - 2000', 'qrcode_96.png', '1624033070_download.jpg', 'active', '2021-06-18 10:47:50', '2021-06-18 10:47:51', 1, 1),
(97, 'Dynatech V7000', 'Dynatech V 7000', 'qrcode_97.png', '1624033502_download.jpg', 'active', '2021-06-18 10:55:02', '2021-06-18 10:55:02', 1, 1),
(98, 'Dynatech PD 2500 - 1', 'Dynatech PD 2500\r\nDynatech PowerDrive Series Power Amplifier.', 'qrcode_98.png', '1624033673_Dynatech-PD-2500-001.jpg', 'active', '2021-06-18 10:57:53', '2021-06-18 10:57:53', 1, 1),
(99, 'Dynatech PD 2500 - 2', 'Dynatech PD 2500\r\nDynatech PowerDrive Series Power Amplifiers.', 'qrcode_99.png', '1624033737_Dynatech-PD-2500-001.jpg', 'active', '2021-06-18 10:58:57', '2021-06-18 10:58:57', 1, 1),
(100, 'Dynatech PD 2500 - 3', 'Dynatech PD 2500\r\nDynatech PowerDrive Series Power Amplifiers.', 'qrcode_100.png', '1624033802_Dynatech-PD-2500-001.jpg', 'active', '2021-06-18 11:00:02', '2021-06-18 11:00:03', 1, 1),
(101, 'Techno 5', 'SOUND STANDARD AMPLIFIER TECHNO 5', 'qrcode_101.png', '1624034078_unnamed.png', 'active', '2021-06-18 11:04:38', '2021-06-18 11:04:39', 1, 1),
(102, 'Zypher Z7 - 1', 'Zypher DS-Z7 Power Amplifier', 'qrcode_102.png', '1624034343_81X5hMBwBwL._SL1500_.jpg', 'active', '2021-06-18 11:09:03', '2021-06-18 11:09:04', 1, 1),
(103, 'Zypher Z7 - 2', 'Zypher DS-Z7 Power Amplifier.', 'qrcode_103.png', '1624034398_81X5hMBwBwL._SL1500_.jpg', 'active', '2021-06-18 11:09:58', '2021-06-18 11:09:58', 1, 1),
(104, 'HD 80+ Power Amp.', 'P. Audio\'s HD+ series of power amplifiers delivers from 600 to 7200 Watts of power in two to three rack spaces.', 'qrcode_104.png', '1624034628_unnamed.jpg', 'active', '2021-06-18 11:13:48', '2021-06-18 11:13:48', 1, 1),
(105, 'BTZ 7000 - 1', 'Ahuja BTZ-7000 AV Power Amplifier.', 'qrcode_105.png', '1624034884_ahuja-two-zone-pa-amplifier-btz-7000-500x500.jpg', 'active', '2021-06-18 11:18:04', '2021-06-18 11:18:24', 1, 1),
(106, 'BTZ 7000 - 2', 'Ahuja BTZ-7000 AV Power Amplifier.', 'qrcode_106.png', '1624034950_ahuja-two-zone-pa-amplifier-btz-7000-500x500.jpg', 'active', '2021-06-18 11:19:10', '2021-06-25 01:10:01', 1, 1),
(107, 'BTZ 7000 - 3', 'Ahuja BTZ-7000 AV Power Amplifier.', 'qrcode_107.png', '1624035027_ahuja-two-zone-pa-amplifier-btz-7000-500x500.jpg', 'active', '2021-06-18 11:20:27', '2021-06-18 11:20:27', 1, 1),
(108, 'BTZ 250+250', 'Ahuja BTZ 250+250', 'qrcode_108.png', '1624035599_ahuja-two-zone-pa-amplifier-btz-7000-500x500.jpg', 'active', '2021-06-18 11:29:59', '2021-06-18 11:29:59', 1, 1),
(109, 'BTZ 250+250', 'Ahuja BTZ 250+250', 'qrcode_109.png', '1624035599_ahuja-two-zone-pa-amplifier-btz-7000-500x500.jpg', 'active', '2021-06-18 11:29:59', '2021-06-18 11:30:00', 1, 1),
(110, 'Stranger PBT 501 - 1', 'PBT 501 Stranger Power Amplifier.', 'qrcode_110.png', '1624036151_download.jpg', 'active', '2021-06-18 11:39:11', '2021-06-18 11:40:01', 1, 1),
(111, 'Stranger PBT 501 - 2', 'PBT 501 Stranger Power Amplifier.', 'qrcode_111.png', '1624036393_download.jpg', 'active', '2021-06-18 11:43:13', '2021-06-18 11:43:13', 1, 1),
(112, 'BR 250w RACK - 1', 'Ahuja BR 250 250 W AV Power Amplifier,\r\nRACK\r\nBR 250w  x  4', 'qrcode_112.png', '1624118803_images.jpg', 'active', '2021-06-19 10:36:43', '2021-06-19 10:36:43', 1, 1),
(113, 'BR 250w RACK - 2', 'Ahuja BR 250 250 W AV Power Amplifier \r\nRACK\r\nBR 250w  x  4', 'qrcode_113.png', '1624118892_images.jpg', 'active', '2021-06-19 10:38:12', '2021-06-19 10:38:12', 1, 1),
(114, 'BR 250w RACK - 3', 'Ahuja BR 250 250 W AV Power Amplifier \r\nRACK\r\nBR 250w  x  2', 'qrcode_114.png', '1624118952_images.jpg', 'active', '2021-06-19 10:39:12', '2021-06-19 10:39:12', 1, 1),
(115, 'BR 250w - 11', 'Ahuja BR 250 250 W AV Power Amplifier.', 'qrcode_115.png', '1624119066_images.jpg', 'active', '2021-06-19 10:41:06', '2021-06-19 10:41:06', 1, 1),
(116, 'BR 250w - 12', 'Ahuja BR 250 250 W AV Power Amplifier', 'qrcode_116.png', '1624119159_images.jpg', 'active', '2021-06-19 10:42:16', '2021-06-19 10:42:39', 1, 1),
(117, 'BR 250w - 13', 'Ahuja BR 250 250 W AV Power Amplifier', 'qrcode_117.png', '1624119204_images.jpg', 'active', '2021-06-19 10:43:24', '2021-06-19 10:43:24', 1, 1),
(118, 'BR 250w - 14', 'Ahuja BR 250 250 W AV Power Amplifier', 'qrcode_118.png', '1624119242_images.jpg', 'active', '2021-06-19 10:44:02', '2021-06-19 10:44:02', 1, 1),
(119, 'BR 250w - 15', 'Ahuja BR 250 250 W AV Power Amplifier', 'qrcode_119.png', '1624119279_images.jpg', 'active', '2021-06-19 10:44:39', '2021-06-19 10:44:39', 1, 1),
(120, 'BR 250w - 16', 'Ahuja BR 250 250 W AV Power Amplifier', 'qrcode_120.png', '1624119315_images.jpg', 'active', '2021-06-19 10:45:15', '2021-06-19 10:45:15', 1, 1),
(121, 'BR 250w - 17', 'Ahuja BR 250 250 W AV Power Amplifier', 'qrcode_121.png', '1624119347_images.jpg', 'active', '2021-06-19 10:45:47', '2021-06-19 10:45:47', 1, 1),
(122, 'BR 500w - 18', 'Ahuja BR 250 250 W AV Power Amplifier', 'qrcode_122.png', '1624174964_41nTjcjCx7L.jpg', 'active', '2021-06-19 10:46:33', '2021-06-20 02:12:44', 1, 1),
(123, 'Ahuja 225w - 1', 'Ahuja 225w', 'qrcode_123.png', 'default.png', 'active', '2021-06-19 10:47:51', '2021-06-19 10:48:18', 1, 1),
(124, 'Ahuja 225w - 2', 'Ahuja 225', 'qrcode_124.png', 'default.png', 'active', '2021-06-19 10:53:09', '2021-06-19 10:53:09', 1, 1),
(125, 'Panel board black - 1', 'POWERSAFE\r\n110KV 3-Phase Panel Board', 'qrcode_125.png', '1624121463_20210618_184256 1111111111.jpg', 'active', '2021-06-19 11:21:03', '2021-06-20 06:42:12', 1, 1),
(126, 'Panel board white - 2', 'POWERSAFE\r\n70KV 3-Phase Panel Board', 'qrcode_126.png', '1624121620_20210618_184413 111111.jpg', 'active', '2021-06-19 11:23:40', '2021-06-19 11:27:56', 1, 1),
(127, 'Stabilizer 10KV - 1', '10KV Stabilizer \r\nProtek Power\r\nVoltage Stabilizers - Digital voltage stabilizer for AC, Voltage Stabilizer', 'qrcode_127.png', '1624121855_autocup-stabilizer.jpg', 'active', '2021-06-19 11:27:35', '2021-06-19 11:28:09', 1, 1),
(128, 'Stabilizer 10KV - 2', '10KV Stabilizer \r\nProtek Power\r\nVoltage Stabilizers - Digital voltage stabilizer for AC, Voltage Stabilizer', 'qrcode_128.png', '1624121921_autocup-stabilizer.jpg', 'active', '2021-06-19 11:28:41', '2021-06-19 11:28:41', 1, 1),
(129, 'Stabilizer 10KV - 3', '10KV Stabilizer \r\nProtek Power\r\nVoltage Stabilizers - Digital voltage stabilizer for AC, Voltage Stabilizer', 'qrcode_129.png', '1624121953_autocup-stabilizer.jpg', 'active', '2021-06-19 11:29:13', '2021-06-19 11:29:13', 1, 1),
(130, 'Stabilizer 10KV - 3', '10KV Stabilizer \r\nProtek Power\r\nVoltage Stabilizers - Digital voltage stabilizer for AC, Voltage Stabilizer', 'qrcode_130.png', '1624121953_autocup-stabilizer.jpg', 'active', '2021-06-19 11:29:13', '2021-06-20 07:36:49', 1, 1),
(131, 'Stabilizer 6KV - 1', '6KV Stabilizer \r\nKeprej\r\nVoltage Stabilizers - Digital voltage stabilizer for AC, Voltage Stabilizer', 'qrcode_131.png', 'default.png', 'active', '2021-06-19 11:31:03', '2021-06-19 11:32:06', 1, 1),
(132, 'Stabilizer 6KV - 2', '6KV Stabilizer \r\nKeprej\r\nVoltage Stabilizers - Digital voltage stabilizer for AC, Voltage Stabilizer', 'qrcode_132.png', 'default.png', 'active', '2021-06-19 11:31:44', '2021-06-19 11:31:44', 1, 1),
(133, 'Stabilizer 5KV - 1', '5KV Stabilizer \r\nKeprej\r\nVoltage Stabilizers - Digital voltage stabilizer for AC, Voltage Stabilizer', 'qrcode_133.png', 'default.png', 'active', '2021-06-19 11:34:51', '2021-06-23 23:47:09', 1, 1),
(134, 'Ahuja Unit with LT Case - 1', 'AHUJA AU 40XT DRIVER UNIT WITH TRANSFORM FOR REFLEX HORN,\r\nPA Driver unit with 100W', 'qrcode_134.png', '1624185541_download unit with lt.jpg', 'active', '2021-06-20 05:09:01', '2021-06-20 05:11:48', 1, 1),
(135, 'Ahuja Unit with LT Case - 2', 'AHUJA AU 40XT DRIVER UNIT WITH TRANSFORM FOR REFLEX HORN,\r\nPA Driver unit with 100W', 'qrcode_135.png', '1624186025_download unit with lt.jpg', 'active', '2021-06-20 05:17:05', '2021-06-20 05:34:47', 1, 1),
(137, 'Ahuja Unit without LT', 'Ahuja Unit without LT', 'qrcode_137.png', '1624187424_61vSyOP7a8L._SL1000_.jpg', 'active', '2021-06-20 05:40:24', '2021-06-20 05:40:25', 1, 1),
(138, 'Ahuja 150W - 1', 'Ahuja 150w', 'qrcode_138.png', '1624187707_ahuja-speakers-250x250.jpg', 'active', '2021-06-20 05:45:07', '2021-06-20 07:29:06', 1, 1),
(139, 'Ahuja 150w - 2', 'Ahuja 150w -', 'qrcode_139.png', '1624194382_ahuja-speakers-250x250.jpg', 'active', '2021-06-20 07:36:22', '2021-06-20 07:36:22', 1, 1),
(140, '16-chennal drum - 1', 'Snake Cables on a Reel  \r\n Stage Snake Cables \r\n XLR Snake Cables', 'qrcode_140.png', '1624204924_images.jpg', 'active', '2021-06-20 10:32:04', '2021-06-20 10:34:56', 1, 1),
(141, '4-chennal XLR drum', 'XLR DRUM 4-chennal', 'qrcode_141.png', 'default.png', 'active', '2021-06-20 10:32:52', '2021-06-20 10:32:52', 1, 1),
(142, 'UPS - 1', 'APC UPS 2KVA', 'qrcode_142.png', '1624205518_maxresdefault.jpg', 'active', '2021-06-20 10:41:58', '2021-06-23 23:46:11', 1, 1),
(143, 'UPS - 2', 'APC UPS 1KVA', 'qrcode_143.png', 'default.png', 'active', '2021-06-20 10:50:47', '2021-06-20 10:50:47', 1, 1),
(144, 'Aluminium  Trumpet Horn, -1', 'Aluminium  Trumpet Horn,', 'qrcode_144.png', '1624513791_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:19:51', '2021-06-24 00:45:22', 1, 1),
(145, 'Aluminium  Trumpet Horn, -2', 'Aluminium  Trumpet Horn,', 'qrcode_145.png', '1624514504_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:31:44', '2021-06-24 00:31:44', 1, 1),
(146, 'Aluminium  Trumpet Horn, -3', 'Aluminium  Trumpet Horn,', 'qrcode_146.png', '1624514781_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:36:21', '2021-06-24 00:36:21', 1, 1),
(147, 'Aluminium  Trumpet Horn, -4', 'Aluminium  Trumpet Horn,', 'qrcode_147.png', '1624514835_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:37:15', '2021-06-24 00:43:51', 1, 1),
(148, 'Aluminium  Trumpet Horn, -5', 'Aluminium  Trumpet Horn,', 'qrcode_148.png', '1624514929_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:38:49', '2021-06-24 00:38:49', 1, 1),
(149, 'Aluminium  Trumpet Horn, -6', 'Aluminium  Trumpet Horn,', 'qrcode_149.png', '1624514976_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:39:36', '2021-06-24 00:39:36', 1, 1),
(150, 'Aluminium  Trumpet Horn, -7', 'Aluminium  Trumpet Horn,', 'qrcode_150.png', '1624515046_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:40:46', '2021-06-24 00:44:11', 1, 1),
(151, 'Aluminium  Trumpet Horn, -8', 'Aluminium  Trumpet Horn,', 'qrcode_151.png', '1624515304_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:45:04', '2021-06-24 00:45:04', 1, 1),
(152, 'Aluminium  Trumpet Horn, -9', 'Aluminium  Trumpet Horn,', 'qrcode_152.png', '1624515389_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:46:29', '2021-06-24 00:46:30', 1, 1),
(153, 'Aluminium  Trumpet Horn, -10', 'Aluminium  Trumpet Horn,', 'qrcode_153.png', '1624515713_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:51:53', '2021-06-24 00:51:54', 1, 1),
(154, 'Aluminium  Trumpet Horn, -11', 'Aluminium  Trumpet Horn,', 'qrcode_154.png', '1624516121_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:58:41', '2021-06-24 00:58:41', 1, 1),
(155, 'Aluminium  Trumpet Horn, -12', 'Aluminium  Trumpet Horn,', 'qrcode_155.png', '1624516184_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 00:59:44', '2021-06-24 00:59:44', 1, 1),
(156, 'Aluminium  Trumpet Horn, -13', 'Aluminium  Trumpet Horn,', 'qrcode_156.png', '1624516222_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 01:00:22', '2021-06-24 01:00:22', 1, 1),
(157, 'Aluminium  Trumpet Horn, -14', 'Aluminium  Trumpet Horn,', 'qrcode_157.png', '1624516262_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 01:01:02', '2021-06-24 01:01:03', 1, 1),
(158, 'Aluminium  Trumpet Horn, -15', 'Aluminium  Trumpet Horn,', 'qrcode_158.png', '1624516386_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 01:03:06', '2021-06-24 01:03:06', 1, 1),
(159, 'Aluminium  Trumpet Horn, -16', 'Aluminium  Trumpet Horn,', 'qrcode_159.png', '1624516435_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 01:03:55', '2021-06-24 01:03:55', 1, 1),
(160, 'Aluminium  Trumpet Horn, -17', 'Aluminium  Trumpet Horn,', 'qrcode_160.png', '1624516482_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 01:04:42', '2021-06-24 01:04:42', 1, 1),
(161, 'Aluminium  Trumpet Horn, -18', '`Aluminium  Trumpet Horn,', 'qrcode_161.png', '1624516539_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 01:05:39', '2021-06-24 01:05:39', 1, 1),
(162, 'Aluminium  Trumpet Horn, -19', 'Aluminium  Trumpet Horn,', 'qrcode_162.png', '1624516702_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 01:08:22', '2021-06-24 01:08:23', 1, 1),
(163, 'Aluminium  Trumpet Horn, 20', 'Aluminium  Trumpet Horn,', 'qrcode_163.png', '1624516760_aluminum-loud-speaker-trumpet-horn-500x500.jpg', 'active', '2021-06-24 01:09:20', '2021-06-24 01:16:54', 1, 1),
(164, 'Ahuja B,tayp Model Aluminium   Horn, 1', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_164.png', '1624517544_A HOR4A.jpg', 'active', '2021-06-24 01:22:24', '2021-06-24 01:22:36', 1, 1),
(165, 'Ahuja B,tayp Model Aluminium   Horn, 2', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_165.png', '1624517622_A HOR4A.jpg', 'active', '2021-06-24 01:23:42', '2021-06-24 01:23:42', 1, 1),
(166, 'Ahuja B,tayp Model Aluminium   Horn, 3', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_166.png', '1624517679_A HOR4A.jpg', 'active', '2021-06-24 01:24:39', '2021-06-24 01:24:39', 1, 1),
(167, 'Ahuja B,tayp Model Aluminium   Horn, 4', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_167.png', '1624517732_A HOR4A.jpg', 'active', '2021-06-24 01:25:32', '2021-06-24 01:25:32', 1, 1),
(168, 'Ahuja B,tayp Model Aluminium   Horn, 5', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_168.png', '1624517814_A HOR4A.jpg', 'active', '2021-06-24 01:26:54', '2021-06-24 01:26:54', 1, 1),
(169, 'Ahuja B,tayp Model Aluminium   Horn, 6', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_169.png', '1624517897_A HOR4A.jpg', 'active', '2021-06-24 01:28:17', '2021-06-24 01:28:17', 1, 1),
(170, 'Ahuja B,tayp Model Aluminium   Horn, 7', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_170.png', '1624517956_A HOR4A.jpg', 'active', '2021-06-24 01:29:16', '2021-06-24 01:29:35', 1, 1),
(171, 'Ahuja B,tayp Model Aluminium   Horn, 8', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_171.png', '1624518166_A HOR4A.jpg', 'active', '2021-06-24 01:32:46', '2021-06-24 01:34:35', 1, 1),
(172, 'Ahuja B,tayp Model Aluminium   Horn, 9', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_172.png', '1624518350_A HOR4A.jpg', 'active', '2021-06-24 01:35:50', '2021-06-24 01:35:50', 1, 1),
(173, 'Ahuja B,tayp Model Aluminium   Horn, 10', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_173.png', '1624518461_A HOR4A.jpg', 'active', '2021-06-24 01:37:41', '2021-06-24 01:37:41', 1, 1),
(174, 'Ahuja B,tayp Model Aluminium   Horn, 11', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_174.png', '1624518501_A HOR4A.jpg', 'active', '2021-06-24 01:38:21', '2021-06-24 01:38:21', 1, 1),
(175, 'Ahuja B,tayp Model Aluminium   Horn, 12', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_175.png', '1624518545_A HOR4A.jpg', 'active', '2021-06-24 01:39:05', '2021-06-24 01:39:05', 1, 1),
(176, 'Ahuja B,tayp Model Aluminium   Horn, 13', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_176.png', '1624518580_A HOR4A.jpg', 'active', '2021-06-24 01:39:40', '2021-06-24 01:39:41', 1, 1),
(177, 'Ahuja B,tayp Model Aluminium   Horn, 14', '`Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_177.png', '1624518615_A HOR4A.jpg', 'active', '2021-06-24 01:40:15', '2021-06-24 01:40:15', 1, 1),
(178, 'Ahuja B,tayp Model Aluminium   Horn, 15', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_178.png', '1624518652_A HOR4A.jpg', 'active', '2021-06-24 01:40:52', '2021-06-25 00:54:53', 1, 1),
(179, 'Ahuja B,tayp Model Aluminium   Horn, 16', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_179.png', '1624518734_A HOR4A.jpg', 'active', '2021-06-24 01:42:14', '2021-06-24 01:42:14', 1, 1),
(180, 'Ahuja B,tayp Model Aluminium   Horn, 17', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_180.png', '1624518772_A HOR4A.jpg', 'active', '2021-06-24 01:42:52', '2021-06-24 01:42:52', 1, 1),
(181, 'Ahuja B,tayp Model Aluminium   Horn, 18', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_181.png', '1624518824_A HOR4A.jpg', 'active', '2021-06-24 01:43:44', '2021-06-24 01:43:44', 1, 1),
(182, 'Ahuja B,tayp Model Aluminium   Horn, 19', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_182.png', '1624518870_A HOR4A.jpg', 'active', '2021-06-24 01:44:30', '2021-06-24 01:44:30', 1, 1),
(183, 'Ahuja B,tayp Model Aluminium   Horn, 20', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_183.png', '1624518920_A HOR4A.jpg', 'active', '2021-06-24 01:45:20', '2021-06-24 01:45:20', 1, 1),
(184, 'Ahuja B,tayp Model Aluminium   Horn, 21', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_184.png', '1624518987_A HOR4A.jpg', 'active', '2021-06-24 01:46:27', '2021-06-24 01:46:27', 1, 1),
(185, 'Ahuja B,tayp Model Aluminium   Horn, 22', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_185.png', '1624519060_A HOR4A.jpg', 'active', '2021-06-24 01:47:40', '2021-06-24 01:47:40', 1, 1),
(186, 'Ahuja B,tayp Model Aluminium   Horn, 23', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_186.png', '1624519109_A HOR4A.jpg', 'active', '2021-06-24 01:48:29', '2021-06-24 01:48:29', 1, 1),
(187, 'Ahuja B,tayp Model Aluminium   Horn, 24', 'Ahuja B,tayp Model Aluminium   Horn,', 'qrcode_187.png', '1624519152_A HOR4A.jpg', 'active', '2021-06-24 01:49:12', '2021-06-24 01:49:12', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
