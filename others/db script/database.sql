-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 23, 2018 at 08:44 PM
-- Server version: 8.0.11
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cookery`
--

-- --------------------------------------------------------

--
-- Table structure for table `ABOUT_US`
--

CREATE TABLE `ABOUT_US` (
  `ABOUT_US_ID` int(11) NOT NULL,
  `ABOUT_US_DESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` timestamp NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ABOUT_US`
--

INSERT INTO `ABOUT_US` (`ABOUT_US_ID`, `ABOUT_US_DESC`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'Test for About us super heros', '2018-03-18 15:32:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ADMIN_USER`
--

CREATE TABLE `ADMIN_USER` (
  `ADMIN_USER_ID` int(11) NOT NULL,
  `ADMIN_USER_NAME` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_USER_PASSWORD` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_USER_ROLE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_USER_MOBILE` bigint(20) NOT NULL,
  `ADMIN_USER_EMAIL` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DEL` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ADMIN_USER`
--

INSERT INTO `ADMIN_USER` (`ADMIN_USER_ID`, `ADMIN_USER_NAME`, `ADMIN_USER_PASSWORD`, `ADMIN_USER_ROLE`, `ADMIN_USER_MOBILE`, `ADMIN_USER_EMAIL`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'vishal', 'cm9jaw==', 'Admin', 7448145685, 'dial2vishal@gmail.com', 'N', '2018-04-22 00:44:40', '2018-04-22 00:44:40'),
(2, 'test', 'dGVzdA==', 'Employee', 9962218577, 'vishalva06@gmail.com', 'N', '2018-04-22 00:45:27', '2018-04-22 01:59:27');

-- --------------------------------------------------------

--
-- Table structure for table `COMMENTS`
--

CREATE TABLE `COMMENTS` (
  `COM_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `COMMENT` text NOT NULL,
  `TYPE` varchar(15) NOT NULL,
  `TYPE_ID` int(11) NOT NULL,
  `IS_DEL` varchar(1) NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `COMMENTS`
--

INSERT INTO `COMMENTS` (`COM_ID`, `USER_ID`, `COMMENT`, `TYPE`, `TYPE_ID`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(9, 1, 'TEST COMMENT', 'RECIPE', 3, 'Y', '2017-12-06 18:32:20', NULL),
(10, 1, 'TEST COMMENT', 'RECIPE', 3, 'Y', '2017-12-06 18:36:44', NULL),
(11, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 18:37:27', NULL),
(12, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 18:37:32', NULL),
(13, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 18:37:43', NULL),
(14, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 18:38:21', NULL),
(15, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 18:39:02', NULL),
(16, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 21:06:47', NULL),
(17, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 21:19:48', NULL),
(18, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 21:19:50', NULL),
(19, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 21:19:52', NULL),
(20, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 21:19:54', NULL),
(21, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 21:19:55', NULL),
(22, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-06 21:19:57', NULL),
(23, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 11:33:16', NULL),
(24, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 11:54:36', NULL),
(25, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 12:05:45', NULL),
(26, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 12:23:59', NULL),
(27, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 12:24:00', NULL),
(28, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 12:24:00', NULL),
(29, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 12:24:02', NULL),
(30, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 12:24:02', NULL),
(31, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 12:24:02', NULL),
(32, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 15:03:11', NULL),
(33, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 15:03:26', NULL),
(34, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 15:03:30', NULL),
(35, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 15:04:01', NULL),
(36, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 15:04:07', NULL),
(37, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-07 15:14:05', NULL),
(38, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-09 02:33:20', NULL),
(39, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-09 02:33:21', NULL),
(40, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-09 02:33:23', NULL),
(41, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-09 02:33:24', NULL),
(42, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-09 02:33:24', NULL),
(43, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-09 03:05:58', NULL),
(44, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-12 15:30:57', NULL),
(45, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-13 15:39:10', NULL),
(46, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-14 11:02:00', NULL),
(47, 1, 'TEST COMMENT', 'RECIPE', 3, 'N', '2017-12-15 15:02:35', NULL),
(48, 1, 'TEST COMMENT', 'RECIPE', 103, 'Y', '2017-12-15 20:19:16', NULL),
(49, 1, 'TEST COMMENT', 'RECIPE', 103, 'Y', '2017-12-16 22:49:06', NULL),
(50, 1, 'TEST COMMENT', 'RECIPE', 103, 'N', '2017-12-17 14:22:44', NULL),
(51, 1, '123456789', 'RECIPE', 103, 'Y', '2017-12-17 19:33:36', NULL),
(52, 1, 'TEST COMMENT', 'RECIPE', 103, 'N', '2017-12-17 19:39:46', NULL),
(53, 1, 'TEST COMMENT', 'RECIPE', 103, 'N', '2017-12-18 09:54:07', NULL),
(54, 1, 'TEST COMMENT', 'RECIPE', 103, 'N', '2017-12-18 10:11:13', NULL),
(55, 1, 'TEST COMMENT-62', 'RECIPE', 103, 'N', '2017-12-18 15:31:25', NULL),
(56, 1, 'TEST COMMENT-01', 'RECIPE', 103, 'N', '2017-12-19 19:58:35', NULL),
(57, 1, 'TEST COMMENT-15', 'RECIPE', 103, 'N', '2017-12-21 09:27:24', NULL),
(58, 1, 'I follow this user from past 1 year. His cooking skills are beyond this world. I personally like his Italian sweet dishes. Waiting for his next dishes eagerly.', 'RECIPE', 103, 'N', '2017-12-22 17:45:08', NULL),
(59, 1, 'Hello test', 'RECIPE', 103, 'N', '2017-12-22 17:51:00', NULL),
(60, 1, 'test 1234567', 'RECIPE', 103, 'N', '2017-12-22 17:51:42', NULL),
(61, 1, 'test 12345', 'RECIPE', 103, 'N', '2017-12-22 17:59:17', NULL),
(62, 1, 'TEST COMMENT-26', 'RECIPE', 103, 'N', '2017-12-28 09:23:50', NULL),
(63, 1, 'TEST COMMENT-22', 'RECIPE', 103, 'N', '2017-12-30 08:57:05', NULL),
(64, 1, 'Hii', 'RECIPE', 103, 'N', '2018-01-16 00:56:08', NULL),
(65, 1, 'Hi', 'RECIPE', 103, 'N', '2018-01-16 00:56:09', NULL),
(66, 1, 'Ndnd', 'RECIPE', 103, 'N', '2018-01-16 23:46:25', NULL),
(67, 1, 'Ndnd', 'RECIPE', 103, 'N', '2018-01-16 23:46:26', NULL),
(68, 1, 'Jdnd', 'RECIPE', 103, 'N', '2018-01-16 23:46:42', NULL),
(69, 1, 'Jdnd', 'RECIPE', 103, 'N', '2018-01-16 23:46:43', NULL),
(70, 1, 'TEST COMMENT-65', 'RECIPE', 103, 'N', '2018-02-15 10:45:56', NULL),
(71, 1, 'humpty Dumpty sat on a wall', 'RECIPE', 103, 'N', '2018-03-03 13:10:58', NULL),
(72, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photoas well as a recipe image - 25', 'RECIPE', 105, 'Y', '2018-03-21 12:26:54', NULL),
(76, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 79', 'RECIPE', 105, 'Y', '2018-03-21 12:34:03', NULL),
(78, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 72', 'RECIPE_IMG', 105, 'N', '2018-03-21 12:35:07', NULL),
(85, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 61', 'RECIPE', 96, 'N', '2018-03-21 12:41:26', NULL),
(86, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 66', 'RECIPE', 105, 'Y', '2018-03-21 18:34:41', NULL),
(87, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 07', 'RECIPE_IMG', 96, 'N', '2018-03-21 18:34:48', NULL),
(88, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 61', 'RECIPE', 105, 'N', '2018-03-21 18:42:58', NULL),
(90, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 58', 'RECIPE', 105, 'Y', '2018-03-21 18:57:59', NULL),
(91, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 89', 'RECIPE_IMG', 96, 'N', '2018-03-21 18:58:22', NULL),
(92, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 47', 'USER', 1, 'N', '2018-03-22 12:08:20', NULL),
(93, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 35', 'USER', 1, 'N', '2018-03-22 12:09:06', NULL),
(94, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 40', 'RECIPE_IMG', 96, 'N', '2018-03-22 12:09:14', NULL),
(95, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 78', 'RECIPE', 105, 'Y', '2018-03-22 12:09:18', NULL),
(96, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 39', 'RECIPE', 105, 'Y', '2018-03-26 13:58:32', NULL),
(97, 1, 'Test for new comment on recipe image', 'RECIPE_IMG', 105, 'N', '2018-04-04 19:06:36', NULL),
(98, 1, 'Test for another comment on recipe image', 'RECIPE_IMG', 105, 'N', '2018-04-04 19:21:25', NULL),
(101, 1, 'test first comment', 'RECIPE_IMG', 102, 'Y', '2018-04-04 19:34:49', NULL),
(102, 1, 'test', 'RECIPE_IMG', 103, 'N', '2018-04-04 19:35:48', NULL),
(103, 1, 'to begin, begin.', 'RECIPE_IMG', 104, 'N', '2018-04-04 19:39:21', NULL),
(115, 1, '1st', 'RECIPE_IMG', 100, 'Y', '2018-04-04 20:04:10', NULL),
(116, 1, '2nd', 'RECIPE_IMG', 100, 'Y', '2018-04-04 20:04:18', NULL),
(117, 1, '3rd', 'RECIPE_IMG', 100, 'Y', '2018-04-04 20:04:30', NULL),
(118, 1, 'second comment', 'RECIPE_IMG', 102, 'Y', '2018-04-04 20:05:08', NULL),
(119, 1, 'fourth', 'RECIPE_IMG', 100, 'Y', '2018-04-04 20:08:35', NULL),
(120, 1, 'Hi ! This\'s just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 33', 'RECIPE', 105, 'Y', '2018-04-13 11:32:59', NULL),
(122, 1, 'fifth', 'RECIPE_IMG', 100, 'Y', '2018-04-16 18:25:39', NULL),
(123, 1, 'test', 'RECIPE_IMG', 100, 'Y', '2018-04-16 18:27:26', NULL),
(124, 1, 'sixth', 'RECIPE_IMG', 100, 'Y', '2018-04-16 18:29:33', NULL),
(125, 1, 'seventh comment', 'RECIPE_IMG', 100, 'Y', '2018-04-16 18:33:38', NULL),
(126, 1, 'this time it should work', 'RECIPE_IMG', 100, 'Y', '2018-04-16 18:37:27', NULL),
(127, 1, 'this time it should work', 'RECIPE_IMG', 100, 'Y', '2018-04-16 18:37:38', NULL),
(128, 1, 'this time it should work', 'RECIPE_IMG', 100, 'Y', '2018-04-16 18:38:10', NULL),
(129, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 02', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:39:13', NULL),
(130, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 44', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:42:04', NULL),
(131, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 33', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:42:53', NULL),
(132, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 40', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:45:13', NULL),
(133, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 24', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:47:14', NULL),
(134, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 92', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:47:35', NULL),
(135, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 03', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:48:07', NULL),
(136, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 52', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:48:36', NULL),
(137, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 85', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:49:00', NULL),
(138, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 90', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:49:22', NULL),
(139, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 22', 'RECIPE_IMG', 96, 'N', '2018-04-16 18:49:38', NULL),
(140, 1, 'this time it should work', 'RECIPE_IMG', 100, 'Y', '2018-04-16 18:51:17', NULL),
(141, 1, 'this time it should work', 'RECIPE_IMG', 100, 'N', '2018-04-16 18:51:43', NULL),
(142, 1, 'third comment. This time it must work !', 'RECIPE_IMG', 102, 'Y', '2018-04-16 18:53:36', NULL),
(143, 1, 'second comment is good luck', 'RECIPE_IMG', 103, 'N', '2018-04-16 18:55:51', NULL),
(144, 1, 'third comment is superstitious', 'RECIPE_IMG', 103, 'N', '2018-04-16 18:56:30', NULL),
(145, 1, 'check for soft keyboard hide', 'RECIPE_IMG', 100, 'N', '2018-04-16 19:02:35', NULL),
(146, 1, 'test soft keyboard hide functionality soon after I submitted this ridiculous comment which is simply made up to test something equally ridiculous.', 'RECIPE_IMG', 104, 'N', '2018-04-16 19:03:39', NULL),
(147, 1, 'test', 'RECIPE_IMG', 102, 'Y', '2018-04-16 20:17:35', NULL),
(148, 1, 'test', 'RECIPE', 105, 'N', '2018-04-16 20:23:07', NULL),
(149, 1, 'test 123', 'RECIPE', 105, 'N', '2018-04-16 20:29:29', NULL),
(150, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 75', 'RECIPE', 105, 'N', '2018-04-16 20:35:13', NULL),
(151, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 45', 'RECIPE', 105, 'N', '2018-04-16 20:36:01', NULL),
(152, 1, 'test my patience', 'RECIPE', 105, 'N', '2018-04-16 20:38:45', NULL),
(153, 1, 'thups up.. taste the thunder !', 'RECIPE', 105, 'N', '2018-04-16 20:40:41', NULL),
(154, 1, 'let me rest in peace', 'RECIPE', 105, 'N', '2018-04-16 20:41:42', NULL),
(155, 1, 'no I won\'t let us rest today', 'RECIPE', 105, 'N', '2018-04-16 20:41:58', NULL),
(156, 1, 'I\'m Thor ! The god of thunder', 'RECIPE_IMG', 100, 'N', '2018-04-16 20:49:20', NULL),
(157, 1, 'And I\'m Loki.. Loki ki sabzi', 'RECIPE_IMG', 100, 'N', '2018-04-16 20:49:42', NULL),
(158, 1, 'buhahahahah', 'RECIPE_IMG', 100, 'N', '2018-04-16 20:49:56', NULL),
(159, 1, 'aj.. na koi kaam.. na dhanda', 'RECIPE_IMG', 100, 'N', '2018-04-16 20:50:26', NULL),
(160, 1, 'ok Teri wargi na he', 'RECIPE_IMG', 100, 'N', '2018-04-16 20:50:39', NULL),
(161, 1, 'aj Tera accha sa test ho Jaye... sala bhot Tang kar raha he', 'RECIPE_IMG', 100, 'N', '2018-04-16 21:00:56', NULL),
(162, 1, 'test madu guru', 'RECIPE', 105, 'N', '2018-04-16 21:03:52', NULL),
(163, 1, 'Hi there !', 'USER', 4, 'Y', '2018-04-16 21:27:40', NULL),
(164, 1, 'Hi Again !', 'USER', 4, 'N', '2018-04-16 21:27:56', NULL),
(165, 1, 'Nice DP :D', 'USER', 4, 'N', '2018-04-16 21:28:18', NULL),
(166, 1, 'your food sucks !', 'USER', 4, 'N', '2018-04-16 21:28:40', NULL),
(167, 1, 'worst chef ever !!!', 'USER', 4, 'N', '2018-04-16 21:28:57', NULL),
(168, 1, 'I apologize for my rudeness', 'USER', 4, 'N', '2018-04-16 21:29:11', NULL),
(169, 1, 'no I don\'t !', 'RECIPE', 4, 'N', '2018-04-16 21:29:20', NULL);

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
  `ING_AKA_ID` int(11) NOT NULL,
  `QTY_ID` int(11) NOT NULL,
  `ING_QTY` int(11) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DISH`
--

INSERT INTO `DISH` (`DISH_ID`, `RCP_ID`, `ING_AKA_ID`, `QTY_ID`, `ING_QTY`, `CREATE_DTM`, `MOD_DTM`) VALUES
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
(151, 103, 1, 1, 5, '2017-12-19 19:45:19', NULL),
(152, 103, 2, 2, 6, '2017-12-19 19:45:19', NULL),
(153, 104, 1, 1, 5, '2018-03-18 10:04:17', NULL),
(154, 104, 2, 2, 6, '2018-03-18 10:04:17', NULL),
(155, 105, 28, 1, 4, '2018-03-18 11:14:27', NULL),
(156, 105, 3, 3, 1, '2018-03-18 11:14:27', NULL),
(157, 105, 20, 3, 5, '2018-03-18 11:14:27', NULL),
(158, 105, 27, 3, 2, '2018-03-18 11:14:27', NULL),
(159, 105, 26, 7, 10, '2018-03-18 11:14:27', NULL),
(160, 105, 25, 1, 1, '2018-03-18 11:14:27', NULL),
(161, 105, 24, 6, 1, '2018-03-18 11:14:27', NULL),
(162, 106, 1, 1, 5, '2018-03-24 17:55:56', NULL),
(163, 106, 2, 2, 6, '2018-03-24 17:55:56', NULL),
(170, 110, 1, 1, 5, '2018-03-24 18:01:14', NULL),
(171, 110, 2, 2, 6, '2018-03-24 18:01:15', NULL),
(172, 111, 1, 1, 5, '2018-03-24 18:01:42', NULL),
(173, 111, 2, 2, 6, '2018-03-24 18:01:42', NULL),
(174, 112, 1, 1, 5, '2018-03-24 18:06:09', NULL),
(175, 112, 2, 2, 6, '2018-03-24 18:06:09', NULL),
(176, 113, 1, 1, 5, '2018-03-24 18:12:13', NULL),
(177, 113, 2, 2, 6, '2018-03-24 18:12:14', NULL),
(178, 114, 1, 1, 5, '2018-03-24 18:17:49', NULL),
(179, 114, 2, 2, 6, '2018-03-24 18:17:49', NULL),
(180, 115, 1, 1, 5, '2018-03-24 18:18:15', NULL),
(181, 115, 2, 2, 6, '2018-03-24 18:18:15', NULL),
(184, 117, 1, 1, 5, '2018-03-28 18:08:31', NULL),
(185, 117, 2, 2, 6, '2018-03-28 18:08:31', NULL),
(186, 118, 1, 1, 5, '2018-03-28 18:10:43', NULL),
(187, 118, 2, 2, 6, '2018-03-28 18:10:43', NULL),
(188, 119, 1, 1, 5, '2018-03-28 18:11:58', NULL),
(189, 119, 2, 2, 6, '2018-03-28 18:11:59', NULL),
(194, 3, 1, 1, 5, '2018-04-04 13:58:48', NULL),
(195, 3, 2, 2, 6, '2018-04-04 13:58:49', NULL),
(196, 121, 1, 1, 5, '2018-04-05 08:02:32', NULL),
(197, 121, 2, 2, 6, '2018-04-05 08:02:32', NULL),
(198, 122, 1, 1, 5, '2018-04-05 08:04:03', NULL),
(199, 122, 2, 2, 6, '2018-04-05 08:04:03', NULL),
(200, 123, 1, 1, 5, '2018-04-05 08:07:53', NULL),
(201, 123, 2, 2, 6, '2018-04-05 08:07:53', NULL),
(202, 124, 1, 1, 5, '2018-04-05 08:09:30', NULL),
(203, 124, 2, 2, 6, '2018-04-05 08:09:30', NULL),
(204, 125, 1, 1, 5, '2018-04-05 08:10:48', NULL),
(205, 125, 2, 2, 6, '2018-04-05 08:10:48', NULL),
(206, 126, 1, 1, 5, '2018-04-05 08:15:22', NULL),
(207, 126, 2, 2, 6, '2018-04-05 08:15:22', NULL),
(208, 127, 1, 1, 5, '2018-04-05 08:21:15', NULL),
(209, 127, 2, 2, 6, '2018-04-05 08:21:16', NULL),
(210, 128, 1, 1, 5, '2018-04-05 08:23:45', NULL),
(211, 128, 2, 2, 6, '2018-04-05 08:23:45', NULL),
(212, 129, 1, 1, 5, '2018-04-22 19:34:00', NULL),
(213, 129, 2, 2, 6, '2018-04-22 19:34:00', NULL),
(214, 130, 1, 1, 5, '2018-04-22 19:56:49', NULL),
(215, 130, 2, 2, 6, '2018-04-22 19:56:49', NULL),
(216, 131, 1, 1, 5, '2018-04-22 20:03:10', NULL),
(217, 131, 2, 2, 6, '2018-04-22 20:03:10', NULL),
(221, 135, 1, 1, 5, '2018-04-22 20:41:37', NULL),
(222, 135, 2, 2, 6, '2018-04-22 20:41:37', NULL),
(234, 147, 1, 1, 1, '2018-04-23 20:37:14', NULL),
(235, 147, 19, 1, 1, '2018-04-23 20:37:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `FAVOURITES`
--

CREATE TABLE `FAVOURITES` (
  `FAV_ID` int(11) NOT NULL,
  `RCP_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `IS_DEL` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FAVOURITES`
--

INSERT INTO `FAVOURITES` (`FAV_ID`, `RCP_ID`, `USER_ID`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(5, 103, 1, 'N', '2018-03-07 23:12:34', '2018-03-07 23:13:05'),
(6, 105, 1, 'N', '2018-03-26 18:34:55', '2018-03-26 18:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `FOOD_CUISINE`
--

CREATE TABLE `FOOD_CUISINE` (
  `FOOD_CSN_ID` int(11) NOT NULL,
  `FOOD_CSN_NAME` varchar(25) NOT NULL,
  `IS_DEF` varchar(1) NOT NULL DEFAULT 'N',
  `IS_DEL` varchar(1) NOT NULL,
  `IMG` varchar(50) NOT NULL DEFAULT 'images/png.png',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FOOD_CUISINE`
--

INSERT INTO `FOOD_CUISINE` (`FOOD_CSN_ID`, `FOOD_CSN_NAME`, `IS_DEF`, `IS_DEL`, `IMG`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'INDIAN', 'Y', 'N', 'app_data/master_data/cuisines/indian.jpg', '2017-08-27 00:00:00', NULL),
(10, 'AFRICAN', 'N', 'N', 'app_data/master_data/cuisines/african.jpg', '2018-03-06 07:26:29', NULL),
(11, 'AMERICAN', 'N', 'N', 'app_data/master_data/cuisines/american.jpg', '2018-03-06 07:26:29', NULL),
(12, 'ASIAN', 'N', 'N', 'app_data/master_data/cuisines/asian.jpg', '2018-03-06 07:26:30', NULL),
(13, 'BARBEQUE', 'N', 'N', 'app_data/master_data/cuisines/barbeque.jpg', '2018-03-06 07:26:30', NULL),
(14, 'BRAZILLIAN', 'N', 'N', 'app_data/master_data/cuisines/brazillian.jpg', '2018-03-06 07:26:30', NULL),
(15, 'BRITISH', 'N', 'N', 'app_data/master_data/cuisines/british.jpg', '2018-03-06 07:26:30', NULL),
(16, 'CANTONESE', 'N', 'N', 'app_data/master_data/cuisines/cantonese.jpg', '2018-03-06 07:26:30', NULL),
(17, 'AFRICAN', 'N', 'N', 'app_data/master_data/cuisines/african.jpg', '2018-03-06 07:26:58', NULL),
(18, 'AMERICAN', 'N', 'N', 'app_data/master_data/cuisines/american.jpg', '2018-03-06 07:26:59', NULL),
(19, 'ASIAN', 'N', 'N', 'app_data/master_data/cuisines/asian.jpg', '2018-03-06 07:26:59', NULL),
(20, 'BARBEQUE', 'N', 'N', 'app_data/master_data/cuisines/barbeque.jpg', '2018-03-06 07:26:59', NULL),
(21, 'BRAZILLIAN', 'N', 'N', 'app_data/master_data/cuisines/brazillian.jpg', '2018-03-06 07:26:59', NULL),
(22, 'BRITISH', 'N', 'N', 'app_data/master_data/cuisines/british.jpg', '2018-03-06 07:26:59', NULL),
(23, 'CANTONESE', 'N', 'N', 'app_data/master_data/cuisines/cantonese.jpg', '2018-03-06 07:26:59', NULL),
(24, 'AFRICAN', 'N', 'N', 'app_data/master_data/cuisines/african.jpg', '2018-03-06 07:27:45', NULL),
(25, 'AMERICAN', 'N', 'N', 'app_data/master_data/cuisines/american.jpg', '2018-03-06 07:27:45', NULL),
(26, 'ASIAN', 'N', 'N', 'app_data/master_data/cuisines/asian.jpg', '2018-03-06 07:27:45', NULL),
(27, 'BARBEQUE', 'N', 'N', 'app_data/master_data/cuisines/barbeque.jpg', '2018-03-06 07:27:45', NULL),
(28, 'BRAZILLIAN', 'N', 'N', 'app_data/master_data/cuisines/brazillian.jpg', '2018-03-06 07:27:45', NULL),
(29, 'BRITISH', 'N', 'N', 'app_data/master_data/cuisines/british.jpg', '2018-03-06 07:27:45', NULL),
(30, 'CANTONESE', 'N', 'N', 'app_data/master_data/cuisines/cantonese.jpg', '2018-03-06 07:27:45', NULL),
(31, 'CARRIBEAN', 'N', 'N', 'app_data/master_data/cuisines/carribean.jpg', '2018-03-06 07:27:45', NULL),
(32, 'CHINESE', 'N', 'N', 'app_data/master_data/cuisines/chinese.jpg', '2018-03-06 07:27:45', NULL),
(33, 'CUBAN', 'N', 'N', 'app_data/master_data/cuisines/cuban.jpg', '2018-03-06 07:27:45', NULL),
(34, 'ETHIOPIAN', 'N', 'N', 'app_data/master_data/cuisines/ethiopian.jpg', '2018-03-06 07:27:46', NULL),
(35, 'EUROPEAN', 'N', 'N', 'app_data/master_data/cuisines/european.jpg', '2018-03-06 07:27:46', NULL),
(36, 'FAST FOOD', 'N', 'N', 'app_data/master_data/cuisines/fastfood.jpg', '2018-03-06 07:27:46', NULL),
(37, 'FILIPINO', 'N', 'N', 'app_data/master_data/cuisines/filipino.jpg', '2018-03-06 07:27:46', NULL),
(38, 'FRENCH', 'N', 'N', 'app_data/master_data/cuisines/french.jpg', '2018-03-06 07:27:46', NULL),
(39, 'FUSION', 'N', 'N', 'app_data/master_data/cuisines/fusion.jpg', '2018-03-06 07:27:46', NULL),
(40, 'GERMAN', 'N', 'N', 'app_data/master_data/cuisines/german.jpg', '2018-03-06 07:27:46', NULL),
(41, 'GLOBAL', 'N', 'N', 'app_data/master_data/cuisines/global.jpg', '2018-03-06 07:27:46', NULL),
(42, 'GREEK', 'N', 'N', 'app_data/master_data/cuisines/greek.jpg', '2018-03-06 07:27:46', NULL),
(43, 'HAUTE', 'N', 'N', 'app_data/master_data/cuisines/haute.jpg', '2018-03-06 07:27:46', NULL),
(44, 'ICE CREAM', 'N', 'N', 'app_data/master_data/cuisines/icecream.jpg', '2018-03-06 07:27:46', NULL),
(45, 'INDONESIAN', 'N', 'N', 'app_data/master_data/cuisines/indonesian.jpg', '2018-03-06 07:27:46', NULL),
(46, 'IRANIAN', 'N', 'N', 'app_data/master_data/cuisines/iranian.jpg', '2018-03-06 07:27:47', NULL),
(47, 'IRISH', 'N', 'N', 'app_data/master_data/cuisines/irish.jpg', '2018-03-06 07:27:47', NULL),
(48, 'ITALIAN', 'N', 'N', 'app_data/master_data/cuisines/italian.jpg', '2018-03-06 07:27:47', NULL),
(49, 'JAPANESE', 'N', 'N', 'app_data/master_data/cuisines/japanese.jpg', '2018-03-06 07:27:47', NULL),
(50, 'KOREAN', 'N', 'N', 'app_data/master_data/cuisines/korean.jpg', '2018-03-06 07:27:47', NULL),
(51, 'LEBANESE', 'N', 'N', 'app_data/master_data/cuisines/lebanese.jpg', '2018-03-06 07:27:47', NULL),
(52, 'MALAYSIAN', 'N', 'N', 'app_data/master_data/cuisines/malaysian.jpg', '2018-03-06 07:27:47', NULL),
(53, 'MEDITERRANEAN', 'N', 'N', 'app_data/master_data/cuisines/mediterranean.jpg', '2018-03-06 07:27:47', NULL),
(54, 'MEXICAN', 'N', 'N', 'app_data/master_data/cuisines/mexican.jpg', '2018-03-06 07:27:47', NULL),
(55, 'MIDDLE EASTERN', 'N', 'N', 'app_data/master_data/cuisines/middleeastern.jpg', '2018-03-06 07:27:47', NULL),
(56, 'MOROCCAN', 'N', 'N', 'app_data/master_data/cuisines/moroccan.jpg', '2018-03-06 07:27:47', NULL),
(57, 'PAKISTANI', 'N', 'N', 'app_data/master_data/cuisines/pakistani.jpg', '2018-03-06 07:27:47', NULL),
(58, 'PERUVIAN', 'N', 'N', 'app_data/master_data/cuisines/peruvian.jpg', '2018-03-06 07:27:47', NULL),
(59, 'POLISH', 'N', 'N', 'app_data/master_data/cuisines/polish.jpg', '2018-03-06 07:27:48', NULL),
(60, 'PORTUGESE', 'N', 'N', 'app_data/master_data/cuisines/portugese.jpg', '2018-03-06 07:27:48', NULL),
(61, 'RUSSIAN', 'N', 'N', 'app_data/master_data/cuisines/russian.jpg', '2018-03-06 07:27:48', NULL),
(62, 'SICHUAN', 'N', 'N', 'app_data/master_data/cuisines/sichuan.jpg', '2018-03-06 07:27:48', NULL),
(63, 'SOUTH INDIAN', 'N', 'N', 'app_data/master_data/cuisines/southindian.jpg', '2018-03-06 07:27:48', NULL),
(64, 'SPANISH', 'N', 'N', 'app_data/master_data/cuisines/spanish.jpg', '2018-03-06 07:27:48', NULL),
(65, 'STREET FOOD', 'N', 'N', 'app_data/master_data/cuisines/streetfood.jpg', '2018-03-06 07:27:48', NULL),
(66, 'TAIWANESE', 'N', 'N', 'app_data/master_data/cuisines/taiwanese.jpg', '2018-03-06 07:27:48', NULL),
(67, 'THAI', 'N', 'N', 'app_data/master_data/cuisines/thai.jpg', '2018-03-06 07:27:48', NULL),
(68, 'TURKISH', 'N', 'N', 'app_data/master_data/cuisines/turkish.jpg', '2018-03-06 07:27:48', NULL),
(69, 'VIETNAMESE', 'N', 'N', 'app_data/master_data/cuisines/vietnamese.jpg', '2018-03-06 07:27:48', NULL),
(70, 'SCOTISH', 'N', 'N', 'app_data/master_data/cuisines/indian.jpg', '2018-04-14 05:52:30', '2018-04-14 05:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `FOOD_TYPE`
--

CREATE TABLE `FOOD_TYPE` (
  `FOOD_TYP_ID` int(11) NOT NULL,
  `FOOD_TYP_NAME` varchar(25) NOT NULL,
  `IS_DEF` varchar(1) NOT NULL DEFAULT 'N',
  `IS_DEL` varchar(1) NOT NULL,
  `IMG` varchar(50) NOT NULL DEFAULT 'images/cake.jpg',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FOOD_TYPE`
--

INSERT INTO `FOOD_TYPE` (`FOOD_TYP_ID`, `FOOD_TYP_NAME`, `IS_DEF`, `IS_DEL`, `IMG`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'BREAKFAST', 'N', 'N', 'app_data/master_data/food_type/breakfast.jpg', '2017-08-27 00:00:00', '2018-04-21 13:05:30'),
(2, 'LUNCH', 'N', 'N', 'app_data/master_data/food_type/lunch.jpg', '2017-08-27 00:00:00', '2018-04-21 13:43:34'),
(3, 'DINNER', 'Y', 'N', 'app_data/master_data/food_type/dinner.jpg', '2017-08-27 00:00:00', NULL),
(4, 'SNACKS', 'N', 'N', 'app_data/master_data/food_type/snacks.jpg', '2017-08-27 00:00:00', NULL),
(5, 'DESSERT', 'N', 'N', 'app_data/master_data/food_type/dessert.jpg', '2017-08-27 00:00:00', '2018-04-21 13:43:24'),
(6, 'SOUP', 'N', 'N', 'app_data/master_data/food_type/soup.jpg', '2017-08-27 00:00:00', '2018-04-21 12:53:49'),
(7, 'DRINKS', 'N', 'N', 'app_data/master_data/food_type/drinks.jpg', '2017-08-27 00:00:00', '2018-04-21 12:53:49'),
(8, 'OTHERS', 'N', 'N', 'app_data/master_data/food_type/others.jpg', '2017-08-27 00:00:00', '2018-04-21 13:17:00'),
(9, 'MOCKTAILS', 'N', 'N', 'app_data/master_data/food_type/breakfast.jpg', '2018-04-14 05:53:38', '2018-04-21 13:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `INGREDIENT`
--

CREATE TABLE `INGREDIENT` (
  `ING_ID` int(11) NOT NULL,
  `ING_CAT_ID` int(11) NOT NULL DEFAULT '1',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `INGREDIENT`
--

INSERT INTO `INGREDIENT` (`ING_ID`, `ING_CAT_ID`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, '2017-09-08 00:00:00', NULL),
(2, 1, '2017-09-08 00:00:00', NULL),
(3, 1, '2017-09-08 00:00:00', NULL),
(4, 1, '2017-09-08 00:00:00', NULL),
(7, 1, '2017-12-30 14:36:23', NULL),
(8, 1, '2017-12-30 14:36:23', NULL),
(9, 1, '2017-12-30 14:38:48', NULL),
(11, 1, '2017-12-30 15:09:31', NULL),
(12, 1, '2017-12-30 15:11:48', NULL),
(13, 1, '2017-12-30 23:23:32', NULL),
(14, 1, '2018-01-12 22:02:29', NULL),
(15, 1, '2018-01-12 23:25:37', NULL),
(16, 1, '2018-01-12 23:25:37', NULL),
(18, 1, '2018-01-12 23:30:52', NULL),
(19, 1, '2018-01-14 00:23:12', NULL),
(20, 1, '2018-03-06 00:00:00', NULL),
(23, 1, '2018-03-06 00:00:00', NULL),
(24, 1, '2018-03-18 08:50:56', NULL),
(25, 1, '2018-03-18 00:00:00', NULL),
(26, 1, '2018-03-18 00:00:00', NULL),
(27, 1, '2018-03-18 00:00:00', NULL),
(28, 1, '2018-03-18 00:00:00', NULL),
(29, 1, '2018-03-18 00:00:00', NULL),
(99, 1, '2018-03-28 17:32:26', NULL),
(101, 1, '2018-04-14 05:18:41', '2018-04-14 05:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `ING_AKA`
--

CREATE TABLE `ING_AKA` (
  `ING_AKA_ID` int(11) NOT NULL,
  `ING_ID` int(11) NOT NULL DEFAULT '99',
  `ING_AKA_NAME` varchar(25) NOT NULL,
  `IS_REG` varchar(1) NOT NULL DEFAULT 'N',
  `IS_DEL` varchar(1) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ING_AKA`
--

INSERT INTO `ING_AKA` (`ING_AKA_ID`, `ING_ID`, `ING_AKA_NAME`, `IS_REG`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 'GINGER', 'Y', 'N', '2017-09-08 00:00:00', NULL),
(2, 2, 'TURMERIC', 'Y', 'N', '2017-09-08 00:00:00', NULL),
(3, 3, 'SALT', 'Y', 'N', '2017-09-08 00:00:00', NULL),
(4, 4, 'ONION', 'Y', 'N', '2017-09-08 00:00:00', NULL),
(7, 7, 'CORN FLOUR', 'Y', 'N', '2017-12-30 14:36:23', NULL),
(8, 8, 'GARLIC', 'Y', 'N', '2017-12-30 14:36:23', NULL),
(9, 9, 'TOFU', 'Y', 'N', '2017-12-30 14:38:48', NULL),
(11, 11, 'BUTTER', 'Y', 'N', '2017-12-30 15:09:31', NULL),
(12, 12, 'PANEER', 'Y', 'N', '2017-12-30 15:11:48', NULL),
(13, 13, 'CHEESE', 'Y', 'N', '2017-12-30 23:23:32', NULL),
(14, 14, 'EGG', 'Y', 'N', '2018-01-12 22:02:29', NULL),
(15, 15, 'GARAM MASALA', 'Y', 'N', '2018-01-12 23:25:37', NULL),
(16, 16, 'BLACK SALT', 'Y', 'N', '2018-01-12 23:25:37', NULL),
(18, 18, 'PUDINA', 'Y', 'N', '2018-01-12 23:30:52', NULL),
(19, 19, 'MILK', 'Y', 'N', '2018-01-14 00:23:12', NULL),
(20, 20, 'PEPPER', 'Y', 'N', '2018-03-06 00:00:00', NULL),
(23, 23, 'TOMATO', 'Y', 'N', '2018-03-06 00:00:00', NULL),
(24, 24, 'BHINDI', 'Y', 'N', '2018-03-18 08:50:56', NULL),
(25, 25, 'MUSTARD SEEDS', 'Y', 'N', '2018-03-18 00:00:00', NULL),
(26, 26, 'POSTO SEEDS', 'Y', 'N', '2018-03-18 00:00:00', NULL),
(27, 27, 'HALDI', 'Y', 'N', '2018-03-18 00:00:00', NULL),
(28, 28, 'GREEN CHILLLY', 'Y', 'N', '2018-03-18 00:00:00', NULL),
(29, 29, 'CORIANDER', 'Y', 'N', '2018-03-18 00:00:00', NULL),
(31, 101, 'DALIA', 'Y', 'N', '2018-04-14 05:18:41', '2018-04-14 05:18:41'),
(32, 99, 'MALAI', 'N', 'N', '2018-04-16 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ING_CATEGORIES`
--

CREATE TABLE `ING_CATEGORIES` (
  `ING_CAT_ID` int(11) NOT NULL,
  `ING_CAT_NAME` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` timestamp NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ING_CATEGORIES`
--

INSERT INTO `ING_CATEGORIES` (`ING_CAT_ID`, `ING_CAT_NAME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'OTHERS', '2018-04-15 22:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ING_IMAGES`
--

CREATE TABLE `ING_IMAGES` (
  `ING_IMG_ID` int(11) NOT NULL,
  `ING_ID` int(11) NOT NULL,
  `ING_IMG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DEF` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `CREATE_DTM` timestamp NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ING_IMAGES`
--

INSERT INTO `ING_IMAGES` (`ING_IMG_ID`, `ING_ID`, `ING_IMG`, `IS_DEF`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 'app_data/master_data/ingredients/ginger.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(2, 2, 'app_data/master_data/ingredients/turmeric.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(3, 3, 'app_data/master_data/ingredients/salt.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(4, 4, 'app_data/master_data/ingredients/onion.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(5, 7, 'app_data/master_data/ingredients/cornflour.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(6, 8, 'app_data/master_data/ingredients/garlic.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(7, 9, 'app_data/master_data/ingredients/tofu.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(8, 11, 'app_data/master_data/ingredients/butter.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(9, 12, 'app_data/master_data/ingredients/paneer.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(10, 13, 'app_data/master_data/ingredients/cheese.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(11, 14, 'app_data/master_data/ingredients/eggs.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(12, 15, 'app_data/master_data/ingredients/garammasala.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(13, 16, 'app_data/master_data/ingredients/blacksalt.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(14, 18, 'app_data/master_data/ingredients/pudina.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(15, 19, 'app_data/master_data/ingredients/milk.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(16, 20, 'app_data/master_data/ingredients/pepper.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(17, 23, 'app_data/master_data/ingredients/tomato.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(18, 24, 'app_data/master_data/ingredients/bhindi.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(19, 25, 'app_data/master_data/ingredients/mustard_seeds.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(20, 26, 'app_data/master_data/ingredients/posto_seeds.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(21, 27, 'app_data/master_data/ingredients/turmeric.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(22, 28, 'app_data/master_data/ingredients/green_chilly.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(23, 29, 'app_data/master_data/ingredients/coriander.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(24, 101, 'app_data/master_data/ingredients/ginger.jpg', 'Y', '2018-04-16 06:37:19', NULL),
(25, 99, 'app_data/master_data/ingredients/vegetable.jpg', 'N', '2018-04-15 22:00:00', NULL);

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
(1, 1, 'RECIPE', 103, 'N', '2017-10-15 11:19:18', '2018-03-20 19:24:44'),
(2, 2, 'RECIPE', 103, 'N', '2017-10-15 12:49:50', '2017-11-07 12:00:57'),
(3, 3, 'RECIPE', 103, 'N', '2017-11-07 15:14:53', NULL),
(4, 4, 'RECIPE', 103, 'N', '2017-12-06 18:15:07', '2017-12-15 15:02:26'),
(5, 1, 'COMMENT', 1, 'N', '2017-12-06 18:18:04', '2017-12-18 15:51:20'),
(6, 1, 'REVIEW', 9, 'Y', '2017-12-06 18:19:18', '2018-03-26 17:01:46'),
(8, 1, 'COMMENT', 9, 'Y', '2017-12-18 15:53:32', '2018-03-26 17:01:42'),
(9, 1, 'REVIEW', 10, 'N', '2017-12-22 14:30:53', '2017-12-22 20:05:42'),
(10, 1, 'REVIEW', 11, 'N', '2017-12-22 14:47:53', '2018-02-09 20:43:07'),
(11, 1, 'COMMENT', 48, 'N', '2017-12-22 15:31:35', NULL),
(12, 1, 'COMMENT', 51, 'N', '2017-12-22 15:31:53', NULL),
(13, 1, 'COMMENT', 58, 'N', '2017-12-22 17:45:47', NULL),
(14, 1, 'COMMENT', 50, 'N', '2017-12-22 17:51:32', NULL),
(15, 1, 'COMMENT', 53, 'Y', '2017-12-22 20:17:26', '2018-03-01 22:10:12'),
(16, 1, 'COMMENT', 55, 'N', '2017-12-22 20:17:30', '2018-03-01 22:10:28'),
(17, 1, 'RECIPE', 66, 'Y', '2018-01-12 20:41:14', '2018-02-03 20:41:16'),
(18, 1, 'COMMENT', 54, 'Y', '2018-01-16 00:56:05', '2018-03-01 22:10:11'),
(19, 1, 'COMMENT', 52, 'N', '2018-03-01 22:10:13', NULL),
(21, 1, 'RECIPE_IMG', 1, 'N', '2018-03-13 13:24:57', NULL),
(22, 1, 'RECIPE_IMG', 96, 'Y', '2018-03-13 13:27:35', '2018-03-26 17:01:33'),
(23, 1, 'USER', 1, 'Y', '2018-03-13 18:01:10', '2018-04-23 20:34:52'),
(24, 1, 'USER', 2, 'N', '2018-03-13 18:03:36', NULL),
(25, 1, 'USER', 3, 'N', '2018-03-13 18:07:08', NULL),
(26, 1, 'USER', 4, 'N', '2018-03-13 18:10:16', '2018-04-15 11:09:28'),
(27, 1, 'RECIPE_IMG', 94, 'Y', '2018-03-17 10:15:31', '2018-03-17 11:50:08'),
(28, 1, 'RECIPE_IMG', 95, 'N', '2018-03-17 10:56:37', '2018-03-17 11:49:51'),
(29, 1, 'RECIPE', 3, 'Y', '2018-03-17 11:14:54', '2018-03-17 11:17:53'),
(30, 1, 'RECIPE_IMG', 100, 'N', '2018-03-19 19:36:17', '2018-04-16 18:21:03'),
(31, 1, 'RECIPE_IMG', 102, 'Y', '2018-03-19 19:36:47', '2018-04-15 08:50:59'),
(32, 1, 'RECIPE_IMG', 97, 'Y', '2018-03-20 18:58:30', '2018-03-20 19:24:55'),
(33, 1, 'RECIPE', 105, 'N', '2018-03-23 19:00:11', '2018-03-26 17:01:28'),
(34, 2, 'RECIPE', 105, 'N', '2018-03-26 19:05:54', NULL),
(35, 3, 'RECIPE', 105, 'N', '2018-03-26 19:06:00', NULL),
(36, 4, 'RECIPE', 105, 'N', '2018-03-26 19:06:07', NULL),
(37, 1, 'COMMENT', 95, 'N', '2018-04-14 22:31:00', '2018-04-14 23:55:10'),
(38, 1, 'COMMENT', 96, 'N', '2018-04-14 22:56:33', '2018-04-15 09:02:23'),
(39, 1, 'COMMENT', 120, 'N', '2018-04-14 23:41:05', NULL),
(40, 1, 'RECIPE_IMG', 103, 'N', '2018-04-15 00:07:19', NULL),
(41, 1, 'RECIPE_IMG', 104, 'N', '2018-04-15 08:51:18', NULL),
(42, 1, 'REVIEW', 15, 'N', '2018-04-15 09:56:24', '2018-04-15 10:21:49'),
(43, 1, 'COMMENT', 115, 'N', '2018-04-16 18:21:20', NULL),
(44, 1, 'COMMENT', 147, 'N', '2018-04-16 20:17:40', NULL),
(45, 1, 'COMMENT', 164, 'N', '2018-04-16 21:28:00', NULL),
(46, 1, 'COMMENT', 92, 'N', '2018-04-16 21:38:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MILESTONE`
--

CREATE TABLE `MILESTONE` (
  `MLT_ID` int(11) NOT NULL,
  `RANK_ID` int(11) NOT NULL,
  `TYPE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, 'GLASS', '', '2017-09-09 00:00:00', NULL),
(6, 'KILO GRAMS', 'N', '2018-03-18 00:00:00', NULL),
(7, 'GRAMS', 'N', '2018-03-18 00:00:00', NULL),
(10, 'LITRES', 'N', '2018-03-18 00:00:00', NULL),
(11, 'MILLI LITRES', 'N', '2018-03-18 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `RANK`
--

CREATE TABLE `RANK` (
  `RANK_ID` int(11) NOT NULL,
  `RANK_NAME` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RANK_RULE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `RCP_NAME` varchar(50) NOT NULL,
  `FOOD_TYP_ID` int(11) NOT NULL,
  `FOOD_CSN_ID` int(11) NOT NULL,
  `IS_DEL` varchar(1) NOT NULL DEFAULT 'N',
  `USER_ID` int(11) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RECIPE`
--

INSERT INTO `RECIPE` (`RCP_ID`, `RCP_NAME`, `FOOD_TYP_ID`, `FOOD_CSN_ID`, `IS_DEL`, `USER_ID`, `CREATE_DTM`, `MOD_DTM`) VALUES
(3, 'Updated Recipe Name', 1, 1, 'N', 1, '2017-09-15 14:04:57', '2018-04-04 13:58:48'),
(4, 'test recipe', 3, 1, 'N', 1, '2017-12-03 11:23:26', NULL),
(76, 'bhindi masala 1', 3, 1, 'N', 1, '2017-12-03 11:17:31', NULL),
(77, 'bhindi masala 2', 3, 1, 'N', 1, '2017-12-03 11:17:42', NULL),
(79, 'abcd 1', 3, 1, 'N', 1, '2017-12-03 11:31:16', NULL),
(80, 'abcd 2', 3, 1, 'Y', 1, '2017-12-03 11:34:45', NULL),
(81, 'act', 3, 1, 'Y', 1, '2017-12-03 11:36:13', NULL),
(87, 'TEST_RECIPE_NAME 1', 1, 1, 'N', 1, '2017-12-06 15:15:43', NULL),
(88, 'TEST_RECIPE_NAME 2', 1, 1, 'N', 1, '2017-12-06 15:16:58', NULL),
(89, 'TEST_RECIPE_NAME 3', 1, 1, 'Y', 1, '2017-12-06 15:17:53', NULL),
(90, 'TEST_RECIPE_NAME 4', 1, 1, 'N', 1, '2017-12-06 15:20:48', NULL),
(91, 'TEST_RECIPE_NAME 5', 1, 1, 'N', 1, '2017-12-06 15:23:47', NULL),
(103, 'TEST_RECIPE_NAME 6', 1, 1, 'N', 1, '2017-12-08 06:28:24', '2017-12-19 19:45:19'),
(104, 'TEST_RECIPE_NAME - 65', 1, 1, 'N', 1, '2018-03-18 10:04:17', NULL),
(105, 'Bhindi in Sarson and Posto Sauce', 2, 1, 'N', 1, '2018-03-18 11:14:26', NULL),
(106, 'TEST_RECIPE_NAME - 25', 1, 1, 'N', 1, '2018-03-24 17:55:56', NULL),
(110, 'TEST_RECIPE_NAME - 84', 1, 1, 'N', 1, '2018-03-24 18:01:14', NULL),
(111, 'TEST_RECIPE_NAME - 27', 1, 1, 'N', 1, '2018-03-24 18:01:42', NULL),
(112, 'TEST_RECIPE_NAME - 98', 1, 1, 'N', 1, '2018-03-24 18:06:09', NULL),
(113, 'TEST_RECIPE_NAME - 15', 1, 1, 'N', 1, '2018-03-24 18:12:13', NULL),
(114, 'TEST_RECIPE_NAME - 28', 1, 1, 'N', 1, '2018-03-24 18:17:49', NULL),
(115, 'TEST_RECIPE_NAME - 82', 1, 1, 'N', 1, '2018-03-24 18:18:15', NULL),
(116, 'Masala puri', 4, 1, 'N', 100, '2018-03-27 23:46:31', NULL),
(117, 'TEST_RECIPE_NAME - 40', 1, 1, 'N', 1, '2018-03-28 18:08:30', NULL),
(118, 'TEST_RECIPE_NAME - 02', 1, 1, 'N', 1, '2018-03-28 18:10:43', NULL),
(119, 'TEST_RECIPE_NAME - 17', 1, 1, 'N', 1, '2018-03-28 18:11:58', NULL),
(121, 'TEST_RECIPE_NAME - 01', 1, 1, 'N', 1, '2018-04-05 08:02:32', NULL),
(122, 'TEST_RECIPE_NAME - 07', 1, 1, 'N', 1, '2018-04-05 08:04:03', NULL),
(123, 'TEST_RECIPE_NAME - 17', 1, 1, 'N', 1, '2018-04-05 08:07:53', NULL),
(124, 'TEST_RECIPE_NAME - 42', 1, 1, 'N', 1, '2018-04-05 08:09:30', NULL),
(125, 'TEST_RECIPE_NAME - 78', 1, 1, 'N', 1, '2018-04-05 08:10:48', NULL),
(126, 'TEST_RECIPE_NAME - 11', 1, 1, 'N', 1, '2018-04-05 08:15:22', NULL),
(127, 'TEST_RECIPE_NAME - 99', 1, 1, 'N', 1, '2018-04-05 08:21:15', NULL),
(128, 'TEST_RECIPE_NAME - 60', 1, 1, 'N', 1, '2018-04-05 08:23:45', NULL),
(129, 'TEST_RECIPE_NAME - 48', 1, 1, 'N', 1, '2018-04-22 19:34:00', NULL),
(130, 'TEST_RECIPE_NAME - 27', 1, 1, 'N', 1, '2018-04-22 19:56:49', NULL),
(131, 'TEST_RECIPE_NAME - 69', 1, 1, 'N', 1, '2018-04-22 20:03:10', NULL),
(135, 'TEST_RECIPE_NAME - 45', 1, 1, 'N', 1, '2018-04-22 20:41:37', NULL),
(147, 'My Grandma\'s Loki Halwa', 3, 1, 'N', 1, '2018-04-23 20:37:13', NULL);

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
(96, 103, 'app_data/users/1/recipes/103/images/5a395e41862d8.jpg', '2017-12-19 19:45:21', NULL),
(97, 103, 'app_data/users/1/recipes/103/images/5a2a22f92838d.jpg', '2017-12-19 19:45:21', NULL),
(98, 104, 'app_data/users/1/recipes/104/images/5aae2b9248dfc.jpg', '2018-03-18 10:04:18', NULL),
(99, 104, 'app_data/users/1/recipes/104/images/5aae2b926ffa1.jpg', '2018-03-18 10:04:18', NULL),
(100, 105, 'app_data/users/1/recipes/105/images/5aae3c05cb800.jpg', '2018-03-18 11:14:29', NULL),
(102, 105, 'app_data/users/1/recipes/105/images/5aae3c06257ec.jpg', '2018-03-18 11:14:30', NULL),
(103, 105, 'app_data/users/1/recipes/105/images/5aae3c064c9b5.jpg', '2018-03-18 11:14:30', NULL),
(104, 105, 'app_data/users/1/recipes/105/images/5aae3c06739cd.jpg', '2018-03-18 11:14:30', NULL),
(105, 106, 'app_data/users/1/recipes/106/images/5ab6831cecb16.jpg', '2018-03-24 17:55:57', NULL),
(106, 106, 'app_data/users/1/recipes/106/images/5ab6831d169bd.jpg', '2018-03-24 17:55:57', NULL),
(113, 110, 'app_data/users/1/recipes/110/images/5ab6845bc1b9e.jpg', '2018-03-24 18:01:15', NULL),
(114, 110, 'app_data/users/1/recipes/110/images/5ab6845bdfc28.jpg', '2018-03-24 18:01:15', NULL),
(115, 111, 'app_data/users/1/recipes/111/images/5ab684774b890.jpg', '2018-03-24 18:01:43', NULL),
(116, 111, 'app_data/users/1/recipes/111/images/5ab68477698c5.jpg', '2018-03-24 18:01:43', NULL),
(117, 112, 'app_data/users/1/recipes/112/images/5ab685823b052.jpg', '2018-03-24 18:06:10', NULL),
(118, 112, 'app_data/users/1/recipes/112/images/5ab685825902c.jpg', '2018-03-24 18:06:10', NULL),
(119, 113, 'app_data/users/1/recipes/113/images/5ab686eead1cb.jpg', '2018-03-24 18:12:14', NULL),
(120, 113, 'app_data/users/1/recipes/113/images/5ab686eecb128.jpg', '2018-03-24 18:12:14', NULL),
(121, 114, 'app_data/users/1/recipes/114/images/5ab6883e2068a.jpg', '2018-03-24 18:17:50', NULL),
(122, 114, 'app_data/users/1/recipes/114/images/5ab6883e3e66a.jpg', '2018-03-24 18:17:50', NULL),
(123, 115, 'app_data/users/1/recipes/115/images/5ab6885864d06.jpg', '2018-03-24 18:18:16', NULL),
(124, 115, 'app_data/users/1/recipes/115/images/5ab6885882d32.jpg', '2018-03-24 18:18:16', NULL),
(125, 116, 'app_data/users/100/recipes/116/images/5ababbb8684fb.jpg', '2018-03-27 23:46:32', NULL),
(126, 117, 'app_data/users/1/recipes/117/images/5abbbdffdc007.jpg', '2018-03-28 18:08:31', NULL),
(127, 117, 'app_data/users/1/recipes/117/images/5abbbe0007e6e.jpg', '2018-03-28 18:08:32', NULL),
(128, 118, 'app_data/users/1/recipes/118/images/5abbbe841e2e3.jpg', '2018-03-28 18:10:44', NULL),
(129, 118, 'app_data/users/1/recipes/118/images/5abbbe843c625.jpg', '2018-03-28 18:10:44', NULL),
(130, 119, 'app_data/users/1/recipes/119/images/5abbbecfa6caf.jpg', '2018-03-28 18:11:59', NULL),
(131, 119, 'app_data/users/1/recipes/119/images/5abbbecfc4ff1.jpg', '2018-03-28 18:11:59', NULL),
(135, 3, 'app_data/users/1/recipes/3/images/5ac4bdfa478cb.jpg', '2018-04-04 13:58:50', NULL),
(136, 121, 'app_data/users/1/recipes/121/images/5ac5bbf99213a.jpg', '2018-04-05 08:02:33', NULL),
(137, 121, 'app_data/users/1/recipes/121/images/5ac5bbf9b0473.jpg', '2018-04-05 08:02:33', NULL),
(138, 122, 'app_data/users/1/recipes/122/images/5ac5bc5498fc4.jpg', '2018-04-05 08:04:04', NULL),
(139, 122, 'app_data/users/1/recipes/122/images/5ac5bc54b703f.jpg', '2018-04-05 08:04:04', NULL),
(140, 123, 'app_data/users/1/recipes/123/images/5ac5bd3a0d6d6.jpg', '2018-04-05 08:07:54', NULL),
(141, 123, 'app_data/users/1/recipes/123/images/5ac5bd3a2b790.jpg', '2018-04-05 08:07:54', NULL),
(142, 124, 'app_data/users/1/recipes/124/images/5ac5bd9b77e66.jpg', '2018-04-05 08:09:31', NULL),
(143, 124, 'app_data/users/1/recipes/124/images/5ac5bd9b95e5a.jpg', '2018-04-05 08:09:31', NULL),
(144, 125, 'app_data/users/1/recipes/125/images/5ac5bde964980.jpg', '2018-04-05 08:10:49', NULL),
(145, 125, 'app_data/users/1/recipes/125/images/5ac5bde982928.jpg', '2018-04-05 08:10:49', NULL),
(146, 126, 'app_data/users/1/recipes/126/images/5ac5befb5d8a7.jpg', '2018-04-05 08:15:23', NULL),
(147, 126, 'app_data/users/1/recipes/126/images/5ac5befb7b6f5.jpg', '2018-04-05 08:15:23', NULL),
(148, 127, 'app_data/users/1/recipes/127/images/5ac5c05cbf186.jpg', '2018-04-05 08:21:16', NULL),
(149, 127, 'app_data/users/1/recipes/127/images/5ac5c05cdd08b.jpg', '2018-04-05 08:21:16', NULL),
(150, 128, 'app_data/users/1/recipes/128/images/5ac5c0f239dc5.jpg', '2018-04-05 08:23:46', NULL),
(151, 128, 'app_data/users/1/recipes/128/images/5ac5c0f257d30.jpg', '2018-04-05 08:23:46', NULL),
(152, 129, 'app_data/users/1/recipes/129/images/5adcc789e2222.jpg', '2018-04-22 19:34:02', NULL),
(153, 129, 'app_data/users/1/recipes/129/images/5adcc78a186bd.jpg', '2018-04-22 19:34:02', NULL),
(154, 130, 'app_data/users/1/recipes/130/images/5adccce25f7bb.jpg', '2018-04-22 19:56:50', NULL),
(155, 130, 'app_data/users/1/recipes/130/images/5adccce286b7f.jpg', '2018-04-22 19:56:50', NULL),
(156, 131, 'app_data/users/1/recipes/131/images/5adcce5f3857a.jpg', '2018-04-22 20:03:11', NULL),
(157, 131, 'app_data/users/1/recipes/131/images/5adcce5f5f8b6.jpg', '2018-04-22 20:03:11', NULL),
(161, 135, 'app_data/users/1/recipes/135/images/5adcd7626b10a.jpg', '2018-04-22 20:41:38', NULL),
(162, 135, 'app_data/users/1/recipes/135/images/5adcd76292340.jpg', '2018-04-22 20:41:38', NULL),
(174, 147, 'app_data/users/1/recipes/147/images/5ade27daf2ca7.jpg', '2018-04-23 20:37:15', NULL),
(175, 147, 'app_data/users/1/recipes/147/images/5ade27db26dc7.jpg', '2018-04-23 20:37:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `RECIPE_STEPS`
--

CREATE TABLE `RECIPE_STEPS` (
  `RCP_STPS_ID` int(15) NOT NULL,
  `RCP_ID` int(15) NOT NULL,
  `RCP_STEP` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(8, 4, 'step 1', '2017-12-03 11:23:26', NULL),
(9, 4, 'step 2', '2017-12-03 11:23:26', NULL),
(10, 4, 'step 3', '2017-12-03 11:23:26', NULL),
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
(78, 103, 'This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. ', '2017-12-19 19:45:20', NULL),
(79, 103, 'This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. \n', '2017-12-19 19:45:20', NULL),
(80, 103, 'This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. ', '2017-12-19 19:45:20', NULL),
(81, 104, 'TEST STEP !', '2018-03-18 10:04:17', NULL),
(82, 104, 'TEST STEP 2', '2018-03-18 10:04:17', NULL),
(83, 105, 'First wash the bhindi and cut into small pieces.', '2018-03-18 11:14:28', NULL),
(84, 105, 'Make a paste of the mustard and posto seeds and keep aside for a few minutes.', '2018-03-18 11:14:28', NULL),
(85, 105, 'Heat the oil in a pan. Add the green chillies and the bhindi and let it cook for a few minutes.', '2018-03-18 11:14:28', NULL),
(86, 105, 'Then add the haldi and salt.', '2018-03-18 11:14:28', NULL),
(87, 105, 'Add the paste and a bit of water and cover the pan for 10 minutes.', '2018-03-18 11:14:28', NULL),
(88, 105, 'Check to see if the bhindi is soft and then remove from the gas.', '2018-03-18 11:14:28', NULL),
(89, 105, 'Garnish with coriander. Sprinkle some pepper.', '2018-03-18 11:14:29', NULL),
(90, 105, 'Serve it hot & enjoy your meal !', '2018-03-18 11:14:29', NULL),
(91, 106, 'TEST STEP !', '2018-03-24 17:55:56', NULL),
(92, 106, 'TEST STEP 2', '2018-03-24 17:55:56', NULL),
(99, 110, 'TEST STEP !', '2018-03-24 18:01:15', NULL),
(100, 110, 'TEST STEP 2', '2018-03-24 18:01:15', NULL),
(101, 111, 'TEST STEP !', '2018-03-24 18:01:42', NULL),
(102, 111, 'TEST STEP 2', '2018-03-24 18:01:42', NULL),
(103, 112, 'TEST STEP !', '2018-03-24 18:06:09', NULL),
(104, 112, 'TEST STEP 2', '2018-03-24 18:06:09', NULL),
(105, 113, 'TEST STEP !', '2018-03-24 18:12:14', NULL),
(106, 113, 'TEST STEP 2', '2018-03-24 18:12:14', NULL),
(107, 114, 'TEST STEP !', '2018-03-24 18:17:49', NULL),
(108, 114, 'TEST STEP 2', '2018-03-24 18:17:49', NULL),
(109, 115, 'TEST STEP !', '2018-03-24 18:18:15', NULL),
(110, 115, 'TEST STEP 2', '2018-03-24 18:18:15', NULL),
(111, 116, 'Fill sev and many other masala in golgappa', '2018-03-27 23:46:31', NULL),
(112, 117, 'TEST STEP !', '2018-03-28 18:08:31', NULL),
(113, 117, 'TEST STEP 2', '2018-03-28 18:08:31', NULL),
(114, 118, 'TEST STEP !', '2018-03-28 18:10:43', NULL),
(115, 118, 'TEST STEP 2', '2018-03-28 18:10:43', NULL),
(116, 119, 'TEST STEP !', '2018-03-28 18:11:59', NULL),
(117, 119, 'TEST STEP 2', '2018-03-28 18:11:59', NULL),
(124, 3, 'This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. ', '2018-04-04 13:58:49', NULL),
(125, 3, 'This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. \r\n', '2018-04-04 13:58:49', NULL),
(126, 3, 'This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. ', '2018-04-04 13:58:49', NULL),
(127, 121, 'TEST STEP !', '2018-04-05 08:02:33', NULL),
(128, 121, 'TEST STEP 2', '2018-04-05 08:02:33', NULL),
(129, 122, 'TEST STEP !', '2018-04-05 08:04:04', NULL),
(130, 122, 'TEST STEP 2', '2018-04-05 08:04:04', NULL),
(131, 123, 'TEST STEP !', '2018-04-05 08:07:53', NULL),
(132, 123, 'TEST STEP 2', '2018-04-05 08:07:53', NULL),
(133, 124, 'TEST STEP !', '2018-04-05 08:09:30', NULL),
(134, 124, 'TEST STEP 2', '2018-04-05 08:09:31', NULL),
(135, 125, 'TEST STEP !', '2018-04-05 08:10:48', NULL),
(136, 125, 'TEST STEP 2', '2018-04-05 08:10:48', NULL),
(137, 126, 'TEST STEP !', '2018-04-05 08:15:22', NULL),
(138, 126, 'TEST STEP 2', '2018-04-05 08:15:22', NULL),
(139, 127, 'TEST STEP !', '2018-04-05 08:21:16', NULL),
(140, 127, 'TEST STEP 2', '2018-04-05 08:21:16', NULL),
(141, 128, 'TEST STEP !', '2018-04-05 08:23:45', NULL),
(142, 128, 'TEST STEP 2', '2018-04-05 08:23:45', NULL),
(143, 129, 'TEST STEP !', '2018-04-22 19:34:01', NULL),
(144, 129, 'TEST STEP 2', '2018-04-22 19:34:01', NULL),
(145, 130, 'TEST STEP !', '2018-04-22 19:56:49', NULL),
(146, 130, 'TEST STEP 2', '2018-04-22 19:56:49', NULL),
(147, 131, 'TEST STEP !', '2018-04-22 20:03:10', NULL),
(148, 131, 'TEST STEP 2', '2018-04-22 20:03:10', NULL),
(152, 135, 'TEST STEP !', '2018-04-22 20:41:37', NULL),
(153, 135, 'TEST STEP 2', '2018-04-22 20:41:37', NULL),
(165, 147, 'once upon a time there lived a king who lived untill he died.', '2018-04-23 20:37:14', NULL);

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
(314, 103, 1, 4, '2017-12-19 19:45:20', NULL),
(315, 103, 2, 3, '2017-12-19 19:45:21', NULL),
(316, 103, 3, 2, '2017-12-19 19:45:21', NULL),
(317, 104, 1, 4, '2018-03-18 10:04:17', NULL),
(318, 104, 2, 3, '2018-03-18 10:04:18', NULL),
(319, 104, 3, 2, '2018-03-18 10:04:18', NULL),
(320, 105, 1, 4, '2018-03-18 11:14:29', NULL),
(321, 105, 2, 1, '2018-03-18 11:14:29', NULL),
(322, 105, 3, 0, '2018-03-18 11:14:29', NULL),
(323, 106, 1, 4, '2018-03-24 17:55:56', NULL),
(324, 106, 2, 3, '2018-03-24 17:55:56', NULL),
(325, 106, 3, 2, '2018-03-24 17:55:56', NULL),
(335, 110, 1, 4, '2018-03-24 18:01:15', NULL),
(336, 110, 2, 3, '2018-03-24 18:01:15', NULL),
(337, 110, 3, 2, '2018-03-24 18:01:15', NULL),
(338, 111, 1, 4, '2018-03-24 18:01:43', NULL),
(339, 111, 2, 3, '2018-03-24 18:01:43', NULL),
(340, 111, 3, 2, '2018-03-24 18:01:43', NULL),
(341, 112, 1, 4, '2018-03-24 18:06:09', NULL),
(342, 112, 2, 3, '2018-03-24 18:06:10', NULL),
(343, 112, 3, 2, '2018-03-24 18:06:10', NULL),
(344, 113, 1, 4, '2018-03-24 18:12:14', NULL),
(345, 113, 2, 3, '2018-03-24 18:12:14', NULL),
(346, 113, 3, 2, '2018-03-24 18:12:14', NULL),
(347, 114, 1, 4, '2018-03-24 18:17:49', NULL),
(348, 114, 2, 3, '2018-03-24 18:17:49', NULL),
(349, 114, 3, 2, '2018-03-24 18:17:50', NULL),
(350, 115, 1, 4, '2018-03-24 18:18:16', NULL),
(351, 115, 2, 3, '2018-03-24 18:18:16', NULL),
(352, 115, 3, 2, '2018-03-24 18:18:16', NULL),
(353, 116, 1, 5, '2018-03-27 23:46:32', NULL),
(354, 116, 2, 1, '2018-03-27 23:46:32', NULL),
(355, 116, 3, 0, '2018-03-27 23:46:32', NULL),
(356, 117, 1, 4, '2018-03-28 18:08:31', NULL),
(357, 117, 2, 3, '2018-03-28 18:08:31', NULL),
(358, 117, 3, 2, '2018-03-28 18:08:31', NULL),
(359, 118, 1, 4, '2018-03-28 18:10:43', NULL),
(360, 118, 2, 3, '2018-03-28 18:10:43', NULL),
(361, 118, 3, 2, '2018-03-28 18:10:44', NULL),
(362, 119, 1, 4, '2018-03-28 18:11:59', NULL),
(363, 119, 2, 3, '2018-03-28 18:11:59', NULL),
(364, 119, 3, 2, '2018-03-28 18:11:59', NULL),
(371, 3, 1, 4, '2018-04-04 13:58:49', NULL),
(372, 3, 2, 3, '2018-04-04 13:58:49', NULL),
(373, 3, 3, 2, '2018-04-04 13:58:50', NULL),
(374, 121, 1, 4, '2018-04-05 08:02:33', NULL),
(375, 121, 2, 3, '2018-04-05 08:02:33', NULL),
(376, 121, 3, 2, '2018-04-05 08:02:33', NULL),
(377, 122, 1, 4, '2018-04-05 08:04:04', NULL),
(378, 122, 2, 3, '2018-04-05 08:04:04', NULL),
(379, 122, 3, 2, '2018-04-05 08:04:04', NULL),
(380, 123, 1, 4, '2018-04-05 08:07:53', NULL),
(381, 123, 2, 3, '2018-04-05 08:07:53', NULL),
(382, 123, 3, 2, '2018-04-05 08:07:53', NULL),
(383, 124, 1, 4, '2018-04-05 08:09:31', NULL),
(384, 124, 2, 3, '2018-04-05 08:09:31', NULL),
(385, 124, 3, 2, '2018-04-05 08:09:31', NULL),
(386, 125, 1, 4, '2018-04-05 08:10:49', NULL),
(387, 125, 2, 3, '2018-04-05 08:10:49', NULL),
(388, 125, 3, 2, '2018-04-05 08:10:49', NULL),
(389, 126, 1, 4, '2018-04-05 08:15:23', NULL),
(390, 126, 2, 3, '2018-04-05 08:15:23', NULL),
(391, 126, 3, 2, '2018-04-05 08:15:23', NULL),
(392, 127, 1, 4, '2018-04-05 08:21:16', NULL),
(393, 127, 2, 3, '2018-04-05 08:21:16', NULL),
(394, 127, 3, 2, '2018-04-05 08:21:16', NULL),
(395, 128, 1, 4, '2018-04-05 08:23:45', NULL),
(396, 128, 2, 3, '2018-04-05 08:23:46', NULL),
(397, 128, 3, 2, '2018-04-05 08:23:46', NULL),
(398, 129, 1, 4, '2018-04-22 19:34:01', NULL),
(399, 129, 2, 3, '2018-04-22 19:34:01', NULL),
(400, 129, 3, 2, '2018-04-22 19:34:01', NULL),
(401, 130, 1, 4, '2018-04-22 19:56:49', NULL),
(402, 130, 2, 3, '2018-04-22 19:56:50', NULL),
(403, 130, 3, 2, '2018-04-22 19:56:50', NULL),
(404, 131, 1, 4, '2018-04-22 20:03:10', NULL),
(405, 131, 2, 3, '2018-04-22 20:03:10', NULL),
(406, 131, 3, 2, '2018-04-22 20:03:11', NULL),
(416, 135, 1, 4, '2018-04-22 20:41:38', NULL),
(417, 135, 2, 3, '2018-04-22 20:41:38', NULL),
(418, 135, 3, 2, '2018-04-22 20:41:38', NULL),
(452, 147, 1, 3, '2018-04-23 20:37:14', NULL),
(453, 147, 2, 2, '2018-04-23 20:37:14', NULL),
(454, 147, 3, 0, '2018-04-23 20:37:14', NULL);

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
(10, 103, 1, 'TEST REVIEW - 32', 3, 'N', '2017-12-16 11:11:28', '2018-02-15 10:46:02'),
(11, 103, 2, 'This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review.', 3, 'N', '2017-12-16 20:44:15', NULL),
(15, 105, 1, 'TEST REVIEW - 51', 3, 'N', '2018-03-26 17:04:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SCOPE`
--

CREATE TABLE `SCOPE` (
  `SCOPE_ID` int(11) NOT NULL,
  `SCOPE_NAME` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 1, 1, 'USER_ADD', 1, 1, 'Y', '2017-08-27 00:00:00', NULL),
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
(619, 1, 1, 'USER_PHOTO_MODIFY', 1, 2, 'N', '2018-02-06 17:19:28', NULL),
(620, 1, 1, 'LIKE_RECIPE_ADD', 7, 1, 'N', '2018-02-09 19:46:51', NULL),
(621, 1, 2, 'LIKE_REVIEW_ADD', 10, 1, 'N', '2018-02-09 20:43:07', NULL),
(622, 68, 68, 'USER_ADD', 68, 1, 'N', '2018-02-15 10:44:56', NULL),
(623, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-02-15 10:45:05', NULL),
(624, 1, 1, 'RECIPE_REMOVE', 103, 1, 'N', '2018-02-15 10:45:28', NULL),
(625, 1, 1, 'LIKE_RECIPE_REMOVE', 7, 1, 'N', '2018-02-15 10:45:42', NULL),
(626, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2018-02-15 10:45:44', NULL),
(627, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2018-02-15 10:45:46', NULL),
(628, 1, 1, 'COMMENT_RECIPE_ADD', 70, 1, 'N', '2018-02-15 10:45:57', NULL),
(629, 1, 1, 'COMMENT_RECIPE_REMOVE', 9, 1, 'N', '2018-02-15 10:46:01', NULL),
(630, 1, 1, 'REVIEW_RECIPE_ADD', 10, 1, 'N', '2018-02-15 10:46:03', NULL),
(631, 1, 1, 'REVIEW_RECIPE_REMOVE', 9, 1, 'N', '2018-02-15 10:46:06', NULL),
(632, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2018-02-15 10:46:44', NULL),
(633, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-02-15 10:47:36', NULL),
(634, 1, 1, 'LIKE_RECIPE_ADD', 7, 1, 'N', '2018-02-15 18:25:23', NULL),
(635, 1, 1, 'LIKE_COMMENT_REMOVE', 16, 1, 'N', '2018-03-01 22:10:10', NULL),
(636, 1, 1, 'LIKE_COMMENT_REMOVE', 18, 1, 'N', '2018-03-01 22:10:11', NULL),
(637, 1, 1, 'LIKE_COMMENT_REMOVE', 15, 1, 'N', '2018-03-01 22:10:12', NULL),
(638, 1, 1, 'LIKE_COMMENT_ADD', 19, 1, 'N', '2018-03-01 22:10:13', NULL),
(639, 1, 1, 'LIKE_COMMENT_ADD', 20, 1, 'N', '2018-03-01 22:10:13', NULL),
(640, 1, 1, 'LIKE_COMMENT_ADD', 16, 1, 'N', '2018-03-01 22:10:28', NULL),
(641, 1, 1, 'LIKE_RECIPE_REMOVE', 7, 1, 'N', '2018-03-01 22:11:26', NULL),
(642, 1, 1, 'LIKE_RECIPE_ADD', 7, 1, 'N', '2018-03-01 22:11:29', NULL),
(643, 1, 1, 'LIKE_RECIPE_REMOVE', 7, 1, 'N', '2018-03-01 22:11:29', NULL),
(644, 1, 1, 'LIKE_RECIPE_ADD', 7, 1, 'N', '2018-03-01 22:11:32', NULL),
(645, 1, 1, 'LIKE_RECIPE_REMOVE', 7, 1, 'N', '2018-03-01 22:11:33', NULL),
(646, 1, 1, 'LIKE_RECIPE_REMOVE', 1, 1, 'N', '2018-03-03 09:00:49', NULL),
(647, 1, 1, 'LIKE_RECIPE_ADD', 1, 1, 'N', '2018-03-03 09:00:52', NULL),
(648, 1, 1, 'COMMENT_RECIPE_ADD', 71, 1, 'N', '2018-03-03 13:10:59', NULL),
(649, 69, 69, 'USER_ADD', 69, 1, 'N', '2018-03-10 22:10:58', NULL),
(650, 70, 70, 'USER_ADD', 70, 1, 'N', '2018-03-10 22:12:33', NULL),
(655, 75, 75, 'USER_ADD', 75, 1, 'N', '2018-03-11 01:01:30', NULL),
(656, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-03-13 13:45:01', NULL),
(657, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-03-13 13:45:04', NULL),
(658, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-03-13 13:45:07', NULL),
(659, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-03-13 18:02:14', NULL),
(660, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-03-13 18:03:22', NULL),
(661, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-03-13 18:03:25', NULL),
(662, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-03-13 18:03:28', NULL),
(663, 1, 4, 'LIKE_USER_ADD', 26, 1, 'N', '2018-03-13 18:10:16', NULL),
(664, 1, 4, 'LIKE_USER_REMOVE', 26, 1, 'N', '2018-03-13 18:10:19', NULL),
(665, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-03-13 18:10:28', NULL),
(666, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-03-13 18:10:31', NULL),
(667, 1, 1, 'LIKE_RECIPE_REMOVE', 1, 1, 'N', '2018-03-13 18:50:54', NULL),
(668, 1, 1, 'LIKE_RECIPE_ADD', 1, 1, 'N', '2018-03-13 18:50:57', NULL),
(669, 1, 1, 'LIKE_RECIPE_REMOVE', 1, 1, 'N', '2018-03-13 18:50:59', NULL),
(670, 1, 1, 'LIKE_RECIPE_ADD', 1, 1, 'N', '2018-03-13 18:51:02', NULL),
(671, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-03-13 18:51:07', NULL),
(672, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-03-13 18:51:09', NULL),
(673, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-03-13 18:51:14', NULL),
(674, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-03-13 18:51:16', NULL),
(675, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2018-03-13 18:51:32', NULL),
(676, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2018-03-13 18:51:35', NULL),
(677, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2018-03-13 18:51:48', NULL),
(678, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2018-03-13 18:51:51', NULL),
(679, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2018-03-13 18:51:53', NULL),
(680, 1, 2, 'USER_UNFOLLOW', 1, 1, 'N', '2018-03-13 20:01:44', NULL),
(681, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2018-03-13 20:01:46', NULL),
(682, 1, 1, 'LIKE_RECIPE_IMG_ADD', 27, 1, 'N', '2018-03-17 10:15:31', NULL),
(683, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 27, 1, 'N', '2018-03-17 10:19:22', NULL),
(684, 1, 1, 'LIKE_RECIPE_IMG_ADD', 27, 1, 'N', '2018-03-17 10:19:26', NULL),
(685, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 27, 1, 'N', '2018-03-17 10:33:47', NULL),
(686, 1, 1, 'LIKE_RECIPE_IMG_ADD', 27, 1, 'N', '2018-03-17 10:34:00', NULL),
(687, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-03-17 10:40:14', NULL),
(688, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-03-17 10:40:19', NULL),
(689, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-03-17 10:40:22', NULL),
(690, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-03-17 10:51:27', NULL),
(691, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-03-17 10:51:31', NULL),
(692, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-03-17 10:51:36', NULL),
(693, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 27, 1, 'N', '2018-03-17 10:52:44', NULL),
(694, 1, 1, 'LIKE_RECIPE_IMG_ADD', 27, 1, 'N', '2018-03-17 10:54:34', NULL),
(695, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 27, 1, 'N', '2018-03-17 10:55:20', NULL),
(696, 1, 1, 'LIKE_RECIPE_IMG_ADD', 27, 1, 'N', '2018-03-17 10:55:24', NULL),
(697, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 27, 1, 'N', '2018-03-17 10:56:18', NULL),
(698, 1, 1, 'LIKE_RECIPE_IMG_ADD', 27, 1, 'N', '2018-03-17 10:56:20', NULL),
(699, 1, 1, 'LIKE_RECIPE_IMG_ADD', 28, 1, 'N', '2018-03-17 10:56:37', NULL),
(700, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 27, 1, 'N', '2018-03-17 10:56:47', NULL),
(701, 1, 1, 'LIKE_RECIPE_IMG_ADD', 27, 1, 'N', '2018-03-17 11:02:15', NULL),
(702, 1, 1, 'LIKE_RECIPE_ADD', 29, 1, 'N', '2018-03-17 11:14:55', NULL),
(703, 1, 1, 'LIKE_RECIPE_REMOVE', 29, 1, 'N', '2018-03-17 11:17:53', NULL),
(704, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 28, 1, 'N', '2018-03-17 11:43:47', NULL),
(705, 1, 1, 'LIKE_RECIPE_IMG_ADD', 28, 1, 'N', '2018-03-17 11:48:09', NULL),
(706, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 28, 1, 'N', '2018-03-17 11:49:47', NULL),
(707, 1, 1, 'LIKE_RECIPE_IMG_ADD', 28, 1, 'N', '2018-03-17 11:49:52', NULL),
(708, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 27, 1, 'N', '2018-03-17 11:50:09', NULL),
(709, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-03-17 19:06:14', NULL),
(710, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-03-17 19:06:17', NULL),
(711, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-03-17 19:24:44', NULL),
(712, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-03-17 19:36:02', NULL),
(713, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-03-17 19:36:10', NULL),
(714, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-03-17 19:36:15', NULL),
(715, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-03-17 19:36:20', NULL),
(716, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-03-17 19:36:22', NULL),
(717, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-03-17 19:40:07', NULL),
(718, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-03-17 19:40:09', NULL),
(719, 76, 76, 'USER_ADD', 76, 1, 'N', '2018-03-18 17:09:16', NULL),
(720, 1, 1, 'LIKE_RECIPE_IMG_ADD', 30, 1, 'N', '2018-03-19 19:36:17', NULL),
(721, 1, 1, 'LIKE_RECIPE_IMG_ADD', 31, 1, 'N', '2018-03-19 19:36:48', NULL),
(722, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-03-20 18:50:45', NULL),
(723, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-03-20 18:51:30', NULL),
(724, 1, 1, 'LIKE_RECIPE_REMOVE', 1, 1, 'N', '2018-03-20 18:58:12', NULL),
(725, 1, 1, 'LIKE_RECIPE_ADD', 1, 1, 'N', '2018-03-20 18:58:15', NULL),
(726, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-03-20 18:58:18', NULL),
(727, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-03-20 18:58:23', NULL),
(728, 1, 1, 'LIKE_RECIPE_IMG_ADD', 32, 1, 'N', '2018-03-20 18:58:30', NULL),
(729, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-03-20 19:13:54', NULL),
(730, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-03-20 19:16:30', NULL),
(731, 1, 1, 'LIKE_RECIPE_REMOVE', 1, 1, 'N', '2018-03-20 19:16:35', NULL),
(732, 1, 1, 'LIKE_RECIPE_ADD', 1, 1, 'N', '2018-03-20 19:24:44', NULL),
(733, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 32, 1, 'N', '2018-03-20 19:24:55', NULL),
(741, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 96, 1, 'N', '2018-03-21 18:43:04', NULL),
(742, 1, 1, 'COMMENT_RECIPE_ADD', 90, 1, 'N', '2018-03-21 18:58:00', NULL),
(743, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 91, 1, 'N', '2018-03-21 18:58:23', NULL),
(744, 1, 1, 'COMMENT_RECIPE_ADD', 93, 1, 'N', '2018-03-22 12:09:06', NULL),
(745, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 94, 1, 'N', '2018-03-22 12:09:14', NULL),
(746, 1, 1, 'COMMENT_RECIPE_ADD', 95, 1, 'N', '2018-03-22 12:09:18', NULL),
(747, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-03-23 19:00:11', NULL),
(748, 1, 1, 'RECIPE_ADD', 106, 1, 'N', '2018-03-24 17:55:57', NULL),
(752, 1, 1, 'RECIPE_ADD', 110, 1, 'N', '2018-03-24 18:01:16', NULL),
(753, 1, 1, 'RECIPE_ADD', 111, 1, 'N', '2018-03-24 18:01:43', NULL),
(754, 1, 1, 'RECIPE_ADD', 112, 1, 'N', '2018-03-24 18:06:10', NULL),
(755, 1, 1, 'RECIPE_ADD', 113, 1, 'N', '2018-03-24 18:12:15', NULL),
(756, 1, 1, 'RECIPE_ADD', 114, 1, 'N', '2018-03-24 18:17:50', NULL),
(757, 1, 1, 'RECIPE_ADD', 115, 1, 'N', '2018-03-24 18:18:16', NULL),
(758, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-03-24 21:24:23', NULL),
(759, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-03-24 21:51:18', NULL),
(760, 77, 77, 'USER_ADD', 77, 1, 'N', '2018-03-24 22:01:24', NULL),
(761, 78, 78, 'USER_ADD', 78, 1, 'N', '2018-03-24 22:04:05', NULL),
(762, 79, 79, 'USER_ADD', 79, 1, 'N', '2018-03-24 22:12:20', NULL),
(763, 80, 80, 'USER_ADD', 80, 1, 'N', '2018-03-24 22:19:26', NULL),
(764, 81, 81, 'USER_ADD', 81, 1, 'N', '2018-03-24 22:28:02', NULL),
(765, 82, 82, 'USER_ADD', 82, 1, 'N', '2018-03-24 22:31:31', NULL),
(766, 83, 83, 'USER_ADD', 83, 1, 'N', '2018-03-24 22:32:53', NULL),
(767, 84, 84, 'USER_ADD', 84, 1, 'N', '2018-03-24 22:46:28', NULL),
(770, 87, 87, 'USER_ADD', 87, 1, 'N', '2018-03-25 10:06:17', NULL),
(771, 88, 88, 'USER_ADD', 88, 1, 'N', '2018-03-25 19:37:24', NULL),
(772, 1, 1, 'COMMENT_RECIPE_REMOVE', 9, 1, 'N', '2018-03-26 12:03:55', NULL),
(773, 1, 1, 'COMMENT_RECIPE_REMOVE', 10, 1, 'N', '2018-03-26 13:53:24', NULL),
(774, 1, 1, 'COMMENT_RECIPE_REMOVE', 10, 1, 'N', '2018-03-26 13:53:32', NULL),
(775, 1, 1, 'COMMENT_RECIPE_ADD', 96, 1, 'N', '2018-03-26 13:58:33', NULL),
(776, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-03-26 16:51:55', NULL),
(777, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-03-26 17:01:28', NULL),
(778, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-03-26 17:01:34', NULL),
(779, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-03-26 17:01:37', NULL),
(780, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2018-03-26 17:01:42', NULL),
(781, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2018-03-26 17:01:46', NULL),
(782, 1, 1, 'RECIPE_REMOVE', 15, 1, 'N', '2018-03-26 17:04:07', NULL),
(783, 1, 1, 'REVIEW_RECIPE_REMOVE', 9, 1, 'N', '2018-03-26 17:04:30', NULL),
(784, 1, 1, 'REVIEW_RECIPE_ADD', 15, 1, 'N', '2018-03-26 17:04:41', NULL),
(785, 1, 2, 'USER_UNFOLLOW', 1, 1, 'N', '2018-03-26 18:36:08', NULL),
(786, 1, 2, 'USER_FOLLOW', 1, 1, 'N', '2018-03-26 18:36:12', NULL),
(787, 2, 1, 'LIKE_RECIPE_ADD', 34, 1, 'N', '2018-03-26 19:05:55', NULL),
(788, 3, 1, 'LIKE_RECIPE_ADD', 35, 1, 'N', '2018-03-26 19:06:00', NULL),
(789, 4, 1, 'LIKE_RECIPE_ADD', 36, 1, 'N', '2018-03-26 19:06:07', NULL),
(790, 1, 4, 'USER_UNFOLLOW', 3, 1, 'N', '2018-03-26 19:18:11', NULL),
(791, 1, 4, 'USER_FOLLOW', 3, 1, 'N', '2018-03-26 19:18:13', NULL),
(792, 100, 100, 'USER_ADD', 100, 1, 'N', '2018-03-27 23:41:21', NULL),
(793, 100, 100, 'RECIPE_ADD', 116, 1, 'N', '2018-03-27 23:46:32', NULL),
(794, 100, 1, 'USER_FOLLOW', 25, 1, 'N', '2018-03-28 00:05:56', NULL),
(795, 1, 1, 'RECIPE_ADD', 117, 1, 'N', '2018-03-28 18:08:32', NULL),
(796, 1, 1, 'RECIPE_ADD', 118, 1, 'N', '2018-03-28 18:10:44', NULL),
(797, 1, 1, 'RECIPE_ADD', 119, 1, 'N', '2018-03-28 18:11:59', NULL),
(807, 110, 110, 'USER_ADD', 110, 1, 'N', '2018-04-02 21:01:41', NULL),
(808, 111, 111, 'USER_ADD', 111, 1, 'N', '2018-04-04 11:07:48', NULL),
(809, 1, 1, 'RECIPE_MODIFY', 3, 1, 'N', '2018-04-04 13:58:50', NULL),
(810, 1, 1, 'RECIPE_REMOVE', 81, 1, 'N', '2018-04-04 14:28:14', NULL),
(811, 1, 1, 'RECIPE_REMOVE', 80, 1, 'N', '2018-04-04 14:35:32', NULL),
(812, 1, 1, 'RECIPE_REMOVE', 82, 1, 'N', '2018-04-04 14:56:44', NULL),
(813, 1, 1, 'RECIPE_REMOVE', 83, 1, 'N', '2018-04-04 14:57:34', NULL),
(814, 1, 1, 'RECIPE_REMOVE', 84, 1, 'N', '2018-04-04 15:12:11', NULL),
(815, 1, 1, 'RECIPE_REMOVE', 89, 1, 'N', '2018-04-04 15:14:49', NULL),
(816, 1, 1, 'RECIPE_REMOVE', 89, 1, 'N', '2018-04-04 15:16:19', NULL),
(817, 1, 1, 'RECIPE_REMOVE', 89, 1, 'N', '2018-04-04 15:20:04', NULL),
(818, 1, 1, 'RECIPE_REMOVE', 89, 1, 'N', '2018-04-04 15:21:25', NULL),
(819, 1, 1, 'RECIPE_REMOVE', 89, 1, 'N', '2018-04-04 15:23:00', NULL),
(820, 1, 1, 'RECIPE_REMOVE', 89, 1, 'N', '2018-04-04 15:24:36', NULL),
(821, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 97, 1, 'N', '2018-04-04 19:06:36', NULL),
(822, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 98, 1, 'N', '2018-04-04 19:21:25', NULL),
(823, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 99, 1, 'N', '2018-04-04 19:30:31', NULL),
(824, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 100, 1, 'N', '2018-04-04 19:31:18', NULL),
(825, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 101, 1, 'N', '2018-04-04 19:34:49', NULL),
(826, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 102, 1, 'N', '2018-04-04 19:35:48', NULL),
(827, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 103, 1, 'N', '2018-04-04 19:39:21', NULL),
(828, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 104, 1, 'N', '2018-04-04 19:43:21', NULL),
(829, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 105, 1, 'N', '2018-04-04 19:43:44', NULL),
(830, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 106, 1, 'N', '2018-04-04 19:45:06', NULL),
(831, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 107, 1, 'N', '2018-04-04 19:47:15', NULL),
(832, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 108, 1, 'N', '2018-04-04 19:47:26', NULL),
(833, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 109, 1, 'N', '2018-04-04 19:51:25', NULL),
(834, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 110, 1, 'N', '2018-04-04 19:51:33', NULL),
(835, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 111, 1, 'N', '2018-04-04 19:57:40', NULL),
(836, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 112, 1, 'N', '2018-04-04 19:58:20', NULL),
(837, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 113, 1, 'N', '2018-04-04 20:01:05', NULL),
(838, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 114, 1, 'N', '2018-04-04 20:01:35', NULL),
(839, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 115, 1, 'N', '2018-04-04 20:04:10', NULL),
(840, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 116, 1, 'N', '2018-04-04 20:04:18', NULL),
(841, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 117, 1, 'N', '2018-04-04 20:04:31', NULL),
(842, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 118, 1, 'N', '2018-04-04 20:05:08', NULL),
(843, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 119, 1, 'N', '2018-04-04 20:08:35', NULL),
(844, 1, 1, 'RECIPE_ADD', 121, 1, 'N', '2018-04-05 08:02:33', NULL),
(845, 1, 1, 'RECIPE_ADD', 122, 1, 'N', '2018-04-05 08:04:04', NULL),
(846, 1, 1, 'RECIPE_ADD', 123, 1, 'N', '2018-04-05 08:07:54', NULL),
(847, 1, 1, 'RECIPE_ADD', 124, 1, 'N', '2018-04-05 08:09:31', NULL),
(848, 1, 1, 'RECIPE_ADD', 125, 1, 'N', '2018-04-05 08:10:49', NULL),
(849, 1, 1, 'RECIPE_ADD', 126, 1, 'N', '2018-04-05 08:15:23', NULL),
(850, 1, 1, 'RECIPE_ADD', 127, 1, 'N', '2018-04-05 08:21:17', NULL),
(851, 1, 1, 'RECIPE_ADD', 128, 1, 'N', '2018-04-05 08:23:46', NULL),
(852, 1, 1, 'COMMENT_RECIPE_ADD', 120, 1, 'N', '2018-04-13 11:32:59', NULL),
(853, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 30, 1, 'N', '2018-04-14 15:32:15', NULL),
(854, 112, 112, 'USER_ADD', 112, 1, 'N', '2018-04-14 16:32:55', NULL),
(855, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 31, 1, 'N', '2018-04-14 20:15:36', NULL),
(856, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 22:31:00', NULL),
(857, 1, 1, 'LIKE_COMMENT_ADD', 38, 1, 'N', '2018-04-14 22:56:33', NULL),
(858, 1, 1, 'LIKE_COMMENT_REMOVE', 38, 1, 'N', '2018-04-14 22:57:28', NULL),
(859, 1, 1, 'LIKE_COMMENT_ADD', 38, 1, 'N', '2018-04-14 23:05:38', NULL),
(860, 1, 1, 'LIKE_COMMENT_REMOVE', 37, 1, 'N', '2018-04-14 23:06:17', NULL),
(861, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 23:06:34', NULL),
(862, 1, 1, 'LIKE_COMMENT_REMOVE', 37, 1, 'N', '2018-04-14 23:09:07', NULL),
(863, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 23:38:38', NULL),
(864, 1, 1, 'LIKE_COMMENT_REMOVE', 37, 1, 'N', '2018-04-14 23:40:49', NULL),
(865, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 23:40:55', NULL),
(866, 1, 1, 'LIKE_COMMENT_REMOVE', 37, 1, 'N', '2018-04-14 23:40:56', NULL),
(867, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 23:40:57', NULL),
(868, 1, 1, 'LIKE_COMMENT_REMOVE', 37, 1, 'N', '2018-04-14 23:40:59', NULL),
(869, 1, 1, 'LIKE_COMMENT_REMOVE', 37, 1, 'N', '2018-04-14 23:41:00', NULL),
(870, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 23:41:02', NULL),
(871, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 23:41:02', NULL),
(872, 1, 1, 'LIKE_COMMENT_REMOVE', 37, 1, 'N', '2018-04-14 23:41:04', NULL),
(873, 1, 1, 'LIKE_COMMENT_ADD', 39, 1, 'N', '2018-04-14 23:41:06', NULL),
(874, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 23:42:54', NULL),
(875, 1, 1, 'LIKE_COMMENT_REMOVE', 37, 1, 'N', '2018-04-14 23:42:58', NULL),
(876, 1, 1, 'LIKE_COMMENT_REMOVE', 38, 1, 'N', '2018-04-14 23:43:01', NULL),
(877, 1, 1, 'LIKE_COMMENT_ADD', 38, 1, 'N', '2018-04-14 23:43:03', NULL),
(878, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 23:43:05', NULL),
(879, 1, 1, 'LIKE_COMMENT_REMOVE', 37, 1, 'N', '2018-04-14 23:50:36', NULL),
(880, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 23:51:57', NULL),
(881, 1, 1, 'LIKE_COMMENT_REMOVE', 37, 1, 'N', '2018-04-14 23:52:09', NULL),
(882, 1, 1, 'LIKE_COMMENT_ADD', 37, 1, 'N', '2018-04-14 23:55:10', NULL),
(883, 1, 1, 'LIKE_COMMENT_REMOVE', 38, 1, 'N', '2018-04-14 23:55:40', NULL),
(884, 1, 1, 'LIKE_RECIPE_IMG_ADD', 40, 1, 'N', '2018-04-15 00:07:19', NULL),
(885, 1, 1, 'LIKE_RECIPE_IMG_ADD', 30, 1, 'N', '2018-04-15 00:07:25', NULL),
(886, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 30, 1, 'N', '2018-04-15 00:07:39', NULL),
(887, 1, 1, 'LIKE_RECIPE_IMG_ADD', 30, 1, 'N', '2018-04-15 06:56:15', NULL),
(888, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 30, 1, 'N', '2018-04-15 06:56:40', NULL),
(889, 1, 1, 'LIKE_RECIPE_IMG_ADD', 30, 1, 'N', '2018-04-15 06:56:55', NULL),
(890, 1, 1, 'LIKE_RECIPE_IMG_ADD', 31, 1, 'N', '2018-04-15 06:58:46', NULL),
(891, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 30, 1, 'N', '2018-04-15 07:02:54', NULL),
(892, 1, 1, 'LIKE_RECIPE_IMG_ADD', 30, 1, 'N', '2018-04-15 07:04:18', NULL),
(893, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 30, 1, 'N', '2018-04-15 07:09:11', NULL),
(894, 1, 1, 'LIKE_RECIPE_IMG_ADD', 30, 1, 'N', '2018-04-15 08:27:17', NULL),
(895, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 30, 1, 'N', '2018-04-15 08:27:25', NULL),
(896, 1, 1, 'LIKE_RECIPE_IMG_ADD', 30, 1, 'N', '2018-04-15 08:43:11', NULL),
(897, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 30, 1, 'N', '2018-04-15 08:43:31', NULL),
(898, 1, 1, 'LIKE_RECIPE_IMG_ADD', 30, 1, 'N', '2018-04-15 08:44:39', NULL),
(899, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 30, 1, 'N', '2018-04-15 08:44:42', NULL),
(900, 1, 1, 'LIKE_RECIPE_IMG_ADD', 30, 1, 'N', '2018-04-15 08:44:45', NULL),
(901, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 30, 1, 'N', '2018-04-15 08:50:23', NULL),
(902, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 31, 1, 'N', '2018-04-15 08:50:59', NULL),
(903, 1, 1, 'LIKE_RECIPE_IMG_ADD', 41, 1, 'N', '2018-04-15 08:51:19', NULL),
(904, 1, 1, 'LIKE_COMMENT_ADD', 38, 1, 'N', '2018-04-15 09:02:24', NULL),
(905, 1, 1, 'LIKE_REVIEW_ADD', 42, 1, 'N', '2018-04-15 09:56:25', NULL),
(906, 1, 1, 'LIKE_REVIEW_REMOVE', 42, 1, 'N', '2018-04-15 10:04:38', NULL),
(907, 1, 1, 'LIKE_REVIEW_ADD', 42, 1, 'N', '2018-04-15 10:04:50', NULL),
(908, 1, 1, 'LIKE_REVIEW_REMOVE', 42, 1, 'N', '2018-04-15 10:16:43', NULL),
(909, 1, 1, 'LIKE_REVIEW_ADD', 42, 1, 'N', '2018-04-15 10:18:23', NULL),
(910, 1, 1, 'LIKE_REVIEW_REMOVE', 42, 1, 'N', '2018-04-15 10:20:45', NULL),
(911, 1, 1, 'LIKE_REVIEW_ADD', 42, 1, 'N', '2018-04-15 10:21:27', NULL),
(912, 1, 1, 'LIKE_REVIEW_REMOVE', 42, 1, 'N', '2018-04-15 10:21:46', NULL),
(913, 1, 1, 'LIKE_REVIEW_ADD', 42, 1, 'N', '2018-04-15 10:21:49', NULL),
(914, 1, 4, 'LIKE_USER_ADD', 26, 1, 'N', '2018-04-15 10:48:41', NULL),
(915, 1, 4, 'LIKE_USER_REMOVE', 26, 1, 'N', '2018-04-15 10:49:41', NULL),
(916, 1, 4, 'LIKE_USER_ADD', 26, 1, 'N', '2018-04-15 10:49:43', NULL),
(917, 1, 4, 'LIKE_USER_REMOVE', 26, 1, 'N', '2018-04-15 10:51:56', NULL),
(918, 1, 4, 'LIKE_USER_ADD', 26, 1, 'N', '2018-04-15 11:00:38', NULL),
(919, 1, 4, 'LIKE_USER_REMOVE', 26, 1, 'N', '2018-04-15 11:09:16', NULL),
(920, 1, 4, 'LIKE_USER_ADD', 26, 1, 'N', '2018-04-15 11:09:28', NULL),
(921, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-04-15 12:12:08', NULL),
(922, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-04-15 12:12:47', NULL),
(923, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-04-15 15:56:37', NULL),
(924, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-04-15 16:00:31', NULL),
(925, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-04-15 16:00:43', NULL),
(926, 1, 1, 'LIKE_RECIPE_IMG_ADD', 30, 1, 'N', '2018-04-16 18:21:03', NULL),
(927, 1, 1, 'LIKE_COMMENT_ADD', 43, 1, 'N', '2018-04-16 18:21:20', NULL),
(928, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 122, 1, 'N', '2018-04-16 18:25:39', NULL),
(929, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 123, 1, 'N', '2018-04-16 18:27:26', NULL),
(930, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 124, 1, 'N', '2018-04-16 18:29:34', NULL),
(931, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 125, 1, 'N', '2018-04-16 18:33:39', NULL),
(932, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 126, 1, 'N', '2018-04-16 18:37:27', NULL),
(933, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 127, 1, 'N', '2018-04-16 18:37:38', NULL),
(934, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 128, 1, 'N', '2018-04-16 18:38:10', NULL),
(935, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 129, 1, 'N', '2018-04-16 18:39:13', NULL),
(936, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 130, 1, 'N', '2018-04-16 18:42:04', NULL),
(937, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 131, 1, 'N', '2018-04-16 18:42:53', NULL),
(938, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 132, 1, 'N', '2018-04-16 18:45:13', NULL),
(939, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 133, 1, 'N', '2018-04-16 18:47:14', NULL),
(940, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 134, 1, 'N', '2018-04-16 18:47:35', NULL),
(941, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 135, 1, 'N', '2018-04-16 18:48:07', NULL),
(942, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 136, 1, 'N', '2018-04-16 18:48:36', NULL),
(943, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 137, 1, 'N', '2018-04-16 18:49:01', NULL),
(944, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 138, 1, 'N', '2018-04-16 18:49:22', NULL),
(945, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 139, 1, 'N', '2018-04-16 18:49:38', NULL),
(946, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 140, 1, 'N', '2018-04-16 18:51:17', NULL),
(947, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 141, 1, 'N', '2018-04-16 18:51:43', NULL),
(948, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 142, 1, 'N', '2018-04-16 18:53:36', NULL),
(949, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 143, 1, 'N', '2018-04-16 18:55:51', NULL),
(950, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 144, 1, 'N', '2018-04-16 18:56:30', NULL),
(951, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 145, 1, 'N', '2018-04-16 19:02:35', NULL),
(952, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 146, 1, 'N', '2018-04-16 19:03:39', NULL),
(953, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 101, 1, 'N', '2018-04-16 19:04:26', NULL),
(954, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 115, 1, 'N', '2018-04-16 19:58:52', NULL),
(955, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 124, 1, 'N', '2018-04-16 20:01:20', NULL),
(956, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 125, 1, 'N', '2018-04-16 20:02:13', NULL),
(957, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 126, 1, 'N', '2018-04-16 20:03:24', NULL),
(958, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 127, 1, 'N', '2018-04-16 20:05:18', NULL),
(959, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 128, 1, 'N', '2018-04-16 20:06:41', NULL),
(960, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 140, 1, 'N', '2018-04-16 20:08:06', NULL),
(961, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 123, 1, 'N', '2018-04-16 20:08:19', NULL),
(962, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 122, 1, 'N', '2018-04-16 20:08:38', NULL),
(963, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 116, 1, 'N', '2018-04-16 20:12:28', NULL),
(964, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 117, 1, 'N', '2018-04-16 20:16:56', NULL),
(965, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 118, 1, 'N', '2018-04-16 20:17:15', NULL),
(966, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 142, 1, 'N', '2018-04-16 20:17:22', NULL),
(967, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 147, 1, 'N', '2018-04-16 20:17:35', NULL),
(968, 1, 1, 'LIKE_COMMENT_ADD', 44, 1, 'N', '2018-04-16 20:17:41', NULL),
(969, 1, 1, 'COMMENT_RECIPE_REMOVE', 72, 1, 'N', '2018-04-16 20:18:03', NULL),
(970, 1, 1, 'COMMENT_RECIPE_REMOVE', 86, 1, 'N', '2018-04-16 20:18:10', NULL),
(971, 1, 1, 'COMMENT_RECIPE_REMOVE', 95, 1, 'N', '2018-04-16 20:18:20', NULL),
(972, 1, 1, 'COMMENT_RECIPE_REMOVE', 96, 1, 'N', '2018-04-16 20:18:38', NULL),
(973, 1, 1, 'COMMENT_RECIPE_REMOVE', 120, 1, 'N', '2018-04-16 20:18:53', NULL),
(974, 1, 1, 'COMMENT_RECIPE_REMOVE', 95, 1, 'N', '2018-04-16 20:19:05', NULL),
(975, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 119, 1, 'N', '2018-04-16 20:22:39', NULL),
(976, 1, 1, 'COMMENT_RECIPE_REMOVE', 76, 1, 'N', '2018-04-16 20:22:58', NULL),
(977, 1, 1, 'COMMENT_RECIPE_ADD', 148, 1, 'N', '2018-04-16 20:23:08', NULL),
(978, 1, 1, 'COMMENT_RECIPE_REMOVE', 90, 1, 'N', '2018-04-16 20:23:16', NULL),
(979, 1, 1, 'COMMENT_RECIPE_ADD', 149, 1, 'N', '2018-04-16 20:29:30', NULL),
(980, 1, 1, 'COMMENT_RECIPE_ADD', 150, 1, 'N', '2018-04-16 20:35:14', NULL),
(981, 1, 1, 'COMMENT_RECIPE_ADD', 151, 1, 'N', '2018-04-16 20:36:01', NULL),
(982, 1, 1, 'COMMENT_RECIPE_ADD', 152, 1, 'N', '2018-04-16 20:38:46', NULL),
(983, 1, 1, 'COMMENT_RECIPE_ADD', 153, 1, 'N', '2018-04-16 20:40:41', NULL),
(984, 1, 1, 'COMMENT_RECIPE_ADD', 154, 1, 'N', '2018-04-16 20:41:42', NULL),
(985, 1, 1, 'COMMENT_RECIPE_ADD', 155, 1, 'N', '2018-04-16 20:41:58', NULL),
(986, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 156, 1, 'N', '2018-04-16 20:49:20', NULL),
(987, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 157, 1, 'N', '2018-04-16 20:49:43', NULL),
(988, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 158, 1, 'N', '2018-04-16 20:49:56', NULL),
(989, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 159, 1, 'N', '2018-04-16 20:50:26', NULL),
(990, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 160, 1, 'N', '2018-04-16 20:50:39', NULL),
(991, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 161, 1, 'N', '2018-04-16 21:00:57', NULL),
(992, 1, 1, 'COMMENT_RECIPE_ADD', 162, 1, 'N', '2018-04-16 21:03:52', NULL),
(993, 1, 1, 'COMMENT_RECIPE_IMG_REMOVE', 147, 1, 'N', '2018-04-16 21:21:36', NULL),
(994, 1, 4, 'COMMENT_RECIPE_ADD', 163, 1, 'N', '2018-04-16 21:27:40', NULL),
(995, 1, 1, 'COMMENT_USER_REMOVE', 163, 1, 'N', '2018-04-16 21:27:47', NULL),
(996, 1, 4, 'COMMENT_RECIPE_ADD', 164, 1, 'N', '2018-04-16 21:27:56', NULL),
(997, 1, 1, 'LIKE_COMMENT_ADD', 45, 1, 'N', '2018-04-16 21:28:00', NULL),
(998, 1, 4, 'COMMENT_RECIPE_ADD', 165, 1, 'N', '2018-04-16 21:28:18', NULL),
(999, 1, 4, 'COMMENT_RECIPE_ADD', 166, 1, 'N', '2018-04-16 21:28:40', NULL),
(1000, 1, 4, 'COMMENT_RECIPE_ADD', 167, 1, 'N', '2018-04-16 21:28:57', NULL),
(1001, 1, 4, 'COMMENT_RECIPE_ADD', 168, 1, 'N', '2018-04-16 21:29:12', NULL),
(1003, 1, 1, 'LIKE_COMMENT_ADD', 46, 1, 'N', '2018-04-16 21:38:35', NULL),
(1004, 1, 1, 'RECIPE_ADD', 129, 1, 'N', '2018-04-22 19:34:02', NULL),
(1005, 1, 1, 'RECIPE_ADD', 130, 1, 'N', '2018-04-22 19:56:50', NULL),
(1006, 1, 1, 'RECIPE_ADD', 131, 1, 'N', '2018-04-22 20:03:11', NULL),
(1007, 1, 1, 'RECIPE_ADD', 135, 1, 'N', '2018-04-22 20:41:38', NULL),
(1012, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-04-23 20:07:25', NULL),
(1013, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-04-23 20:34:52', NULL),
(1014, 1, 1, 'RECIPE_ADD', 147, 1, 'N', '2018-04-23 20:37:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `TRENDS`
--

CREATE TABLE `TRENDS` (
  `TRND_ID` int(11) NOT NULL,
  `TRND_KEY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRND_MSG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_ACTIVE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TRENDS`
--

INSERT INTO `TRENDS` (`TRND_ID`, `TRND_KEY`, `TRND_MSG`, `IS_ACTIVE`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'RECIPES_OF_THE_MONTH', 'RECIPES OF THE MONTH', 'Y', '2018-03-12 00:00:00', NULL),
(2, 'USER_OF_THE_WEEK', 'CHEF OF THE WEEK', 'Y', '2018-03-12 00:00:00', NULL),
(3, 'RECIPE_OF_THE_DAY', 'RECIPE OF THE DAY', 'Y', '2018-03-12 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `TRENDS_ITEM`
--

CREATE TABLE `TRENDS_ITEM` (
  `TRND_ITEM_ID` int(11) NOT NULL,
  `TRND_ID` int(10) NOT NULL,
  `TRND_ITEM_TYPE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRND_ITEM_TYPE_ID` int(10) NOT NULL,
  `IS_ACTIVE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TRENDS_ITEM`
--

INSERT INTO `TRENDS_ITEM` (`TRND_ITEM_ID`, `TRND_ID`, `TRND_ITEM_TYPE`, `TRND_ITEM_TYPE_ID`, `IS_ACTIVE`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 'RECIPE', 105, 'Y', '2018-03-12 00:00:00', NULL),
(2, 1, 'RECIPE', 103, 'Y', '2018-03-12 00:00:00', NULL),
(3, 1, 'RECIPE', 3, 'Y', '2018-03-12 00:00:00', NULL),
(4, 2, 'USER', 1, 'Y', '2018-03-12 00:00:00', NULL),
(5, 3, 'RECIPE', 105, 'Y', '2018-03-12 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `USER_ID` int(11) NOT NULL,
  `NAME` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `VERI_CODE` int(8) NOT NULL,
  `IMG` varchar(50) DEFAULT NULL,
  `MOBILE` varchar(15) DEFAULT NULL,
  `PASSWORD` varchar(25) NOT NULL,
  `GENDER` varchar(1) DEFAULT '',
  `GENDER_SCOPE_ID` int(11) NOT NULL DEFAULT '1',
  `MOBILE_SCOPE_ID` int(11) NOT NULL DEFAULT '1',
  `EMAIL_SCOPE_ID` int(11) NOT NULL DEFAULT '1',
  `RANK_ID` int(11) NOT NULL DEFAULT '1',
  `SSID` varchar(25) DEFAULT NULL,
  `SALT` varchar(25) DEFAULT NULL,
  `VERI_CODE_DTM` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`USER_ID`, `NAME`, `EMAIL`, `VERI_CODE`, `IMG`, `MOBILE`, `PASSWORD`, `GENDER`, `GENDER_SCOPE_ID`, `MOBILE_SCOPE_ID`, `EMAIL_SCOPE_ID`, `RANK_ID`, `SSID`, `SALT`, `VERI_CODE_DTM`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'O\'reilly', 'ajitkamathk@gmail.com', 31516801, 'app_data/users/1/profile/images/5ade274bc7348.jpg', '2456540685', 'Q09PS0VSWXNOS1dJ', 'O', 1, 1, 1, 1, '', 'c05LV0k=', '2018-03-26 19:59:53', '2017-09-23 00:00:00', '2018-04-23 20:34:51'),
(2, 'USER - 2', 'testemail@cookery.com', 0, NULL, '9962218578', 'aWFtdGVzdE15RkJE', 'm', 1, 1, 1, 1, 'BlsXt3B4aS', 'TXlGQkQ=', '2017-12-29 06:29:04', '2017-10-31 05:05:03', '2017-12-31 06:54:52'),
(3, 'USER - 3', 'testemail2@cookery.com', 0, NULL, '7503876065', 'aWFtdGVzdG9TS3Ay', 'm', 1, 1, 1, 1, 'UgbYfiDJNG', 'b1NLcDI=', '2017-12-29 06:29:04', '2017-10-31 05:22:11', NULL),
(4, 'USER - 4', 'vishal@cookery.com', 0, 'app_data/users/99/profile/images/5ab6b3f780f34.jpg', '8124627522', 'cm9jazJaUEtw', 'M', 1, 1, 1, 1, 'zXpcSp5CRx', 'MlpQS3A=', '2017-12-29 06:29:04', '2017-10-31 13:37:06', NULL),
(5, 'USER - 5', 'testuser@gmail.com', 0, NULL, '1234567890', 'MTIzNDU2NzgxNjhjUg==', 'M', 1, 1, 1, 1, '8WGpsX2MsJ', 'MTY4Y1I=', '2017-12-29 06:29:04', '2017-12-05 09:28:53', NULL),
(6, 'USER - 6', 'yOIW8uBUPh@gmail.com', 0, NULL, '8202377734', 'MTIzNDU2Nzh6YUlrYw==', 'M', 1, 1, 1, 1, 'p1DuoOctRT', 'emFJa2M=', '2017-12-29 06:29:04', '2017-12-06 10:09:03', NULL),
(7, 'USER - 7', 'BuaMX1inFJ@gmail.com', 0, NULL, '1434819247', 'MTIzNDU2NzgzeGtreA==', 'M', 1, 1, 1, 1, 'fugYiKnDx8', 'M3hra3g=', '2017-12-29 06:29:04', '2017-12-06 10:17:52', NULL),
(8, 'USER - 8', 'mbTVNucEYo@gmail.com', 0, NULL, '4048666965', 'MTIzNDU2NzhqWW9RRA==', 'M', 1, 1, 1, 1, 'wqzAVyYyJt', 'allvUUQ=', '2017-12-29 06:29:04', '2017-12-06 10:18:40', NULL),
(9, 'Test User', 'mKZ3tT6mDV@gmail.com', 0, NULL, '2463154465', 'MTIzNDU2NzhuV1hOVA==', 'M', 1, 1, 1, 1, '79D6gkz9YL', 'bldYTlQ=', '2017-12-29 06:29:04', '2017-12-06 10:19:12', NULL),
(10, 'Test User', 'yotGl72BQP@gmail.com', 0, NULL, '4706108967', 'MTIzNDU2Nzhna05KRw==', 'M', 1, 1, 1, 1, '10bR1Dhl1v', 'Z2tOSkc=', '2017-12-29 06:29:04', '2017-12-06 10:25:31', NULL),
(11, 'Test User', 'p7gerTEFcK@gmail.com', 0, NULL, '3224967902', 'MTIzNDU2NzhNZHhsWA==', 'M', 1, 1, 1, 1, 'Aa0qpd0dRi', 'TWR4bFg=', '2017-12-29 06:29:04', '2017-12-06 10:26:31', NULL),
(12, 'Test User', '2hdwLAh3Qf@gmail.com', 0, NULL, '1122780923', 'MTIzNDU2NzhhU1VXMQ==', 'M', 1, 1, 1, 1, 'kZQae7t6VP', 'YVNVVzE=', '2017-12-29 06:29:04', '2017-12-06 10:32:19', NULL),
(13, 'Test User', '1ur6aieyL4@gmail.com', 0, NULL, '7568342541', 'UkZ3azZVRGJRNlE2SXpx', 'M', 1, 1, 1, 1, 'efESK2GWwx', 'UTZJenE=', '2017-12-29 06:29:04', '2017-12-06 10:36:54', NULL),
(14, 'USER - 14', 'DyBbMIg3hW@gmail.com', 0, NULL, '6397083418', 'MzZnMUR2dnFJODhmclFj', 'M', 1, 1, 1, 1, 'j5uaOopyRB', 'OGZyUWM=', '2017-12-29 06:29:04', '2017-12-06 10:38:49', NULL),
(15, 'USER - 15', 'Ch0C1oJCgP@gmail.com', 0, NULL, '1236028204', 'bTh5RTNEY203Y0d3ODBR', 'M', 1, 1, 1, 1, '1cwiaP2xsA', 'R3c4MFE=', '2017-12-29 06:29:04', '2017-12-06 10:42:08', NULL),
(16, 'Test User', 'ZfhzXsEz5X@gmail.com', 0, NULL, '0328880787', 'T0ZMSUpkYm1sTTBsRDJi', 'M', 1, 1, 1, 1, 'XVLEHSZm7U', 'MGxEMmI=', '2017-12-29 06:29:04', '2017-12-06 10:43:00', NULL),
(17, 'Test User', 'RX631Oc74f@gmail.com', 0, NULL, '1925274231', 'ZFVURk1SM1Z6ek9sckpo', 'M', 1, 1, 1, 1, 'FkQwv4DZaz', 'T2xySmg=', '2017-12-29 06:29:04', '2017-12-06 15:20:07', NULL),
(18, 'Test User', 'Nq2ieecBym@gmail.com', 0, NULL, '9071819562', 'WGdETmlpdjRHQnMxNGVD', 'M', 1, 1, 1, 1, 'lO8HfQ826L', 'czE0ZUM=', '2017-12-29 06:29:04', '2017-12-06 21:06:19', NULL),
(19, 'Test User', 'jj5eAEXfU9@gmail.com', 0, NULL, '4282843437', 'M3VEOVJDaHFWV056OUxu', 'M', 1, 1, 1, 1, 'hmMUs3e1cd', 'Tno5TG4=', '2017-12-29 06:29:04', '2017-12-06 21:19:07', NULL),
(20, 'Test User', '29LcdlnLKf@gmail.com', 0, NULL, '4345019328', 'SmdQc29VUlREVFVSYk1B', 'M', 1, 1, 1, 1, 'oCThqOWUsW', 'VVJiTUE=', '2017-12-29 06:29:04', '2017-12-06 21:19:07', NULL),
(21, 'Test User', 'gUl84sC85i@gmail.com', 0, NULL, '7493439821', 'NjZBeVM5OVpQRjZGTHZ3', 'M', 1, 1, 1, 1, 'V5RuFN3DlM', 'NkZMdnc=', '2017-12-29 06:29:04', '2017-12-06 21:19:07', NULL),
(22, 'Test User', 'hOpulyUcvN@gmail.com', 0, NULL, '2551728778', 'YlpsYWo2QUNkazhsQWlq', 'M', 1, 1, 1, 1, 'I3icXGGgbT', 'OGxBaWo=', '2017-12-29 06:29:04', '2017-12-06 21:19:08', NULL),
(23, 'Test User', 'bMfjcgsHmB@gmail.com', 0, NULL, '8788910625', 'ZjdVQjNWbjhZQkdSTlBT', 'M', 1, 1, 1, 1, 'sLtY3DO5bg', 'R1JOUFM=', '2017-12-29 06:29:04', '2017-12-06 21:19:08', NULL),
(24, 'Test User', 'gzzvd5mHzV@gmail.com', 0, NULL, '2459219942', 'd1ZDSmpndk1uMHJkZWZY', 'M', 1, 1, 1, 1, '3NAeFBSWWU', 'cmRlZlg=', '2017-12-29 06:29:04', '2017-12-06 21:19:08', NULL),
(25, 'Test User', 'CFAXHpPwUd@gmail.com', 0, NULL, '7921299722', 'YzVhdnpDVDlmZ05PV1pB', 'M', 1, 1, 1, 1, 'UDzOV0DRU5', 'Tk9XWkE=', '2017-12-29 06:29:04', '2017-12-07 11:32:54', NULL),
(26, 'Test User', 'eEfVEJrxIX@gmail.com', 0, NULL, '3499450811', 'bXRKSUxSNzROdFI1N1Ay', 'M', 1, 1, 1, 1, 'w50UEdmk58', 'UjU3UDI=', '2017-12-29 06:29:04', '2017-12-07 11:54:15', NULL),
(27, 'Test User', '4OjqajUs9g@gmail.com', 0, NULL, '1150903063', 'TXFidlN1czNlYTVyVWpI', 'M', 1, 1, 1, 1, 'x3o7h3JaZG', 'NXJVakg=', '2017-12-29 06:29:04', '2017-12-07 12:05:22', NULL),
(28, 'Test User', 'lpZngIZUKY@gmail.com', 0, NULL, '7172558694', 'Q1I5dXJ2TXFLb1FqSXlU', 'M', 1, 1, 1, 1, 'oKM3Cw6itC', 'UWpJeVQ=', '2017-12-29 06:29:04', '2017-12-07 12:22:14', NULL),
(29, 'Test User', 'Qanx1xZlef@gmail.com', 0, NULL, '6077018106', 'QzZTdDVNNWdiR2FVU3Fx', 'M', 1, 1, 1, 1, 'LuHOy11sWR', 'YVVTcXE=', '2017-12-29 06:29:04', '2017-12-07 12:22:14', NULL),
(30, 'Test User', 'PE5XKyFRTO@gmail.com', 0, NULL, '6856612574', 'RW5vWmRMZmVhM0lXYU5h', 'M', 1, 1, 1, 1, '37bbOr2Xt8', 'SVdhTmE=', '2017-12-29 06:29:04', '2017-12-07 12:22:14', NULL),
(31, 'Test User', 'rQnpbdgL71@gmail.com', 0, NULL, '9396035651', 'cndnV1hWOWlVck5UV2ZL', 'M', 1, 1, 1, 1, 'WBoqMdPcLG', 'TlRXZks=', '2017-12-29 06:29:04', '2017-12-07 12:22:14', NULL),
(32, 'Test User', 'ztfSEk6B3C@gmail.com', 0, NULL, '7311704009', 'dWs3UklOeXM4S1BuUEFT', 'M', 1, 1, 1, 1, '9uY0ZDN2g9', 'UG5QQVM=', '2017-12-29 06:29:04', '2017-12-07 12:22:15', NULL),
(33, 'Test User', 'lYoRhb8ZBf@gmail.com', 0, NULL, '8451165685', 'b0YxZG1GckhES2R3M0Zn', 'M', 1, 1, 1, 1, 'Dudt0IxEHI', 'ZHczRmc=', '2017-12-29 06:29:04', '2017-12-07 12:22:15', NULL),
(34, 'Test User', '3H5vt92ouL@gmail.com', 0, NULL, '8549161982', 'T2w2TUhiMHBSamxNWFQ3', 'M', 1, 1, 1, 1, 'DCmE3MR3ZJ', 'bE1YVDc=', '2017-12-29 06:29:04', '2017-12-07 15:01:26', NULL),
(35, 'Test User', '4T1Z4vzjCH@gmail.com', 0, NULL, '2209997550', 'dG81cVdlWkhmMVBncmJU', 'M', 1, 1, 1, 1, 'lSnjYx9Yr3', 'UGdyYlQ=', '2017-12-29 06:29:04', '2017-12-07 15:01:39', NULL),
(36, 'Test User', '5M7QIvAVFd@gmail.com', 0, NULL, '2978043429', 'bGs2cjFLdnhEa2JSd1pH', 'M', 1, 1, 1, 1, 'k81O74sVaE', 'YlJ3Wkc=', '2017-12-29 06:29:04', '2017-12-07 15:01:46', NULL),
(37, 'Test User', 'gyhxa6lCeN@gmail.com', 0, NULL, '1449887458', 'RE9jMUR2SEZ5S2w0eXBK', 'M', 1, 1, 1, 1, 'oCaB5bkDQ1', 'bDR5cEo=', '2017-12-29 06:29:04', '2017-12-07 15:02:15', NULL),
(38, 'Test User', 'JcEK2zoeFr@gmail.com', 0, NULL, '5028518859', 'c2NrelhQc25XYkthRmx0', 'M', 1, 1, 1, 1, '8XOraL8Q2k', 'S2FGbHQ=', '2017-12-29 06:29:04', '2017-12-07 15:02:21', NULL),
(39, 'Test User', 'kTWUUMdona@gmail.com', 0, NULL, '6701341132', 'ZTMyZDVxcWo3U0xWYUlV', 'M', 1, 1, 1, 1, 'Relr2grF7m', 'TFZhSVU=', '2017-12-29 06:29:04', '2017-12-07 15:12:20', NULL),
(40, 'Test User', 'G5tTSHpBzo@gmail.com', 0, NULL, '9785956975', 'dzFCWWxQeEdLUkJibTVl', 'M', 1, 1, 1, 1, 'eGAnNJuj2Z', 'QmJtNWU=', '2017-12-29 06:29:04', '2017-12-09 02:31:36', NULL),
(41, 'Test User', 'szP8OEFT2Y@gmail.com', 0, NULL, '8418273261', 'VjlrM0VHSFhxQmJic3JS', 'M', 1, 1, 1, 1, 'fGjcdciQF7', 'YmJzclI=', '2017-12-29 06:29:04', '2017-12-09 02:31:36', NULL),
(42, 'Test User', 'iUOPvHMUHU@gmail.com', 0, NULL, '3981859004', 'Y2RZTFhXSTFPdDU5Yzk1', 'M', 1, 1, 1, 1, 'yvbV3rhwBp', 'NTljOTU=', '2017-12-29 06:29:04', '2017-12-09 02:31:37', NULL),
(43, 'Test User', 'm83W2E74ml@gmail.com', 0, NULL, '8988125485', 'dHZxVWVBTDNRQ2xWR0hp', 'M', 1, 1, 1, 1, 'nokluy1nr8', 'bFZHSGk=', '2017-12-29 06:29:04', '2017-12-09 02:31:37', NULL),
(44, 'Test User', 'u5dK9mDKc3@gmail.com', 0, NULL, '9466253586', 'M1IzamhwSXdXeWIwVGVF', 'M', 1, 1, 1, 1, 's1VUX7txJV', 'YjBUZUU=', '2017-12-29 06:29:04', '2017-12-09 02:31:38', NULL),
(45, 'Test User', 'AJ3uHtwFi5@gmail.com', 0, NULL, '5933337509', 'S3d2NUVKbTg4Q2oyM0c3', 'M', 1, 1, 1, 1, 'wsk7P8QkrS', 'ajIzRzc=', '2017-12-29 06:29:04', '2017-12-09 03:04:14', NULL),
(46, 'Test User', '2D3knF59UH@gmail.com', 0, NULL, '8031776077', 'V25yVFhjekVLZWhkRnVj', 'M', 1, 1, 1, 1, 'XQSDDW2AUH', 'aGRGdWM=', '2017-12-29 06:29:04', '2017-12-12 15:30:27', NULL),
(47, 'Test User', 'bxy59Uozgv@gmail.com', 0, NULL, '3311571135', 'czBURzFjd2JMVEo0ZTFP', 'M', 1, 1, 1, 1, 'zervzzZPzM', 'SjRlMU8=', '2017-12-29 06:29:04', '2017-12-13 15:38:42', NULL),
(48, 'Test User', 'BnjETSM2Ce@gmail.com', 0, NULL, '7804938640', 'T2VDaVkzTEFwOThEZWZv', 'M', 1, 1, 1, 1, '9grxmxpmhZ', 'OERlZm8=', '2017-12-29 06:29:04', '2017-12-14 11:01:33', NULL),
(49, 'Test User', 'mqTJxCGpka@gmail.com', 0, NULL, '1202368274', 'bHdOdUpDMDJacEVtYzVt', 'M', 1, 1, 1, 1, 'atlgH3L0ph', 'RW1jNW0=', '2017-12-29 06:29:04', '2017-12-15 15:02:05', NULL),
(50, 'Test User', 'xOUqRp2oZN@gmail.com', 0, NULL, '0402232131', 'S1FsSHNoVXpmN3Y3dHRR', 'M', 1, 1, 1, 1, 'CrZF7envK9', 'djd0dFE=', '2017-12-29 06:29:04', '2017-12-16 22:48:35', NULL),
(51, 'Test User', 'ndjriWzSBw@gmail.com', 0, NULL, '7597298013', 'a1JIVmZLZnhCSWduRHBH', 'M', 1, 1, 1, 1, 'STYGY8xzwl', 'Z25EcEc=', '2017-12-29 06:29:04', '2017-12-17 14:22:14', NULL),
(52, 'Test User', 'zCIHqiEg2k@gmail.com', 0, NULL, '9176520834', 'ODRiRWhtSjRzVlJ3c292', 'M', 1, 1, 1, 1, '1EoMyTgiDT', 'Undzb3Y=', '2017-12-29 06:29:04', '2017-12-17 19:39:15', NULL),
(53, 'Test User', 'e0vTB20CNI@gmail.com', 0, NULL, '7795599808', 'Q1dNN3JDbGd5b0F6M2RU', 'M', 1, 1, 1, 1, 'rr3qhhYTGl', 'QXozZFQ=', '2017-12-29 06:29:04', '2017-12-18 09:53:36', NULL),
(54, 'Test User', 'cGHi8zJir7@gmail.com', 0, NULL, '1344784955', 'YW5NOXlvYnVINDJ1U3dY', 'M', 1, 1, 1, 1, 'MQlMvt0SZK', 'MnVTd1g=', '2017-12-29 06:29:04', '2017-12-18 10:10:43', NULL),
(55, 'Test User', '1eitY1tUdB@gmail.com', 0, NULL, '3091295174', 'dGVOcm9CZVhCc0ZjbGRx', 'M', 1, 1, 1, 1, 'jXGYOyuPYb', 'RmNsZHE=', '2017-12-29 06:29:04', '2017-12-18 15:54:48', NULL),
(56, 'Test User', 'iG3S1XhetD@gmail.com', 0, NULL, '1376574609', 'SVJzZW14ZlU1TTE3N1l0', 'M', 1, 1, 1, 1, 'w7Wtdm6Hnt', 'MTc3WXQ=', '2017-12-29 06:29:04', '2017-12-19 19:58:01', NULL),
(57, 'Test User', 'u1STMAbyKf@gmail.com', 0, NULL, '0182983869', 'dTNOS1ZPdWpLNEl5djZ6', 'M', 1, 1, 1, 1, 'jHia9CKnAj', 'SXl2Nno=', '2017-12-29 06:29:04', '2017-12-21 09:26:46', NULL),
(58, 'Test User', 'bIOX9zJiqh@gmail.com', 0, NULL, '0494893380', 'YVBSY0ljTDdpZWtkd2FY', 'M', 1, 1, 1, 1, 'buW2OLC4kD', 'a2R3YVg=', '2017-12-29 06:29:04', '2017-12-28 09:23:09', NULL),
(59, 'Test User', 'tmnJJQY6NW@gmail.com', 0, NULL, '6176779264', 'M0xFSWpCSjVjOGUxaksz', 'M', 1, 1, 1, 1, 'FwBucTafMt', 'ZTFqSzM=', '2017-12-29 07:14:50', '2017-12-29 07:14:50', NULL),
(60, 'Test User', '83JuYpN2mR@gmail.com', 0, NULL, '7301820168', 'bmZ3cG15d0FjTTBhRVlW', 'M', 1, 1, 1, 1, 'OK50R4fzFj', 'MGFFWVY=', '2017-12-29 07:38:05', '2017-12-29 07:38:05', NULL),
(61, 'Test User', 'Am8gZZWHa3@gmail.com', 0, NULL, '8114166397', 'TmpiMjNTd3NyRjRwV0Nw', 'M', 1, 1, 1, 1, 'osaJRbEWK5', 'NHBXQ3A=', '2017-12-29 08:30:55', '2017-12-29 08:30:55', NULL),
(62, 'Test User', 'w9ZiyCBczv@gmail.com', 38158294, NULL, '3575891040', 'Z1d3Z2o4MnBXUnNlZHB0', 'M', 1, 1, 1, 1, '9ElEB5ILF0', 'c2VkcHQ=', '2017-12-29 16:52:50', '2017-12-29 16:52:50', NULL),
(63, 'COOKERY', 'mEmve9D2D6@gmail.com', 14708985, NULL, NULL, 'NDUzNDY0ODQ5NHNFQjI0', NULL, 1, 1, 1, 1, '4YfRLcdJ2J', 'c0VCMjQ=', '2017-12-30 09:53:23', '2017-12-30 09:53:23', NULL),
(64, 'Test User -  08', 'DkuyWf4vOz@gmail.com', 88859188, NULL, NULL, 'Q09PS0VSWVJzSGlv', NULL, 1, 1, 1, 1, '0rqwzKv526', 'UnNIaW8=', '2017-12-30 09:55:20', '2017-12-30 09:55:20', NULL),
(65, 'Test User -  08', '2usvcVlzb6@gmail.com', 55039142, NULL, NULL, 'Q09PS0VSWVR2SzNK', '', 1, 1, 1, 1, '7bzJJtwkqG', 'VHZLM0o=', '2018-01-01 11:23:18', '2018-01-01 11:23:18', NULL),
(66, 'Test User -  00', 'aMJUvZ4CM5@gmail.com', 49645219, NULL, NULL, 'Q09PS0VSWU9QOXlG', '', 1, 1, 1, 1, 'qeAtZdPW3D', 'T1A5eUY=', '2018-01-18 14:23:33', '2018-01-18 14:23:33', NULL),
(67, 'Vishal', 'rock@cookery.com', 64728213, NULL, NULL, 'cm9ja21uYkhY', '', 1, 1, 1, 1, '5pX9Gn9wlB', 'bW5iSFg=', '2018-01-29 23:34:52', '2018-01-29 23:34:52', NULL),
(68, 'Test User -  82', 'LVcQblpRQe@gmail.com', 61232494, NULL, NULL, 'Q09PS0VSWUVjQVQw', '', 1, 1, 1, 1, 'jXPnTiVFMf', 'RWNBVDA=', '2018-02-15 10:44:56', '2018-02-15 10:44:56', NULL),
(69, 'Agv', 'hgvj@gmail.com', 69125900, NULL, NULL, 'Z2d2a3Z2RVE3b0E=', '', 1, 1, 1, 1, 'uJvTObPp7A', 'RVE3b0E=', '2018-03-10 22:10:58', '2018-03-10 22:10:58', NULL),
(70, 'Tfgg jgffyh', 'fug@gmail.com', 9425499, NULL, NULL, 'ZnVqZ2d5ZnhlSjJpQQ==', '', 1, 1, 1, 1, 'Vrvva2vx91', 'ZUoyaUE=', '2018-03-10 22:12:33', '2018-03-10 22:12:33', NULL),
(75, 'Vishal Varshney', 'mywayanadtrip2017@gmail.com', 1927904, NULL, NULL, 'Y29va2VyeWd2bVoy', '', 1, 1, 1, 1, 'WXRIvJHkbV', 'Z3ZtWjI=', '2018-03-11 01:01:30', '2018-03-11 01:01:30', NULL),
(76, 'Vishal', 'user@cookery.com', 34117358, NULL, NULL, 'dXNlckVYN21z', '', 1, 1, 1, 1, 'fRcKbiUBxo', 'RVg3bXM=', '2018-03-18 17:09:16', '2018-03-18 17:09:16', NULL),
(77, 'Vishal', 'vishal@yahoo.com', 51277786, NULL, NULL, 'eWFob29pRVhaZA==', '', 1, 1, 1, 1, 'vF4kvKZfJE', 'aUVYWmQ=', '2018-03-24 22:01:24', '2018-03-24 22:01:24', NULL),
(78, 'Vishal', 'vaihal@hotmail.com', 2934660, NULL, NULL, 'aG90bWFpbDZQTTlk', '', 1, 1, 1, 1, 'SPqzQm5C7j', 'NlBNOWQ=', '2018-03-24 22:04:05', '2018-03-24 22:04:05', NULL),
(79, 'Vishal', 'lobik@hotmail.com', 65164111, NULL, NULL, 'aG90bWFpbHFVVHJs', '', 1, 1, 1, 1, '0Pnxh3lKdH', 'cVVUcmw=', '2018-03-24 22:12:20', '2018-03-24 22:12:20', NULL),
(80, 'Vishal', 'twst@outlook.com', 86337830, NULL, NULL, 'b3V0bG9va0pWV25N', '', 1, 1, 1, 1, 'LTSNS9rrGz', 'SlZXbk0=', '2018-03-24 22:19:26', '2018-03-24 22:19:26', NULL),
(81, 'Vishal', 'emial@gmail.com', 66912922, NULL, NULL, 'Z21haWxvdUNCYg==', '', 1, 1, 1, 1, 'THPQdIIyhh', 'b3VDQmI=', '2018-03-24 22:28:01', '2018-03-24 22:28:01', NULL),
(82, 'Vishal', 'email@gmail.com', 87603266, NULL, NULL, 'Z21haWw0WmJHRw==', '', 1, 1, 1, 1, 'BbQBQeEEJH', 'NFpiR0c=', '2018-03-24 22:31:31', '2018-03-24 22:31:31', NULL),
(83, 'Tigrr', 'yirrg@gjvgm.vom', 81381558, NULL, NULL, 'dGlnZXJiWjlwRQ==', '', 1, 1, 1, 1, 'AKMEuM8koj', 'Ylo5cEU=', '2018-03-24 22:32:53', '2018-03-24 22:32:53', NULL),
(84, 'Vishal ', 'test@cookerymail.com', 35775628, NULL, NULL, 'Y29va2VyeW1haWxqSENuMw==', '', 1, 1, 1, 1, 'K3ys39vWal', 'akhDbjM=', '2018-03-24 22:46:28', '2018-03-24 22:46:28', NULL),
(87, 'Test User -  79', 'ajitkamathk@gmail.com', 42703034, NULL, NULL, 'Q09PS0VSWVZiOG9V', '', 1, 1, 1, 1, 'guyQJdehaK', 'VmI4b1U=', '2018-03-25 10:06:17', '2018-03-25 10:06:17', NULL),
(88, 'Vishal', 'cook@gmail.com', 15957800, NULL, NULL, 'Y29vazl4aTNP', '', 1, 1, 1, 1, 'TxedRplew3', 'OXhpM08=', '2018-03-25 19:37:24', '2018-03-25 19:37:24', NULL),
(100, 'Vishal', 'vishal@cookery.in', 9117251, NULL, NULL, 'cm9ja05kY0hx', '', 1, 1, 1, 1, 'LEPjx6giWX', 'TmRjSHE=', '2018-03-27 23:41:21', '2018-03-27 23:41:21', NULL),
(110, 'Vaibhav', 'vaibhavagrawal.ece09@gmail.com', 0, NULL, NULL, 'ODg5OTA5OGR3UjZZ', '', 1, 1, 1, 1, 'ApAd1j4RD1', 'ZHdSNlk=', '2018-04-02 21:01:41', '2018-04-02 21:01:41', NULL),
(111, 'Sukanta Mondal', 'sukanta.suku19@gmail.com', 0, NULL, NULL, 'VGVzdDEyM0lpVERD', '', 1, 1, 1, 1, 'gNW1piOCIR', 'SWlUREM=', '2018-04-04 11:07:48', '2018-04-04 11:07:48', NULL),
(112, 'Vishal', 'dial2vishal@gmail.com', 0, NULL, NULL, 'cm9ja0lXUnV3', '', 1, 1, 1, 1, 'LcKqFOxrvf', 'SVdSdXc=', '2018-04-14 16:32:54', '2018-04-14 16:32:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `USER_ING_LIST`
--

CREATE TABLE `USER_ING_LIST` (
  `USER_ING_LIST_ID` int(11) NOT NULL,
  `ING_LIST_NAME` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` int(10) NOT NULL,
  `IS_DEL` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `ING_AKA_ID` int(10) NOT NULL,
  `USER_ING_LIST_ID` int(10) NOT NULL,
  `IS_CHECKED` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `USER_ING_LIST_ITEM`
--

INSERT INTO `USER_ING_LIST_ITEM` (`USER_ING_LIST_ITEM_ID`, `ING_AKA_ID`, `USER_ING_LIST_ID`, `IS_CHECKED`, `CREATE_DTM`, `MOD_DTM`) VALUES
(27, 2, 21, 'N', '2017-12-30 13:58:08', '2017-12-30 13:58:08'),
(28, 1, 21, 'N', '2017-12-30 13:58:08', '2017-12-30 13:58:08'),
(29, 4, 21, 'N', '2017-12-30 13:58:08', '2017-12-30 13:58:08'),
(32, 7, 25, 'N', '2017-12-30 14:36:23', '2017-12-30 14:36:23'),
(33, 8, 25, 'N', '2017-12-30 14:36:23', '2017-12-30 14:36:23'),
(34, 9, 26, 'N', '2017-12-30 14:38:49', '2017-12-30 14:38:49'),
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
(54, 8, 31, 'N', '2018-01-07 14:55:04', '2018-01-07 14:55:04'),
(55, 11, 31, 'N', '2018-01-07 14:55:04', '2018-01-07 14:55:04'),
(89, 15, 32, 'N', '2018-01-12 23:54:48', '2018-01-12 23:54:48'),
(91, 19, 33, 'N', '2018-01-14 00:23:12', '2018-01-14 00:23:12'),
(92, 2, 31, 'N', '2018-02-03 14:32:09', '2018-02-03 14:32:09'),
(98, 8, 30, 'N', '2018-02-09 16:17:45', '2018-02-09 16:17:45'),
(99, 8, 30, 'N', '2018-02-09 16:17:45', '2018-02-09 16:17:45'),
(100, 8, 30, 'N', '2018-02-09 16:17:45', '2018-02-09 16:17:45');

-- --------------------------------------------------------

--
-- Table structure for table `USER_RELATIONSHIP`
--

CREATE TABLE `USER_RELATIONSHIP` (
  `RLT_ID` int(15) NOT NULL,
  `FLWR_USER_ID` int(15) NOT NULL,
  `FLWS_USER_ID` int(15) NOT NULL,
  `IS_DEL` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `USER_RELATIONSHIP`
--

INSERT INTO `USER_RELATIONSHIP` (`RLT_ID`, `FLWR_USER_ID`, `FLWS_USER_ID`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 2, 'N', '2017-12-27 08:20:02', '2018-03-26 18:36:12'),
(2, 1, 3, 'Y', '2017-12-27 08:27:22', '2018-02-15 10:47:36'),
(3, 1, 4, 'N', '2018-01-08 08:37:17', '2018-03-26 19:18:13'),
(4, 1, 8, 'N', '2018-01-08 08:37:24', NULL),
(5, 1, 15, 'N', '2018-01-08 08:37:56', NULL),
(6, 1, 14, 'N', '2018-01-08 08:38:08', NULL),
(17, 4, 5, 'N', '2018-01-08 09:05:36', NULL),
(19, 3, 4, 'N', '2018-01-08 09:07:23', '2018-01-08 09:08:04'),
(20, 2, 3, 'N', '2018-01-08 16:14:30', '2018-01-11 08:29:10'),
(21, 3, 1, 'N', '2018-01-08 16:14:45', NULL),
(22, 5, 1, 'N', '2018-01-08 16:14:54', NULL),
(23, 6, 1, 'N', '2018-01-08 16:15:02', NULL),
(24, 8, 1, 'N', '2018-01-08 16:15:07', NULL),
(25, 100, 1, 'N', '2018-03-28 00:05:56', NULL);

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
(8, 3, 4, '2017-12-05 18:40:07', NULL),
(9, 1, 3, '2017-12-06 16:01:57', NULL),
(11, 1, 103, '2017-12-13 18:13:18', NULL),
(12, 1, 105, '2018-03-18 15:18:28', NULL),
(13, 100, 116, '2018-03-27 23:46:53', NULL),
(14, 100, 105, '2018-03-27 23:47:50', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ABOUT_US`
--
ALTER TABLE `ABOUT_US`
  ADD UNIQUE KEY `ABOUT_US_ID_INDEX` (`ABOUT_US_ID`);

--
-- Indexes for table `ADMIN_USER`
--
ALTER TABLE `ADMIN_USER`
  ADD PRIMARY KEY (`ADMIN_USER_ID`);

--
-- Indexes for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD PRIMARY KEY (`COM_ID`),
  ADD KEY `RCP_ID` (`TYPE_ID`),
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
  ADD KEY `DISH_FK1` (`QTY_ID`),
  ADD KEY `DISH_FK2` (`ING_AKA_ID`);

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
  ADD PRIMARY KEY (`ING_ID`),
  ADD KEY `INGREDIENT_FK1` (`ING_CAT_ID`);

--
-- Indexes for table `ING_AKA`
--
ALTER TABLE `ING_AKA`
  ADD PRIMARY KEY (`ING_AKA_ID`),
  ADD KEY `ING_AKA_FK1` (`ING_ID`);

--
-- Indexes for table `ING_CATEGORIES`
--
ALTER TABLE `ING_CATEGORIES`
  ADD PRIMARY KEY (`ING_CAT_ID`);

--
-- Indexes for table `ING_IMAGES`
--
ALTER TABLE `ING_IMAGES`
  ADD PRIMARY KEY (`ING_IMG_ID`),
  ADD KEY `ING_IMAGES_FK1` (`ING_ID`);

--
-- Indexes for table `LIKES`
--
ALTER TABLE `LIKES`
  ADD PRIMARY KEY (`LIKE_ID`),
  ADD UNIQUE KEY `USER_ID_2` (`USER_ID`,`TYPE`,`TYPE_ID`),
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
-- Indexes for table `TRENDS`
--
ALTER TABLE `TRENDS`
  ADD PRIMARY KEY (`TRND_ID`);

--
-- Indexes for table `TRENDS_ITEM`
--
ALTER TABLE `TRENDS_ITEM`
  ADD PRIMARY KEY (`TRND_ITEM_ID`),
  ADD KEY `TRENDS_ITEM_FK1` (`TRND_ID`);

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
  ADD KEY `ING_ID` (`ING_AKA_ID`),
  ADD KEY `ING_ID_2` (`ING_AKA_ID`);

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
-- AUTO_INCREMENT for table `ABOUT_US`
--
ALTER TABLE `ABOUT_US`
  MODIFY `ABOUT_US_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ADMIN_USER`
--
ALTER TABLE `ADMIN_USER`
  MODIFY `ADMIN_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  MODIFY `COM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `CONTAINS`
--
ALTER TABLE `CONTAINS`
  MODIFY `CONT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `DISH`
--
ALTER TABLE `DISH`
  MODIFY `DISH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `FAVOURITES`
--
ALTER TABLE `FAVOURITES`
  MODIFY `FAV_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `FOOD_CUISINE`
--
ALTER TABLE `FOOD_CUISINE`
  MODIFY `FOOD_CSN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `FOOD_TYPE`
--
ALTER TABLE `FOOD_TYPE`
  MODIFY `FOOD_TYP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `INGREDIENT`
--
ALTER TABLE `INGREDIENT`
  MODIFY `ING_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `ING_AKA`
--
ALTER TABLE `ING_AKA`
  MODIFY `ING_AKA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `ING_CATEGORIES`
--
ALTER TABLE `ING_CATEGORIES`
  MODIFY `ING_CAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ING_IMAGES`
--
ALTER TABLE `ING_IMAGES`
  MODIFY `ING_IMG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `LIKES`
--
ALTER TABLE `LIKES`
  MODIFY `LIKE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `MILESTONE`
--
ALTER TABLE `MILESTONE`
  MODIFY `MLT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `QTY`
--
ALTER TABLE `QTY`
  MODIFY `QTY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `RANK`
--
ALTER TABLE `RANK`
  MODIFY `RANK_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `RECIPE`
--
ALTER TABLE `RECIPE`
  MODIFY `RCP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `RECIPE_CONTAINS`
--
ALTER TABLE `RECIPE_CONTAINS`
  MODIFY `RCP_CONT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RECIPE_IMG`
--
ALTER TABLE `RECIPE_IMG`
  MODIFY `RCP_IMG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `RECIPE_STEPS`
--
ALTER TABLE `RECIPE_STEPS`
  MODIFY `RCP_STPS_ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `RECIPE_TASTE`
--
ALTER TABLE `RECIPE_TASTE`
  MODIFY `RCP_TST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=455;

--
-- AUTO_INCREMENT for table `REVIEWS`
--
ALTER TABLE `REVIEWS`
  MODIFY `REV_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `TMLN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1015;

--
-- AUTO_INCREMENT for table `TRENDS`
--
ALTER TABLE `TRENDS`
  MODIFY `TRND_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `TRENDS_ITEM`
--
ALTER TABLE `TRENDS_ITEM`
  MODIFY `TRND_ITEM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `USER_ING_LIST`
--
ALTER TABLE `USER_ING_LIST`
  MODIFY `USER_ING_LIST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `USER_ING_LIST_ITEM`
--
ALTER TABLE `USER_ING_LIST_ITEM`
  MODIFY `USER_ING_LIST_ITEM_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `USER_RELATIONSHIP`
--
ALTER TABLE `USER_RELATIONSHIP`
  MODIFY `RLT_ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `VIEWS`
--
ALTER TABLE `VIEWS`
  MODIFY `VIEW_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
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
  ADD CONSTRAINT `DISH_FK1` FOREIGN KEY (`QTY_ID`) REFERENCES `QTY` (`qty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `DISH_FK2` FOREIGN KEY (`ING_AKA_ID`) REFERENCES `ING_AKA` (`ing_aka_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `FAVOURITES`
--
ALTER TABLE `FAVOURITES`
  ADD CONSTRAINT `RCP_FAV_FK` FOREIGN KEY (`RCP_ID`) REFERENCES `RECIPE` (`rcp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `USER_FAV_FK` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `INGREDIENT`
--
ALTER TABLE `INGREDIENT`
  ADD CONSTRAINT `INGREDIENT_FK1` FOREIGN KEY (`ING_CAT_ID`) REFERENCES `ING_CATEGORIES` (`ing_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ING_AKA`
--
ALTER TABLE `ING_AKA`
  ADD CONSTRAINT `ING_AKA_FK1` FOREIGN KEY (`ING_ID`) REFERENCES `INGREDIENT` (`ing_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ING_IMAGES`
--
ALTER TABLE `ING_IMAGES`
  ADD CONSTRAINT `ING_IMAGES_FK1` FOREIGN KEY (`ING_ID`) REFERENCES `INGREDIENT` (`ing_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `TRENDS_ITEM`
--
ALTER TABLE `TRENDS_ITEM`
  ADD CONSTRAINT `TRENDS_ITEM_FK1` FOREIGN KEY (`TRND_ID`) REFERENCES `TRENDS` (`trnd_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `ING_FK` FOREIGN KEY (`ING_AKA_ID`) REFERENCES `INGREDIENT` (`ing_id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
