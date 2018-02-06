-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Feb 06, 2018 at 05:24 PM
-- Server version: 8.0.4-rc-log
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cookery`
--

-- --------------------------------------------------------

--
-- Table structure for table `COMMENTS`
--

CREATE TABLE `COMMENTS` (
  `COM_ID` int(11) NOT NULL,
  `RCP_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `COMMENT` text NOT NULL,
  `IS_DEL` varchar(1) NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `COMMENTS`
--

INSERT INTO `COMMENTS` (`COM_ID`, `RCP_ID`, `USER_ID`, `COMMENT`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(9, 3, 1, 'TEST COMMENT', 'Y', '2017-12-06 18:32:20', NULL),
(10, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 18:36:44', NULL),
(11, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 18:37:27', NULL),
(12, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 18:37:32', NULL),
(13, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 18:37:43', NULL),
(14, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 18:38:21', NULL),
(15, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 18:39:02', NULL),
(16, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 21:06:47', NULL),
(17, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 21:19:48', NULL),
(18, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 21:19:50', NULL),
(19, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 21:19:52', NULL),
(20, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 21:19:54', NULL),
(21, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 21:19:55', NULL),
(22, 3, 1, 'TEST COMMENT', 'N', '2017-12-06 21:19:57', NULL),
(23, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 11:33:16', NULL),
(24, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 11:54:36', NULL),
(25, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 12:05:45', NULL),
(26, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 12:23:59', NULL),
(27, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 12:24:00', NULL),
(28, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 12:24:00', NULL),
(29, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 12:24:02', NULL),
(30, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 12:24:02', NULL),
(31, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 12:24:02', NULL),
(32, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 15:03:11', NULL),
(33, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 15:03:26', NULL),
(34, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 15:03:30', NULL),
(35, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 15:04:01', NULL),
(36, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 15:04:07', NULL),
(37, 3, 1, 'TEST COMMENT', 'N', '2017-12-07 15:14:05', NULL),
(38, 3, 1, 'TEST COMMENT', 'N', '2017-12-09 02:33:20', NULL),
(39, 3, 1, 'TEST COMMENT', 'N', '2017-12-09 02:33:21', NULL),
(40, 3, 1, 'TEST COMMENT', 'N', '2017-12-09 02:33:23', NULL),
(41, 3, 1, 'TEST COMMENT', 'N', '2017-12-09 02:33:24', NULL),
(42, 3, 1, 'TEST COMMENT', 'N', '2017-12-09 02:33:24', NULL),
(43, 3, 1, 'TEST COMMENT', 'N', '2017-12-09 03:05:58', NULL),
(44, 3, 1, 'TEST COMMENT', 'N', '2017-12-12 15:30:57', NULL),
(45, 3, 1, 'TEST COMMENT', 'N', '2017-12-13 15:39:10', NULL),
(46, 3, 1, 'TEST COMMENT', 'N', '2017-12-14 11:02:00', NULL),
(47, 3, 1, 'TEST COMMENT', 'N', '2017-12-15 15:02:35', NULL),
(48, 103, 1, 'TEST COMMENT', 'Y', '2017-12-15 20:19:16', NULL),
(49, 103, 1, 'TEST COMMENT', 'Y', '2017-12-16 22:49:06', NULL),
(50, 103, 1, 'TEST COMMENT', 'N', '2017-12-17 14:22:44', NULL),
(51, 103, 1, '123456789', 'Y', '2017-12-17 19:33:36', NULL),
(52, 103, 1, 'TEST COMMENT', 'N', '2017-12-17 19:39:46', NULL),
(53, 103, 1, 'TEST COMMENT', 'N', '2017-12-18 09:54:07', NULL),
(54, 103, 1, 'TEST COMMENT', 'N', '2017-12-18 10:11:13', NULL),
(55, 103, 1, 'TEST COMMENT-62', 'N', '2017-12-18 15:31:25', NULL),
(56, 103, 1, 'TEST COMMENT-01', 'N', '2017-12-19 19:58:35', NULL),
(57, 103, 1, 'TEST COMMENT-15', 'N', '2017-12-21 09:27:24', NULL),
(58, 103, 1, 'I follow this user from past 1 year. His cooking skills are beyond this world. I personally like his Italian sweet dishes. Waiting for his next dishes eagerly.', 'N', '2017-12-22 17:45:08', NULL),
(59, 103, 1, 'Hello test', 'N', '2017-12-22 17:51:00', NULL),
(60, 103, 1, 'test 1234567', 'N', '2017-12-22 17:51:42', NULL),
(61, 103, 1, 'test 12345', 'N', '2017-12-22 17:59:17', NULL),
(62, 103, 1, 'TEST COMMENT-26', 'N', '2017-12-28 09:23:50', NULL),
(63, 103, 1, 'TEST COMMENT-22', 'N', '2017-12-30 08:57:05', NULL),
(64, 103, 1, 'Hii', 'N', '2018-01-16 00:56:08', NULL),
(65, 103, 1, 'Hi', 'N', '2018-01-16 00:56:09', NULL),
(66, 103, 1, 'Ndnd', 'N', '2018-01-16 23:46:25', NULL),
(67, 103, 1, 'Ndnd', 'N', '2018-01-16 23:46:26', NULL),
(68, 103, 1, 'Jdnd', 'N', '2018-01-16 23:46:42', NULL),
(69, 103, 1, 'Jdnd', 'N', '2018-01-16 23:46:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CONTAINS`
--

CREATE TABLE `CONTAINS` (
  `CONT_ID` int(11) NOT NULL,
  `ING_ID` int(11) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DISH`
--

CREATE TABLE `DISH` (
  `DISH_ID` int(11) NOT NULL,
  `RCP_ID` int(11) NOT NULL,
  `ING_OR_AKA_ID` int(11) NOT NULL,
  `QTY_ID` int(11) NOT NULL,
  `ING_QTY` int(11) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DISH`
--

INSERT INTO `DISH` (`DISH_ID`, `RCP_ID`, `ING_OR_AKA_ID`, `QTY_ID`, `ING_QTY`, `CREATE_DTM`, `MOD_DTM`) VALUES
(5, 4, 2, 1, 1, '2017-09-10 05:57:07', NULL),
(6, 4, 1, 1, 1, '2017-09-10 05:57:07', NULL),
(7, 5, 1, 1, 1, '2017-09-10 06:36:11', NULL),
(8, 5, 2, 1, 1, '2017-09-10 06:36:11', NULL),
(9, 6, 1, 1, 1, '2017-09-10 06:39:44', NULL),
(10, 6, 2, 1, 1, '2017-09-10 06:39:44', NULL),
(11, 7, 1, 1, 1, '2017-09-10 06:39:53', NULL),
(12, 7, 2, 1, 1, '2017-09-10 06:39:53', NULL),
(13, 8, 4, 3, 3, '2017-09-10 06:42:49', NULL),
(14, 9, 2, 4, 5, '2017-09-15 14:04:57', NULL),
(15, 10, 1, 1, 1, '2017-09-15 14:54:58', NULL),
(16, 11, 1, 1, 1, '2017-09-23 04:24:14', NULL),
(17, 12, 1, 1, 1, '2017-09-23 04:24:20', NULL),
(18, 13, 1, 1, 1, '2017-09-23 04:24:27', NULL),
(19, 14, 1, 1, 1, '2017-09-23 04:24:28', NULL),
(20, 15, 1, 1, 1, '2017-09-23 04:24:36', NULL),
(21, 16, 1, 1, 1, '2017-09-23 04:24:38', NULL),
(22, 17, 1, 1, 1, '2017-09-23 04:27:36', NULL),
(23, 18, 1, 1, 1, '2017-09-23 05:04:47', NULL),
(24, 19, 2, 1, 1, '2017-09-23 05:23:14', NULL),
(25, 20, 1, 1, 1, '2017-09-23 05:38:49', NULL),
(26, 21, 1, 1, 1, '2017-09-23 05:45:07', NULL),
(27, 22, 1, 1, 1, '2017-09-23 15:41:17', NULL),
(28, 23, 3, 1, 1, '2017-09-23 16:01:51', NULL),
(29, 24, 4, 4, 1, '2017-09-23 16:16:54', NULL),
(30, 25, 4, 1, 1, '2017-09-24 09:38:24', NULL),
(31, 26, 1, 1, 1, '2017-09-26 14:04:10', NULL),
(32, 27, 1, 1, 1, '2017-09-26 14:25:56', NULL),
(33, 28, 2, 1, 1, '2017-10-29 10:43:28', NULL),
(34, 29, 1, 1, 1, '2017-10-29 10:46:35', NULL),
(35, 30, 1, 1, 1, '2017-10-29 10:50:30', NULL),
(36, 31, 1, 1, 1, '2017-10-29 10:57:06', NULL),
(37, 32, 2, 1, 1, '2017-10-29 11:08:48', NULL),
(38, 34, 1, 1, 1, '2017-10-29 11:18:04', NULL),
(39, 35, 1, 1, 1, '2017-10-29 11:25:15', NULL),
(40, 38, 1, 1, 1, '2017-10-29 11:37:12', NULL),
(41, 39, 2, 1, 1, '2017-10-29 11:42:49', NULL),
(42, 40, 1, 1, 1, '2017-10-29 11:46:08', NULL),
(43, 41, 1, 1, 1, '2017-10-29 11:46:48', NULL),
(44, 42, 1, 1, 1, '2017-10-29 12:16:13', NULL),
(45, 43, 1, 1, 1, '2017-10-29 12:17:41', NULL),
(46, 44, 1, 1, 1, '2017-10-29 12:18:37', NULL),
(47, 45, 1, 1, 1, '2017-10-29 12:20:39', NULL),
(48, 46, 1, 1, 1, '2017-10-29 12:26:05', NULL),
(49, 47, 1, 1, 1, '2017-10-29 12:30:20', NULL),
(50, 48, 0, 1, 1, '2017-10-29 12:31:59', NULL),
(51, 49, 1, 1, 1, '2017-10-29 12:33:52', NULL),
(52, 50, 1, 1, 1, '2017-10-29 12:49:54', NULL),
(53, 51, 1, 1, 1, '2017-10-31 08:37:33', NULL),
(54, 52, 2, 1, 1, '2017-11-11 09:32:47', NULL),
(55, 53, 2, 1, 1, '2017-11-11 09:47:30', NULL),
(56, 54, 2, 1, 1, '2017-11-11 10:28:46', NULL),
(57, 55, 2, 1, 1, '2017-11-11 10:36:19', NULL),
(58, 56, 2, 1, 1, '2017-11-11 10:38:00', NULL),
(59, 57, 2, 1, 1, '2017-11-11 10:40:49', NULL),
(60, 58, 2, 1, 1, '2017-11-11 10:48:31', NULL),
(61, 59, 2, 1, 1, '2017-11-11 10:50:56', NULL),
(62, 60, 2, 1, 1, '2017-11-11 10:57:18', NULL),
(63, 61, 2, 1, 1, '2017-11-11 11:00:27', NULL),
(64, 62, 2, 1, 1, '2017-11-11 11:02:17', NULL),
(68, 66, 2, 1, 1, '2017-11-11 11:25:57', NULL),
(73, 71, 2, 1, 1, '2017-11-11 11:35:16', NULL),
(75, 73, 2, 1, 1, '2017-11-11 11:37:59', NULL),
(78, 76, 1, 1, 1, '2017-12-03 11:17:31', NULL),
(79, 77, 1, 1, 1, '2017-12-03 11:17:42', NULL),
(80, 78, 2, 1, 81, '2017-12-03 11:23:26', NULL),
(81, 78, 1, 3, 5, '2017-12-03 11:23:26', NULL),
(82, 79, 1, 1, 1, '2017-12-03 11:31:16', NULL),
(83, 80, 1, 1, 1, '2017-12-03 11:34:45', NULL),
(84, 81, 1, 1, 1, '2017-12-03 11:36:13', NULL),
(95, 87, 1, 1, 5, '2017-12-06 15:15:43', NULL),
(96, 87, 2, 2, 6, '2017-12-06 15:15:43', NULL),
(97, 88, 1, 1, 5, '2017-12-06 15:16:58', NULL),
(98, 88, 2, 2, 6, '2017-12-06 15:16:58', NULL),
(99, 89, 1, 1, 5, '2017-12-06 15:17:53', NULL),
(100, 89, 2, 2, 6, '2017-12-06 15:17:53', NULL),
(101, 90, 1, 1, 5, '2017-12-06 15:20:48', NULL),
(102, 90, 2, 2, 6, '2017-12-06 15:20:48', NULL),
(103, 91, 1, 1, 5, '2017-12-06 15:23:47', NULL),
(104, 91, 2, 2, 6, '2017-12-06 15:23:47', NULL),
(149, 3, 1, 1, 5, '2017-12-08 06:30:00', NULL),
(150, 3, 2, 2, 6, '2017-12-08 06:30:00', NULL),
(151, 103, 1, 1, 5, '2017-12-19 19:45:19', NULL),
(152, 103, 2, 2, 6, '2017-12-19 19:45:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `FAVOURITES`
--

CREATE TABLE `FAVOURITES` (
  `FAV_ID` int(11) NOT NULL,
  `RCP_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `IS_DEL` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FAVOURITES`
--

INSERT INTO `FAVOURITES` (`FAV_ID`, `RCP_ID`, `USER_ID`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(4, 66, 1, 'N', '2018-02-04 02:40:53', '2018-02-04 03:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `FOOD_CUISINE`
--

CREATE TABLE `FOOD_CUISINE` (
  `FOOD_CSN_ID` int(11) NOT NULL,
  `FOOD_CSN_NAME` varchar(25) NOT NULL,
  `IS_DEF` varchar(1) NOT NULL DEFAULT 'N',
  `IMG` varchar(50) NOT NULL DEFAULT 'images/png.png',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FOOD_CUISINE`
--

INSERT INTO `FOOD_CUISINE` (`FOOD_CSN_ID`, `FOOD_CSN_NAME`, `IS_DEF`, `IMG`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'INDIAN', 'Y', 'images/png.png', '2017-08-27 00:00:00', NULL),
(2, 'THAI', 'N', 'images/png.png', '2017-08-27 00:00:00', NULL),
(3, 'MAXICAN', 'N', 'images/png.png', '2017-08-27 00:00:00', NULL),
(4, 'CHINESE', 'N', 'images/png.png', '2017-08-27 00:00:00', NULL),
(5, 'NORTH INDIAN', 'N', 'images/png.png', '2017-08-27 00:00:00', NULL),
(6, 'SOUTH INDIAN', 'N', 'images/png.png', '2017-08-27 00:00:00', NULL),
(7, 'SPANISH', 'N', 'images/png.png', '2017-08-27 00:00:00', NULL),
(8, 'MUGHALAI', 'N', 'images/png.png', '2017-08-27 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `FOOD_TYPE`
--

CREATE TABLE `FOOD_TYPE` (
  `FOOD_TYP_ID` int(11) NOT NULL,
  `FOOD_TYP_NAME` varchar(25) NOT NULL,
  `IS_DEF` varchar(1) NOT NULL DEFAULT 'N',
  `IMG` varchar(50) NOT NULL DEFAULT 'images/cake.jpg',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FOOD_TYPE`
--

INSERT INTO `FOOD_TYPE` (`FOOD_TYP_ID`, `FOOD_TYP_NAME`, `IS_DEF`, `IMG`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'BREAKFAST', 'N', 'images/cake.jpg', '2017-08-27 00:00:00', NULL),
(2, 'LUNCH', 'N', 'images/cake.jpg', '2017-08-27 00:00:00', NULL),
(3, 'DINNER', 'Y', 'images/cake.jpg', '2017-08-27 00:00:00', NULL),
(4, 'SNACKS', 'N', 'images/cake.jpg', '2017-08-27 00:00:00', NULL),
(5, 'DESSERT', 'N', 'images/cake.jpg', '2017-08-27 00:00:00', NULL),
(6, 'STARTER', 'N', 'images/cake.jpg', '2017-08-27 00:00:00', NULL),
(7, 'DRINKS', 'N', 'images/cake.jpg', '2017-08-27 00:00:00', NULL),
(8, 'OTHERS', 'N', 'images/cake.jpg', '2017-08-27 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `INGREDIENT`
--

CREATE TABLE `INGREDIENT` (
  `ING_ID` int(11) NOT NULL,
  `ING_NAME` varchar(25) NOT NULL,
  `IMG` varchar(50) NOT NULL DEFAULT 'images/cake.jpg',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `INGREDIENT`
--

INSERT INTO `INGREDIENT` (`ING_ID`, `ING_NAME`, `IMG`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'GINGER', '', '2017-09-08 00:00:00', NULL),
(2, 'TURMERIC', '', '2017-09-08 00:00:00', NULL),
(3, 'SALT', '', '2017-09-08 00:00:00', NULL),
(4, 'ONION', '', '2017-09-08 00:00:00', NULL),
(7, 'CORN FLOUR', 'images/cake.jpg', '2017-12-30 14:36:23', NULL),
(8, 'GARLIC', 'images/cake.jpg', '2017-12-30 14:36:23', NULL),
(9, 'Tofu', 'images/cake.jpg', '2017-12-30 14:38:48', NULL),
(10, 'Onions', 'images/cake.jpg', '2017-12-30 14:38:49', NULL),
(11, 'Gallor', 'images/cake.jpg', '2017-12-30 15:09:31', NULL),
(12, 'Paneer', 'images/cake.jpg', '2017-12-30 15:11:48', NULL),
(13, 'Gin', 'images/cake.jpg', '2017-12-30 23:23:32', NULL),
(14, 'Hff', 'images/cake.jpg', '2018-01-12 22:02:29', NULL),
(15, 'Garam Masala', 'images/cake.jpg', '2018-01-12 23:25:37', NULL),
(16, 'Black Salt', 'images/cake.jpg', '2018-01-12 23:25:37', NULL),
(17, 'Degi Mirch', 'images/cake.jpg', '2018-01-12 23:25:37', NULL),
(18, 'Pudina', 'images/cake.jpg', '2018-01-12 23:30:52', NULL),
(19, '', 'images/cake.jpg', '2018-01-14 00:23:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ING_AKA`
--

CREATE TABLE `ING_AKA` (
  `ING_AKA_ID` int(11) NOT NULL,
  `ING_ID` int(11) NOT NULL,
  `ING_AKA_NAME` varchar(25) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LIKES`
--

CREATE TABLE `LIKES` (
  `LIKE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `TYPE` varchar(25) NOT NULL,
  `TYPE_ID` int(11) NOT NULL,
  `IS_DEL` varchar(1) NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LIKES`
--

INSERT INTO `LIKES` (`LIKE_ID`, `USER_ID`, `TYPE`, `TYPE_ID`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 'RECIPE', 2, 'N', '2017-10-15 11:19:18', '2017-10-15 11:19:18'),
(2, 1, 'RECIPE', 27, 'Y', '2017-10-15 12:49:50', '2017-11-07 12:00:57'),
(3, 1, 'RECIPE', 50, 'N', '2017-11-07 15:14:53', NULL),
(4, 1, 'RECIPE', 3, 'Y', '2017-12-06 18:15:07', '2017-12-15 15:02:26'),
(5, 1, 'COMMENT', 1, 'N', '2017-12-06 18:18:04', '2017-12-18 15:51:20'),
(6, 1, 'REVIEW', 9, 'N', '2017-12-06 18:19:18', '2018-01-15 08:19:00'),
(7, 1, 'RECIPE', 103, 'Y', '2017-12-15 20:36:17', '2018-01-16 23:46:14'),
(8, 1, 'COMMENT', 9, 'Y', '2017-12-18 15:53:32', '2018-01-15 08:15:35'),
(9, 1, 'REVIEW', 10, 'N', '2017-12-22 14:30:53', '2017-12-22 20:05:42'),
(10, 1, 'REVIEW', 11, 'Y', '2017-12-22 14:47:53', '2017-12-22 19:46:45'),
(11, 1, 'COMMENT', 48, 'N', '2017-12-22 15:31:35', NULL),
(12, 1, 'COMMENT', 51, 'N', '2017-12-22 15:31:53', NULL),
(13, 1, 'COMMENT', 58, 'N', '2017-12-22 17:45:47', NULL),
(14, 1, 'COMMENT', 50, 'N', '2017-12-22 17:51:32', NULL),
(15, 1, 'COMMENT', 53, 'N', '2017-12-22 20:17:26', NULL),
(16, 1, 'COMMENT', 55, 'N', '2017-12-22 20:17:30', '2017-12-22 20:17:36'),
(17, 1, 'RECIPE', 66, 'Y', '2018-01-12 20:41:14', '2018-02-03 20:41:16'),
(18, 1, 'COMMENT', 54, 'N', '2018-01-16 00:56:05', '2018-01-16 00:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `MILESTONE`
--

CREATE TABLE `MILESTONE` (
  `MLT_ID` int(11) NOT NULL,
  `RANK_ID` int(11) NOT NULL,
  `TYPE` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NUMBER` int(11) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `MILESTONE`
--

INSERT INTO `MILESTONE` (`MLT_ID`, `RANK_ID`, `TYPE`, `NUMBER`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 'LIKE', 0, '2018-01-15 00:00:00', NULL),
(2, 1, 'REVIEW', 0, '2018-01-18 00:00:00', NULL),
(3, 1, 'RECIPE', 0, '2018-01-25 00:00:00', NULL),
(8, 2, 'LIKE', 100, '2018-01-15 00:00:00', NULL),
(9, 2, 'RECIPE', 5, '2018-01-18 00:00:00', NULL),
(10, 2, 'REVIEW', 25, '2018-01-25 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `QTY`
--

CREATE TABLE `QTY` (
  `QTY_ID` int(11) NOT NULL,
  `QTY_NAME` varchar(25) NOT NULL,
  `IS_DEF` varchar(1) NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `QTY`
--

INSERT INTO `QTY` (`QTY_ID`, `QTY_NAME`, `IS_DEF`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'CUP', '', '2017-09-09 00:00:00', NULL),
(2, 'PINCH', 'Y', '2017-09-09 00:00:00', NULL),
(3, 'TABLE SPOON', '', '2017-09-09 00:00:00', NULL),
(4, 'BOWL', '', '2017-09-09 00:00:00', NULL),
(5, 'GLASS', '', '2017-09-09 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `RANK`
--

CREATE TABLE `RANK` (
  `RANK_ID` int(11) NOT NULL,
  `RANK_NAME` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RANK_RULE` text COLLATE utf8mb4_unicode_ci,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `RANK`
--

INSERT INTO `RANK` (`RANK_ID`, `RANK_NAME`, `RANK_RULE`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'FOODIE', 'Initial Rank', '2018-01-18 00:00:00', NULL),
(2, 'KITCHEN HAND', '(5 Recipes & 100 Likes) or 25 Reviews', '2018-01-18 00:00:00', NULL),
(3, 'COMMIS CHEF', '(20 Recipes & 500 Likes) or 200 Shares or 200 Reviews', '2018-01-18 00:00:00', NULL),
(4, 'CHEF DE PARTIE', '(25 Recipes & 1000 likes) or 400 Shares or 400 Reviews', '2018-01-18 00:00:00', NULL),
(5, 'SOUS CHEF', '(25 Recipes & 2000 Likes) or 500 Shares or 500 Reviews', '2018-01-18 00:00:00', NULL),
(6, 'HEAD CHEF', '(25 Recipes & 5000 Likes) or 1000 Shares or 1000 Reviews', '2018-01-18 00:00:00', NULL),
(7, 'EXECUTIVE CHEF', '(25 Recipes & 10000 Likes) or 5000 Shares or 5000 Reviews', '2018-01-18 00:00:00', NULL),
(8, 'SUPER CHEF', '(50 Recipes & 20000 Likes) or 10000 Shares or 10000 Reviews', '2018-01-18 00:00:00', NULL),
(9, 'MASTER CHEF', '(75 Recipes & 30000 Likes) or 20000 Shares or 20000 Reviews', '2018-01-18 00:00:00', NULL),
(10, 'GODS COOK', '(100 Recipes & 50000 Likes) or 30000 Shares or 30000 Reviews', '2018-01-18 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `RECIPE`
--

CREATE TABLE `RECIPE` (
  `RCP_ID` int(11) NOT NULL,
  `RCP_NAME` varchar(25) NOT NULL,
  `FOOD_TYP_ID` int(11) NOT NULL,
  `FOOD_CSN_ID` int(11) NOT NULL,
  `RCP_PROC` text NOT NULL,
  `RCP_PLATING` text,
  `RCP_NOTE` text,
  `IS_DEL` varchar(1) NOT NULL DEFAULT 'N',
  `USER_ID` int(11) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RECIPE`
--

INSERT INTO `RECIPE` (`RCP_ID`, `RCP_NAME`, `FOOD_TYP_ID`, `FOOD_CSN_ID`, `RCP_PROC`, `RCP_PLATING`, `RCP_NOTE`, `IS_DEL`, `USER_ID`, `CREATE_DTM`, `MOD_DTM`) VALUES
(3, 'TEST_RECIPE_NAME', 1, 1, '', '', '', 'Y', 1, '2017-09-15 14:04:57', '2017-12-08 06:30:00'),
(66, 'Chicken Dum Biriyani', 3, 1, 'Kill Chicken. Fry it. Eat it.', 'null', 'null', 'N', 2, '2017-11-11 11:25:57', NULL),
(71, 'Chicken Dum Biriyani', 3, 1, 'Kill Chicken. Fry it. Eat it.', 'null', 'null', 'N', 1, '2017-11-11 11:35:16', NULL),
(73, 'Chicken Dum Biriyani', 3, 1, 'Kill Chicken. Fry it. Eat it.', 'null', 'null', 'Y', 1, '2017-11-11 11:37:58', NULL),
(76, 'bhindi masala', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:17:31', NULL),
(77, 'bhindi masala', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:17:42', NULL),
(78, 'test recipe', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:23:26', NULL),
(79, 'abcd', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:31:16', NULL),
(80, 'abcd', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:34:45', NULL),
(81, 'act', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:36:13', NULL),
(87, 'TEST_RECIPE_NAME 1', 1, 1, '', '', '', 'N', 1, '2017-12-06 15:15:43', NULL),
(88, 'TEST_RECIPE_NAME 2', 1, 1, '', '', '', 'N', 1, '2017-12-06 15:16:58', NULL),
(89, 'TEST_RECIPE_NAME 3', 1, 1, '', '', '', 'N', 1, '2017-12-06 15:17:53', NULL),
(90, 'TEST_RECIPE_NAME 4', 1, 1, '', '', '', 'N', 1, '2017-12-06 15:20:48', NULL),
(91, 'TEST_RECIPE_NAME 5', 1, 1, '', '', '', 'N', 1, '2017-12-06 15:23:47', NULL),
(103, 'TEST_RECIPE_NAME 6', 1, 1, '', '', '', 'N', 1, '2017-12-08 06:28:24', '2017-12-19 19:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `RECIPE_CONTAINS`
--

CREATE TABLE `RECIPE_CONTAINS` (
  `RCP_CONT_ID` int(11) NOT NULL,
  `RCP_ID` int(11) NOT NULL,
  `CONT_ID` int(11) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RECIPE_IMG`
--

CREATE TABLE `RECIPE_IMG` (
  `RCP_IMG_ID` int(11) NOT NULL,
  `RCP_ID` int(11) NOT NULL,
  `RCP_IMG` text NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RECIPE_IMG`
--

INSERT INTO `RECIPE_IMG` (`RCP_IMG_ID`, `RCP_ID`, `RCP_IMG`, `CREATE_DTM`, `MOD_DTM`) VALUES
(44, 66, 'app_data/users/1/recipes/66/images/5a06d03641be2.jpg', '2017-11-11 11:25:58', NULL),
(45, 66, 'app_data/users/1/recipes/66/images/5a06d03658f7c.jpg', '2017-11-11 11:25:58', NULL),
(46, 66, 'app_data/users/1/recipes/66/images/5a06d03670163.jpg', '2017-11-11 11:25:58', NULL),
(47, 66, 'app_data/users/1/recipes/66/images/5a06d036872d8.jpg', '2017-11-11 11:25:58', NULL),
(48, 66, 'app_data/users/1/recipes/66/images/5a06d0369e45f.jpg', '2017-11-11 11:25:58', NULL),
(49, 71, 'app_data/users/1/recipes/71/images/5a06d2653e082.jpg', '2017-11-11 11:35:17', NULL),
(50, 71, 'app_data/users/1/recipes/71/images/5a06d265553a1.jpg', '2017-11-11 11:35:17', NULL),
(51, 73, 'app_data/users/1/recipes/73/images/5a06d3075d570.jpg', '2017-11-11 11:37:59', NULL),
(52, 73, 'app_data/users/1/recipes/73/images/5a06d3077483d.jpg', '2017-11-11 11:37:59', NULL),
(53, 76, 'app_data/users/1/recipes/76/images/5a23cf3c3ebf8.jpg', '2017-12-03 11:17:32', NULL),
(54, 77, 'app_data/users/1/recipes/77/images/5a23cf46c52f0.jpg', '2017-12-03 11:17:42', NULL),
(55, 78, 'app_data/users/1/recipes/78/images/5a23d09eee7d0.jpg', '2017-12-03 11:23:27', NULL),
(56, 78, 'app_data/users/1/recipes/78/images/5a23d09f11744.jpg', '2017-12-03 11:23:27', NULL),
(57, 79, 'app_data/users/1/recipes/79/images/5a23d2754f5f8.jpg', '2017-12-03 11:31:17', NULL),
(58, 80, 'app_data/users/1/recipes/80/images/5a23d3462876a.jpg', '2017-12-03 11:34:46', NULL),
(59, 81, 'app_data/users/1/recipes/81/images/5a23d39d9f9a7.jpg', '2017-12-03 11:36:13', NULL),
(65, 87, 'app_data/users/1/recipes/87/images/5a27fb906dfd0.jpg', '2017-12-06 15:15:44', NULL),
(66, 87, 'app_data/users/1/recipes/87/images/5a27fb9085430.jpg', '2017-12-06 15:15:44', NULL),
(67, 88, 'app_data/users/1/recipes/88/images/5a27fbdad4d0b.jpg', '2017-12-06 15:16:58', NULL),
(68, 88, 'app_data/users/1/recipes/88/images/5a27fbdaec019.jpg', '2017-12-06 15:16:59', NULL),
(69, 89, 'app_data/users/1/recipes/89/images/5a27fc125b733.jpg', '2017-12-06 15:17:54', NULL),
(70, 89, 'app_data/users/1/recipes/89/images/5a27fc1272b40.jpg', '2017-12-06 15:17:54', NULL),
(71, 90, 'app_data/users/1/recipes/90/images/5a27fcc125b68.jpg', '2017-12-06 15:20:49', NULL),
(72, 90, 'app_data/users/1/recipes/90/images/5a27fcc13ccf8.jpg', '2017-12-06 15:20:49', NULL),
(73, 91, 'app_data/users/1/recipes/91/images/5a27fd7407e37.jpg', '2017-12-06 15:23:48', NULL),
(74, 91, 'app_data/users/1/recipes/91/images/5a27fd741f13b.jpg', '2017-12-06 15:23:48', NULL),
(94, 3, 'app_data/users/1/recipes/3/images/5a2a23591c823.jpg', '2017-12-08 06:30:01', NULL),
(95, 3, 'app_data/users/1/recipes/3/images/5a2a235935e57.jpg', '2017-12-08 06:30:01', NULL),
(96, 103, 'app_data/users/1/recipes/103/images/5a395e41862d8.jpg', '2017-12-19 19:45:21', NULL),
(97, 103, 'app_data/users/1/recipes/103/images/5a395e41af834.jpg', '2017-12-19 19:45:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `RECIPE_STEPS`
--

CREATE TABLE `RECIPE_STEPS` (
  `RCP_STPS_ID` int(15) NOT NULL,
  `RCP_ID` int(15) NOT NULL,
  `RCP_STEP` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `RECIPE_STEPS`
--

INSERT INTO `RECIPE_STEPS` (`RCP_STPS_ID`, `RCP_ID`, `RCP_STEP`, `CREATE_DTM`, `MOD_DTM`) VALUES
(4, 76, 'step 1', '2017-12-03 11:17:31', NULL),
(5, 76, 'step 2', '2017-12-03 11:17:31', NULL),
(6, 77, 'step 1', '2017-12-03 11:17:42', NULL),
(7, 77, 'step 2', '2017-12-03 11:17:42', NULL),
(8, 78, 'step 1', '2017-12-03 11:23:26', NULL),
(9, 78, 'step 2', '2017-12-03 11:23:26', NULL),
(10, 78, 'step 3', '2017-12-03 11:23:26', NULL),
(11, 79, 'test1', '2017-12-03 11:31:16', NULL),
(12, 80, 'test1', '2017-12-03 11:34:45', NULL),
(13, 81, 'step 2', '2017-12-03 11:36:13', NULL),
(24, 87, 'TEST STEP !', '2017-12-06 15:15:44', NULL),
(25, 87, 'TEST STEP 2', '2017-12-06 15:15:44', NULL),
(26, 88, 'TEST STEP !', '2017-12-06 15:16:58', NULL),
(27, 88, 'TEST STEP 2', '2017-12-06 15:16:58', NULL),
(28, 89, 'TEST STEP !', '2017-12-06 15:17:53', NULL),
(29, 89, 'TEST STEP 2', '2017-12-06 15:17:54', NULL),
(30, 90, 'TEST STEP !', '2017-12-06 15:20:48', NULL),
(31, 90, 'TEST STEP 2', '2017-12-06 15:20:48', NULL),
(32, 91, 'TEST STEP !', '2017-12-06 15:23:47', NULL),
(33, 91, 'TEST STEP 2', '2017-12-06 15:23:47', NULL),
(76, 3, 'TEST STEP !', '2017-12-08 06:30:00', NULL),
(77, 3, 'TEST STEP 2', '2017-12-08 06:30:00', NULL),
(78, 103, 'This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. ', '2017-12-19 19:45:20', NULL),
(79, 103, 'This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. \n', '2017-12-19 19:45:20', NULL),
(80, 103, 'This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. ', '2017-12-19 19:45:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `RECIPE_TASTE`
--

CREATE TABLE `RECIPE_TASTE` (
  `RCP_TST_ID` int(11) NOT NULL,
  `RCP_ID` int(11) NOT NULL,
  `TST_ID` int(11) NOT NULL,
  `TST_QTY` int(11) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RECIPE_TASTE`
--

INSERT INTO `RECIPE_TASTE` (`RCP_TST_ID`, `RCP_ID`, `TST_ID`, `TST_QTY`, `CREATE_DTM`, `MOD_DTM`) VALUES
(8, 4, 1, 3, '2017-09-10 05:57:07', NULL),
(9, 4, 2, 2, '2017-09-10 05:57:07', NULL),
(10, 4, 3, 0, '2017-09-10 05:57:07', NULL),
(11, 5, 1, 3, '2017-09-10 06:36:11', NULL),
(12, 5, 2, 2, '2017-09-10 06:36:11', NULL),
(13, 5, 3, 0, '2017-09-10 06:36:11', NULL),
(14, 6, 1, 3, '2017-09-10 06:39:44', NULL),
(15, 6, 2, 2, '2017-09-10 06:39:44', NULL),
(16, 6, 3, 0, '2017-09-10 06:39:44', NULL),
(17, 7, 1, 3, '2017-09-10 06:39:53', NULL),
(18, 7, 2, 2, '2017-09-10 06:39:53', NULL),
(19, 7, 3, 0, '2017-09-10 06:39:53', NULL),
(20, 8, 1, 3, '2017-09-10 06:42:49', NULL),
(21, 8, 2, 2, '2017-09-10 06:42:49', NULL),
(22, 8, 3, 0, '2017-09-10 06:42:49', NULL),
(23, 9, 1, 5, '2017-09-15 14:04:57', NULL),
(24, 9, 2, 4, '2017-09-15 14:04:57', NULL),
(25, 9, 3, 0, '2017-09-15 14:04:57', NULL),
(26, 10, 1, 3, '2017-09-15 14:54:58', NULL),
(27, 10, 2, 3, '2017-09-15 14:54:58', NULL),
(28, 10, 3, 0, '2017-09-15 14:54:58', NULL),
(29, 11, 1, 3, '2017-09-23 04:24:14', NULL),
(30, 11, 2, 2, '2017-09-23 04:24:14', NULL),
(31, 11, 3, 0, '2017-09-23 04:24:14', NULL),
(32, 12, 1, 3, '2017-09-23 04:24:20', NULL),
(33, 12, 2, 2, '2017-09-23 04:24:20', NULL),
(34, 12, 3, 0, '2017-09-23 04:24:20', NULL),
(35, 13, 1, 3, '2017-09-23 04:24:27', NULL),
(36, 13, 2, 2, '2017-09-23 04:24:27', NULL),
(37, 13, 3, 0, '2017-09-23 04:24:27', NULL),
(38, 14, 1, 3, '2017-09-23 04:24:28', NULL),
(39, 14, 2, 2, '2017-09-23 04:24:28', NULL),
(40, 14, 3, 0, '2017-09-23 04:24:28', NULL),
(41, 15, 1, 3, '2017-09-23 04:24:36', NULL),
(42, 15, 2, 2, '2017-09-23 04:24:36', NULL),
(43, 15, 3, 0, '2017-09-23 04:24:36', NULL),
(44, 16, 1, 3, '2017-09-23 04:24:38', NULL),
(45, 16, 2, 2, '2017-09-23 04:24:38', NULL),
(46, 16, 3, 0, '2017-09-23 04:24:38', NULL),
(47, 17, 1, 3, '2017-09-23 04:27:36', NULL),
(48, 17, 2, 2, '2017-09-23 04:27:36', NULL),
(49, 17, 3, 0, '2017-09-23 04:27:36', NULL),
(50, 18, 1, 3, '2017-09-23 05:04:47', NULL),
(51, 18, 2, 2, '2017-09-23 05:04:47', NULL),
(52, 18, 3, 0, '2017-09-23 05:04:47', NULL),
(53, 19, 1, 3, '2017-09-23 05:23:14', NULL),
(54, 19, 2, 2, '2017-09-23 05:23:14', NULL),
(55, 19, 3, 0, '2017-09-23 05:23:14', NULL),
(56, 20, 1, 3, '2017-09-23 05:38:49', NULL),
(57, 20, 2, 2, '2017-09-23 05:38:49', NULL),
(58, 20, 3, 0, '2017-09-23 05:38:49', NULL),
(59, 21, 1, 3, '2017-09-23 05:45:07', NULL),
(60, 21, 2, 2, '2017-09-23 05:45:07', NULL),
(61, 21, 3, 0, '2017-09-23 05:45:07', NULL),
(62, 22, 1, 3, '2017-09-23 15:41:17', NULL),
(63, 22, 2, 2, '2017-09-23 15:41:17', NULL),
(64, 22, 3, 0, '2017-09-23 15:41:17', NULL),
(65, 23, 1, 3, '2017-09-23 16:01:51', NULL),
(66, 23, 2, 2, '2017-09-23 16:01:51', NULL),
(67, 23, 3, 0, '2017-09-23 16:01:51', NULL),
(68, 24, 1, 5, '2017-09-23 16:16:54', NULL),
(69, 24, 2, 1, '2017-09-23 16:16:54', NULL),
(70, 24, 3, 0, '2017-09-23 16:16:54', NULL),
(71, 25, 1, 5, '2017-09-24 09:38:24', NULL),
(72, 25, 2, 5, '2017-09-24 09:38:24', NULL),
(73, 25, 3, 0, '2017-09-24 09:38:24', NULL),
(74, 26, 1, 3, '2017-09-26 14:04:10', NULL),
(75, 26, 2, 2, '2017-09-26 14:04:10', NULL),
(76, 26, 3, 0, '2017-09-26 14:04:10', NULL),
(77, 27, 1, 3, '2017-09-26 14:25:56', NULL),
(78, 27, 2, 2, '2017-09-26 14:25:56', NULL),
(79, 27, 3, 0, '2017-09-26 14:25:56', NULL),
(80, 28, 1, 3, '2017-10-29 10:43:28', NULL),
(81, 28, 2, 2, '2017-10-29 10:43:28', NULL),
(82, 28, 3, 0, '2017-10-29 10:43:28', NULL),
(83, 29, 1, 3, '2017-10-29 10:46:35', NULL),
(84, 29, 2, 2, '2017-10-29 10:46:35', NULL),
(85, 29, 3, 0, '2017-10-29 10:46:35', NULL),
(86, 30, 1, 3, '2017-10-29 10:50:30', NULL),
(87, 30, 2, 2, '2017-10-29 10:50:30', NULL),
(88, 30, 3, 0, '2017-10-29 10:50:30', NULL),
(89, 31, 1, 3, '2017-10-29 10:57:06', NULL),
(90, 31, 2, 2, '2017-10-29 10:57:06', NULL),
(91, 31, 3, 0, '2017-10-29 10:57:06', NULL),
(92, 32, 1, 3, '2017-10-29 11:08:48', NULL),
(93, 32, 2, 2, '2017-10-29 11:08:48', NULL),
(94, 32, 3, 0, '2017-10-29 11:08:48', NULL),
(95, 34, 1, 3, '2017-10-29 11:18:04', NULL),
(96, 34, 2, 2, '2017-10-29 11:18:04', NULL),
(97, 34, 3, 0, '2017-10-29 11:18:04', NULL),
(98, 35, 1, 3, '2017-10-29 11:25:15', NULL),
(99, 35, 2, 2, '2017-10-29 11:25:15', NULL),
(100, 35, 3, 0, '2017-10-29 11:25:15', NULL),
(101, 38, 1, 3, '2017-10-29 11:37:12', NULL),
(102, 38, 2, 2, '2017-10-29 11:37:12', NULL),
(103, 38, 3, 0, '2017-10-29 11:37:12', NULL),
(104, 39, 1, 3, '2017-10-29 11:42:49', NULL),
(105, 39, 2, 2, '2017-10-29 11:42:49', NULL),
(106, 39, 3, 0, '2017-10-29 11:42:49', NULL),
(107, 40, 1, 1, '2017-10-29 11:46:08', NULL),
(108, 41, 1, 1, '2017-10-29 11:46:48', NULL),
(109, 42, 1, 1, '2017-10-29 12:16:13', NULL),
(110, 43, 1, 1, '2017-10-29 12:17:41', NULL),
(111, 44, 1, 1, '2017-10-29 12:18:37', NULL),
(112, 45, 1, 3, '2017-10-29 12:20:39', NULL),
(113, 45, 2, 2, '2017-10-29 12:20:39', NULL),
(114, 45, 3, 0, '2017-10-29 12:20:39', NULL),
(115, 46, 1, 3, '2017-10-29 12:26:05', NULL),
(116, 46, 2, 2, '2017-10-29 12:26:05', NULL),
(117, 46, 3, 0, '2017-10-29 12:26:05', NULL),
(118, 47, 1, 3, '2017-10-29 12:30:20', NULL),
(119, 47, 2, 2, '2017-10-29 12:30:20', NULL),
(120, 47, 3, 0, '2017-10-29 12:30:20', NULL),
(121, 48, 1, 3, '2017-10-29 12:31:59', NULL),
(122, 48, 2, 2, '2017-10-29 12:31:59', NULL),
(123, 48, 3, 0, '2017-10-29 12:31:59', NULL),
(124, 49, 1, 3, '2017-10-29 12:33:52', NULL),
(125, 49, 2, 2, '2017-10-29 12:33:52', NULL),
(126, 49, 3, 0, '2017-10-29 12:33:52', NULL),
(127, 50, 1, 3, '2017-10-29 12:49:54', NULL),
(128, 50, 2, 2, '2017-10-29 12:49:54', NULL),
(129, 50, 3, 0, '2017-10-29 12:49:54', NULL),
(130, 51, 1, 1, '2017-10-31 08:37:33', NULL),
(131, 52, 1, 3, '2017-11-11 09:32:47', NULL),
(132, 52, 2, 2, '2017-11-11 09:32:47', NULL),
(133, 52, 3, 0, '2017-11-11 09:32:47', NULL),
(134, 53, 1, 3, '2017-11-11 09:47:31', NULL),
(135, 53, 2, 2, '2017-11-11 09:47:31', NULL),
(136, 53, 3, 0, '2017-11-11 09:47:31', NULL),
(137, 54, 1, 3, '2017-11-11 10:28:46', NULL),
(138, 54, 2, 2, '2017-11-11 10:28:46', NULL),
(139, 54, 3, 0, '2017-11-11 10:28:46', NULL),
(140, 55, 1, 3, '2017-11-11 10:36:19', NULL),
(141, 55, 2, 2, '2017-11-11 10:36:19', NULL),
(142, 55, 3, 0, '2017-11-11 10:36:19', NULL),
(143, 56, 1, 3, '2017-11-11 10:38:00', NULL),
(144, 56, 2, 2, '2017-11-11 10:38:00', NULL),
(145, 56, 3, 0, '2017-11-11 10:38:00', NULL),
(146, 57, 1, 3, '2017-11-11 10:40:49', NULL),
(147, 57, 2, 2, '2017-11-11 10:40:49', NULL),
(148, 57, 3, 0, '2017-11-11 10:40:49', NULL),
(149, 58, 1, 3, '2017-11-11 10:48:32', NULL),
(150, 58, 2, 2, '2017-11-11 10:48:32', NULL),
(151, 58, 3, 0, '2017-11-11 10:48:32', NULL),
(152, 59, 1, 3, '2017-11-11 10:50:56', NULL),
(153, 59, 2, 2, '2017-11-11 10:50:56', NULL),
(154, 59, 3, 0, '2017-11-11 10:50:56', NULL),
(155, 60, 1, 3, '2017-11-11 10:57:18', NULL),
(156, 60, 2, 2, '2017-11-11 10:57:18', NULL),
(157, 60, 3, 0, '2017-11-11 10:57:18', NULL),
(158, 61, 1, 3, '2017-11-11 11:00:27', NULL),
(159, 61, 2, 2, '2017-11-11 11:00:27', NULL),
(160, 61, 3, 0, '2017-11-11 11:00:27', NULL),
(161, 62, 1, 3, '2017-11-11 11:02:17', NULL),
(162, 62, 2, 2, '2017-11-11 11:02:17', NULL),
(163, 62, 3, 0, '2017-11-11 11:02:17', NULL),
(173, 66, 1, 3, '2017-11-11 11:25:58', NULL),
(174, 66, 2, 2, '2017-11-11 11:25:58', NULL),
(175, 66, 3, 0, '2017-11-11 11:25:58', NULL),
(188, 71, 1, 3, '2017-11-11 11:35:17', NULL),
(189, 71, 2, 2, '2017-11-11 11:35:17', NULL),
(190, 71, 3, 0, '2017-11-11 11:35:17', NULL),
(194, 73, 1, 3, '2017-11-11 11:37:59', NULL),
(195, 73, 2, 2, '2017-11-11 11:37:59', NULL),
(196, 73, 3, 0, '2017-11-11 11:37:59', NULL),
(203, 76, 1, 3, '2017-12-03 11:17:31', NULL),
(204, 76, 2, 2, '2017-12-03 11:17:32', NULL),
(205, 76, 3, 0, '2017-12-03 11:17:32', NULL),
(206, 77, 1, 3, '2017-12-03 11:17:42', NULL),
(207, 77, 2, 2, '2017-12-03 11:17:42', NULL),
(208, 77, 3, 0, '2017-12-03 11:17:42', NULL),
(209, 78, 1, 5, '2017-12-03 11:23:26', NULL),
(210, 78, 2, 5, '2017-12-03 11:23:26', NULL),
(211, 78, 3, 0, '2017-12-03 11:23:26', NULL),
(212, 79, 1, 3, '2017-12-03 11:31:17', NULL),
(213, 79, 2, 2, '2017-12-03 11:31:17', NULL),
(214, 79, 3, 0, '2017-12-03 11:31:17', NULL),
(215, 80, 1, 3, '2017-12-03 11:34:45', NULL),
(216, 80, 2, 2, '2017-12-03 11:34:46', NULL),
(217, 80, 3, 0, '2017-12-03 11:34:46', NULL),
(218, 81, 1, 3, '2017-12-03 11:36:13', NULL),
(219, 81, 2, 2, '2017-12-03 11:36:13', NULL),
(220, 81, 3, 0, '2017-12-03 11:36:13', NULL),
(236, 87, 1, 4, '2017-12-06 15:15:44', NULL),
(237, 87, 2, 3, '2017-12-06 15:15:44', NULL),
(238, 87, 3, 2, '2017-12-06 15:15:44', NULL),
(239, 88, 1, 4, '2017-12-06 15:16:58', NULL),
(240, 88, 2, 3, '2017-12-06 15:16:58', NULL),
(241, 88, 3, 2, '2017-12-06 15:16:58', NULL),
(242, 89, 1, 4, '2017-12-06 15:17:54', NULL),
(243, 89, 2, 3, '2017-12-06 15:17:54', NULL),
(244, 89, 3, 2, '2017-12-06 15:17:54', NULL),
(245, 90, 1, 4, '2017-12-06 15:20:48', NULL),
(246, 90, 2, 3, '2017-12-06 15:20:49', NULL),
(247, 90, 3, 2, '2017-12-06 15:20:49', NULL),
(248, 91, 1, 4, '2017-12-06 15:23:47', NULL),
(249, 91, 2, 3, '2017-12-06 15:23:47', NULL),
(250, 91, 3, 2, '2017-12-06 15:23:47', NULL),
(311, 3, 1, 4, '2017-12-08 06:30:00', NULL),
(312, 3, 2, 3, '2017-12-08 06:30:00', NULL),
(313, 3, 3, 2, '2017-12-08 06:30:00', NULL),
(314, 103, 1, 4, '2017-12-19 19:45:20', NULL),
(315, 103, 2, 3, '2017-12-19 19:45:21', NULL),
(316, 103, 3, 2, '2017-12-19 19:45:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `REVIEWS`
--

CREATE TABLE `REVIEWS` (
  `REV_ID` int(11) NOT NULL,
  `RCP_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `REVIEW` text,
  `RATING` int(11) NOT NULL,
  `IS_DEL` varchar(1) NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `REVIEWS`
--

INSERT INTO `REVIEWS` (`REV_ID`, `RCP_ID`, `USER_ID`, `REVIEW`, `RATING`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(9, 3, 1, 'TEST REVIEW', 4, 'N', '2017-10-17 15:13:23', '2017-12-15 15:02:40'),
(10, 103, 1, 'TEST REVIEW - 98', 3, 'N', '2017-12-16 11:11:28', '2017-12-30 08:57:26'),
(11, 103, 2, 'This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review.', 3, 'N', '2017-12-16 20:44:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SCOPE`
--

CREATE TABLE `SCOPE` (
  `SCOPE_ID` int(11) NOT NULL,
  `SCOPE_NAME` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SCOPE`
--

INSERT INTO `SCOPE` (`SCOPE_ID`, `SCOPE_NAME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'PUBLIC', '2018-01-15 00:00:00', NULL),
(2, 'FOLLOWERS', '2018-01-15 00:00:00', NULL),
(3, 'SELF', '2018-01-15 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `TASTES`
--

CREATE TABLE `TASTES` (
  `TST_ID` int(11) NOT NULL,
  `TST_NAME` varchar(25) NOT NULL,
  `IMG` varchar(50) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TASTES`
--

INSERT INTO `TASTES` (`TST_ID`, `TST_NAME`, `IMG`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'SPICY', '', '2017-08-27 00:00:00', NULL),
(2, 'SWEET', '', '2017-08-27 00:00:00', NULL),
(3, 'SOUR', '', '2017-08-27 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `TIMELINES`
--

CREATE TABLE `TIMELINES` (
  `TMLN_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `REF_USER_ID` int(10) NOT NULL,
  `TYPE` varchar(25) NOT NULL,
  `TYPE_ID` int(11) NOT NULL,
  `SCOPE_ID` int(11) NOT NULL DEFAULT '1',
  `IS_DEL` varchar(1) NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TIMELINES`
--

INSERT INTO `TIMELINES` (`TMLN_ID`, `USER_ID`, `REF_USER_ID`, `TYPE`, `TYPE_ID`, `SCOPE_ID`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 1, 'USER_ADD', 1, 1, 'N', '2017-08-27 00:00:00', NULL),
(12, 1, 1, 'LIKE_RECIPE_ADD', 3, 1, 'N', '2017-11-07 15:14:53', NULL),
(17, 5, 5, 'USER_ADD', 5, 1, 'N', '2017-12-05 09:28:54', NULL),
(18, 6, 6, 'USER_ADD', 6, 1, 'N', '2017-12-06 10:09:04', NULL),
(19, 7, 7, 'USER_ADD', 7, 1, 'N', '2017-12-06 10:17:52', NULL),
(20, 8, 8, 'USER_ADD', 8, 1, 'N', '2017-12-06 10:18:40', NULL),
(21, 9, 9, 'USER_ADD', 9, 1, 'N', '2017-12-06 10:19:12', NULL),
(22, 10, 10, 'USER_ADD', 10, 1, 'N', '2017-12-06 10:25:31', NULL),
(23, 11, 11, 'USER_ADD', 11, 1, 'N', '2017-12-06 10:26:32', NULL),
(24, 12, 12, 'USER_ADD', 12, 1, 'N', '2017-12-06 10:32:19', NULL),
(25, 13, 13, 'USER_ADD', 13, 1, 'N', '2017-12-06 10:36:54', NULL),
(26, 14, 14, 'USER_ADD', 14, 1, 'N', '2017-12-06 10:38:49', NULL),
(27, 15, 15, 'USER_ADD', 15, 1, 'N', '2017-12-06 10:42:09', NULL),
(28, 16, 16, 'USER_ADD', 16, 1, 'N', '2017-12-06 10:43:01', NULL),
(29, 17, 17, 'USER_ADD', 17, 1, 'N', '2017-12-06 15:20:07', NULL),
(34, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-06 18:18:04', NULL),
(35, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-06 18:18:09', NULL),
(36, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-06 18:19:19', NULL),
(37, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-06 18:19:21', NULL),
(48, 18, 18, 'USER_ADD', 18, 1, 'N', '2017-12-06 21:06:20', NULL),
(50, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-06 21:06:43', NULL),
(51, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-06 21:06:44', NULL),
(54, 19, 19, 'USER_ADD', 19, 1, 'N', '2017-12-06 21:19:07', NULL),
(55, 20, 20, 'USER_ADD', 20, 1, 'N', '2017-12-06 21:19:07', NULL),
(56, 21, 21, 'USER_ADD', 21, 1, 'N', '2017-12-06 21:19:07', NULL),
(57, 22, 22, 'USER_ADD', 22, 1, 'N', '2017-12-06 21:19:08', NULL),
(58, 23, 23, 'USER_ADD', 23, 1, 'N', '2017-12-06 21:19:08', NULL),
(59, 24, 24, 'USER_ADD', 24, 1, 'N', '2017-12-06 21:19:08', NULL),
(62, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-06 21:19:41', NULL),
(64, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-06 21:19:43', NULL),
(65, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-06 21:19:43', NULL),
(67, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-06 21:19:44', NULL),
(68, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-06 21:19:45', NULL),
(70, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-06 21:19:46', NULL),
(71, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-06 21:19:46', NULL),
(73, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-06 21:19:48', NULL),
(75, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-06 21:19:48', NULL),
(76, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-06 21:19:49', NULL),
(77, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-06 21:19:50', NULL),
(79, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-06 21:19:51', NULL),
(91, 1, 1, 'RECIPE_REMOVE', 3, 1, 'N', '2017-12-07 06:37:13', NULL),
(92, 1, 1, 'RECIPE_REMOVE', 3, 1, 'N', '2017-12-07 06:40:42', NULL),
(93, 1, 1, 'RECIPE_REMOVE', 3, 1, 'N', '2017-12-07 06:40:58', NULL),
(99, 25, 25, 'USER_ADD', 25, 1, 'N', '2017-12-07 11:32:54', NULL),
(101, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-07 11:33:12', NULL),
(102, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-07 11:33:13', NULL),
(107, 26, 26, 'USER_ADD', 26, 1, 'N', '2017-12-07 11:54:15', NULL),
(109, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-07 11:54:32', NULL),
(110, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-07 11:54:34', NULL),
(115, 27, 27, 'USER_ADD', 27, 1, 'N', '2017-12-07 12:05:22', NULL),
(118, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-07 12:05:41', NULL),
(119, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-07 12:05:42', NULL),
(124, 28, 28, 'USER_ADD', 28, 1, 'N', '2017-12-07 12:22:14', NULL),
(125, 29, 29, 'USER_ADD', 29, 1, 'N', '2017-12-07 12:22:14', NULL),
(126, 30, 30, 'USER_ADD', 30, 1, 'N', '2017-12-07 12:22:14', NULL),
(127, 31, 31, 'USER_ADD', 31, 1, 'N', '2017-12-07 12:22:15', NULL),
(128, 32, 32, 'USER_ADD', 32, 1, 'N', '2017-12-07 12:22:15', NULL),
(129, 33, 33, 'USER_ADD', 33, 1, 'N', '2017-12-07 12:22:15', NULL),
(142, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-07 12:23:35', NULL),
(143, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-07 12:23:36', NULL),
(144, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-07 12:23:36', NULL),
(145, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-07 12:23:38', NULL),
(146, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-07 12:23:38', NULL),
(147, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-07 12:23:38', NULL),
(148, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-07 12:23:42', NULL),
(149, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-07 12:23:42', NULL),
(150, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-07 12:23:42', NULL),
(151, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-07 12:23:44', NULL),
(152, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-07 12:23:44', NULL),
(153, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-07 12:23:45', NULL),
(176, 1, 1, 'REVIEW_RECIPE_ADD', 3, 1, 'N', '2017-12-07 12:24:38', NULL),
(178, 34, 34, 'USER_ADD', 34, 1, 'N', '2017-12-07 15:01:26', NULL),
(179, 35, 35, 'USER_ADD', 35, 1, 'N', '2017-12-07 15:01:39', NULL),
(180, 36, 36, 'USER_ADD', 36, 1, 'N', '2017-12-07 15:01:46', NULL),
(181, 37, 37, 'USER_ADD', 37, 1, 'N', '2017-12-07 15:02:15', NULL),
(182, 38, 38, 'USER_ADD', 38, 1, 'N', '2017-12-07 15:02:21', NULL),
(183, 1, 1, 'RECIPE_REMOVE', 3, 1, 'N', '2017-12-07 15:02:24', NULL),
(187, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-07 15:02:48', NULL),
(188, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-07 15:02:54', NULL),
(191, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-07 15:03:02', NULL),
(192, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-07 15:03:07', NULL),
(193, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-07 15:03:09', NULL),
(195, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-07 15:03:13', NULL),
(197, 1, 1, 'RECIPE_REMOVE', 3, 1, 'N', '2017-12-07 15:03:19', NULL),
(198, 1, 1, 'COMMENT_RECIPE_REMOVE', 3, 1, 'N', '2017-12-07 15:03:23', NULL),
(204, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-07 15:03:37', NULL),
(205, 1, 1, 'COMMENT_RECIPE_REMOVE', 3, 1, 'N', '2017-12-07 15:03:38', NULL),
(207, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-07 15:03:43', NULL),
(208, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-07 15:03:43', NULL),
(212, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-07 15:03:49', NULL),
(217, 1, 1, 'COMMENT_RECIPE_REMOVE', 3, 1, 'N', '2017-12-07 15:04:13', NULL),
(223, 39, 39, 'USER_ADD', 39, 1, 'N', '2017-12-07 15:12:20', NULL),
(226, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-07 15:13:41', NULL),
(227, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-07 15:13:47', NULL),
(232, 40, 40, 'USER_ADD', 40, 1, 'N', '2017-12-09 02:31:36', NULL),
(233, 41, 41, 'USER_ADD', 41, 1, 'N', '2017-12-09 02:31:36', NULL),
(234, 42, 42, 'USER_ADD', 42, 1, 'N', '2017-12-09 02:31:37', NULL),
(235, 43, 43, 'USER_ADD', 43, 1, 'N', '2017-12-09 02:31:37', NULL),
(236, 44, 44, 'USER_ADD', 44, 1, 'N', '2017-12-09 02:31:38', NULL),
(240, 1, 1, 'RECIPE_REMOVE', 3, 1, 'N', '2017-12-09 02:32:35', NULL),
(247, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-09 02:32:56', NULL),
(248, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-09 02:32:57', NULL),
(249, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-09 02:32:59', NULL),
(250, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-09 02:32:59', NULL),
(251, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-09 02:33:00', NULL),
(252, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-09 02:33:03', NULL),
(253, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-09 02:33:03', NULL),
(254, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-09 02:33:05', NULL),
(255, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-09 02:33:06', NULL),
(256, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-09 02:33:06', NULL),
(274, 1, 1, 'REVIEW_RECIPE_ADD', 3, 1, 'N', '2017-12-09 02:33:58', NULL),
(276, 1, 1, 'REVIEW_RECIPE_ADD', 3, 1, 'N', '2017-12-09 02:33:59', NULL),
(277, 45, 45, 'USER_ADD', 45, 1, 'N', '2017-12-09 03:04:14', NULL),
(280, 1, 1, 'LIKE_COMMENT_REMOVE', 5, 1, 'N', '2017-12-09 03:05:35', NULL),
(281, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-09 03:05:41', NULL),
(286, 46, 46, 'USER_ADD', 46, 1, 'N', '2017-12-12 15:30:28', NULL),
(287, 1, 1, 'RECIPE_REMOVE', 3, 1, 'N', '2017-12-12 15:30:47', NULL),
(289, 1, 1, 'LIKE_COMMENT_ADD', 5, 1, 'N', '2017-12-12 15:30:52', NULL),
(290, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-12 15:30:54', NULL),
(295, 47, 47, 'USER_ADD', 47, 1, 'N', '2017-12-13 15:38:42', NULL),
(298, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-13 15:39:06', NULL),
(303, 48, 48, 'USER_ADD', 48, 1, 'N', '2017-12-14 11:01:34', NULL),
(305, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-14 11:01:57', NULL),
(310, 49, 49, 'USER_ADD', 49, 1, 'N', '2017-12-15 15:02:06', NULL),
(312, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-15 15:02:31', NULL),
(314, 1, 1, 'COMMENT_RECIPE_REMOVE', 3, 1, 'N', '2017-12-15 15:02:38', NULL),
(328, 50, 50, 'USER_ADD', 50, 1, 'N', '2017-12-16 22:48:35', NULL),
(331, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-16 22:49:02', NULL),
(372, 51, 51, 'USER_ADD', 51, 1, 'N', '2017-12-17 14:22:14', NULL),
(373, 1, 1, 'RECIPE_REMOVE', 3, 1, 'N', '2017-12-17 14:22:34', NULL),
(375, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-17 14:22:41', NULL),
(379, 1, 1, 'REVIEW_RECIPE_ADD', 91, 1, 'N', '2017-12-17 14:22:53', NULL),
(381, 52, 52, 'USER_ADD', 52, 1, 'N', '2017-12-17 19:39:15', NULL),
(384, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-17 19:39:43', NULL),
(388, 1, 1, 'REVIEW_RECIPE_ADD', 76, 1, 'N', '2017-12-17 19:39:56', NULL),
(391, 53, 53, 'USER_ADD', 53, 1, 'N', '2017-12-18 09:53:37', NULL),
(394, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-18 09:54:04', NULL),
(399, 54, 54, 'USER_ADD', 54, 1, 'N', '2017-12-18 10:10:44', NULL),
(402, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-18 10:11:10', NULL),
(409, 1, 1, 'RECIPE_REMOVE', 73, 1, 'N', '2017-12-18 15:33:29', NULL),
(415, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2017-12-18 15:53:33', NULL),
(416, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2017-12-18 15:53:54', NULL),
(417, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-18 15:54:04', NULL),
(418, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-18 15:54:15', NULL),
(419, 55, 55, 'USER_ADD', 55, 1, 'N', '2017-12-18 15:54:48', NULL),
(420, 56, 56, 'USER_ADD', 56, 1, 'N', '2017-12-19 19:58:02', NULL),
(423, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2017-12-19 19:58:29', NULL),
(424, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-19 19:58:31', NULL),
(434, 57, 57, 'USER_ADD', 57, 1, 'N', '2017-12-21 09:26:46', NULL),
(437, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2017-12-21 09:27:16', NULL),
(438, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-21 09:27:18', NULL),
(444, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2017-12-21 09:29:57', NULL),
(445, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2017-12-22 06:43:43', NULL),
(446, 1, 1, 'LIKE_REVIEW_ADD', 9, 1, 'N', '2017-12-22 14:30:54', NULL),
(447, 1, 1, 'LIKE_REVIEW_REMOVE', 9, 1, 'N', '2017-12-22 14:30:59', NULL),
(448, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2017-12-22 14:44:53', NULL),
(449, 1, 1, 'LIKE_REVIEW_ADD', 9, 1, 'N', '2017-12-22 14:46:36', NULL),
(450, 1, 2, 'LIKE_REVIEW_ADD', 10, 1, 'N', '2017-12-22 14:47:53', NULL),
(451, 1, 2, 'LIKE_REVIEW_REMOVE', 10, 1, 'N', '2017-12-22 14:47:58', NULL),
(452, 1, 2, 'LIKE_REVIEW_ADD', 10, 1, 'N', '2017-12-22 14:48:34', NULL),
(453, 1, 2, 'LIKE_REVIEW_REMOVE', 10, 1, 'N', '2017-12-22 14:48:38', NULL),
(454, 1, 1, 'LIKE_REVIEW_REMOVE', 9, 1, 'N', '2017-12-22 14:48:43', NULL),
(455, 1, 1, 'LIKE_REVIEW_ADD', 9, 1, 'N', '2017-12-22 14:48:48', NULL),
(456, 1, 1, 'LIKE_REVIEW_REMOVE', 9, 1, 'N', '2017-12-22 14:52:41', NULL),
(457, 1, 2, 'LIKE_REVIEW_ADD', 10, 1, 'N', '2017-12-22 14:52:49', NULL),
(458, 1, 1, 'LIKE_REVIEW_ADD', 9, 1, 'N', '2017-12-22 14:52:54', NULL),
(459, 1, 1, 'LIKE_COMMENT_ADD', 11, 1, 'N', '2017-12-22 15:31:36', NULL),
(460, 1, 1, 'LIKE_COMMENT_ADD', 12, 1, 'N', '2017-12-22 15:31:53', NULL),
(469, 1, 1, 'LIKE_COMMENT_ADD', 13, 1, 'N', '2017-12-22 17:45:47', NULL),
(472, 1, 1, 'LIKE_COMMENT_ADD', 14, 1, 'N', '2017-12-22 17:51:32', NULL),
(475, 1, 2, 'LIKE_REVIEW_REMOVE', 10, 1, 'N', '2017-12-22 19:46:46', NULL),
(476, 1, 1, 'LIKE_REVIEW_REMOVE', 9, 1, 'N', '2017-12-22 19:46:52', NULL),
(480, 1, 1, 'LIKE_REVIEW_ADD', 9, 1, 'N', '2017-12-22 19:57:19', NULL),
(486, 1, 1, 'LIKE_REVIEW_REMOVE', 9, 1, 'N', '2017-12-22 20:05:38', NULL),
(487, 1, 1, 'LIKE_REVIEW_ADD', 9, 1, 'N', '2017-12-22 20:05:42', NULL),
(488, 1, 1, 'LIKE_COMMENT_ADD', 15, 1, 'N', '2017-12-22 20:17:27', NULL),
(489, 1, 1, 'LIKE_COMMENT_ADD', 16, 1, 'N', '2017-12-22 20:17:31', NULL),
(490, 1, 1, 'LIKE_COMMENT_REMOVE', 16, 1, 'N', '2017-12-22 20:17:34', NULL),
(491, 1, 1, 'LIKE_COMMENT_ADD', 16, 1, 'N', '2017-12-22 20:17:37', NULL),
(492, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2017-12-24 15:51:22', NULL),
(493, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2017-12-24 15:53:43', NULL),
(495, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-24 16:17:20', NULL),
(498, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:20:02', NULL),
(499, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:21:13', NULL),
(500, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:21:19', NULL),
(501, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:21:22', NULL),
(502, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:26:20', NULL),
(503, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:26:24', NULL),
(504, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:26:27', NULL),
(505, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:27:05', NULL),
(506, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:27:09', NULL),
(507, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:27:12', NULL),
(508, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2017-12-27 08:27:15', NULL),
(509, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2017-12-27 08:27:22', NULL),
(510, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2017-12-27 08:27:26', NULL),
(511, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2017-12-27 08:27:30', NULL),
(512, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2017-12-27 08:29:44', NULL),
(513, 58, 58, 'USER_ADD', 58, 1, 'N', '2017-12-28 09:23:09', NULL),
(514, 1, 2, 'USER_UNFOLLOW', 1, 1, 'N', '2017-12-28 09:23:13', NULL),
(517, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2017-12-28 09:23:42', NULL),
(518, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2017-12-28 09:23:44', NULL),
(522, 1, 1, 'REVIEW_RECIPE_REMOVE', 89, 1, 'N', '2017-12-28 09:23:59', NULL),
(523, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2017-12-28 10:35:16', NULL),
(524, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2017-12-28 10:35:54', NULL),
(525, 59, 59, 'USER_ADD', 59, 1, 'N', '2017-12-29 07:14:50', NULL),
(526, 60, 60, 'USER_ADD', 60, 1, 'N', '2017-12-29 07:38:05', NULL),
(527, 61, 61, 'USER_ADD', 61, 1, 'N', '2017-12-29 08:30:55', NULL),
(528, 62, 62, 'USER_ADD', 62, 1, 'N', '2017-12-29 16:52:50', NULL),
(529, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2017-12-30 08:54:51', NULL),
(530, 1, 1, 'RECIPE_REMOVE', 103, 1, 'N', '2017-12-30 08:55:44', NULL),
(532, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2017-12-30 08:56:27', NULL),
(533, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2017-12-30 08:56:34', NULL),
(538, 63, 63, 'USER_ADD', 63, 1, 'N', '2017-12-30 09:53:23', NULL),
(539, 64, 64, 'USER_ADD', 64, 1, 'N', '2017-12-30 09:55:20', NULL),
(540, 65, 65, 'USER_ADD', 65, 1, 'N', '2018-01-01 11:23:18', NULL),
(541, 1, 4, 'USER_FOLLOW', 3, 1, 'N', '2018-01-08 08:37:18', NULL),
(542, 1, 8, 'USER_FOLLOW', 4, 1, 'N', '2018-01-08 08:37:24', NULL),
(543, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-01-08 08:37:41', NULL),
(544, 1, 15, 'USER_FOLLOW', 5, 1, 'N', '2018-01-08 08:37:56', NULL),
(545, 1, 14, 'USER_FOLLOW', 6, 1, 'N', '2018-01-08 08:38:08', NULL),
(546, 3, 4, 'USER_UNFOLLOW', 19, 1, 'N', '2018-01-08 09:07:45', NULL),
(547, 3, 4, 'USER_FOLLOW', 19, 1, 'N', '2018-01-08 09:07:48', NULL),
(548, 3, 4, 'USER_UNFOLLOW', 19, 1, 'N', '2018-01-08 09:07:52', NULL),
(549, 3, 4, 'USER_FOLLOW', 19, 1, 'N', '2018-01-08 09:07:55', NULL),
(550, 3, 4, 'USER_UNFOLLOW', 19, 1, 'N', '2018-01-08 09:08:01', NULL),
(551, 3, 4, 'USER_FOLLOW', 19, 1, 'N', '2018-01-08 09:08:04', NULL),
(552, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-01-08 11:08:28', NULL),
(553, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2018-01-08 11:08:36', NULL),
(554, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-01-08 14:08:25', NULL),
(555, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-01-08 14:09:52', NULL),
(556, 2, 1, 'USER_FOLLOW', 20, 1, 'N', '2018-01-08 16:14:30', NULL),
(557, 3, 1, 'USER_FOLLOW', 21, 1, 'N', '2018-01-08 16:14:45', NULL),
(558, 5, 1, 'USER_FOLLOW', 22, 1, 'N', '2018-01-08 16:14:55', NULL),
(559, 6, 1, 'USER_FOLLOW', 23, 1, 'N', '2018-01-08 16:15:02', NULL),
(560, 8, 1, 'USER_FOLLOW', 24, 1, 'N', '2018-01-08 16:15:07', NULL),
(561, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2018-01-08 16:15:18', NULL),
(562, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-01-08 16:15:24', NULL),
(563, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2018-01-08 16:15:31', NULL),
(564, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-01-08 16:34:14', NULL),
(565, 2, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-01-08 16:36:31', NULL),
(566, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-01-08 17:02:52', NULL),
(567, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2018-01-08 17:16:27', NULL),
(568, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-01-08 17:16:44', NULL),
(569, 1, 2, 'USER_UNFOLLOW', 1, 1, 'N', '2018-01-08 17:17:13', NULL),
(570, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2018-01-08 17:19:08', NULL),
(571, 1, 2, 'USER_UNFOLLOW', 1, 1, 'N', '2018-01-08 17:19:24', NULL),
(572, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2018-01-08 17:21:10', NULL),
(573, 1, 2, 'USER_UNFOLLOW', 1, 1, 'N', '2018-01-08 17:21:15', NULL),
(574, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2018-01-08 17:21:25', NULL),
(575, 1, 2, 'USER_UNFOLLOW', 1, 1, 'N', '2018-01-08 17:21:51', NULL),
(576, 2, 2, 'USER_FOLLOW', 1, 1, 'N', '2018-01-08 17:25:01', NULL),
(577, 1, 2, 'USER_UNFOLLOW', 1, 1, 'N', '2018-01-11 08:28:50', NULL),
(578, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2018-01-11 08:28:54', NULL),
(579, 2, 1, 'USER_UNFOLLOW', 20, 1, 'N', '2018-01-11 08:29:05', NULL),
(580, 2, 1, 'USER_FOLLOW', 20, 1, 'N', '2018-01-11 08:29:10', NULL),
(581, 1, 2, 'USER_UNFOLLOW', 1, 1, 'N', '2018-01-12 16:33:41', NULL),
(582, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2018-01-12 16:33:46', NULL),
(583, 1, 2, 'LIKE_RECIPE_ADD', 17, 1, 'N', '2018-01-12 20:41:14', NULL),
(584, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-01-13 20:14:50', NULL),
(585, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2018-01-15 08:15:35', NULL),
(586, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'Y', '2018-01-15 08:19:01', NULL),
(587, 1, 1, 'LIKE_COMMENT_ADD', 18, 1, 'N', '2018-01-16 00:56:06', NULL),
(588, 1, 1, 'COMMENT_RECIPE_ADD', 64, 1, 'N', '2018-01-16 00:56:08', NULL),
(589, 1, 1, 'COMMENT_RECIPE_ADD', 65, 1, 'N', '2018-01-16 00:56:09', NULL),
(590, 1, 1, 'LIKE_COMMENT_REMOVE', 18, 1, 'N', '2018-01-16 00:56:10', NULL),
(591, 1, 1, 'LIKE_COMMENT_ADD', 18, 2, 'N', '2018-01-16 00:56:12', NULL),
(592, 1, 1, 'LIKE_RECIPE_ADD', 7, 1, 'Y', '2018-01-16 00:56:13', NULL),
(593, 1, 1, 'LIKE_RECIPE_REMOVE', 7, 1, 'Y', '2018-01-16 23:46:14', NULL),
(594, 1, 1, 'COMMENT_RECIPE_ADD', 66, 2, 'Y', '2018-01-16 23:46:26', NULL),
(595, 1, 1, 'COMMENT_RECIPE_ADD', 67, 3, 'Y', '2018-01-16 23:46:26', NULL),
(596, 1, 1, 'COMMENT_RECIPE_ADD', 68, 3, 'Y', '2018-01-16 23:46:42', NULL),
(597, 1, 1, 'COMMENT_RECIPE_ADD', 69, 1, 'Y', '2018-01-16 23:46:44', NULL),
(598, 66, 66, 'USER_ADD', 66, 1, 'N', '2018-01-18 14:23:33', NULL),
(599, 67, 67, 'USER_ADD', 67, 1, 'N', '2018-01-29 23:34:52', NULL),
(600, 1, 2, 'LIKE_RECIPE_REMOVE', 17, 1, 'N', '2018-02-03 14:18:43', NULL),
(601, 1, 2, 'LIKE_RECIPE_ADD', 17, 1, 'N', '2018-02-03 14:18:44', NULL),
(602, 1, 2, 'LIKE_RECIPE_REMOVE', 17, 1, 'N', '2018-02-03 14:18:47', NULL),
(603, 1, 2, 'LIKE_RECIPE_ADD', 17, 1, 'N', '2018-02-03 14:25:29', NULL),
(604, 1, 2, 'LIKE_RECIPE_REMOVE', 17, 1, 'N', '2018-02-03 14:25:30', NULL),
(605, 1, 2, 'LIKE_RECIPE_ADD', 17, 1, 'N', '2018-02-03 14:25:33', NULL),
(606, 1, 2, 'LIKE_RECIPE_REMOVE', 17, 1, 'N', '2018-02-03 14:25:37', NULL),
(607, 1, 2, 'LIKE_RECIPE_ADD', 17, 1, 'N', '2018-02-03 20:40:47', NULL),
(608, 1, 2, 'LIKE_RECIPE_REMOVE', 17, 1, 'N', '2018-02-03 20:40:49', NULL),
(609, 1, 2, 'LIKE_RECIPE_ADD', 17, 1, 'N', '2018-02-03 20:40:49', NULL),
(610, 1, 2, 'LIKE_RECIPE_REMOVE', 17, 1, 'N', '2018-02-03 20:40:57', NULL),
(611, 1, 2, 'LIKE_RECIPE_ADD', 17, 1, 'N', '2018-02-03 20:40:58', NULL),
(612, 1, 2, 'LIKE_RECIPE_REMOVE', 17, 1, 'N', '2018-02-03 20:41:02', NULL),
(613, 1, 2, 'LIKE_RECIPE_ADD', 17, 1, 'N', '2018-02-03 20:41:04', NULL),
(614, 1, 2, 'LIKE_RECIPE_REMOVE', 17, 1, 'N', '2018-02-03 20:41:11', NULL),
(615, 1, 2, 'LIKE_RECIPE_ADD', 17, 1, 'N', '2018-02-03 20:41:13', NULL),
(616, 1, 2, 'LIKE_RECIPE_REMOVE', 17, 1, 'N', '2018-02-03 20:41:16', NULL),
(617, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-02-06 17:09:36', NULL),
(618, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-02-06 17:15:53', NULL),
(619, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-02-06 17:19:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `USER_ID` int(11) NOT NULL,
  `RANK_ID` int(11) NOT NULL DEFAULT '1',
  `EMAIL` varchar(50) NOT NULL,
  `EMAIL_SCOPE_ID` int(11) NOT NULL DEFAULT '1',
  `VERI_CODE` int(8) NOT NULL,
  `VERI_CODE_DTM` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IMG` varchar(50) DEFAULT NULL,
  `MOBILE` varchar(15) DEFAULT NULL,
  `MOBILE_SCOPE_ID` int(11) NOT NULL DEFAULT '1',
  `PASSWORD` varchar(25) NOT NULL,
  `NAME` varchar(25) DEFAULT NULL,
  `GENDER` varchar(1) DEFAULT '',
  `GENDER_SCOPE_ID` int(11) NOT NULL DEFAULT '1',
  `SSID` varchar(25) DEFAULT NULL,
  `SALT` varchar(25) DEFAULT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`USER_ID`, `RANK_ID`, `EMAIL`, `EMAIL_SCOPE_ID`, `VERI_CODE`, `VERI_CODE_DTM`, `IMG`, `MOBILE`, `MOBILE_SCOPE_ID`, `PASSWORD`, `NAME`, `GENDER`, `GENDER_SCOPE_ID`, `SSID`, `SALT`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 'cookery@cookery.com', 2, 648153, '2018-01-20 20:23:49', 'app_data/users/1/profile/images/5a79d59025e15.jpg', '1234', 2, 'Q09PS0VSWXNOS1dJ', 'USER - 1', 'F', 2, '', 'c05LV0k=', '2017-09-23 00:00:00', '2018-02-06 17:19:28'),
(2, 1, 'testemail@cookery.com', 1, 0, '2017-12-29 06:29:04', NULL, '9962218578', 1, 'aWFtdGVzdE15RkJE', 'USER - 2', 'm', 1, 'BlsXt3B4aS', 'TXlGQkQ=', '2017-10-31 05:05:03', '2017-12-31 06:54:52'),
(3, 1, 'testemail2@cookery.com', 1, 0, '2017-12-29 06:29:04', NULL, '7503876065', 1, 'aWFtdGVzdG9TS3Ay', 'USER - 3', 'm', 1, 'UgbYfiDJNG', 'b1NLcDI=', '2017-10-31 05:22:11', NULL),
(4, 1, 'vishal@cookery.com', 1, 0, '2017-12-29 06:29:04', NULL, '8124627522', 1, 'cm9jazJaUEtw', 'USER - 4', 'M', 1, 'zXpcSp5CRx', 'MlpQS3A=', '2017-10-31 13:37:06', NULL),
(5, 1, 'testuser@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '1234567890', 1, 'MTIzNDU2NzgxNjhjUg==', 'USER - 5', 'M', 1, '8WGpsX2MsJ', 'MTY4Y1I=', '2017-12-05 09:28:53', NULL),
(6, 1, 'yOIW8uBUPh@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '8202377734', 1, 'MTIzNDU2Nzh6YUlrYw==', 'USER - 6', 'M', 1, 'p1DuoOctRT', 'emFJa2M=', '2017-12-06 10:09:03', NULL),
(7, 1, 'BuaMX1inFJ@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '1434819247', 1, 'MTIzNDU2NzgzeGtreA==', 'USER - 7', 'M', 1, 'fugYiKnDx8', 'M3hra3g=', '2017-12-06 10:17:52', NULL),
(8, 1, 'mbTVNucEYo@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '4048666965', 1, 'MTIzNDU2NzhqWW9RRA==', 'USER - 8', 'M', 1, 'wqzAVyYyJt', 'allvUUQ=', '2017-12-06 10:18:40', NULL),
(9, 1, 'mKZ3tT6mDV@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '2463154465', 1, 'MTIzNDU2NzhuV1hOVA==', 'Test User', 'M', 1, '79D6gkz9YL', 'bldYTlQ=', '2017-12-06 10:19:12', NULL),
(10, 1, 'yotGl72BQP@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '4706108967', 1, 'MTIzNDU2Nzhna05KRw==', 'Test User', 'M', 1, '10bR1Dhl1v', 'Z2tOSkc=', '2017-12-06 10:25:31', NULL),
(11, 1, 'p7gerTEFcK@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '3224967902', 1, 'MTIzNDU2NzhNZHhsWA==', 'Test User', 'M', 1, 'Aa0qpd0dRi', 'TWR4bFg=', '2017-12-06 10:26:31', NULL),
(12, 1, '2hdwLAh3Qf@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '1122780923', 1, 'MTIzNDU2NzhhU1VXMQ==', 'Test User', 'M', 1, 'kZQae7t6VP', 'YVNVVzE=', '2017-12-06 10:32:19', NULL),
(13, 1, '1ur6aieyL4@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '7568342541', 1, 'UkZ3azZVRGJRNlE2SXpx', 'Test User', 'M', 1, 'efESK2GWwx', 'UTZJenE=', '2017-12-06 10:36:54', NULL),
(14, 1, 'DyBbMIg3hW@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '6397083418', 1, 'MzZnMUR2dnFJODhmclFj', 'USER - 14', 'M', 1, 'j5uaOopyRB', 'OGZyUWM=', '2017-12-06 10:38:49', NULL),
(15, 1, 'Ch0C1oJCgP@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '1236028204', 1, 'bTh5RTNEY203Y0d3ODBR', 'USER - 15', 'M', 1, '1cwiaP2xsA', 'R3c4MFE=', '2017-12-06 10:42:08', NULL),
(16, 1, 'ZfhzXsEz5X@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '0328880787', 1, 'T0ZMSUpkYm1sTTBsRDJi', 'Test User', 'M', 1, 'XVLEHSZm7U', 'MGxEMmI=', '2017-12-06 10:43:00', NULL),
(17, 1, 'RX631Oc74f@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '1925274231', 1, 'ZFVURk1SM1Z6ek9sckpo', 'Test User', 'M', 1, 'FkQwv4DZaz', 'T2xySmg=', '2017-12-06 15:20:07', NULL),
(18, 1, 'Nq2ieecBym@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '9071819562', 1, 'WGdETmlpdjRHQnMxNGVD', 'Test User', 'M', 1, 'lO8HfQ826L', 'czE0ZUM=', '2017-12-06 21:06:19', NULL),
(19, 1, 'jj5eAEXfU9@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '4282843437', 1, 'M3VEOVJDaHFWV056OUxu', 'Test User', 'M', 1, 'hmMUs3e1cd', 'Tno5TG4=', '2017-12-06 21:19:07', NULL),
(20, 1, '29LcdlnLKf@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '4345019328', 1, 'SmdQc29VUlREVFVSYk1B', 'Test User', 'M', 1, 'oCThqOWUsW', 'VVJiTUE=', '2017-12-06 21:19:07', NULL),
(21, 1, 'gUl84sC85i@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '7493439821', 1, 'NjZBeVM5OVpQRjZGTHZ3', 'Test User', 'M', 1, 'V5RuFN3DlM', 'NkZMdnc=', '2017-12-06 21:19:07', NULL),
(22, 1, 'hOpulyUcvN@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '2551728778', 1, 'YlpsYWo2QUNkazhsQWlq', 'Test User', 'M', 1, 'I3icXGGgbT', 'OGxBaWo=', '2017-12-06 21:19:08', NULL),
(23, 1, 'bMfjcgsHmB@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '8788910625', 1, 'ZjdVQjNWbjhZQkdSTlBT', 'Test User', 'M', 1, 'sLtY3DO5bg', 'R1JOUFM=', '2017-12-06 21:19:08', NULL),
(24, 1, 'gzzvd5mHzV@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '2459219942', 1, 'd1ZDSmpndk1uMHJkZWZY', 'Test User', 'M', 1, '3NAeFBSWWU', 'cmRlZlg=', '2017-12-06 21:19:08', NULL),
(25, 1, 'CFAXHpPwUd@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '7921299722', 1, 'YzVhdnpDVDlmZ05PV1pB', 'Test User', 'M', 1, 'UDzOV0DRU5', 'Tk9XWkE=', '2017-12-07 11:32:54', NULL),
(26, 1, 'eEfVEJrxIX@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '3499450811', 1, 'bXRKSUxSNzROdFI1N1Ay', 'Test User', 'M', 1, 'w50UEdmk58', 'UjU3UDI=', '2017-12-07 11:54:15', NULL),
(27, 1, '4OjqajUs9g@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '1150903063', 1, 'TXFidlN1czNlYTVyVWpI', 'Test User', 'M', 1, 'x3o7h3JaZG', 'NXJVakg=', '2017-12-07 12:05:22', NULL),
(28, 1, 'lpZngIZUKY@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '7172558694', 1, 'Q1I5dXJ2TXFLb1FqSXlU', 'Test User', 'M', 1, 'oKM3Cw6itC', 'UWpJeVQ=', '2017-12-07 12:22:14', NULL),
(29, 1, 'Qanx1xZlef@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '6077018106', 1, 'QzZTdDVNNWdiR2FVU3Fx', 'Test User', 'M', 1, 'LuHOy11sWR', 'YVVTcXE=', '2017-12-07 12:22:14', NULL),
(30, 1, 'PE5XKyFRTO@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '6856612574', 1, 'RW5vWmRMZmVhM0lXYU5h', 'Test User', 'M', 1, '37bbOr2Xt8', 'SVdhTmE=', '2017-12-07 12:22:14', NULL),
(31, 1, 'rQnpbdgL71@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '9396035651', 1, 'cndnV1hWOWlVck5UV2ZL', 'Test User', 'M', 1, 'WBoqMdPcLG', 'TlRXZks=', '2017-12-07 12:22:14', NULL),
(32, 1, 'ztfSEk6B3C@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '7311704009', 1, 'dWs3UklOeXM4S1BuUEFT', 'Test User', 'M', 1, '9uY0ZDN2g9', 'UG5QQVM=', '2017-12-07 12:22:15', NULL),
(33, 1, 'lYoRhb8ZBf@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '8451165685', 1, 'b0YxZG1GckhES2R3M0Zn', 'Test User', 'M', 1, 'Dudt0IxEHI', 'ZHczRmc=', '2017-12-07 12:22:15', NULL),
(34, 1, '3H5vt92ouL@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '8549161982', 1, 'T2w2TUhiMHBSamxNWFQ3', 'Test User', 'M', 1, 'DCmE3MR3ZJ', 'bE1YVDc=', '2017-12-07 15:01:26', NULL),
(35, 1, '4T1Z4vzjCH@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '2209997550', 1, 'dG81cVdlWkhmMVBncmJU', 'Test User', 'M', 1, 'lSnjYx9Yr3', 'UGdyYlQ=', '2017-12-07 15:01:39', NULL),
(36, 1, '5M7QIvAVFd@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '2978043429', 1, 'bGs2cjFLdnhEa2JSd1pH', 'Test User', 'M', 1, 'k81O74sVaE', 'YlJ3Wkc=', '2017-12-07 15:01:46', NULL),
(37, 1, 'gyhxa6lCeN@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '1449887458', 1, 'RE9jMUR2SEZ5S2w0eXBK', 'Test User', 'M', 1, 'oCaB5bkDQ1', 'bDR5cEo=', '2017-12-07 15:02:15', NULL),
(38, 1, 'JcEK2zoeFr@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '5028518859', 1, 'c2NrelhQc25XYkthRmx0', 'Test User', 'M', 1, '8XOraL8Q2k', 'S2FGbHQ=', '2017-12-07 15:02:21', NULL),
(39, 1, 'kTWUUMdona@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '6701341132', 1, 'ZTMyZDVxcWo3U0xWYUlV', 'Test User', 'M', 1, 'Relr2grF7m', 'TFZhSVU=', '2017-12-07 15:12:20', NULL),
(40, 1, 'G5tTSHpBzo@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '9785956975', 1, 'dzFCWWxQeEdLUkJibTVl', 'Test User', 'M', 1, 'eGAnNJuj2Z', 'QmJtNWU=', '2017-12-09 02:31:36', NULL),
(41, 1, 'szP8OEFT2Y@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '8418273261', 1, 'VjlrM0VHSFhxQmJic3JS', 'Test User', 'M', 1, 'fGjcdciQF7', 'YmJzclI=', '2017-12-09 02:31:36', NULL),
(42, 1, 'iUOPvHMUHU@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '3981859004', 1, 'Y2RZTFhXSTFPdDU5Yzk1', 'Test User', 'M', 1, 'yvbV3rhwBp', 'NTljOTU=', '2017-12-09 02:31:37', NULL),
(43, 1, 'm83W2E74ml@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '8988125485', 1, 'dHZxVWVBTDNRQ2xWR0hp', 'Test User', 'M', 1, 'nokluy1nr8', 'bFZHSGk=', '2017-12-09 02:31:37', NULL),
(44, 1, 'u5dK9mDKc3@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '9466253586', 1, 'M1IzamhwSXdXeWIwVGVF', 'Test User', 'M', 1, 's1VUX7txJV', 'YjBUZUU=', '2017-12-09 02:31:38', NULL),
(45, 1, 'AJ3uHtwFi5@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '5933337509', 1, 'S3d2NUVKbTg4Q2oyM0c3', 'Test User', 'M', 1, 'wsk7P8QkrS', 'ajIzRzc=', '2017-12-09 03:04:14', NULL),
(46, 1, '2D3knF59UH@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '8031776077', 1, 'V25yVFhjekVLZWhkRnVj', 'Test User', 'M', 1, 'XQSDDW2AUH', 'aGRGdWM=', '2017-12-12 15:30:27', NULL),
(47, 1, 'bxy59Uozgv@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '3311571135', 1, 'czBURzFjd2JMVEo0ZTFP', 'Test User', 'M', 1, 'zervzzZPzM', 'SjRlMU8=', '2017-12-13 15:38:42', NULL),
(48, 1, 'BnjETSM2Ce@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '7804938640', 1, 'T2VDaVkzTEFwOThEZWZv', 'Test User', 'M', 1, '9grxmxpmhZ', 'OERlZm8=', '2017-12-14 11:01:33', NULL),
(49, 1, 'mqTJxCGpka@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '1202368274', 1, 'bHdOdUpDMDJacEVtYzVt', 'Test User', 'M', 1, 'atlgH3L0ph', 'RW1jNW0=', '2017-12-15 15:02:05', NULL),
(50, 1, 'xOUqRp2oZN@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '0402232131', 1, 'S1FsSHNoVXpmN3Y3dHRR', 'Test User', 'M', 1, 'CrZF7envK9', 'djd0dFE=', '2017-12-16 22:48:35', NULL),
(51, 1, 'ndjriWzSBw@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '7597298013', 1, 'a1JIVmZLZnhCSWduRHBH', 'Test User', 'M', 1, 'STYGY8xzwl', 'Z25EcEc=', '2017-12-17 14:22:14', NULL),
(52, 1, 'zCIHqiEg2k@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '9176520834', 1, 'ODRiRWhtSjRzVlJ3c292', 'Test User', 'M', 1, '1EoMyTgiDT', 'Undzb3Y=', '2017-12-17 19:39:15', NULL),
(53, 1, 'e0vTB20CNI@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '7795599808', 1, 'Q1dNN3JDbGd5b0F6M2RU', 'Test User', 'M', 1, 'rr3qhhYTGl', 'QXozZFQ=', '2017-12-18 09:53:36', NULL),
(54, 1, 'cGHi8zJir7@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '1344784955', 1, 'YW5NOXlvYnVINDJ1U3dY', 'Test User', 'M', 1, 'MQlMvt0SZK', 'MnVTd1g=', '2017-12-18 10:10:43', NULL),
(55, 1, '1eitY1tUdB@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '3091295174', 1, 'dGVOcm9CZVhCc0ZjbGRx', 'Test User', 'M', 1, 'jXGYOyuPYb', 'RmNsZHE=', '2017-12-18 15:54:48', NULL),
(56, 1, 'iG3S1XhetD@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '1376574609', 1, 'SVJzZW14ZlU1TTE3N1l0', 'Test User', 'M', 1, 'w7Wtdm6Hnt', 'MTc3WXQ=', '2017-12-19 19:58:01', NULL),
(57, 1, 'u1STMAbyKf@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '0182983869', 1, 'dTNOS1ZPdWpLNEl5djZ6', 'Test User', 'M', 1, 'jHia9CKnAj', 'SXl2Nno=', '2017-12-21 09:26:46', NULL),
(58, 1, 'bIOX9zJiqh@gmail.com', 1, 0, '2017-12-29 06:29:04', NULL, '0494893380', 1, 'YVBSY0ljTDdpZWtkd2FY', 'Test User', 'M', 1, 'buW2OLC4kD', 'a2R3YVg=', '2017-12-28 09:23:09', NULL),
(59, 1, 'tmnJJQY6NW@gmail.com', 1, 0, '2017-12-29 07:14:50', NULL, '6176779264', 1, 'M0xFSWpCSjVjOGUxaksz', 'Test User', 'M', 1, 'FwBucTafMt', 'ZTFqSzM=', '2017-12-29 07:14:50', NULL),
(60, 1, '83JuYpN2mR@gmail.com', 1, 0, '2017-12-29 07:38:05', NULL, '7301820168', 1, 'bmZ3cG15d0FjTTBhRVlW', 'Test User', 'M', 1, 'OK50R4fzFj', 'MGFFWVY=', '2017-12-29 07:38:05', NULL),
(61, 1, 'Am8gZZWHa3@gmail.com', 1, 0, '2017-12-29 08:30:55', NULL, '8114166397', 1, 'TmpiMjNTd3NyRjRwV0Nw', 'Test User', 'M', 1, 'osaJRbEWK5', 'NHBXQ3A=', '2017-12-29 08:30:55', NULL),
(62, 1, 'w9ZiyCBczv@gmail.com', 1, 38158294, '2017-12-29 16:52:50', NULL, '3575891040', 1, 'Z1d3Z2o4MnBXUnNlZHB0', 'Test User', 'M', 1, '9ElEB5ILF0', 'c2VkcHQ=', '2017-12-29 16:52:50', NULL),
(63, 1, 'mEmve9D2D6@gmail.com', 1, 14708985, '2017-12-30 09:53:23', NULL, NULL, 1, 'NDUzNDY0ODQ5NHNFQjI0', 'COOKERY', NULL, 1, '4YfRLcdJ2J', 'c0VCMjQ=', '2017-12-30 09:53:23', NULL),
(64, 1, 'DkuyWf4vOz@gmail.com', 1, 88859188, '2017-12-30 09:55:20', NULL, NULL, 1, 'Q09PS0VSWVJzSGlv', 'Test User -  08', NULL, 1, '0rqwzKv526', 'UnNIaW8=', '2017-12-30 09:55:20', NULL),
(65, 1, '2usvcVlzb6@gmail.com', 1, 55039142, '2018-01-01 11:23:18', NULL, NULL, 1, 'Q09PS0VSWVR2SzNK', 'Test User -  08', '', 1, '7bzJJtwkqG', 'VHZLM0o=', '2018-01-01 11:23:18', NULL),
(66, 1, 'aMJUvZ4CM5@gmail.com', 1, 49645219, '2018-01-18 14:23:33', NULL, NULL, 1, 'Q09PS0VSWU9QOXlG', 'Test User -  00', '', 1, 'qeAtZdPW3D', 'T1A5eUY=', '2018-01-18 14:23:33', NULL),
(67, 1, 'rock@cookery.com', 1, 64728213, '2018-01-29 23:34:52', NULL, NULL, 1, 'cm9ja21uYkhY', 'Vishal', '', 1, '5pX9Gn9wlB', 'bW5iSFg=', '2018-01-29 23:34:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `USER_ING_LIST`
--

CREATE TABLE `USER_ING_LIST` (
  `USER_ING_LIST_ID` int(11) NOT NULL,
  `ING_LIST_NAME` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` int(10) NOT NULL,
  `IS_DEL` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `USER_ING_LIST`
--

INSERT INTO `USER_ING_LIST` (`USER_ING_LIST_ID`, `ING_LIST_NAME`, `USER_ID`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(21, 'First list', 1, 'N', '2017-12-30 13:58:08', '2017-12-30 13:58:08'),
(25, 'second list', 1, 'N', '2017-12-30 14:36:23', '2017-12-30 14:36:23'),
(26, 'Gym list', 1, 'N', '2017-12-30 14:38:48', '2017-12-30 14:38:48'),
(27, 'New list', 1, 'N', '2017-12-30 15:09:31', '2017-12-30 15:09:31'),
(28, 'Venkateshwara', 1, 'N', '2017-12-30 15:11:48', '2017-12-30 15:11:48'),
(29, 'Venkateshwara', 1, 'N', '2017-12-30 23:23:32', '2017-12-30 23:23:32'),
(30, 'Venkateshwara', 1, 'N', '2018-01-07 14:49:52', '2018-01-07 14:49:52'),
(31, 'New list', 1, 'N', '2018-01-07 14:55:04', '2018-01-07 14:55:04'),
(32, 'Edit test', 1, 'N', '2018-01-12 22:02:29', '2018-01-12 22:02:29'),
(33, 'Test empty', 1, 'N', '2018-01-14 00:23:11', '2018-01-14 00:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `USER_ING_LIST_ITEM`
--

CREATE TABLE `USER_ING_LIST_ITEM` (
  `USER_ING_LIST_ITEM_ID` int(10) NOT NULL,
  `ING_ID` int(10) NOT NULL,
  `USER_ING_LIST_ID` int(10) NOT NULL,
  `IS_CHECKED` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `USER_ING_LIST_ITEM`
--

INSERT INTO `USER_ING_LIST_ITEM` (`USER_ING_LIST_ITEM_ID`, `ING_ID`, `USER_ING_LIST_ID`, `IS_CHECKED`, `CREATE_DTM`, `MOD_DTM`) VALUES
(27, 2, 21, 'N', '2017-12-30 13:58:08', '2017-12-30 13:58:08'),
(28, 1, 21, 'N', '2017-12-30 13:58:08', '2017-12-30 13:58:08'),
(29, 4, 21, 'N', '2017-12-30 13:58:08', '2017-12-30 13:58:08'),
(32, 7, 25, 'N', '2017-12-30 14:36:23', '2017-12-30 14:36:23'),
(33, 8, 25, 'N', '2017-12-30 14:36:23', '2017-12-30 14:36:23'),
(34, 9, 26, 'N', '2017-12-30 14:38:49', '2017-12-30 14:38:49'),
(35, 10, 26, 'N', '2017-12-30 14:38:49', '2017-12-30 14:38:49'),
(36, 8, 26, 'N', '2017-12-30 14:38:49', '2017-12-30 14:38:49'),
(37, 7, 26, 'N', '2017-12-30 14:38:49', '2017-12-30 14:38:49'),
(38, 8, 27, 'N', '2017-12-30 15:09:31', '2017-12-30 15:09:31'),
(39, 11, 27, 'N', '2017-12-30 15:09:31', '2017-12-30 15:09:31'),
(40, 12, 28, 'N', '2017-12-30 15:11:48', '2017-12-30 15:11:48'),
(41, 9, 28, 'N', '2017-12-30 15:11:48', '2017-12-30 15:11:48'),
(42, 7, 28, 'N', '2017-12-30 15:11:48', '2017-12-30 15:11:48'),
(43, 8, 28, 'N', '2017-12-30 15:11:48', '2017-12-30 15:11:48'),
(44, 13, 29, 'N', '2017-12-30 23:23:33', '2017-12-30 23:23:33'),
(45, 8, 29, 'N', '2017-12-30 23:23:33', '2017-12-30 23:23:33'),
(46, 8, 29, 'N', '2017-12-30 23:23:33', '2017-12-30 23:23:33'),
(47, 8, 29, 'N', '2017-12-30 23:23:33', '2017-12-30 23:23:33'),
(48, 8, 29, 'N', '2017-12-30 23:23:33', '2017-12-30 23:23:33'),
(49, 13, 30, 'N', '2018-01-07 14:49:52', '2018-01-07 14:49:52'),
(50, 8, 30, 'N', '2018-01-07 14:49:52', '2018-01-07 14:49:52'),
(51, 8, 30, 'N', '2018-01-07 14:49:53', '2018-01-07 14:49:53'),
(52, 8, 30, 'N', '2018-01-07 14:49:53', '2018-01-07 14:49:53'),
(53, 8, 30, 'N', '2018-01-07 14:49:53', '2018-01-07 14:49:53'),
(54, 8, 31, 'N', '2018-01-07 14:55:04', '2018-01-07 14:55:04'),
(55, 11, 31, 'N', '2018-01-07 14:55:04', '2018-01-07 14:55:04'),
(88, 10, 32, 'N', '2018-01-12 23:54:48', '2018-01-12 23:54:48'),
(89, 15, 32, 'N', '2018-01-12 23:54:48', '2018-01-12 23:54:48'),
(90, 17, 32, 'N', '2018-01-12 23:54:48', '2018-01-12 23:54:48'),
(91, 19, 33, 'N', '2018-01-14 00:23:12', '2018-01-14 00:23:12'),
(92, 2, 31, 'N', '2018-02-03 14:32:09', '2018-02-03 14:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `USER_RELATIONSHIP`
--

CREATE TABLE `USER_RELATIONSHIP` (
  `RLT_ID` int(15) NOT NULL,
  `FLWR_USER_ID` int(15) NOT NULL,
  `FLWS_USER_ID` int(15) NOT NULL,
  `IS_DEL` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `USER_RELATIONSHIP`
--

INSERT INTO `USER_RELATIONSHIP` (`RLT_ID`, `FLWR_USER_ID`, `FLWS_USER_ID`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 2, 'N', '2017-12-27 08:20:02', '2018-01-12 16:33:45'),
(2, 1, 3, 'N', '2017-12-27 08:27:22', '2018-01-08 17:16:44'),
(3, 1, 4, 'N', '2018-01-08 08:37:17', NULL),
(4, 1, 8, 'N', '2018-01-08 08:37:24', NULL),
(5, 1, 15, 'N', '2018-01-08 08:37:56', NULL),
(6, 1, 14, 'N', '2018-01-08 08:38:08', NULL),
(17, 4, 5, 'N', '2018-01-08 09:05:36', NULL),
(19, 3, 4, 'N', '2018-01-08 09:07:23', '2018-01-08 09:08:04'),
(20, 2, 3, 'N', '2018-01-08 16:14:30', '2018-01-11 08:29:10'),
(21, 3, 1, 'N', '2018-01-08 16:14:45', NULL),
(22, 5, 1, 'N', '2018-01-08 16:14:54', NULL),
(23, 6, 1, 'N', '2018-01-08 16:15:02', NULL),
(24, 8, 1, 'N', '2018-01-08 16:15:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `VIEWS`
--

CREATE TABLE `VIEWS` (
  `VIEW_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `RCP_ID` int(11) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `VIEWS`
--

INSERT INTO `VIEWS` (`VIEW_ID`, `USER_ID`, `RCP_ID`, `CREATE_DTM`, `MOD_DTM`) VALUES
(8, 3, 78, '2017-12-05 18:40:07', NULL),
(9, 1, 3, '2017-12-06 16:01:57', NULL),
(10, 1, 66, '2017-12-13 18:12:02', NULL),
(11, 1, 103, '2017-12-13 18:13:18', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD PRIMARY KEY (`COM_ID`),
  ADD KEY `RCP_ID` (`RCP_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `CONTAINS`
--
ALTER TABLE `CONTAINS`
  ADD PRIMARY KEY (`CONT_ID`),
  ADD KEY `FK1` (`ING_ID`);

--
-- Indexes for table `DISH`
--
ALTER TABLE `DISH`
  ADD PRIMARY KEY (`DISH_ID`),
  ADD KEY `DISH_FK1` (`QTY_ID`);

--
-- Indexes for table `FAVOURITES`
--
ALTER TABLE `FAVOURITES`
  ADD PRIMARY KEY (`FAV_ID`),
  ADD KEY `USER_FAV_FK` (`USER_ID`),
  ADD KEY `RCP_FAV_FK` (`RCP_ID`);

--
-- Indexes for table `FOOD_CUISINE`
--
ALTER TABLE `FOOD_CUISINE`
  ADD PRIMARY KEY (`FOOD_CSN_ID`);

--
-- Indexes for table `FOOD_TYPE`
--
ALTER TABLE `FOOD_TYPE`
  ADD PRIMARY KEY (`FOOD_TYP_ID`);

--
-- Indexes for table `INGREDIENT`
--
ALTER TABLE `INGREDIENT`
  ADD PRIMARY KEY (`ING_ID`);

--
-- Indexes for table `ING_AKA`
--
ALTER TABLE `ING_AKA`
  ADD PRIMARY KEY (`ING_AKA_ID`),
  ADD KEY `ING_AKA_FK1` (`ING_ID`);

--
-- Indexes for table `LIKES`
--
ALTER TABLE `LIKES`
  ADD PRIMARY KEY (`LIKE_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `MILESTONE`
--
ALTER TABLE `MILESTONE`
  ADD PRIMARY KEY (`MLT_ID`),
  ADD KEY `MILESTON_FK1` (`RANK_ID`);

--
-- Indexes for table `QTY`
--
ALTER TABLE `QTY`
  ADD PRIMARY KEY (`QTY_ID`);

--
-- Indexes for table `RANK`
--
ALTER TABLE `RANK`
  ADD PRIMARY KEY (`RANK_ID`);

--
-- Indexes for table `RECIPE`
--
ALTER TABLE `RECIPE`
  ADD PRIMARY KEY (`RCP_ID`);

--
-- Indexes for table `RECIPE_CONTAINS`
--
ALTER TABLE `RECIPE_CONTAINS`
  ADD PRIMARY KEY (`RCP_CONT_ID`),
  ADD KEY `RECIPE_CONTAINS_FK1` (`RCP_ID`);

--
-- Indexes for table `RECIPE_IMG`
--
ALTER TABLE `RECIPE_IMG`
  ADD PRIMARY KEY (`RCP_IMG_ID`);

--
-- Indexes for table `RECIPE_STEPS`
--
ALTER TABLE `RECIPE_STEPS`
  ADD PRIMARY KEY (`RCP_STPS_ID`),
  ADD KEY `RCP_ID` (`RCP_ID`);

--
-- Indexes for table `RECIPE_TASTE`
--
ALTER TABLE `RECIPE_TASTE`
  ADD PRIMARY KEY (`RCP_TST_ID`);

--
-- Indexes for table `REVIEWS`
--
ALTER TABLE `REVIEWS`
  ADD PRIMARY KEY (`REV_ID`),
  ADD KEY `RCP_ID` (`RCP_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `SCOPE`
--
ALTER TABLE `SCOPE`
  ADD PRIMARY KEY (`SCOPE_ID`);

--
-- Indexes for table `TASTES`
--
ALTER TABLE `TASTES`
  ADD PRIMARY KEY (`TST_ID`);

--
-- Indexes for table `TIMELINES`
--
ALTER TABLE `TIMELINES`
  ADD PRIMARY KEY (`TMLN_ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `REF_USER_ID` (`REF_USER_ID`),
  ADD KEY `TIMELINES_FK3` (`SCOPE_ID`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`USER_ID`),
  ADD KEY `USER_FK1` (`EMAIL_SCOPE_ID`),
  ADD KEY `USER_FK3` (`MOBILE_SCOPE_ID`),
  ADD KEY `USER_FK2` (`GENDER_SCOPE_ID`),
  ADD KEY `USER_FK4` (`RANK_ID`);

--
-- Indexes for table `USER_ING_LIST`
--
ALTER TABLE `USER_ING_LIST`
  ADD PRIMARY KEY (`USER_ING_LIST_ID`),
  ADD KEY `USER_ID_FK` (`USER_ID`);

--
-- Indexes for table `USER_ING_LIST_ITEM`
--
ALTER TABLE `USER_ING_LIST_ITEM`
  ADD PRIMARY KEY (`USER_ING_LIST_ITEM_ID`),
  ADD KEY `LIST_ID_FK` (`USER_ING_LIST_ID`),
  ADD KEY `USER_ING_LIST_ITEM_ID` (`USER_ING_LIST_ITEM_ID`),
  ADD KEY `ING_ID` (`ING_ID`),
  ADD KEY `ING_ID_2` (`ING_ID`);

--
-- Indexes for table `USER_RELATIONSHIP`
--
ALTER TABLE `USER_RELATIONSHIP`
  ADD PRIMARY KEY (`RLT_ID`),
  ADD KEY `FLWR_USER_ID` (`FLWR_USER_ID`),
  ADD KEY `FLWS_USER_ID` (`FLWS_USER_ID`) USING BTREE;

--
-- Indexes for table `VIEWS`
--
ALTER TABLE `VIEWS`
  ADD PRIMARY KEY (`VIEW_ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `RCP_ID` (`RCP_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  MODIFY `COM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `CONTAINS`
--
ALTER TABLE `CONTAINS`
  MODIFY `CONT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `DISH`
--
ALTER TABLE `DISH`
  MODIFY `DISH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `FAVOURITES`
--
ALTER TABLE `FAVOURITES`
  MODIFY `FAV_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `FOOD_CUISINE`
--
ALTER TABLE `FOOD_CUISINE`
  MODIFY `FOOD_CSN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `FOOD_TYPE`
--
ALTER TABLE `FOOD_TYPE`
  MODIFY `FOOD_TYP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `INGREDIENT`
--
ALTER TABLE `INGREDIENT`
  MODIFY `ING_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ING_AKA`
--
ALTER TABLE `ING_AKA`
  MODIFY `ING_AKA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `LIKES`
--
ALTER TABLE `LIKES`
  MODIFY `LIKE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `MILESTONE`
--
ALTER TABLE `MILESTONE`
  MODIFY `MLT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `QTY`
--
ALTER TABLE `QTY`
  MODIFY `QTY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `RANK`
--
ALTER TABLE `RANK`
  MODIFY `RANK_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `RECIPE`
--
ALTER TABLE `RECIPE`
  MODIFY `RCP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `RECIPE_CONTAINS`
--
ALTER TABLE `RECIPE_CONTAINS`
  MODIFY `RCP_CONT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RECIPE_IMG`
--
ALTER TABLE `RECIPE_IMG`
  MODIFY `RCP_IMG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `RECIPE_STEPS`
--
ALTER TABLE `RECIPE_STEPS`
  MODIFY `RCP_STPS_ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `RECIPE_TASTE`
--
ALTER TABLE `RECIPE_TASTE`
  MODIFY `RCP_TST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `REVIEWS`
--
ALTER TABLE `REVIEWS`
  MODIFY `REV_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `SCOPE`
--
ALTER TABLE `SCOPE`
  MODIFY `SCOPE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `TASTES`
--
ALTER TABLE `TASTES`
  MODIFY `TST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `TIMELINES`
--
ALTER TABLE `TIMELINES`
  MODIFY `TMLN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=620;

--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `USER_ING_LIST`
--
ALTER TABLE `USER_ING_LIST`
  MODIFY `USER_ING_LIST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `USER_ING_LIST_ITEM`
--
ALTER TABLE `USER_ING_LIST_ITEM`
  MODIFY `USER_ING_LIST_ITEM_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `USER_RELATIONSHIP`
--
ALTER TABLE `USER_RELATIONSHIP`
  MODIFY `RLT_ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `VIEWS`
--
ALTER TABLE `VIEWS`
  MODIFY `VIEW_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD CONSTRAINT `FK_RECIPE_COMMENTS` FOREIGN KEY (`RCP_ID`) REFERENCES `RECIPE` (`rcp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_USER_COMMENTS` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CONTAINS`
--
ALTER TABLE `CONTAINS`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`ING_ID`) REFERENCES `INGREDIENT` (`ing_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `DISH`
--
ALTER TABLE `DISH`
  ADD CONSTRAINT `DISH_FK1` FOREIGN KEY (`QTY_ID`) REFERENCES `QTY` (`qty_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `FAVOURITES`
--
ALTER TABLE `FAVOURITES`
  ADD CONSTRAINT `RCP_FAV_FK` FOREIGN KEY (`RCP_ID`) REFERENCES `RECIPE` (`rcp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `USER_FAV_FK` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ING_AKA`
--
ALTER TABLE `ING_AKA`
  ADD CONSTRAINT `ING_AKA_FK1` FOREIGN KEY (`ING_ID`) REFERENCES `INGREDIENT` (`ing_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `LIKES`
--
ALTER TABLE `LIKES`
  ADD CONSTRAINT `FK_USER_LIKES` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MILESTONE`
--
ALTER TABLE `MILESTONE`
  ADD CONSTRAINT `MILESTON_FK1` FOREIGN KEY (`RANK_ID`) REFERENCES `RANK` (`rank_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `RECIPE_CONTAINS`
--
ALTER TABLE `RECIPE_CONTAINS`
  ADD CONSTRAINT `RECIPE_CONTAINS_FK1` FOREIGN KEY (`RCP_ID`) REFERENCES `RECIPE` (`rcp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `RECIPE_STEPS`
--
ALTER TABLE `RECIPE_STEPS`
  ADD CONSTRAINT `RECIPE_STEPS_FK1` FOREIGN KEY (`RCP_ID`) REFERENCES `RECIPE` (`rcp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `REVIEWS`
--
ALTER TABLE `REVIEWS`
  ADD CONSTRAINT `REVIEWS_FK1` FOREIGN KEY (`RCP_ID`) REFERENCES `RECIPE` (`rcp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `REVIEWS_FK2` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `TIMELINES`
--
ALTER TABLE `TIMELINES`
  ADD CONSTRAINT `TIMELINES_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `TIMELINES_FK2` FOREIGN KEY (`REF_USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `TIMELINES_FK3` FOREIGN KEY (`SCOPE_ID`) REFERENCES `SCOPE` (`scope_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `USER`
--
ALTER TABLE `USER`
  ADD CONSTRAINT `USER_FK1` FOREIGN KEY (`EMAIL_SCOPE_ID`) REFERENCES `SCOPE` (`scope_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `USER_FK2` FOREIGN KEY (`GENDER_SCOPE_ID`) REFERENCES `SCOPE` (`scope_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `USER_FK3` FOREIGN KEY (`MOBILE_SCOPE_ID`) REFERENCES `SCOPE` (`scope_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `USER_FK4` FOREIGN KEY (`RANK_ID`) REFERENCES `RANK` (`rank_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `USER_ING_LIST`
--
ALTER TABLE `USER_ING_LIST`
  ADD CONSTRAINT `USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `USER_ING_LIST_ITEM`
--
ALTER TABLE `USER_ING_LIST_ITEM`
  ADD CONSTRAINT `ING_FK` FOREIGN KEY (`ING_ID`) REFERENCES `INGREDIENT` (`ing_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `LIST_ID_FK` FOREIGN KEY (`USER_ING_LIST_ID`) REFERENCES `USER_ING_LIST` (`user_ing_list_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `USER_RELATIONSHIP`
--
ALTER TABLE `USER_RELATIONSHIP`
  ADD CONSTRAINT `USER_RLT_FK1` FOREIGN KEY (`FLWR_USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `USER_RLT_FK2` FOREIGN KEY (`FLWS_USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `VIEWS`
--
ALTER TABLE `VIEWS`
  ADD CONSTRAINT `VIEWS_FK1` FOREIGN KEY (`RCP_ID`) REFERENCES `RECIPE` (`rcp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `VIEWS_FK2` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
