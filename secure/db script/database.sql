-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jan 01, 2018 at 06:40 PM
-- Server version: 8.0.3-rc-log
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
(63, 103, 1, 'TEST COMMENT-22', 'N', '2017-12-30 08:57:05', NULL);

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
(13, 'Gin', 'images/cake.jpg', '2017-12-30 23:23:32', NULL);

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
(6, 1, 'REVIEW', 9, 'Y', '2017-12-06 18:19:18', '2017-12-30 08:56:33'),
(7, 1, 'RECIPE', 103, 'Y', '2017-12-15 20:36:17', '2017-12-30 08:56:19'),
(8, 1, 'COMMENT', 9, 'N', '2017-12-18 15:53:32', '2017-12-30 08:56:26'),
(9, 1, 'REVIEW', 10, 'N', '2017-12-22 14:30:53', '2017-12-22 20:05:42'),
(10, 1, 'REVIEW', 11, 'Y', '2017-12-22 14:47:53', '2017-12-22 19:46:45'),
(11, 1, 'COMMENT', 48, 'N', '2017-12-22 15:31:35', NULL),
(12, 1, 'COMMENT', 51, 'N', '2017-12-22 15:31:53', NULL),
(13, 1, 'COMMENT', 58, 'N', '2017-12-22 17:45:47', NULL),
(14, 1, 'COMMENT', 50, 'N', '2017-12-22 17:51:32', NULL),
(15, 1, 'COMMENT', 53, 'N', '2017-12-22 20:17:26', NULL),
(16, 1, 'COMMENT', 55, 'N', '2017-12-22 20:17:30', '2017-12-22 20:17:36');

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
(66, 'Chicken Dum Biriyani', 3, 1, 'Kill Chicken. Fry it. Eat it.', 'null', 'null', 'N', 1, '2017-11-11 11:25:57', NULL),
(71, 'Chicken Dum Biriyani', 3, 1, 'Kill Chicken. Fry it. Eat it.', 'null', 'null', 'N', 1, '2017-11-11 11:35:16', NULL),
(73, 'Chicken Dum Biriyani', 3, 1, 'Kill Chicken. Fry it. Eat it.', 'null', 'null', 'Y', 1, '2017-11-11 11:37:58', NULL),
(76, 'bhindi masala', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:17:31', NULL),
(77, 'bhindi masala', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:17:42', NULL),
(78, 'test recipe', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:23:26', NULL),
(79, 'abcd', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:31:16', NULL),
(80, 'abcd', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:34:45', NULL),
(81, 'act', 3, 1, 'null', 'null', 'null', 'N', 1, '2017-12-03 11:36:13', NULL),
(87, 'TEST_RECIPE_NAME', 1, 1, '', '', '', 'N', 1, '2017-12-06 15:15:43', NULL),
(88, 'TEST_RECIPE_NAME', 1, 1, '', '', '', 'N', 1, '2017-12-06 15:16:58', NULL),
(89, 'TEST_RECIPE_NAME', 1, 1, '', '', '', 'N', 1, '2017-12-06 15:17:53', NULL),
(90, 'TEST_RECIPE_NAME', 1, 1, '', '', '', 'N', 1, '2017-12-06 15:20:48', NULL),
(91, 'TEST_RECIPE_NAME', 1, 1, '', '', '', 'N', 1, '2017-12-06 15:23:47', NULL),
(103, 'TEST_RECIPE_NAME', 1, 1, '', '', '', 'N', 1, '2017-12-08 06:28:24', '2017-12-19 19:45:19');

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
(9, 3, 1, 'TEST REVIEW', 4, 'Y', '2017-10-17 15:13:23', '2017-12-15 15:02:40'),
(10, 103, 1, 'TEST REVIEW - 98', 3, 'N', '2017-12-16 11:11:28', '2017-12-30 08:57:26'),
(11, 103, 2, 'This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review.', 3, 'N', '2017-12-16 20:44:15', NULL);

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
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TIMELINES`
--

INSERT INTO `TIMELINES` (`TMLN_ID`, `USER_ID`, `REF_USER_ID`, `TYPE`, `TYPE_ID`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 1, 'USER_ADD', 1, '2017-08-27 00:00:00', NULL),
(2, 1, 1, 'LIKE_RECIPE_ADD', 2, '2017-11-07 11:31:39', NULL),
(3, 1, 1, 'LIKE_RECIPE_ADD', 2, '2017-11-07 11:46:08', NULL),
(4, 1, 1, 'LIKE_RECIPE_ADD', 2, '2017-11-07 11:46:17', NULL),
(5, 1, 1, 'LIKE_RECIPE_ADD', 2, '2017-11-07 11:47:50', NULL),
(6, 1, 1, 'LIKE_RECIPE_ADD', 2, '2017-11-07 11:48:49', NULL),
(7, 1, 1, 'LIKE_RECIPE_ADD', 2, '2017-11-07 11:49:07', NULL),
(8, 1, 1, 'LIKE_RECIPE_ADD', 2, '2017-11-07 11:51:09', NULL),
(9, 1, 1, 'LIKE_RECIPE_ADD', 2, '2017-11-07 11:58:33', NULL),
(10, 1, 1, 'LIKE_RECIPE_ADD', 2, '2017-11-07 11:58:37', NULL),
(11, 1, 1, 'LIKE_RECIPE_ADD', 2, '2017-11-07 12:00:57', NULL),
(12, 1, 1, 'LIKE_RECIPE_ADD', 3, '2017-11-07 15:14:53', NULL),
(13, 1, 1, 'COMMENT_RECIPE_ADD', 5, '2017-11-09 19:15:04', NULL),
(14, 1, 1, 'COMMENT_RECIPE_ADD', 6, '2017-11-09 19:18:54', NULL),
(15, 1, 1, 'COMMENT_RECIPE_ADD', 7, '2017-11-09 19:23:12', NULL),
(16, 1, 1, 'COMMENT_RECIPE_ADD', 8, '2017-11-09 19:32:14', NULL),
(17, 5, 5, 'USER_ADD', 5, '2017-12-05 09:28:54', NULL),
(18, 6, 6, 'USER_ADD', 6, '2017-12-06 10:09:04', NULL),
(19, 7, 7, 'USER_ADD', 7, '2017-12-06 10:17:52', NULL),
(20, 8, 8, 'USER_ADD', 8, '2017-12-06 10:18:40', NULL),
(21, 9, 9, 'USER_ADD', 9, '2017-12-06 10:19:12', NULL),
(22, 10, 10, 'USER_ADD', 10, '2017-12-06 10:25:31', NULL),
(23, 11, 11, 'USER_ADD', 11, '2017-12-06 10:26:32', NULL),
(24, 12, 12, 'USER_ADD', 12, '2017-12-06 10:32:19', NULL),
(25, 13, 13, 'USER_ADD', 13, '2017-12-06 10:36:54', NULL),
(26, 14, 14, 'USER_ADD', 14, '2017-12-06 10:38:49', NULL),
(27, 15, 15, 'USER_ADD', 15, '2017-12-06 10:42:09', NULL),
(28, 16, 16, 'USER_ADD', 16, '2017-12-06 10:43:01', NULL),
(29, 17, 17, 'USER_ADD', 17, '2017-12-06 15:20:07', NULL),
(30, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-06 18:15:07', NULL),
(31, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-06 18:16:19', NULL),
(32, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-06 18:16:22', NULL),
(33, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-06 18:16:27', NULL),
(34, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-06 18:18:04', NULL),
(35, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-06 18:18:09', NULL),
(36, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-06 18:19:19', NULL),
(37, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-06 18:19:21', NULL),
(38, 1, 1, 'COMMENT_RECIPE_ADD', 9, '2017-12-06 18:32:20', NULL),
(39, 1, 1, 'COMMENT_RECIPE_ADD', 10, '2017-12-06 18:36:44', NULL),
(40, 1, 1, 'COMMENT_RECIPE_ADD', 11, '2017-12-06 18:37:27', NULL),
(41, 1, 1, 'COMMENT_RECIPE_ADD', 12, '2017-12-06 18:37:32', NULL),
(42, 1, 1, 'COMMENT_RECIPE_ADD', 13, '2017-12-06 18:37:43', NULL),
(43, 1, 1, 'COMMENT_RECIPE_ADD', 14, '2017-12-06 18:38:21', NULL),
(44, 1, 1, 'COMMENT_RECIPE_ADD', 15, '2017-12-06 18:39:02', NULL),
(45, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-06 18:42:28', NULL),
(46, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-06 18:45:09', NULL),
(47, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-06 18:45:51', NULL),
(48, 18, 18, 'USER_ADD', 18, '2017-12-06 21:06:20', NULL),
(49, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-06 21:06:41', NULL),
(50, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-06 21:06:43', NULL),
(51, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-06 21:06:44', NULL),
(52, 1, 1, 'COMMENT_RECIPE_ADD', 16, '2017-12-06 21:06:47', NULL),
(53, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-06 21:06:49', NULL),
(54, 19, 19, 'USER_ADD', 19, '2017-12-06 21:19:07', NULL),
(55, 20, 20, 'USER_ADD', 20, '2017-12-06 21:19:07', NULL),
(56, 21, 21, 'USER_ADD', 21, '2017-12-06 21:19:07', NULL),
(57, 22, 22, 'USER_ADD', 22, '2017-12-06 21:19:08', NULL),
(58, 23, 23, 'USER_ADD', 23, '2017-12-06 21:19:08', NULL),
(59, 24, 24, 'USER_ADD', 24, '2017-12-06 21:19:08', NULL),
(60, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-06 21:19:39', NULL),
(61, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-06 21:19:40', NULL),
(62, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-06 21:19:41', NULL),
(63, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-06 21:19:42', NULL),
(64, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-06 21:19:43', NULL),
(65, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-06 21:19:43', NULL),
(66, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-06 21:19:44', NULL),
(67, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-06 21:19:44', NULL),
(68, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-06 21:19:45', NULL),
(69, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-06 21:19:45', NULL),
(70, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-06 21:19:46', NULL),
(71, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-06 21:19:46', NULL),
(72, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-06 21:19:47', NULL),
(73, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-06 21:19:48', NULL),
(74, 1, 1, 'COMMENT_RECIPE_ADD', 17, '2017-12-06 21:19:48', NULL),
(75, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-06 21:19:48', NULL),
(76, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-06 21:19:49', NULL),
(77, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-06 21:19:50', NULL),
(78, 1, 1, 'COMMENT_RECIPE_ADD', 18, '2017-12-06 21:19:50', NULL),
(79, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-06 21:19:51', NULL),
(80, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-06 21:19:51', NULL),
(81, 1, 1, 'COMMENT_RECIPE_ADD', 19, '2017-12-06 21:19:52', NULL),
(82, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-06 21:19:54', NULL),
(83, 1, 1, 'COMMENT_RECIPE_ADD', 20, '2017-12-06 21:19:54', NULL),
(84, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-06 21:19:55', NULL),
(85, 1, 1, 'COMMENT_RECIPE_ADD', 21, '2017-12-06 21:19:56', NULL),
(86, 1, 1, 'COMMENT_RECIPE_ADD', 22, '2017-12-06 21:19:57', NULL),
(87, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-06 21:19:58', NULL),
(88, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-06 21:19:59', NULL),
(89, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-06 21:20:01', NULL),
(90, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-07 06:28:50', NULL),
(91, 1, 1, 'RECIPE_REMOVE', 3, '2017-12-07 06:37:13', NULL),
(92, 1, 1, 'RECIPE_REMOVE', 3, '2017-12-07 06:40:42', NULL),
(93, 1, 1, 'RECIPE_REMOVE', 3, '2017-12-07 06:40:58', NULL),
(94, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 07:36:29', NULL),
(95, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 07:36:49', NULL),
(96, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 07:57:39', NULL),
(97, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 08:05:43', NULL),
(98, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 08:06:32', NULL),
(99, 25, 25, 'USER_ADD', 25, '2017-12-07 11:32:54', NULL),
(100, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-07 11:33:10', NULL),
(101, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-07 11:33:12', NULL),
(102, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-07 11:33:13', NULL),
(103, 1, 1, 'COMMENT_RECIPE_ADD', 23, '2017-12-07 11:33:16', NULL),
(104, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-07 11:33:18', NULL),
(105, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 11:33:19', NULL),
(106, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 11:33:22', NULL),
(107, 26, 26, 'USER_ADD', 26, '2017-12-07 11:54:15', NULL),
(108, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-07 11:54:31', NULL),
(109, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-07 11:54:32', NULL),
(110, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-07 11:54:34', NULL),
(111, 1, 1, 'COMMENT_RECIPE_ADD', 24, '2017-12-07 11:54:37', NULL),
(112, 1, 1, 'COMMENT_RECIPE_REMOVE', 9, '2017-12-07 11:54:39', NULL),
(113, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 11:54:40', NULL),
(114, 1, 1, 'REVIEW_RECIPE_ADD', 8, '2017-12-07 11:54:43', NULL),
(115, 27, 27, 'USER_ADD', 27, '2017-12-07 12:05:22', NULL),
(116, 1, 1, 'RECIPE_REMOVE', 8, '2017-12-07 12:05:37', NULL),
(117, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-07 12:05:39', NULL),
(118, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-07 12:05:41', NULL),
(119, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-07 12:05:42', NULL),
(120, 1, 1, 'COMMENT_RECIPE_ADD', 25, '2017-12-07 12:05:45', NULL),
(121, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-07 12:05:47', NULL),
(122, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 12:05:48', NULL),
(123, 1, 1, 'REVIEW_RECIPE_ADD', 8, '2017-12-07 12:05:51', NULL),
(124, 28, 28, 'USER_ADD', 28, '2017-12-07 12:22:14', NULL),
(125, 29, 29, 'USER_ADD', 29, '2017-12-07 12:22:14', NULL),
(126, 30, 30, 'USER_ADD', 30, '2017-12-07 12:22:14', NULL),
(127, 31, 31, 'USER_ADD', 31, '2017-12-07 12:22:15', NULL),
(128, 32, 32, 'USER_ADD', 32, '2017-12-07 12:22:15', NULL),
(129, 33, 33, 'USER_ADD', 33, '2017-12-07 12:22:15', NULL),
(130, 1, 1, 'RECIPE_REMOVE', 7, '2017-12-07 12:23:12', NULL),
(131, 1, 1, 'RECIPE_REMOVE', 9, '2017-12-07 12:23:13', NULL),
(132, 1, 1, 'RECIPE_REMOVE', 9, '2017-12-07 12:23:13', NULL),
(133, 1, 1, 'RECIPE_REMOVE', 8, '2017-12-07 12:23:14', NULL),
(134, 1, 1, 'RECIPE_REMOVE', 4, '2017-12-07 12:23:14', NULL),
(135, 1, 1, 'RECIPE_REMOVE', 4, '2017-12-07 12:23:14', NULL),
(136, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-07 12:23:29', NULL),
(137, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-07 12:23:30', NULL),
(138, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-07 12:23:30', NULL),
(139, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-07 12:23:32', NULL),
(140, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-07 12:23:32', NULL),
(141, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-07 12:23:32', NULL),
(142, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-07 12:23:35', NULL),
(143, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-07 12:23:36', NULL),
(144, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-07 12:23:36', NULL),
(145, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-07 12:23:38', NULL),
(146, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-07 12:23:38', NULL),
(147, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-07 12:23:38', NULL),
(148, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-07 12:23:42', NULL),
(149, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-07 12:23:42', NULL),
(150, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-07 12:23:42', NULL),
(151, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-07 12:23:44', NULL),
(152, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-07 12:23:44', NULL),
(153, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-07 12:23:45', NULL),
(154, 1, 1, 'COMMENT_RECIPE_ADD', 26, '2017-12-07 12:23:59', NULL),
(155, 1, 1, 'COMMENT_RECIPE_ADD', 27, '2017-12-07 12:24:00', NULL),
(156, 1, 1, 'COMMENT_RECIPE_ADD', 28, '2017-12-07 12:24:00', NULL),
(157, 1, 1, 'COMMENT_RECIPE_ADD', 29, '2017-12-07 12:24:02', NULL),
(158, 1, 1, 'COMMENT_RECIPE_ADD', 30, '2017-12-07 12:24:02', NULL),
(159, 1, 1, 'COMMENT_RECIPE_ADD', 31, '2017-12-07 12:24:03', NULL),
(160, 1, 1, 'COMMENT_RECIPE_REMOVE', 6, '2017-12-07 12:24:10', NULL),
(161, 1, 1, 'COMMENT_RECIPE_REMOVE', 5, '2017-12-07 12:24:11', NULL),
(162, 1, 1, 'COMMENT_RECIPE_REMOVE', 7, '2017-12-07 12:24:11', NULL),
(163, 1, 1, 'COMMENT_RECIPE_REMOVE', 4, '2017-12-07 12:24:14', NULL),
(164, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-07 12:24:14', NULL),
(165, 1, 1, 'COMMENT_RECIPE_REMOVE', 9, '2017-12-07 12:24:14', NULL),
(166, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 12:24:16', NULL),
(167, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 12:24:17', NULL),
(168, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 12:24:17', NULL),
(169, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 12:24:20', NULL),
(170, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 12:24:20', NULL),
(171, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 12:24:21', NULL),
(172, 1, 1, 'REVIEW_RECIPE_ADD', 0, '2017-12-07 12:24:34', NULL),
(173, 1, 1, 'REVIEW_RECIPE_ADD', 1, '2017-12-07 12:24:35', NULL),
(174, 1, 1, 'REVIEW_RECIPE_ADD', 4, '2017-12-07 12:24:35', NULL),
(175, 1, 1, 'REVIEW_RECIPE_ADD', 0, '2017-12-07 12:24:38', NULL),
(176, 1, 1, 'REVIEW_RECIPE_ADD', 3, '2017-12-07 12:24:38', NULL),
(177, 1, 1, 'REVIEW_RECIPE_ADD', 8, '2017-12-07 12:24:38', NULL),
(178, 34, 34, 'USER_ADD', 34, '2017-12-07 15:01:26', NULL),
(179, 35, 35, 'USER_ADD', 35, '2017-12-07 15:01:39', NULL),
(180, 36, 36, 'USER_ADD', 36, '2017-12-07 15:01:46', NULL),
(181, 37, 37, 'USER_ADD', 37, '2017-12-07 15:02:15', NULL),
(182, 38, 38, 'USER_ADD', 38, '2017-12-07 15:02:21', NULL),
(183, 1, 1, 'RECIPE_REMOVE', 3, '2017-12-07 15:02:24', NULL),
(184, 1, 1, 'RECIPE_REMOVE', 5, '2017-12-07 15:02:38', NULL),
(185, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-07 15:02:42', NULL),
(186, 1, 1, 'RECIPE_REMOVE', 6, '2017-12-07 15:02:43', NULL),
(187, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-07 15:02:48', NULL),
(188, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-07 15:02:54', NULL),
(189, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-07 15:02:56', NULL),
(190, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-07 15:03:00', NULL),
(191, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-07 15:03:02', NULL),
(192, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-07 15:03:07', NULL),
(193, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-07 15:03:09', NULL),
(194, 1, 1, 'COMMENT_RECIPE_ADD', 32, '2017-12-07 15:03:12', NULL),
(195, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-07 15:03:13', NULL),
(196, 1, 1, 'RECIPE_REMOVE', 4, '2017-12-07 15:03:13', NULL),
(197, 1, 1, 'RECIPE_REMOVE', 3, '2017-12-07 15:03:19', NULL),
(198, 1, 1, 'COMMENT_RECIPE_REMOVE', 3, '2017-12-07 15:03:23', NULL),
(199, 1, 1, 'COMMENT_RECIPE_ADD', 33, '2017-12-07 15:03:27', NULL),
(200, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 15:03:29', NULL),
(201, 1, 1, 'COMMENT_RECIPE_ADD', 34, '2017-12-07 15:03:30', NULL),
(202, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-07 15:03:31', NULL),
(203, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-07 15:03:36', NULL),
(204, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-07 15:03:37', NULL),
(205, 1, 1, 'COMMENT_RECIPE_REMOVE', 3, '2017-12-07 15:03:38', NULL),
(206, 1, 1, 'COMMENT_RECIPE_REMOVE', 8, '2017-12-07 15:03:41', NULL),
(207, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-07 15:03:43', NULL),
(208, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-07 15:03:43', NULL),
(209, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 15:03:45', NULL),
(210, 1, 1, 'REVIEW_RECIPE_ADD', 2, '2017-12-07 15:03:47', NULL),
(211, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 15:03:47', NULL),
(212, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-07 15:03:49', NULL),
(213, 1, 1, 'COMMENT_RECIPE_ADD', 35, '2017-12-07 15:04:01', NULL),
(214, 1, 1, 'REVIEW_RECIPE_ADD', 1, '2017-12-07 15:04:02', NULL),
(215, 1, 1, 'REVIEW_RECIPE_ADD', 4, '2017-12-07 15:04:05', NULL),
(216, 1, 1, 'COMMENT_RECIPE_ADD', 36, '2017-12-07 15:04:07', NULL),
(217, 1, 1, 'COMMENT_RECIPE_REMOVE', 3, '2017-12-07 15:04:13', NULL),
(218, 1, 1, 'COMMENT_RECIPE_REMOVE', 5, '2017-12-07 15:04:19', NULL),
(219, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 15:04:19', NULL),
(220, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 15:04:25', NULL),
(221, 1, 1, 'REVIEW_RECIPE_ADD', 2, '2017-12-07 15:04:37', NULL),
(222, 1, 1, 'REVIEW_RECIPE_ADD', 5, '2017-12-07 15:04:42', NULL),
(223, 39, 39, 'USER_ADD', 39, '2017-12-07 15:12:20', NULL),
(224, 1, 1, 'RECIPE_REMOVE', 1, '2017-12-07 15:13:17', NULL),
(225, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-07 15:13:35', NULL),
(226, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-07 15:13:41', NULL),
(227, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-07 15:13:47', NULL),
(228, 1, 1, 'COMMENT_RECIPE_ADD', 37, '2017-12-07 15:14:05', NULL),
(229, 1, 1, 'COMMENT_RECIPE_REMOVE', 4, '2017-12-07 15:14:16', NULL),
(230, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-07 15:14:23', NULL),
(231, 1, 1, 'REVIEW_RECIPE_ADD', 0, '2017-12-07 15:14:40', NULL),
(232, 40, 40, 'USER_ADD', 40, '2017-12-09 02:31:36', NULL),
(233, 41, 41, 'USER_ADD', 41, '2017-12-09 02:31:36', NULL),
(234, 42, 42, 'USER_ADD', 42, '2017-12-09 02:31:37', NULL),
(235, 43, 43, 'USER_ADD', 43, '2017-12-09 02:31:37', NULL),
(236, 44, 44, 'USER_ADD', 44, '2017-12-09 02:31:38', NULL),
(237, 1, 1, 'RECIPE_REMOVE', 7, '2017-12-09 02:32:33', NULL),
(238, 1, 1, 'RECIPE_REMOVE', 8, '2017-12-09 02:32:33', NULL),
(239, 1, 1, 'RECIPE_REMOVE', 0, '2017-12-09 02:32:35', NULL),
(240, 1, 1, 'RECIPE_REMOVE', 3, '2017-12-09 02:32:35', NULL),
(241, 1, 1, 'RECIPE_REMOVE', 0, '2017-12-09 02:32:36', NULL),
(242, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-09 02:32:50', NULL),
(243, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-09 02:32:51', NULL),
(244, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-09 02:32:52', NULL),
(245, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-09 02:32:53', NULL),
(246, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-09 02:32:53', NULL),
(247, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-09 02:32:56', NULL),
(248, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-09 02:32:57', NULL),
(249, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-09 02:32:59', NULL),
(250, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-09 02:32:59', NULL),
(251, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-09 02:33:00', NULL),
(252, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-09 02:33:03', NULL),
(253, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-09 02:33:03', NULL),
(254, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-09 02:33:05', NULL),
(255, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-09 02:33:06', NULL),
(256, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-09 02:33:06', NULL),
(257, 1, 1, 'COMMENT_RECIPE_ADD', 38, '2017-12-09 02:33:20', NULL),
(258, 1, 1, 'COMMENT_RECIPE_ADD', 39, '2017-12-09 02:33:21', NULL),
(259, 1, 1, 'COMMENT_RECIPE_ADD', 40, '2017-12-09 02:33:23', NULL),
(260, 1, 1, 'COMMENT_RECIPE_ADD', 41, '2017-12-09 02:33:24', NULL),
(261, 1, 1, 'COMMENT_RECIPE_ADD', 42, '2017-12-09 02:33:24', NULL),
(262, 1, 1, 'COMMENT_RECIPE_REMOVE', 7, '2017-12-09 02:33:32', NULL),
(263, 1, 1, 'COMMENT_RECIPE_REMOVE', 4, '2017-12-09 02:33:32', NULL),
(264, 1, 1, 'COMMENT_RECIPE_REMOVE', 7, '2017-12-09 02:33:34', NULL),
(265, 1, 1, 'COMMENT_RECIPE_REMOVE', 7, '2017-12-09 02:33:36', NULL),
(266, 1, 1, 'COMMENT_RECIPE_REMOVE', 8, '2017-12-09 02:33:36', NULL),
(267, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-09 02:33:38', NULL),
(268, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-09 02:33:39', NULL),
(269, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-09 02:33:41', NULL),
(270, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-09 02:33:42', NULL),
(271, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-09 02:33:42', NULL),
(272, 1, 1, 'REVIEW_RECIPE_ADD', 7, '2017-12-09 02:33:55', NULL),
(273, 1, 1, 'REVIEW_RECIPE_ADD', 5, '2017-12-09 02:33:56', NULL),
(274, 1, 1, 'REVIEW_RECIPE_ADD', 3, '2017-12-09 02:33:58', NULL),
(275, 1, 1, 'REVIEW_RECIPE_ADD', 8, '2017-12-09 02:33:59', NULL),
(276, 1, 1, 'REVIEW_RECIPE_ADD', 3, '2017-12-09 02:33:59', NULL),
(277, 45, 45, 'USER_ADD', 45, '2017-12-09 03:04:14', NULL),
(278, 1, 1, 'RECIPE_REMOVE', 5, '2017-12-09 03:05:11', NULL),
(279, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-09 03:05:29', NULL),
(280, 1, 1, 'LIKE_COMMENT_REMOVE', 5, '2017-12-09 03:05:35', NULL),
(281, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-09 03:05:41', NULL),
(282, 1, 1, 'COMMENT_RECIPE_ADD', 43, '2017-12-09 03:05:59', NULL),
(283, 1, 1, 'COMMENT_RECIPE_REMOVE', 4, '2017-12-09 03:06:10', NULL),
(284, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-09 03:06:16', NULL),
(285, 1, 1, 'REVIEW_RECIPE_ADD', 2, '2017-12-09 03:06:34', NULL),
(286, 46, 46, 'USER_ADD', 46, '2017-12-12 15:30:28', NULL),
(287, 1, 1, 'RECIPE_REMOVE', 3, '2017-12-12 15:30:47', NULL),
(288, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-12 15:30:50', NULL),
(289, 1, 1, 'LIKE_COMMENT_ADD', 5, '2017-12-12 15:30:52', NULL),
(290, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-12 15:30:54', NULL),
(291, 1, 1, 'COMMENT_RECIPE_ADD', 44, '2017-12-12 15:30:58', NULL),
(292, 1, 1, 'COMMENT_RECIPE_REMOVE', 8, '2017-12-12 15:31:00', NULL),
(293, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-12 15:31:01', NULL),
(294, 1, 1, 'REVIEW_RECIPE_ADD', 0, '2017-12-12 15:31:05', NULL),
(295, 47, 47, 'USER_ADD', 47, '2017-12-13 15:38:42', NULL),
(296, 1, 1, 'RECIPE_REMOVE', 0, '2017-12-13 15:38:59', NULL),
(297, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-13 15:39:03', NULL),
(298, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-13 15:39:06', NULL),
(299, 1, 1, 'COMMENT_RECIPE_ADD', 45, '2017-12-13 15:39:11', NULL),
(300, 1, 1, 'COMMENT_RECIPE_REMOVE', 8, '2017-12-13 15:39:13', NULL),
(301, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-13 15:39:15', NULL),
(302, 1, 1, 'REVIEW_RECIPE_ADD', 5, '2017-12-13 15:39:18', NULL),
(303, 48, 48, 'USER_ADD', 48, '2017-12-14 11:01:34', NULL),
(304, 1, 1, 'LIKE_RECIPE_ADD', 4, '2017-12-14 11:01:53', NULL),
(305, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-14 11:01:57', NULL),
(306, 1, 1, 'COMMENT_RECIPE_ADD', 46, '2017-12-14 11:02:00', NULL),
(307, 1, 1, 'COMMENT_RECIPE_REMOVE', 8, '2017-12-14 11:02:03', NULL),
(308, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-14 11:02:04', NULL),
(309, 1, 1, 'REVIEW_RECIPE_ADD', 5, '2017-12-14 11:02:08', NULL),
(310, 49, 49, 'USER_ADD', 49, '2017-12-15 15:02:06', NULL),
(311, 1, 1, 'LIKE_RECIPE_REMOVE', 4, '2017-12-15 15:02:27', NULL),
(312, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-15 15:02:31', NULL),
(313, 1, 1, 'COMMENT_RECIPE_ADD', 47, '2017-12-15 15:02:35', NULL),
(314, 1, 1, 'COMMENT_RECIPE_REMOVE', 3, '2017-12-15 15:02:38', NULL),
(315, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-15 15:02:41', NULL),
(316, 1, 1, 'REVIEW_RECIPE_ADD', 2, '2017-12-15 15:02:44', NULL),
(317, 1, 1, 'COMMENT_RECIPE_ADD', 48, '2017-12-15 20:19:17', NULL),
(318, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-15 20:36:18', NULL),
(319, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-15 20:37:27', NULL),
(320, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-15 20:37:31', NULL),
(321, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-16 11:11:28', NULL),
(322, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-16 16:18:17', NULL),
(323, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-16 19:37:11', NULL),
(324, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-16 19:40:04', NULL),
(325, 2, 1, 'REVIEW_RECIPE_ADD', 11, '2017-12-16 20:44:15', NULL),
(326, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-16 21:47:16', NULL),
(327, 1, 1, 'RECIPE_REMOVE', 17, '2017-12-16 22:43:25', NULL),
(328, 50, 50, 'USER_ADD', 50, '2017-12-16 22:48:35', NULL),
(329, 1, 1, 'RECIPE_REMOVE', 33, '2017-12-16 22:48:55', NULL),
(330, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-16 22:48:59', NULL),
(331, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-16 22:49:02', NULL),
(332, 1, 1, 'COMMENT_RECIPE_ADD', 49, '2017-12-16 22:49:06', NULL),
(333, 1, 1, 'COMMENT_RECIPE_REMOVE', 0, '2017-12-16 22:49:08', NULL),
(334, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-16 22:49:10', NULL),
(335, 1, 1, 'REVIEW_RECIPE_ADD', 0, '2017-12-16 22:49:15', NULL),
(338, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 06:51:37', NULL),
(339, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 06:52:06', NULL),
(340, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 10:09:55', NULL),
(341, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 10:11:35', NULL),
(342, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 10:12:50', NULL),
(343, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 10:14:41', NULL),
(344, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 10:15:52', NULL),
(345, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 10:16:30', NULL),
(346, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 10:36:01', NULL),
(347, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 11:04:58', NULL),
(348, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:23:28', NULL),
(349, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:24:43', NULL),
(350, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:27:07', NULL),
(351, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:27:18', NULL),
(352, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:27:52', NULL),
(353, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:29:31', NULL),
(354, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:30:46', NULL),
(355, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:32:18', NULL),
(356, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:35:56', NULL),
(357, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:36:40', NULL),
(358, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:40:51', NULL),
(359, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:42:26', NULL),
(360, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:42:37', NULL),
(361, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 12:44:09', NULL),
(362, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 13:23:08', NULL),
(363, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 13:53:34', NULL),
(364, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 13:54:49', NULL),
(365, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 13:56:09', NULL),
(366, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 13:57:45', NULL),
(367, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 13:59:05', NULL),
(368, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 14:00:55', NULL),
(369, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 14:03:08', NULL),
(370, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 14:09:10', NULL),
(371, 1, 1, 'RECIPE_REMOVE', 23, '2017-12-17 14:21:32', NULL),
(372, 51, 51, 'USER_ADD', 51, '2017-12-17 14:22:14', NULL),
(373, 1, 1, 'RECIPE_REMOVE', 3, '2017-12-17 14:22:34', NULL),
(374, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-17 14:22:37', NULL),
(375, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-17 14:22:41', NULL),
(376, 1, 1, 'COMMENT_RECIPE_ADD', 50, '2017-12-17 14:22:45', NULL),
(377, 1, 1, 'COMMENT_RECIPE_REMOVE', 1, '2017-12-17 14:22:47', NULL),
(378, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 14:22:48', NULL),
(379, 1, 1, 'REVIEW_RECIPE_ADD', 91, '2017-12-17 14:22:53', NULL),
(380, 1, 1, 'COMMENT_RECIPE_ADD', 51, '2017-12-17 19:33:36', NULL),
(381, 52, 52, 'USER_ADD', 52, '2017-12-17 19:39:15', NULL),
(382, 1, 1, 'RECIPE_REMOVE', 24, '2017-12-17 19:39:36', NULL),
(383, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-17 19:39:39', NULL),
(384, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-17 19:39:43', NULL),
(385, 1, 1, 'COMMENT_RECIPE_ADD', 52, '2017-12-17 19:39:47', NULL),
(386, 1, 1, 'COMMENT_RECIPE_REMOVE', 4, '2017-12-17 19:39:50', NULL),
(387, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-17 19:39:51', NULL),
(388, 1, 1, 'REVIEW_RECIPE_ADD', 76, '2017-12-17 19:39:56', NULL),
(389, 1, 1, 'RECIPE_REMOVE', 9, '2017-12-18 09:47:35', NULL),
(390, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-18 09:48:40', NULL),
(391, 53, 53, 'USER_ADD', 53, '2017-12-18 09:53:37', NULL),
(392, 1, 1, 'RECIPE_REMOVE', 11, '2017-12-18 09:53:57', NULL),
(393, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-18 09:54:00', NULL),
(394, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-18 09:54:04', NULL),
(395, 1, 1, 'COMMENT_RECIPE_ADD', 53, '2017-12-18 09:54:08', NULL),
(396, 1, 1, 'COMMENT_RECIPE_REMOVE', 5, '2017-12-18 09:54:11', NULL),
(397, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-18 09:54:12', NULL),
(398, 1, 1, 'REVIEW_RECIPE_ADD', 84, '2017-12-18 09:54:15', NULL),
(399, 54, 54, 'USER_ADD', 54, '2017-12-18 10:10:44', NULL),
(400, 1, 1, 'RECIPE_REMOVE', 23, '2017-12-18 10:11:03', NULL),
(401, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-18 10:11:06', NULL),
(402, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-18 10:11:10', NULL),
(403, 1, 1, 'COMMENT_RECIPE_ADD', 54, '2017-12-18 10:11:13', NULL),
(404, 1, 1, 'COMMENT_RECIPE_REMOVE', 9, '2017-12-18 10:11:16', NULL),
(405, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-18 10:11:18', NULL),
(406, 1, 1, 'REVIEW_RECIPE_ADD', 48, '2017-12-18 10:11:22', NULL),
(407, 1, 1, 'COMMENT_RECIPE_REMOVE', 9, '2017-12-18 15:23:02', NULL),
(408, 1, 1, 'COMMENT_RECIPE_ADD', 55, '2017-12-18 15:31:25', NULL),
(409, 1, 1, 'RECIPE_REMOVE', 73, '2017-12-18 15:33:29', NULL),
(410, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-18 15:38:52', NULL),
(411, 1, 1, 'REVIEW_RECIPE_ADD', 9, '2017-12-18 15:40:52', NULL),
(412, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-18 15:43:11', NULL),
(413, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-18 15:50:41', NULL),
(414, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-18 15:51:06', NULL),
(415, 1, 1, 'LIKE_COMMENT_ADD', 8, '2017-12-18 15:53:33', NULL),
(416, 1, 1, 'LIKE_COMMENT_REMOVE', 8, '2017-12-18 15:53:54', NULL),
(417, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-18 15:54:04', NULL),
(418, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-18 15:54:15', NULL),
(419, 55, 55, 'USER_ADD', 55, '2017-12-18 15:54:48', NULL),
(420, 56, 56, 'USER_ADD', 56, '2017-12-19 19:58:02', NULL),
(421, 1, 1, 'RECIPE_REMOVE', 96, '2017-12-19 19:58:23', NULL),
(422, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-19 19:58:27', NULL),
(423, 1, 1, 'LIKE_COMMENT_ADD', 8, '2017-12-19 19:58:29', NULL),
(424, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-19 19:58:31', NULL),
(425, 1, 1, 'COMMENT_RECIPE_ADD', 56, '2017-12-19 19:58:35', NULL),
(426, 1, 1, 'COMMENT_RECIPE_REMOVE', 6, '2017-12-19 19:58:39', NULL),
(428, 1, 1, 'REVIEW_RECIPE_REMOVE', 0, '2017-12-19 19:58:48', NULL),
(429, 1, 1, 'RECIPE_REMOVE', 40, '2017-12-19 20:00:52', NULL),
(430, 1, 1, 'RECIPE_REMOVE', 28, '2017-12-19 20:01:13', NULL),
(431, 1, 1, 'RECIPE_REMOVE', 84, '2017-12-19 20:01:32', NULL),
(432, 1, 1, 'RECIPE_REMOVE', 44, '2017-12-19 20:01:52', NULL),
(433, 1, 1, 'RECIPE_REMOVE', 19, '2017-12-19 20:02:13', NULL),
(434, 57, 57, 'USER_ADD', 57, '2017-12-21 09:26:46', NULL),
(435, 1, 1, 'RECIPE_REMOVE', 35, '2017-12-21 09:27:09', NULL),
(436, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-21 09:27:15', NULL),
(437, 1, 1, 'LIKE_COMMENT_REMOVE', 8, '2017-12-21 09:27:16', NULL),
(438, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-21 09:27:18', NULL),
(439, 1, 1, 'COMMENT_RECIPE_ADD', 57, '2017-12-21 09:27:25', NULL),
(440, 1, 1, 'COMMENT_RECIPE_REMOVE', 9, '2017-12-21 09:27:28', NULL),
(442, 1, 1, 'REVIEW_RECIPE_REMOVE', 23, '2017-12-21 09:27:34', NULL),
(443, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-21 09:29:44', NULL),
(444, 1, 1, 'LIKE_COMMENT_ADD', 8, '2017-12-21 09:29:57', NULL),
(445, 1, 1, 'LIKE_COMMENT_REMOVE', 8, '2017-12-22 06:43:43', NULL),
(446, 1, 1, 'LIKE_REVIEW_ADD', 9, '2017-12-22 14:30:54', NULL),
(447, 1, 1, 'LIKE_REVIEW_REMOVE', 9, '2017-12-22 14:30:59', NULL),
(448, 1, 1, 'LIKE_COMMENT_ADD', 8, '2017-12-22 14:44:53', NULL),
(449, 1, 1, 'LIKE_REVIEW_ADD', 9, '2017-12-22 14:46:36', NULL),
(450, 1, 2, 'LIKE_REVIEW_ADD', 10, '2017-12-22 14:47:53', NULL),
(451, 1, 2, 'LIKE_REVIEW_REMOVE', 10, '2017-12-22 14:47:58', NULL),
(452, 1, 2, 'LIKE_REVIEW_ADD', 10, '2017-12-22 14:48:34', NULL),
(453, 1, 2, 'LIKE_REVIEW_REMOVE', 10, '2017-12-22 14:48:38', NULL),
(454, 1, 1, 'LIKE_REVIEW_REMOVE', 9, '2017-12-22 14:48:43', NULL),
(455, 1, 1, 'LIKE_REVIEW_ADD', 9, '2017-12-22 14:48:48', NULL),
(456, 1, 1, 'LIKE_REVIEW_REMOVE', 9, '2017-12-22 14:52:41', NULL),
(457, 1, 2, 'LIKE_REVIEW_ADD', 10, '2017-12-22 14:52:49', NULL),
(458, 1, 1, 'LIKE_REVIEW_ADD', 9, '2017-12-22 14:52:54', NULL),
(459, 1, 1, 'LIKE_COMMENT_ADD', 11, '2017-12-22 15:31:36', NULL),
(460, 1, 1, 'LIKE_COMMENT_ADD', 12, '2017-12-22 15:31:53', NULL),
(461, 1, 1, 'COMMENT_RECIPE_REMOVE', 7, '2017-12-22 17:06:27', NULL),
(462, 1, 1, 'COMMENT_RECIPE_REMOVE', 49, '2017-12-22 17:17:05', NULL),
(463, 1, 1, 'COMMENT_RECIPE_REMOVE', 51, '2017-12-22 17:24:00', NULL),
(464, 1, 1, 'REVIEW_RECIPE_REMOVE', 10, '2017-12-22 17:25:24', NULL),
(466, 1, 1, 'REVIEW_RECIPE_REMOVE', 10, '2017-12-22 17:42:08', NULL),
(468, 1, 1, 'COMMENT_RECIPE_ADD', 58, '2017-12-22 17:45:08', NULL),
(469, 1, 1, 'LIKE_COMMENT_ADD', 13, '2017-12-22 17:45:47', NULL),
(470, 1, 1, 'COMMENT_RECIPE_REMOVE', 48, '2017-12-22 17:46:20', NULL),
(471, 1, 1, 'COMMENT_RECIPE_ADD', 59, '2017-12-22 17:51:01', NULL),
(472, 1, 1, 'LIKE_COMMENT_ADD', 14, '2017-12-22 17:51:32', NULL),
(473, 1, 1, 'COMMENT_RECIPE_ADD', 60, '2017-12-22 17:51:43', NULL),
(474, 1, 1, 'COMMENT_RECIPE_ADD', 61, '2017-12-22 17:59:17', NULL),
(475, 1, 2, 'LIKE_REVIEW_REMOVE', 10, '2017-12-22 19:46:46', NULL),
(476, 1, 1, 'LIKE_REVIEW_REMOVE', 9, '2017-12-22 19:46:52', NULL),
(477, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-22 19:47:26', NULL),
(478, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-22 19:52:57', NULL),
(479, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-22 19:53:18', NULL),
(480, 1, 1, 'LIKE_REVIEW_ADD', 9, '2017-12-22 19:57:19', NULL),
(481, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-22 20:02:03', NULL),
(482, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-22 20:03:09', NULL),
(483, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-22 20:05:04', NULL),
(484, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-22 20:05:08', NULL),
(485, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-22 20:05:14', NULL),
(486, 1, 1, 'LIKE_REVIEW_REMOVE', 9, '2017-12-22 20:05:38', NULL),
(487, 1, 1, 'LIKE_REVIEW_ADD', 9, '2017-12-22 20:05:42', NULL),
(488, 1, 1, 'LIKE_COMMENT_ADD', 15, '2017-12-22 20:17:27', NULL),
(489, 1, 1, 'LIKE_COMMENT_ADD', 16, '2017-12-22 20:17:31', NULL),
(490, 1, 1, 'LIKE_COMMENT_REMOVE', 16, '2017-12-22 20:17:34', NULL),
(491, 1, 1, 'LIKE_COMMENT_ADD', 16, '2017-12-22 20:17:37', NULL),
(492, 1, 1, 'LIKE_COMMENT_REMOVE', 8, '2017-12-24 15:51:22', NULL),
(493, 1, 1, 'LIKE_COMMENT_ADD', 8, '2017-12-24 15:53:43', NULL),
(494, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-24 16:16:43', NULL),
(495, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-24 16:17:20', NULL),
(496, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-26 17:42:18', NULL),
(497, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-27 08:14:10', NULL),
(498, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:20:02', NULL),
(499, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:21:13', NULL),
(500, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:21:19', NULL),
(501, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:21:22', NULL),
(502, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:26:20', NULL),
(503, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:26:24', NULL),
(504, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:26:27', NULL),
(505, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:27:05', NULL),
(506, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:27:09', NULL),
(507, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:27:12', NULL),
(508, 1, 2, 'USER_FOLLOW', 1, '2017-12-27 08:27:15', NULL),
(509, 1, 3, 'USER_FOLLOW', 2, '2017-12-27 08:27:22', NULL),
(510, 1, 3, 'USER_FOLLOW', 2, '2017-12-27 08:27:26', NULL),
(511, 1, 3, 'USER_FOLLOW', 2, '2017-12-27 08:27:30', NULL),
(512, 1, 3, 'USER_UNFOLLOW', 2, '2017-12-27 08:29:44', NULL),
(513, 58, 58, 'USER_ADD', 58, '2017-12-28 09:23:09', NULL),
(514, 1, 2, 'USER_UNFOLLOW', 1, '2017-12-28 09:23:13', NULL),
(515, 1, 1, 'RECIPE_REMOVE', 33, '2017-12-28 09:23:29', NULL),
(516, 1, 1, 'LIKE_RECIPE_ADD', 7, '2017-12-28 09:23:40', NULL),
(517, 1, 1, 'LIKE_COMMENT_REMOVE', 8, '2017-12-28 09:23:42', NULL),
(518, 1, 1, 'LIKE_REVIEW_ADD', 6, '2017-12-28 09:23:44', NULL),
(519, 1, 1, 'COMMENT_RECIPE_ADD', 62, '2017-12-28 09:23:50', NULL),
(520, 1, 1, 'COMMENT_RECIPE_REMOVE', 6, '2017-12-28 09:23:54', NULL),
(521, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-28 09:23:55', NULL),
(522, 1, 1, 'REVIEW_RECIPE_REMOVE', 89, '2017-12-28 09:23:59', NULL),
(523, 1, 3, 'USER_FOLLOW', 2, '2017-12-28 10:35:16', NULL),
(524, 1, 3, 'USER_UNFOLLOW', 2, '2017-12-28 10:35:54', NULL),
(525, 59, 59, 'USER_ADD', 59, '2017-12-29 07:14:50', NULL),
(526, 60, 60, 'USER_ADD', 60, '2017-12-29 07:38:05', NULL),
(527, 61, 61, 'USER_ADD', 61, '2017-12-29 08:30:55', NULL),
(528, 62, 62, 'USER_ADD', 62, '2017-12-29 16:52:50', NULL),
(529, 1, 3, 'USER_FOLLOW', 2, '2017-12-30 08:54:51', NULL),
(530, 1, 1, 'RECIPE_REMOVE', 103, '2017-12-30 08:55:44', NULL),
(531, 1, 1, 'LIKE_RECIPE_REMOVE', 7, '2017-12-30 08:56:20', NULL),
(532, 1, 1, 'LIKE_COMMENT_ADD', 8, '2017-12-30 08:56:27', NULL),
(533, 1, 1, 'LIKE_REVIEW_REMOVE', 6, '2017-12-30 08:56:34', NULL),
(534, 1, 1, 'COMMENT_RECIPE_ADD', 63, '2017-12-30 08:57:06', NULL),
(535, 1, 1, 'COMMENT_RECIPE_REMOVE', 9, '2017-12-30 08:57:19', NULL),
(536, 1, 1, 'REVIEW_RECIPE_ADD', 10, '2017-12-30 08:57:26', NULL),
(537, 1, 1, 'REVIEW_RECIPE_REMOVE', 9, '2017-12-30 08:57:45', NULL),
(538, 63, 63, 'USER_ADD', 63, '2017-12-30 09:53:23', NULL),
(539, 64, 64, 'USER_ADD', 64, '2017-12-30 09:55:20', NULL),
(540, 65, 65, 'USER_ADD', 65, '2018-01-01 11:23:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `USER_ID` int(11) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `VERI_CODE` int(8) NOT NULL,
  `VERI_CODE_DTM` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IMG` varchar(50) DEFAULT NULL,
  `MOBILE` varchar(15) DEFAULT NULL,
  `PASSWORD` varchar(25) NOT NULL,
  `NAME` varchar(25) DEFAULT NULL,
  `GENDER` varchar(1) DEFAULT '',
  `SSID` varchar(25) DEFAULT NULL,
  `SALT` varchar(25) DEFAULT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`USER_ID`, `EMAIL`, `VERI_CODE`, `VERI_CODE_DTM`, `IMG`, `MOBILE`, `PASSWORD`, `NAME`, `GENDER`, `SSID`, `SALT`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'don@cookery.com', 80342615, '2017-12-31 09:14:53', 'app_data/users/1/profile/images/5a4a0f1e76981.jpg', '9654611145', 'Q09PS0VSWXNOS1dJ', 'TEST NAME -  68', 'M', '', 'c05LV0k=', '2017-09-23 00:00:00', '2018-01-01 11:36:14'),
(2, 'testemail@cookery.com', 0, '2017-12-29 06:29:04', NULL, '9962218578', 'aWFtdGVzdE15RkJE', 'ABCD', 'm', 'BlsXt3B4aS', 'TXlGQkQ=', '2017-10-31 05:05:03', '2017-12-31 06:54:52'),
(3, 'testemail2@cookery.com', 0, '2017-12-29 06:29:04', NULL, '7503876065', 'aWFtdGVzdG9TS3Ay', 'testuser1', 'm', 'UgbYfiDJNG', 'b1NLcDI=', '2017-10-31 05:22:11', NULL),
(4, 'vishal@cookery.com', 0, '2017-12-29 06:29:04', NULL, '8124627522', 'cm9jazJaUEtw', 'Vishal', 'M', 'zXpcSp5CRx', 'MlpQS3A=', '2017-10-31 13:37:06', NULL),
(5, 'testuser@gmail.com', 0, '2017-12-29 06:29:04', NULL, '1234567890', 'MTIzNDU2NzgxNjhjUg==', 'Test User', 'M', '8WGpsX2MsJ', 'MTY4Y1I=', '2017-12-05 09:28:53', NULL),
(6, 'yOIW8uBUPh@gmail.com', 0, '2017-12-29 06:29:04', NULL, '8202377734', 'MTIzNDU2Nzh6YUlrYw==', 'Test User', 'M', 'p1DuoOctRT', 'emFJa2M=', '2017-12-06 10:09:03', NULL),
(7, 'BuaMX1inFJ@gmail.com', 0, '2017-12-29 06:29:04', NULL, '1434819247', 'MTIzNDU2NzgzeGtreA==', 'Test User', 'M', 'fugYiKnDx8', 'M3hra3g=', '2017-12-06 10:17:52', NULL),
(8, 'mbTVNucEYo@gmail.com', 0, '2017-12-29 06:29:04', NULL, '4048666965', 'MTIzNDU2NzhqWW9RRA==', 'Test User', 'M', 'wqzAVyYyJt', 'allvUUQ=', '2017-12-06 10:18:40', NULL),
(9, 'mKZ3tT6mDV@gmail.com', 0, '2017-12-29 06:29:04', NULL, '2463154465', 'MTIzNDU2NzhuV1hOVA==', 'Test User', 'M', '79D6gkz9YL', 'bldYTlQ=', '2017-12-06 10:19:12', NULL),
(10, 'yotGl72BQP@gmail.com', 0, '2017-12-29 06:29:04', NULL, '4706108967', 'MTIzNDU2Nzhna05KRw==', 'Test User', 'M', '10bR1Dhl1v', 'Z2tOSkc=', '2017-12-06 10:25:31', NULL),
(11, 'p7gerTEFcK@gmail.com', 0, '2017-12-29 06:29:04', NULL, '3224967902', 'MTIzNDU2NzhNZHhsWA==', 'Test User', 'M', 'Aa0qpd0dRi', 'TWR4bFg=', '2017-12-06 10:26:31', NULL),
(12, '2hdwLAh3Qf@gmail.com', 0, '2017-12-29 06:29:04', NULL, '1122780923', 'MTIzNDU2NzhhU1VXMQ==', 'Test User', 'M', 'kZQae7t6VP', 'YVNVVzE=', '2017-12-06 10:32:19', NULL),
(13, '1ur6aieyL4@gmail.com', 0, '2017-12-29 06:29:04', NULL, '7568342541', 'UkZ3azZVRGJRNlE2SXpx', 'Test User', 'M', 'efESK2GWwx', 'UTZJenE=', '2017-12-06 10:36:54', NULL),
(14, 'DyBbMIg3hW@gmail.com', 0, '2017-12-29 06:29:04', NULL, '6397083418', 'MzZnMUR2dnFJODhmclFj', 'Test User', 'M', 'j5uaOopyRB', 'OGZyUWM=', '2017-12-06 10:38:49', NULL),
(15, 'Ch0C1oJCgP@gmail.com', 0, '2017-12-29 06:29:04', NULL, '1236028204', 'bTh5RTNEY203Y0d3ODBR', 'Test User', 'M', '1cwiaP2xsA', 'R3c4MFE=', '2017-12-06 10:42:08', NULL),
(16, 'ZfhzXsEz5X@gmail.com', 0, '2017-12-29 06:29:04', NULL, '0328880787', 'T0ZMSUpkYm1sTTBsRDJi', 'Test User', 'M', 'XVLEHSZm7U', 'MGxEMmI=', '2017-12-06 10:43:00', NULL),
(17, 'RX631Oc74f@gmail.com', 0, '2017-12-29 06:29:04', NULL, '1925274231', 'ZFVURk1SM1Z6ek9sckpo', 'Test User', 'M', 'FkQwv4DZaz', 'T2xySmg=', '2017-12-06 15:20:07', NULL),
(18, 'Nq2ieecBym@gmail.com', 0, '2017-12-29 06:29:04', NULL, '9071819562', 'WGdETmlpdjRHQnMxNGVD', 'Test User', 'M', 'lO8HfQ826L', 'czE0ZUM=', '2017-12-06 21:06:19', NULL),
(19, 'jj5eAEXfU9@gmail.com', 0, '2017-12-29 06:29:04', NULL, '4282843437', 'M3VEOVJDaHFWV056OUxu', 'Test User', 'M', 'hmMUs3e1cd', 'Tno5TG4=', '2017-12-06 21:19:07', NULL),
(20, '29LcdlnLKf@gmail.com', 0, '2017-12-29 06:29:04', NULL, '4345019328', 'SmdQc29VUlREVFVSYk1B', 'Test User', 'M', 'oCThqOWUsW', 'VVJiTUE=', '2017-12-06 21:19:07', NULL),
(21, 'gUl84sC85i@gmail.com', 0, '2017-12-29 06:29:04', NULL, '7493439821', 'NjZBeVM5OVpQRjZGTHZ3', 'Test User', 'M', 'V5RuFN3DlM', 'NkZMdnc=', '2017-12-06 21:19:07', NULL),
(22, 'hOpulyUcvN@gmail.com', 0, '2017-12-29 06:29:04', NULL, '2551728778', 'YlpsYWo2QUNkazhsQWlq', 'Test User', 'M', 'I3icXGGgbT', 'OGxBaWo=', '2017-12-06 21:19:08', NULL),
(23, 'bMfjcgsHmB@gmail.com', 0, '2017-12-29 06:29:04', NULL, '8788910625', 'ZjdVQjNWbjhZQkdSTlBT', 'Test User', 'M', 'sLtY3DO5bg', 'R1JOUFM=', '2017-12-06 21:19:08', NULL),
(24, 'gzzvd5mHzV@gmail.com', 0, '2017-12-29 06:29:04', NULL, '2459219942', 'd1ZDSmpndk1uMHJkZWZY', 'Test User', 'M', '3NAeFBSWWU', 'cmRlZlg=', '2017-12-06 21:19:08', NULL),
(25, 'CFAXHpPwUd@gmail.com', 0, '2017-12-29 06:29:04', NULL, '7921299722', 'YzVhdnpDVDlmZ05PV1pB', 'Test User', 'M', 'UDzOV0DRU5', 'Tk9XWkE=', '2017-12-07 11:32:54', NULL),
(26, 'eEfVEJrxIX@gmail.com', 0, '2017-12-29 06:29:04', NULL, '3499450811', 'bXRKSUxSNzROdFI1N1Ay', 'Test User', 'M', 'w50UEdmk58', 'UjU3UDI=', '2017-12-07 11:54:15', NULL),
(27, '4OjqajUs9g@gmail.com', 0, '2017-12-29 06:29:04', NULL, '1150903063', 'TXFidlN1czNlYTVyVWpI', 'Test User', 'M', 'x3o7h3JaZG', 'NXJVakg=', '2017-12-07 12:05:22', NULL),
(28, 'lpZngIZUKY@gmail.com', 0, '2017-12-29 06:29:04', NULL, '7172558694', 'Q1I5dXJ2TXFLb1FqSXlU', 'Test User', 'M', 'oKM3Cw6itC', 'UWpJeVQ=', '2017-12-07 12:22:14', NULL),
(29, 'Qanx1xZlef@gmail.com', 0, '2017-12-29 06:29:04', NULL, '6077018106', 'QzZTdDVNNWdiR2FVU3Fx', 'Test User', 'M', 'LuHOy11sWR', 'YVVTcXE=', '2017-12-07 12:22:14', NULL),
(30, 'PE5XKyFRTO@gmail.com', 0, '2017-12-29 06:29:04', NULL, '6856612574', 'RW5vWmRMZmVhM0lXYU5h', 'Test User', 'M', '37bbOr2Xt8', 'SVdhTmE=', '2017-12-07 12:22:14', NULL),
(31, 'rQnpbdgL71@gmail.com', 0, '2017-12-29 06:29:04', NULL, '9396035651', 'cndnV1hWOWlVck5UV2ZL', 'Test User', 'M', 'WBoqMdPcLG', 'TlRXZks=', '2017-12-07 12:22:14', NULL),
(32, 'ztfSEk6B3C@gmail.com', 0, '2017-12-29 06:29:04', NULL, '7311704009', 'dWs3UklOeXM4S1BuUEFT', 'Test User', 'M', '9uY0ZDN2g9', 'UG5QQVM=', '2017-12-07 12:22:15', NULL),
(33, 'lYoRhb8ZBf@gmail.com', 0, '2017-12-29 06:29:04', NULL, '8451165685', 'b0YxZG1GckhES2R3M0Zn', 'Test User', 'M', 'Dudt0IxEHI', 'ZHczRmc=', '2017-12-07 12:22:15', NULL),
(34, '3H5vt92ouL@gmail.com', 0, '2017-12-29 06:29:04', NULL, '8549161982', 'T2w2TUhiMHBSamxNWFQ3', 'Test User', 'M', 'DCmE3MR3ZJ', 'bE1YVDc=', '2017-12-07 15:01:26', NULL),
(35, '4T1Z4vzjCH@gmail.com', 0, '2017-12-29 06:29:04', NULL, '2209997550', 'dG81cVdlWkhmMVBncmJU', 'Test User', 'M', 'lSnjYx9Yr3', 'UGdyYlQ=', '2017-12-07 15:01:39', NULL),
(36, '5M7QIvAVFd@gmail.com', 0, '2017-12-29 06:29:04', NULL, '2978043429', 'bGs2cjFLdnhEa2JSd1pH', 'Test User', 'M', 'k81O74sVaE', 'YlJ3Wkc=', '2017-12-07 15:01:46', NULL),
(37, 'gyhxa6lCeN@gmail.com', 0, '2017-12-29 06:29:04', NULL, '1449887458', 'RE9jMUR2SEZ5S2w0eXBK', 'Test User', 'M', 'oCaB5bkDQ1', 'bDR5cEo=', '2017-12-07 15:02:15', NULL),
(38, 'JcEK2zoeFr@gmail.com', 0, '2017-12-29 06:29:04', NULL, '5028518859', 'c2NrelhQc25XYkthRmx0', 'Test User', 'M', '8XOraL8Q2k', 'S2FGbHQ=', '2017-12-07 15:02:21', NULL),
(39, 'kTWUUMdona@gmail.com', 0, '2017-12-29 06:29:04', NULL, '6701341132', 'ZTMyZDVxcWo3U0xWYUlV', 'Test User', 'M', 'Relr2grF7m', 'TFZhSVU=', '2017-12-07 15:12:20', NULL),
(40, 'G5tTSHpBzo@gmail.com', 0, '2017-12-29 06:29:04', NULL, '9785956975', 'dzFCWWxQeEdLUkJibTVl', 'Test User', 'M', 'eGAnNJuj2Z', 'QmJtNWU=', '2017-12-09 02:31:36', NULL),
(41, 'szP8OEFT2Y@gmail.com', 0, '2017-12-29 06:29:04', NULL, '8418273261', 'VjlrM0VHSFhxQmJic3JS', 'Test User', 'M', 'fGjcdciQF7', 'YmJzclI=', '2017-12-09 02:31:36', NULL),
(42, 'iUOPvHMUHU@gmail.com', 0, '2017-12-29 06:29:04', NULL, '3981859004', 'Y2RZTFhXSTFPdDU5Yzk1', 'Test User', 'M', 'yvbV3rhwBp', 'NTljOTU=', '2017-12-09 02:31:37', NULL),
(43, 'm83W2E74ml@gmail.com', 0, '2017-12-29 06:29:04', NULL, '8988125485', 'dHZxVWVBTDNRQ2xWR0hp', 'Test User', 'M', 'nokluy1nr8', 'bFZHSGk=', '2017-12-09 02:31:37', NULL),
(44, 'u5dK9mDKc3@gmail.com', 0, '2017-12-29 06:29:04', NULL, '9466253586', 'M1IzamhwSXdXeWIwVGVF', 'Test User', 'M', 's1VUX7txJV', 'YjBUZUU=', '2017-12-09 02:31:38', NULL),
(45, 'AJ3uHtwFi5@gmail.com', 0, '2017-12-29 06:29:04', NULL, '5933337509', 'S3d2NUVKbTg4Q2oyM0c3', 'Test User', 'M', 'wsk7P8QkrS', 'ajIzRzc=', '2017-12-09 03:04:14', NULL),
(46, '2D3knF59UH@gmail.com', 0, '2017-12-29 06:29:04', NULL, '8031776077', 'V25yVFhjekVLZWhkRnVj', 'Test User', 'M', 'XQSDDW2AUH', 'aGRGdWM=', '2017-12-12 15:30:27', NULL),
(47, 'bxy59Uozgv@gmail.com', 0, '2017-12-29 06:29:04', NULL, '3311571135', 'czBURzFjd2JMVEo0ZTFP', 'Test User', 'M', 'zervzzZPzM', 'SjRlMU8=', '2017-12-13 15:38:42', NULL),
(48, 'BnjETSM2Ce@gmail.com', 0, '2017-12-29 06:29:04', NULL, '7804938640', 'T2VDaVkzTEFwOThEZWZv', 'Test User', 'M', '9grxmxpmhZ', 'OERlZm8=', '2017-12-14 11:01:33', NULL),
(49, 'mqTJxCGpka@gmail.com', 0, '2017-12-29 06:29:04', NULL, '1202368274', 'bHdOdUpDMDJacEVtYzVt', 'Test User', 'M', 'atlgH3L0ph', 'RW1jNW0=', '2017-12-15 15:02:05', NULL),
(50, 'xOUqRp2oZN@gmail.com', 0, '2017-12-29 06:29:04', NULL, '0402232131', 'S1FsSHNoVXpmN3Y3dHRR', 'Test User', 'M', 'CrZF7envK9', 'djd0dFE=', '2017-12-16 22:48:35', NULL),
(51, 'ndjriWzSBw@gmail.com', 0, '2017-12-29 06:29:04', NULL, '7597298013', 'a1JIVmZLZnhCSWduRHBH', 'Test User', 'M', 'STYGY8xzwl', 'Z25EcEc=', '2017-12-17 14:22:14', NULL),
(52, 'zCIHqiEg2k@gmail.com', 0, '2017-12-29 06:29:04', NULL, '9176520834', 'ODRiRWhtSjRzVlJ3c292', 'Test User', 'M', '1EoMyTgiDT', 'Undzb3Y=', '2017-12-17 19:39:15', NULL),
(53, 'e0vTB20CNI@gmail.com', 0, '2017-12-29 06:29:04', NULL, '7795599808', 'Q1dNN3JDbGd5b0F6M2RU', 'Test User', 'M', 'rr3qhhYTGl', 'QXozZFQ=', '2017-12-18 09:53:36', NULL),
(54, 'cGHi8zJir7@gmail.com', 0, '2017-12-29 06:29:04', NULL, '1344784955', 'YW5NOXlvYnVINDJ1U3dY', 'Test User', 'M', 'MQlMvt0SZK', 'MnVTd1g=', '2017-12-18 10:10:43', NULL),
(55, '1eitY1tUdB@gmail.com', 0, '2017-12-29 06:29:04', NULL, '3091295174', 'dGVOcm9CZVhCc0ZjbGRx', 'Test User', 'M', 'jXGYOyuPYb', 'RmNsZHE=', '2017-12-18 15:54:48', NULL),
(56, 'iG3S1XhetD@gmail.com', 0, '2017-12-29 06:29:04', NULL, '1376574609', 'SVJzZW14ZlU1TTE3N1l0', 'Test User', 'M', 'w7Wtdm6Hnt', 'MTc3WXQ=', '2017-12-19 19:58:01', NULL),
(57, 'u1STMAbyKf@gmail.com', 0, '2017-12-29 06:29:04', NULL, '0182983869', 'dTNOS1ZPdWpLNEl5djZ6', 'Test User', 'M', 'jHia9CKnAj', 'SXl2Nno=', '2017-12-21 09:26:46', NULL),
(58, 'bIOX9zJiqh@gmail.com', 0, '2017-12-29 06:29:04', NULL, '0494893380', 'YVBSY0ljTDdpZWtkd2FY', 'Test User', 'M', 'buW2OLC4kD', 'a2R3YVg=', '2017-12-28 09:23:09', NULL),
(59, 'tmnJJQY6NW@gmail.com', 0, '2017-12-29 07:14:50', NULL, '6176779264', 'M0xFSWpCSjVjOGUxaksz', 'Test User', 'M', 'FwBucTafMt', 'ZTFqSzM=', '2017-12-29 07:14:50', NULL),
(60, '83JuYpN2mR@gmail.com', 0, '2017-12-29 07:38:05', NULL, '7301820168', 'bmZ3cG15d0FjTTBhRVlW', 'Test User', 'M', 'OK50R4fzFj', 'MGFFWVY=', '2017-12-29 07:38:05', NULL),
(61, 'Am8gZZWHa3@gmail.com', 0, '2017-12-29 08:30:55', NULL, '8114166397', 'TmpiMjNTd3NyRjRwV0Nw', 'Test User', 'M', 'osaJRbEWK5', 'NHBXQ3A=', '2017-12-29 08:30:55', NULL),
(62, 'w9ZiyCBczv@gmail.com', 38158294, '2017-12-29 16:52:50', NULL, '3575891040', 'Z1d3Z2o4MnBXUnNlZHB0', 'Test User', 'M', '9ElEB5ILF0', 'c2VkcHQ=', '2017-12-29 16:52:50', NULL),
(63, 'mEmve9D2D6@gmail.com', 14708985, '2017-12-30 09:53:23', NULL, NULL, 'NDUzNDY0ODQ5NHNFQjI0', 'COOKERY', NULL, '4YfRLcdJ2J', 'c0VCMjQ=', '2017-12-30 09:53:23', NULL),
(64, 'DkuyWf4vOz@gmail.com', 88859188, '2017-12-30 09:55:20', NULL, NULL, 'Q09PS0VSWVJzSGlv', 'Test User -  08', NULL, '0rqwzKv526', 'UnNIaW8=', '2017-12-30 09:55:20', NULL),
(65, '2usvcVlzb6@gmail.com', 55039142, '2018-01-01 11:23:18', NULL, NULL, 'Q09PS0VSWVR2SzNK', 'Test User -  08', '', '7bzJJtwkqG', 'VHZLM0o=', '2018-01-01 11:23:18', NULL);

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
(29, 'Venkateshwara', 1, 'N', '2017-12-30 23:23:32', '2017-12-30 23:23:32');

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
(48, 8, 29, 'N', '2017-12-30 23:23:33', '2017-12-30 23:23:33');

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
(1, 1, 2, 'Y', '2017-12-27 08:20:02', '2017-12-28 09:23:12'),
(2, 1, 3, 'N', '2017-12-27 08:27:22', '2017-12-30 08:54:50');

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
-- Indexes for table `QTY`
--
ALTER TABLE `QTY`
  ADD PRIMARY KEY (`QTY_ID`);

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
  ADD KEY `REF_USER_ID` (`REF_USER_ID`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`USER_ID`);

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
  ADD UNIQUE KEY `FLWS_USER_ID` (`FLWS_USER_ID`),
  ADD KEY `FLWR_USER_ID` (`FLWR_USER_ID`);

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
  MODIFY `COM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
  MODIFY `ING_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ING_AKA`
--
ALTER TABLE `ING_AKA`
  MODIFY `ING_AKA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `LIKES`
--
ALTER TABLE `LIKES`
  MODIFY `LIKE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `QTY`
--
ALTER TABLE `QTY`
  MODIFY `QTY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT for table `TASTES`
--
ALTER TABLE `TASTES`
  MODIFY `TST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `TIMELINES`
--
ALTER TABLE `TIMELINES`
  MODIFY `TMLN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541;

--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `USER_ING_LIST`
--
ALTER TABLE `USER_ING_LIST`
  MODIFY `USER_ING_LIST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `USER_ING_LIST_ITEM`
--
ALTER TABLE `USER_ING_LIST_ITEM`
  MODIFY `USER_ING_LIST_ITEM_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `USER_RELATIONSHIP`
--
ALTER TABLE `USER_RELATIONSHIP`
  MODIFY `RLT_ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `TIMELINES_FK2` FOREIGN KEY (`REF_USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
