-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 13, 2018 at 05:03 PM
-- Server version: 8.0.11
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cookery`
--

-- --------------------------------------------------------

--
-- Table structure for table `ADMIN_USER`
--

CREATE TABLE `ADMIN_USER` (
  `ADMIN_USER_ID` int(11) NOT NULL,
  `ADMIN_USER_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_USER_PASSWORD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_USER_ROLE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_USER_MOBILE` bigint(20) NOT NULL,
  `ADMIN_USER_EMAIL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DEL` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ADMIN_USER`
--

INSERT INTO `ADMIN_USER` (`ADMIN_USER_ID`, `ADMIN_USER_NAME`, `ADMIN_USER_PASSWORD`, `ADMIN_USER_ROLE`, `ADMIN_USER_MOBILE`, `ADMIN_USER_EMAIL`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'vishal', 'cm9jaw==', 'Admin', 7448145685, 'dial2vishal@gmail.com', 'N', '2018-04-22 00:44:40', '2018-04-22 00:44:40'),
(2, 'test', 'dGVzdA==', 'Employee', 9962218577, 'vishalva06@gmail.com', 'N', '2018-04-22 00:45:27', '2018-04-22 01:59:27'),
(3, 'Ajit', 'Y29va2VyeQ==', 'Admin', 9884463437, 'ajitkamathk@gmail.com', 'N', '2018-05-08 23:24:08', '2018-05-08 23:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `AUDIT`
--

CREATE TABLE `AUDIT` (
  `AUDIT_ID` int(11) NOT NULL,
  `CLNT_ID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CLNT_IP_ADD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `API_KEY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLNT_OS` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLNT_BROWSER` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HTTP_STAT_CD` int(5) DEFAULT NULL,
  `FUNC_KEY` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COUNTRY` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CITY` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESPONSE_TIME` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATE_DTM` timestamp NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AUDIT`
--

INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-24 14:59:02', NULL),
(2, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', NULL, '2018-04-24 15:10:49', NULL),
(3, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', NULL, '2018-04-24 15:10:51', NULL),
(4, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-24 15:11:14', NULL),
(5, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', NULL, '2018-04-24 15:11:21', NULL),
(6, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', NULL, '2018-04-24 15:11:23', NULL),
(7, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'Unknown Browser', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:05:56', NULL),
(8, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'Unknown Browser', 200, 'FOOD_TYPE_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:05:59', NULL),
(9, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'Unknown Browser', 200, 'FOOD_CUISINE_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:06:01', NULL),
(10, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'Unknown Browser', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:06:01', NULL),
(11, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'Unknown Browser', 200, 'QUANTITY_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:06:03', NULL),
(12, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'Unknown Browser', 200, 'TASTE_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:06:05', NULL),
(13, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'Unknown Browser', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:06:10', NULL),
(14, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'Unknown Browser', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:06:15', NULL),
(15, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:28:59', NULL),
(16, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:29:04', NULL),
(17, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:29:13', NULL),
(18, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:29:18', NULL),
(19, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:29:19', NULL),
(20, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:34:49', NULL),
(21, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:34:54', NULL),
(22, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:35:03', NULL),
(23, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:35:08', NULL),
(24, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:37:24', NULL),
(25, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:44:25', NULL),
(26, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:44:30', NULL),
(27, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:44:39', NULL),
(28, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:44:43', NULL),
(29, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:45:18', NULL),
(30, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '183.82.38.108', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:46:16', NULL),
(31, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '183.82.38.108', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:52:15', NULL),
(32, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '183.82.38.108', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:52:53', NULL),
(33, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:53:30', NULL),
(34, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:53:35', NULL),
(35, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:53:44', NULL),
(36, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:53:49', NULL),
(37, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-24 17:54:19', NULL),
(38, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:57:24', NULL),
(39, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:57:29', NULL),
(40, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:57:34', NULL),
(41, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:57:39', NULL),
(42, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:57:40', NULL),
(43, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 17:57:43', NULL),
(44, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-24 17:58:08', NULL),
(45, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:58:10', NULL),
(46, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:58:17', NULL),
(47, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 17:58:23', NULL),
(48, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-24 18:20:33', NULL),
(49, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 18:20:38', NULL),
(50, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 18:20:48', NULL),
(51, 'UNKNOWN', '183.82.38.108', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-24 18:20:51', NULL),
(52, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:01:56', NULL),
(53, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:01:58', NULL),
(54, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:02:33', NULL),
(55, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:02:35', NULL),
(56, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:03:05', NULL),
(57, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:03:07', NULL),
(58, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:05:24', NULL),
(59, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:06:50', NULL),
(60, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:14:28', NULL),
(61, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:14:59', NULL),
(62, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:15:40', NULL),
(63, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:16:48', NULL),
(64, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:24:11', NULL),
(65, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:24:56', NULL),
(66, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', '', NULL, '2018-04-25 11:25:25', NULL),
(67, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-25 11:31:27', NULL),
(68, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-25 12:30:07', NULL),
(69, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', NULL, '2018-04-25 12:30:10', NULL),
(70, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', NULL, '2018-04-25 12:30:12', NULL),
(71, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_DELETE', 'IN', '', NULL, '2018-04-25 12:30:17', NULL),
(72, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_DELETE', 'IN', '', NULL, '2018-04-25 12:30:18', NULL),
(73, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-25 12:34:34', NULL),
(74, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-25 12:34:50', NULL),
(75, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-25 12:37:37', NULL),
(76, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-25 12:39:00', NULL),
(77, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-25 12:48:07', NULL),
(78, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-25 12:49:18', NULL),
(79, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-25 12:49:37', NULL),
(80, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-25 12:50:45', NULL),
(81, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-25 12:51:25', NULL),
(82, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-25 12:52:23', NULL),
(83, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', NULL, '2018-04-25 12:53:30', NULL),
(84, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-25 12:54:21', NULL),
(85, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-25 12:55:17', NULL),
(86, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-25 12:55:55', NULL),
(87, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', NULL, '2018-04-25 12:57:15', NULL),
(88, 'UNKNOWN', '49.206.114.13', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-25 16:11:13', NULL),
(89, 'UNKNOWN', '49.206.114.13', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-25 16:16:08', NULL),
(90, 'UNKNOWN', '49.206.114.13', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-25 16:16:44', NULL),
(91, 'UNKNOWN', '49.206.114.13', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-25 16:20:24', NULL),
(92, 'UNKNOWN', '49.206.114.13', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-25 16:26:56', NULL),
(93, 'UNKNOWN', '49.206.114.13', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-25 16:28:27', NULL),
(94, 'UNKNOWN', '49.206.114.13', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-25 16:34:46', NULL),
(95, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '49.206.114.13', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-25 16:35:48', NULL),
(96, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '49.206.114.13', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-25 16:35:57', NULL),
(97, 'chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop', '49.206.114.13', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-25 16:39:07', NULL),
(98, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.114.13', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-25 16:40:03', NULL),
(99, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.91', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 04:38:59', NULL),
(100, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.91', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 04:41:00', NULL),
(101, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.38.91', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-26 04:41:42', NULL),
(102, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', NULL, '2018-04-26 06:34:19', NULL),
(103, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', NULL, '2018-04-26 06:34:32', NULL),
(104, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', NULL, '2018-04-26 06:34:44', NULL),
(105, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'FOOD_TYPE_FETCH', 'IN', '', NULL, '2018-04-26 06:43:57', NULL),
(106, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 16:39:01', NULL),
(107, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 16:39:50', NULL),
(108, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:39:55', NULL),
(109, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:40:01', NULL),
(110, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:40:05', NULL),
(111, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:40:05', NULL),
(112, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:40:10', NULL),
(113, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 16:40:10', NULL),
(114, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 16:40:34', NULL),
(115, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:40:44', NULL),
(116, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:40:54', NULL),
(117, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:40:57', NULL),
(118, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:40:59', NULL),
(119, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:41:01', NULL),
(120, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 16:41:03', NULL),
(121, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 16:48:12', NULL),
(122, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:48:17', NULL),
(123, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:48:21', NULL),
(124, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:48:25', NULL),
(125, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:48:26', NULL),
(126, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 16:48:30', NULL),
(127, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:48:31', NULL),
(128, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:48:34', NULL),
(129, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:48:36', NULL),
(130, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:48:38', NULL),
(131, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 16:48:40', NULL),
(132, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:29:28', NULL),
(133, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:29:33', NULL),
(134, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:29:43', NULL),
(135, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:29:48', NULL),
(136, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:30:10', NULL),
(137, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:30:16', NULL),
(138, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:30:16', NULL),
(139, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:30:19', NULL),
(140, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:30:24', NULL),
(141, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:30:25', NULL),
(142, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:30:30', NULL),
(143, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:02', NULL),
(144, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:04', NULL),
(145, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:19', NULL),
(146, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:19', NULL),
(147, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:22', NULL),
(148, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:22', NULL),
(149, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:25', NULL),
(150, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:25', NULL),
(151, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:28', NULL),
(152, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:28', NULL),
(153, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:31', NULL),
(154, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:31', NULL),
(155, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:34', NULL),
(156, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:34', NULL),
(157, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:38', NULL),
(158, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:38', NULL),
(159, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:41', NULL),
(160, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:41', NULL),
(161, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:44', NULL),
(162, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:44', NULL),
(163, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:52', NULL),
(164, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:55', NULL),
(165, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:31:58', NULL),
(166, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:01', NULL),
(167, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:04', NULL),
(168, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:08', NULL),
(169, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:11', NULL),
(170, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:14', NULL),
(171, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:17', NULL),
(172, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:21', NULL),
(173, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:24', NULL),
(174, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:27', NULL),
(175, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:30', NULL),
(176, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:33', NULL),
(177, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:37', NULL),
(178, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:40', NULL),
(179, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:43', NULL),
(180, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:46', NULL),
(181, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:49', NULL),
(182, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:52', NULL),
(183, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:55', NULL),
(184, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:32:58', NULL),
(185, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:02', NULL),
(186, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:05', NULL),
(187, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:08', NULL),
(188, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:11', NULL),
(189, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:14', NULL),
(190, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:17', NULL),
(191, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:21', NULL),
(192, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:24', NULL),
(193, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:27', NULL),
(194, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:30', NULL),
(195, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:33', NULL),
(196, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:36', NULL),
(197, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:39', NULL),
(198, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:43', NULL),
(199, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:46', NULL),
(200, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:49', NULL),
(201, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:52', NULL),
(202, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:55', NULL),
(203, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:33:58', NULL),
(204, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:02', NULL),
(205, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:05', NULL),
(206, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:08', NULL),
(207, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:11', NULL),
(208, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:14', NULL),
(209, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:17', NULL),
(210, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:21', NULL),
(211, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:24', NULL),
(212, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:27', NULL),
(213, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:34:35', NULL),
(214, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:41', NULL),
(215, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:44', NULL),
(216, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:47', NULL),
(217, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:50', NULL),
(218, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:34:51', NULL),
(219, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:55', NULL),
(220, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:55', NULL),
(221, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:58', NULL),
(222, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:34:58', NULL),
(223, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:01', NULL),
(224, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:01', NULL),
(225, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:04', NULL),
(226, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:04', NULL),
(227, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:07', NULL),
(228, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:07', NULL),
(229, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:10', NULL),
(230, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:10', NULL),
(231, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:13', NULL),
(232, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:14', NULL),
(233, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:16', NULL),
(234, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:17', NULL),
(235, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:19', NULL),
(236, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:20', NULL),
(237, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:22', NULL),
(238, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:23', NULL),
(239, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:26', NULL),
(240, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:26', NULL),
(241, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:29', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(242, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:29', NULL),
(243, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:35:37', NULL),
(244, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:43', NULL),
(245, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:52', NULL),
(246, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:35:57', NULL),
(247, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:39:04', NULL),
(248, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:09', NULL),
(249, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:15', NULL),
(250, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:18', NULL),
(251, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:19', NULL),
(252, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:39:22', NULL),
(253, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:24', NULL),
(254, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:26', NULL),
(255, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:27', NULL),
(256, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:29', NULL),
(257, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:30', NULL),
(258, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:32', NULL),
(259, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:33', NULL),
(260, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:35', NULL),
(261, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:36', NULL),
(262, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:38', NULL),
(263, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:39', NULL),
(264, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:41', NULL),
(265, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:43', NULL),
(266, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:44', NULL),
(267, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:46', NULL),
(268, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:47', NULL),
(269, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:49', NULL),
(270, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:51', NULL),
(271, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:52', NULL),
(272, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:54', NULL),
(273, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:55', NULL),
(274, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:57', NULL),
(275, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:39:58', NULL),
(276, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:40:00', NULL),
(277, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:40:01', NULL),
(278, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:40:03', NULL),
(279, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:40:05', NULL),
(280, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:47:29', NULL),
(281, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:47:34', NULL),
(282, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:47:44', NULL),
(283, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:47:49', NULL),
(284, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:48:02', NULL),
(285, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:48:04', NULL),
(286, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:48:05', NULL),
(287, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:48:08', NULL),
(288, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:48:09', NULL),
(289, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:48:11', NULL),
(290, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:48:11', NULL),
(291, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:50:17', NULL),
(292, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:50:22', NULL),
(293, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:50:31', NULL),
(294, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:50:31', NULL),
(295, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:50:34', NULL),
(296, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:50:37', NULL),
(297, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:50:39', NULL),
(298, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:50:40', NULL),
(299, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:50:42', NULL),
(300, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:51:10', NULL),
(301, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:51:56', NULL),
(302, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:52:22', NULL),
(303, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:52:45', NULL),
(304, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:54:04', NULL),
(305, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:54:09', NULL),
(306, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:54:18', NULL),
(307, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:54:24', NULL),
(308, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:54:29', NULL),
(309, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:54:29', NULL),
(310, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:54:33', NULL),
(311, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:54:35', NULL),
(312, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:54:36', NULL),
(313, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FOLLOW_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-26 17:54:49', NULL),
(314, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:55:09', NULL),
(315, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:55:22', NULL),
(316, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:55:25', NULL),
(317, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:55:28', NULL),
(318, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:55:31', NULL),
(319, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:55:34', NULL),
(320, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:55:37', NULL),
(321, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:56:11', NULL),
(322, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:57:39', NULL),
(323, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:57:46', NULL),
(324, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:57:55', NULL),
(325, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:58:00', NULL),
(326, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:58:17', NULL),
(327, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 17:58:17', NULL),
(328, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:58:21', NULL),
(329, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:58:38', NULL),
(330, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:58:41', NULL),
(331, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:59:22', NULL),
(332, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 17:59:41', NULL),
(333, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:00:06', NULL),
(334, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:01:04', NULL),
(335, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:01:10', NULL),
(336, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:01:20', NULL),
(337, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:01:24', NULL),
(338, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:01:51', NULL),
(339, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:16:26', NULL),
(340, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:16:31', NULL),
(341, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:16:40', NULL),
(342, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:16:45', NULL),
(343, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:16:49', NULL),
(344, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:17:01', NULL),
(345, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:17:07', NULL),
(346, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:17:08', NULL),
(347, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:17:12', NULL),
(348, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:17:14', NULL),
(349, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:17:14', NULL),
(350, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:17:35', NULL),
(351, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:17:37', NULL),
(352, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:18:13', NULL),
(353, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:18:16', NULL),
(354, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:18:20', NULL),
(355, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:18:23', NULL),
(356, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:22:21', NULL),
(357, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:22:26', NULL),
(358, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:22:36', NULL),
(359, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:22:41', NULL),
(360, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:23:18', NULL),
(361, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:23:18', NULL),
(362, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:23:22', NULL),
(363, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:23:24', NULL),
(364, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:23:25', NULL),
(365, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:23:29', NULL),
(366, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:23:31', NULL),
(367, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:23:37', NULL),
(368, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:23:39', NULL),
(369, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_SEARCH', 'IN', 'Chennai', NULL, '2018-04-26 18:23:47', NULL),
(370, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', NULL, '2018-04-26 18:23:57', NULL),
(371, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:29:13', NULL),
(372, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:29:18', NULL),
(373, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:29:23', NULL),
(374, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:29:27', NULL),
(375, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:29:27', NULL),
(376, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:29:32', NULL),
(377, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:29:32', NULL),
(378, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:29:38', NULL),
(379, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:29:41', NULL),
(380, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', NULL, '2018-04-26 18:29:46', NULL),
(381, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:33:08', NULL),
(382, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:33:13', NULL),
(383, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:33:22', NULL),
(384, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:33:27', NULL),
(385, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:34:04', NULL),
(386, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:34:05', NULL),
(387, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:34:09', NULL),
(388, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:34:11', NULL),
(389, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:34:12', NULL),
(390, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', NULL, '2018-04-26 18:34:22', NULL),
(391, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOW_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-26 18:34:30', NULL),
(392, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:35:08', NULL),
(393, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:35:14', NULL),
(394, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:35:23', NULL),
(395, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:35:28', NULL),
(396, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:35:35', NULL),
(397, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:35:42', NULL),
(398, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:35:47', NULL),
(399, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:35:57', NULL),
(400, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:36:02', NULL),
(401, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:36:56', NULL),
(402, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:36:57', NULL),
(403, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:37:01', NULL),
(404, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:37:03', NULL),
(405, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:37:04', NULL),
(406, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', NULL, '2018-04-26 18:37:12', NULL),
(407, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOW_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-26 18:37:27', NULL),
(408, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOW_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-26 18:37:38', NULL),
(409, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:37:45', NULL),
(410, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:37:47', NULL),
(411, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', NULL, '2018-04-26 18:38:24', NULL),
(412, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:38:36', NULL),
(413, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:38:39', NULL),
(414, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', NULL, '2018-04-26 18:38:47', NULL),
(415, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:54:48', NULL),
(416, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:54:54', NULL),
(417, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:55:03', NULL),
(418, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:55:07', NULL),
(419, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:55:46', NULL),
(420, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:55:51', NULL),
(421, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:56:00', NULL),
(422, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:56:05', NULL),
(423, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:56:14', NULL),
(424, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:21', NULL),
(425, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:24', NULL),
(426, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:27', NULL),
(427, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:29', NULL),
(428, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:32', NULL),
(429, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:35', NULL),
(430, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:39', NULL),
(431, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:41', NULL),
(432, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:44', NULL),
(433, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:47', NULL),
(434, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:50', NULL),
(435, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:53', NULL),
(436, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:56', NULL),
(437, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:56:59', NULL),
(438, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:02', NULL),
(439, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:05', NULL),
(440, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:08', NULL),
(441, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:11', NULL),
(442, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:14', NULL),
(443, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:17', NULL),
(444, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:20', NULL),
(445, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:23', NULL),
(446, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:26', NULL),
(447, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:29', NULL),
(448, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:32', NULL),
(449, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:35', NULL),
(450, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:38', NULL),
(451, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:40', NULL),
(452, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:43', NULL),
(453, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:46', NULL),
(454, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:49', NULL),
(455, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:52', NULL),
(456, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:55', NULL),
(457, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:57:58', NULL),
(458, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:58:01', NULL),
(459, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:58:04', NULL),
(460, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:58:07', NULL),
(461, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:58:10', NULL),
(462, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:58:13', NULL),
(463, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:58:16', NULL),
(464, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:58:19', NULL),
(465, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:58:22', NULL),
(466, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:58:30', NULL),
(467, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 18:58:45', NULL),
(468, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:58:50', NULL),
(469, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:58:59', NULL),
(470, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:59:04', NULL),
(471, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 18:59:14', NULL),
(472, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:21', NULL),
(473, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:24', NULL),
(474, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:27', NULL),
(475, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:30', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(476, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:33', NULL),
(477, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:36', NULL),
(478, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:39', NULL),
(479, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:42', NULL),
(480, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:45', NULL),
(481, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:48', NULL),
(482, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:51', NULL),
(483, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:54', NULL),
(484, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 18:59:57', NULL),
(485, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:00:00', NULL),
(486, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:00:03', NULL),
(487, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:00:05', NULL),
(488, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:00:08', NULL),
(489, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:00:12', NULL),
(490, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:00:19', NULL),
(491, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:00:25', NULL),
(492, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:00:34', NULL),
(493, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:00:39', NULL),
(494, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:00:48', NULL),
(495, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:01:04', NULL),
(496, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:02:44', NULL),
(497, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:07:38', NULL),
(498, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:07:43', NULL),
(499, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:07:53', NULL),
(500, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:07:57', NULL),
(501, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:08:08', NULL),
(502, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:08:13', NULL),
(503, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:08:37', NULL),
(504, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:09:11', NULL),
(505, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:09:16', NULL),
(506, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:09:25', NULL),
(507, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:09:31', NULL),
(508, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:11:11', NULL),
(509, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:11:16', NULL),
(510, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:11:26', NULL),
(511, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:11:30', NULL),
(512, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:11:38', NULL),
(513, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:11:47', NULL),
(514, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:11:50', NULL),
(515, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:14:04', NULL),
(516, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:14:09', NULL),
(517, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:14:18', NULL),
(518, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:14:23', NULL),
(519, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:14:32', NULL),
(520, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:14:38', NULL),
(521, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:14:57', NULL),
(522, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:16:53', NULL),
(523, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:16:58', NULL),
(524, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:17:09', NULL),
(525, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:17:14', NULL),
(526, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:17:23', NULL),
(527, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:17:28', NULL),
(528, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:21:12', NULL),
(529, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:21:17', NULL),
(530, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:21:26', NULL),
(531, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:06', NULL),
(532, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:30', NULL),
(533, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:32', NULL),
(534, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:35', NULL),
(535, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:37', NULL),
(536, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:40', NULL),
(537, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:42', NULL),
(538, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:45', NULL),
(539, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:47', NULL),
(540, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:50', NULL),
(541, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:52', NULL),
(542, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:55', NULL),
(543, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:22:57', NULL),
(544, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:23:00', NULL),
(545, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:23:02', NULL),
(546, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:23:05', NULL),
(547, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:23:07', NULL),
(548, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:23:10', NULL),
(549, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:24:08', NULL),
(550, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:24:13', NULL),
(551, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:24:23', NULL),
(552, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:24:27', NULL),
(553, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:24:36', NULL),
(554, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:24:41', NULL),
(555, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:24:44', NULL),
(556, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:24:47', NULL),
(557, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:26:29', NULL),
(558, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:26:34', NULL),
(559, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:26:43', NULL),
(560, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:26:48', NULL),
(561, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:27:02', NULL),
(562, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:27:09', NULL),
(563, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:27:12', NULL),
(564, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:27:15', NULL),
(565, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:27:30', NULL),
(566, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:29:11', NULL),
(567, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:29:16', NULL),
(568, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:29:26', NULL),
(569, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:29:30', NULL),
(570, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:29:32', NULL),
(571, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:29:35', NULL),
(572, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:29:36', NULL),
(573, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:29:39', NULL),
(574, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:29:39', NULL),
(575, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:29:54', NULL),
(576, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:01', NULL),
(577, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:04', NULL),
(578, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:06', NULL),
(579, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:09', NULL),
(580, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:11', NULL),
(581, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:14', NULL),
(582, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:16', NULL),
(583, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:19', NULL),
(584, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:21', NULL),
(585, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:24', NULL),
(586, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:26', NULL),
(587, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:29', NULL),
(588, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:31', NULL),
(589, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:34', NULL),
(590, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:36', NULL),
(591, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:39', NULL),
(592, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:41', NULL),
(593, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:44', NULL),
(594, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:46', NULL),
(595, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:49', NULL),
(596, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:51', NULL),
(597, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:53', NULL),
(598, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:56', NULL),
(599, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:30:58', NULL),
(600, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:31:01', NULL),
(601, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:31:03', NULL),
(602, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:31:06', NULL),
(603, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:31:09', NULL),
(604, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:32:08', NULL),
(605, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:33:47', NULL),
(606, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:33:53', NULL),
(607, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.174', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:34:04', NULL),
(608, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:34:38', NULL),
(609, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:34:43', NULL),
(610, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:34:53', NULL),
(611, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:34:57', NULL),
(612, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:35:07', NULL),
(613, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:12', NULL),
(614, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:15', NULL),
(615, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:17', NULL),
(616, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:20', NULL),
(617, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:22', NULL),
(618, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:25', NULL),
(619, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:27', NULL),
(620, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:30', NULL),
(621, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:32', NULL),
(622, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:35', NULL),
(623, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:37', NULL),
(624, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:40', NULL),
(625, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:43', NULL),
(626, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:45', NULL),
(627, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:48', NULL),
(628, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:50', NULL),
(629, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:53', NULL),
(630, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:55', NULL),
(631, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:35:58', NULL),
(632, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:36:00', NULL),
(633, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:36:03', NULL),
(634, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:36:05', NULL),
(635, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:36:08', NULL),
(636, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:37:24', NULL),
(637, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:37:30', NULL),
(638, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:37:39', NULL),
(639, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:37:44', NULL),
(640, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:37:53', NULL),
(641, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:37:59', NULL),
(642, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:38:02', NULL),
(643, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:38:21', NULL),
(644, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:40:43', NULL),
(645, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:40:48', NULL),
(646, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:40:58', NULL),
(647, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:41:02', NULL),
(648, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:41:52', NULL),
(649, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:41:59', NULL),
(650, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:42:01', NULL),
(651, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:42:15', NULL),
(652, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:42:36', NULL),
(653, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:42:41', NULL),
(654, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:42:48', NULL),
(655, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:42:51', NULL),
(656, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:42:52', NULL),
(657, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:42:55', NULL),
(658, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:42:57', NULL),
(659, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:42:58', NULL),
(660, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:42:59', NULL),
(661, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:43:11', NULL),
(662, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:43:14', NULL),
(663, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:46:40', NULL),
(664, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:46:45', NULL),
(665, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:46:55', NULL),
(666, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:46:59', NULL),
(667, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:47:09', NULL),
(668, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:15', NULL),
(669, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:18', NULL),
(670, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:20', NULL),
(671, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:23', NULL),
(672, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:25', NULL),
(673, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:28', NULL),
(674, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:30', NULL),
(675, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:33', NULL),
(676, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:35', NULL),
(677, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:38', NULL),
(678, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:40', NULL),
(679, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:43', NULL),
(680, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:45', NULL),
(681, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:48', NULL),
(682, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:50', NULL),
(683, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:53', NULL),
(684, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:55', NULL),
(685, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:47:58', NULL),
(686, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:48:00', NULL),
(687, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:48:03', NULL),
(688, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:48:12', NULL),
(689, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:48:17', NULL),
(690, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:48:27', NULL),
(691, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:48:31', NULL),
(692, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:48:40', NULL),
(693, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:48:52', NULL),
(694, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:48:55', NULL),
(695, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-26 19:50:50', NULL),
(696, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:50:55', NULL),
(697, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:51:05', NULL),
(698, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:51:09', NULL),
(699, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-26 19:51:20', NULL),
(700, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:51:26', NULL),
(701, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:51:29', NULL),
(702, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'LIKE_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:51:55', NULL),
(703, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.174', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'LIKE_FETCH_USERS', 'IN', 'Chennai', NULL, '2018-04-26 19:51:57', NULL),
(704, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:24:32', NULL),
(705, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:24:38', NULL),
(706, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:24:47', NULL),
(707, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:24:55', NULL),
(708, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:25:00', NULL),
(709, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:25:09', NULL),
(710, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:25:14', NULL),
(711, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:25:22', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(712, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:26:57', NULL),
(713, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:28:30', NULL),
(714, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:28:35', NULL),
(715, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:28:44', NULL),
(716, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:28:48', NULL),
(717, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:30:30', NULL),
(718, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:30:39', NULL),
(719, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:30:52', NULL),
(720, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:31:12', NULL),
(721, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:31:23', NULL),
(722, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:31:32', NULL),
(723, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:31:33', NULL),
(724, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:31:36', NULL),
(725, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:31:44', NULL),
(726, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:32:46', NULL),
(727, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:32:54', NULL),
(728, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:33:03', NULL),
(729, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 17:33:03', NULL),
(730, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:33:08', NULL),
(731, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:51:30', NULL),
(732, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:51:40', NULL),
(733, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:51:44', NULL),
(734, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:53:35', NULL),
(735, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:53:45', NULL),
(736, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-27 17:53:46', NULL),
(737, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:53:49', NULL),
(738, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:54:28', NULL),
(739, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:54:37', NULL),
(740, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:54:43', NULL),
(741, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:55:15', NULL),
(742, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:55:49', NULL),
(743, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:55:54', NULL),
(744, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:56:13', NULL),
(745, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:56:22', NULL),
(746, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:56:27', NULL),
(747, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:57:12', NULL),
(748, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:57:22', NULL),
(749, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:57:26', NULL),
(750, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:59:07', NULL),
(751, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:59:17', NULL),
(752, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:59:21', NULL),
(753, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 17:59:53', NULL),
(754, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:00:03', NULL),
(755, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:00:07', NULL),
(756, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:03:33', NULL),
(757, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:03:43', NULL),
(758, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:03:47', NULL),
(759, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:04:23', NULL),
(760, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:04:34', NULL),
(761, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:04:38', NULL),
(762, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 18:05:09', NULL),
(763, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 18:05:22', NULL),
(764, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_LOGIN', 'IN', 'Chennai', NULL, '2018-04-27 18:06:38', NULL),
(765, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_LOGIN', 'IN', 'Chennai', NULL, '2018-04-27 18:06:51', NULL),
(766, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_LOGIN', 'IN', 'Chennai', NULL, '2018-04-27 18:08:57', NULL),
(767, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_LOGIN', 'IN', 'Chennai', NULL, '2018-04-27 18:09:47', NULL),
(768, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_LOGIN', 'IN', 'Chennai', NULL, '2018-04-27 18:10:04', NULL),
(769, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 18:14:25', NULL),
(770, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', NULL, '2018-04-27 18:14:35', NULL),
(771, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_LOGIN', 'IN', 'Chennai', NULL, '2018-04-27 18:17:52', NULL),
(772, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:35:00', NULL),
(773, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:57:38', NULL),
(774, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:57:47', NULL),
(775, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 18:57:51', NULL),
(776, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 18:59:23', NULL),
(777, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_GENDER', 'IN', 'Chennai', NULL, '2018-04-27 19:02:11', NULL),
(778, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_GENDER', 'IN', 'Chennai', NULL, '2018-04-27 19:02:26', NULL),
(779, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_GENDER', 'IN', 'Chennai', NULL, '2018-04-27 19:02:49', NULL),
(780, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 19:10:09', NULL),
(781, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:10:52', NULL),
(782, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:11:02', NULL),
(783, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:11:06', NULL),
(784, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:11:26', NULL),
(785, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:14:11', NULL),
(786, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:14:21', NULL),
(787, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:14:22', NULL),
(788, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:14:25', NULL),
(789, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:15:39', NULL),
(790, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:15:48', NULL),
(791, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:15:49', NULL),
(792, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:15:53', NULL),
(793, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:16:17', NULL),
(794, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:16:27', NULL),
(795, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:16:31', NULL),
(796, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:16:40', NULL),
(797, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:17:54', NULL),
(798, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:18:03', NULL),
(799, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:18:03', NULL),
(800, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:18:08', NULL),
(801, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:18:30', NULL),
(802, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:18:40', NULL),
(803, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:18:44', NULL),
(804, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:22:03', NULL),
(805, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:22:12', NULL),
(806, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:22:16', NULL),
(807, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:22:30', NULL),
(808, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:22:51', NULL),
(809, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:23:00', NULL),
(810, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:23:04', NULL),
(811, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:24:13', NULL),
(812, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:24:23', NULL),
(813, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:24:27', NULL),
(814, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:25:02', NULL),
(815, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:25:07', NULL),
(816, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:25:12', NULL),
(817, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:25:16', NULL),
(818, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 19:25:41', NULL),
(819, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:27:29', NULL),
(820, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:27:42', NULL),
(821, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:27:51', NULL),
(822, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:27:52', NULL),
(823, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:27:55', NULL),
(824, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 19:28:13', NULL),
(825, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:30:30', NULL),
(826, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:30:38', NULL),
(827, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:30:40', NULL),
(828, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:30:44', NULL),
(829, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 19:31:01', NULL),
(830, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:31:19', NULL),
(831, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 19:33:06', NULL),
(832, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:35:46', NULL),
(833, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:41:02', NULL),
(834, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:41:11', NULL),
(835, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:41:16', NULL),
(836, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:41:23', NULL),
(837, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 19:41:45', NULL),
(838, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:47:49', NULL),
(839, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:47:59', NULL),
(840, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:48:03', NULL),
(841, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:48:16', NULL),
(842, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:48:26', NULL),
(843, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 19:48:30', NULL),
(844, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 19:49:03', NULL),
(845, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 19:49:37', NULL),
(846, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 19:54:49', NULL),
(847, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 500, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 19:55:49', NULL),
(848, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 500, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 19:56:17', NULL),
(849, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 19:58:16', NULL),
(850, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:06:01', NULL),
(851, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:06:10', NULL),
(852, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:06:15', NULL),
(853, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:06:22', NULL),
(854, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 20:06:46', NULL),
(855, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:07:02', NULL),
(856, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:07:15', NULL),
(857, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:14:42', NULL),
(858, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:14:46', NULL),
(859, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:14:51', NULL),
(860, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:14:55', NULL),
(861, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:14:59', NULL),
(862, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:15:34', NULL),
(863, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:15:44', NULL),
(864, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:15:48', NULL),
(865, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:15:49', NULL),
(866, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:16:40', NULL),
(867, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:18:17', NULL),
(868, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:18:26', NULL),
(869, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:18:27', NULL),
(870, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:18:31', NULL),
(871, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:18:47', NULL),
(872, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:19:45', NULL),
(873, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:19:55', NULL),
(874, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:19:59', NULL),
(875, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:20:25', NULL),
(876, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:20:36', NULL),
(877, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:23:11', NULL),
(878, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:23:19', NULL),
(879, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:23:21', NULL),
(880, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:23:25', NULL),
(881, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:23:54', NULL),
(882, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:24:55', NULL),
(883, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:34:03', NULL),
(884, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:34:05', NULL),
(885, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:34:12', NULL),
(886, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:34:16', NULL),
(887, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_IMAGE', 'IN', 'Chennai', NULL, '2018-04-27 20:34:38', NULL),
(888, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:36:26', NULL),
(889, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:36:42', NULL),
(890, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:38:12', NULL),
(891, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:38:21', NULL),
(892, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:38:23', NULL),
(893, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:38:25', NULL),
(894, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:38:34', NULL),
(895, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:43:09', NULL),
(896, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:43:13', NULL),
(897, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:43:19', NULL),
(898, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:43:22', NULL),
(899, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:43:26', NULL),
(900, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:44:12', NULL),
(901, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:47:06', NULL),
(902, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:47:16', NULL),
(903, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:47:16', NULL),
(904, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:47:20', NULL),
(905, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_EMAIL', 'IN', 'Chennai', NULL, '2018-04-27 20:47:21', NULL),
(906, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:49:32', NULL),
(907, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:49:41', NULL),
(908, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:49:45', NULL),
(909, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:50:05', NULL),
(910, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_EMAIL', 'IN', 'Chennai', NULL, '2018-04-27 20:50:14', NULL),
(911, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:50:46', NULL),
(912, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:50:54', NULL),
(913, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:50:55', NULL),
(914, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:50:59', NULL),
(915, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_EMAIL', 'IN', 'Chennai', NULL, '2018-04-27 20:51:02', NULL),
(916, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:55:03', NULL),
(917, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:55:12', NULL),
(918, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 20:55:16', NULL),
(919, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:55:21', NULL),
(920, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'IN', 'Chennai', NULL, '2018-04-27 20:55:48', NULL),
(921, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 20:56:11', NULL),
(922, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_EMAIL', 'IN', 'Chennai', NULL, '2018-04-27 20:56:53', NULL),
(923, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:02:50', NULL),
(924, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:03:00', NULL),
(925, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:03:04', NULL),
(926, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:03:23', NULL),
(927, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_EMAIL', 'IN', 'Chennai', NULL, '2018-04-27 21:03:36', NULL),
(928, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:03:51', NULL),
(929, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_EMAIL', 'IN', 'Chennai', NULL, '2018-04-27 21:04:06', NULL),
(930, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:04:55', NULL),
(931, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:06:26', NULL),
(932, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:06:36', NULL),
(933, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:06:40', NULL),
(934, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:06:40', NULL),
(935, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PHONE', 'IN', 'Chennai', NULL, '2018-04-27 21:06:46', NULL),
(936, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PHONE', 'IN', 'Chennai', NULL, '2018-04-27 21:06:57', NULL),
(937, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:07:35', NULL),
(938, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PHONE', 'IN', 'Chennai', NULL, '2018-04-27 21:07:40', NULL),
(939, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:13:02', NULL),
(940, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:13:06', NULL),
(941, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:13:12', NULL),
(942, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:13:16', NULL),
(943, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_GENDER', 'IN', 'Chennai', NULL, '2018-04-27 21:13:23', NULL),
(944, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:13:36', NULL),
(945, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:18:11', NULL),
(946, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:18:15', NULL),
(947, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:18:21', NULL),
(948, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:18:25', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(949, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:19:00', NULL),
(950, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:25:30', NULL),
(951, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:25:34', NULL),
(952, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:25:39', NULL),
(953, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:25:43', NULL),
(954, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:25:51', NULL),
(955, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:26:55', NULL),
(956, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:26:58', NULL),
(957, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:27:04', NULL),
(958, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:27:08', NULL),
(959, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:27:19', NULL),
(960, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:27:42', NULL),
(961, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:28:13', NULL),
(962, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:28:31', NULL),
(963, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:29:27', NULL),
(964, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:29:53', NULL),
(965, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:31:39', NULL),
(966, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:34:34', NULL),
(967, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:34:44', NULL),
(968, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:34:48', NULL),
(969, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:35:28', NULL),
(970, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:35:43', NULL),
(971, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:36:19', NULL),
(972, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:36:28', NULL),
(973, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:36:29', NULL),
(974, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:36:33', NULL),
(975, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:36:47', NULL),
(976, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:37:44', NULL),
(977, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:37:53', NULL),
(978, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:37:57', NULL),
(979, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:38:20', NULL),
(980, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:38:43', NULL),
(981, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:39:18', NULL),
(982, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:41:04', NULL),
(983, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', NULL, '2018-04-27 21:41:13', NULL),
(984, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:41:14', NULL),
(985, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-27 21:41:18', NULL),
(986, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:41:26', NULL),
(987, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:41:49', NULL),
(988, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'IN', 'Chennai', NULL, '2018-04-27 21:43:25', NULL),
(989, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-27 21:44:15', NULL),
(990, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.153', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_GENDER', 'IN', 'Chennai', NULL, '2018-04-27 21:44:38', NULL),
(991, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.116.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_LOGIN', 'IN', 'Chennai', NULL, '2018-04-27 21:44:57', NULL),
(992, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.39.112', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-28 05:24:21', NULL),
(993, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.39.112', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-28 05:37:37', NULL),
(994, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.39.112', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 05:37:52', NULL),
(995, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.39.112', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'RECIPE_FAVORITE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 05:38:39', NULL),
(996, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.39.112', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'RECIPE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 05:39:03', NULL),
(997, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.39.112', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 05:39:43', NULL),
(998, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 05:54:08', NULL),
(999, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 05:54:18', NULL),
(1000, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 05:54:21', NULL),
(1001, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:51:33', NULL),
(1002, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:51:42', NULL),
(1003, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:51:46', NULL),
(1004, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-28 06:52:46', NULL),
(1005, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:53:01', NULL),
(1006, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:53:03', NULL),
(1007, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-28 06:54:24', NULL),
(1008, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:54:36', NULL),
(1009, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:54:46', NULL),
(1010, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:56:44', NULL),
(1011, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:56:54', NULL),
(1012, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:56:58', NULL),
(1013, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:57:39', NULL),
(1014, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', NULL, '2018-04-28 06:57:44', NULL),
(1015, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:57:49', NULL),
(1016, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:57:53', NULL),
(1017, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 06:58:02', NULL),
(1018, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-28 06:58:17', NULL),
(1019, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:07:44', NULL),
(1020, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:07:54', NULL),
(1021, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:07:58', NULL),
(1022, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:08:20', NULL),
(1023, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-28 07:08:28', NULL),
(1024, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:08:48', NULL),
(1025, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-28 07:08:54', NULL),
(1026, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:09:56', NULL),
(1027, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-28 07:10:02', NULL),
(1028, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'IN', 'Chennai', NULL, '2018-04-28 07:10:09', NULL),
(1029, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_DELETE', 'IN', 'Chennai', NULL, '2018-04-28 07:16:17', NULL),
(1030, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:16:28', NULL),
(1031, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_DELETE', 'IN', 'Chennai', NULL, '2018-04-28 07:16:44', NULL),
(1032, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:16:51', NULL),
(1033, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:52:46', NULL),
(1034, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:52:56', NULL),
(1035, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 07:53:01', NULL),
(1036, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 08:59:18', NULL),
(1037, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:01:09', NULL),
(1038, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:01:19', NULL),
(1039, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:01:24', NULL),
(1040, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:01:34', NULL),
(1041, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:02:19', NULL),
(1042, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:02:29', NULL),
(1043, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:02:34', NULL),
(1044, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:02:43', NULL),
(1045, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:06:02', NULL),
(1046, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:06:12', NULL),
(1047, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:06:17', NULL),
(1048, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:06:27', NULL),
(1049, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:11:16', NULL),
(1050, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:11:26', NULL),
(1051, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:11:31', NULL),
(1052, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:11:56', NULL),
(1053, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:14:27', NULL),
(1054, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:14:37', NULL),
(1055, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:14:42', NULL),
(1056, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:14:52', NULL),
(1057, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:15:53', NULL),
(1058, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:16:03', NULL),
(1059, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:16:08', NULL),
(1060, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:16:18', NULL),
(1061, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:17:36', NULL),
(1062, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:17:46', NULL),
(1063, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:17:51', NULL),
(1064, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:18:02', NULL),
(1065, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:19:51', NULL),
(1066, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:20:00', NULL),
(1067, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:20:05', NULL),
(1068, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:23:10', NULL),
(1069, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:23:20', NULL),
(1070, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:23:25', NULL),
(1071, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:23:35', NULL),
(1072, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:24:04', NULL),
(1073, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:24:13', NULL),
(1074, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:24:22', NULL),
(1075, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:24:31', NULL),
(1076, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:24:36', NULL),
(1077, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:24:46', NULL),
(1078, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:26:25', NULL),
(1079, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:26:35', NULL),
(1080, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:26:40', NULL),
(1081, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:26:49', NULL),
(1082, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:32:24', NULL),
(1083, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:32:33', NULL),
(1084, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:32:39', NULL),
(1085, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:32:48', NULL),
(1086, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:33:30', NULL),
(1087, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:33:40', NULL),
(1088, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:33:46', NULL),
(1089, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:33:56', NULL),
(1090, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:37:28', NULL),
(1091, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:37:38', NULL),
(1092, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:37:43', NULL),
(1093, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.112', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 09:38:02', NULL),
(1094, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-28 15:29:08', NULL),
(1095, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-28 15:29:46', NULL),
(1096, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-28 15:30:43', NULL),
(1097, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', NULL, '2018-04-28 15:31:00', NULL),
(1098, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-28 15:32:21', NULL),
(1099, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', NULL, '2018-04-28 15:32:24', NULL),
(1100, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:47:51', NULL),
(1101, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:48:01', NULL),
(1102, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:48:07', NULL),
(1103, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:51:53', NULL),
(1104, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.119', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:54:18', NULL),
(1105, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:54:37', NULL),
(1106, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:54:46', NULL),
(1107, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:54:52', NULL),
(1108, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:55:02', NULL),
(1109, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:56:33', NULL),
(1110, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:56:42', NULL),
(1111, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:56:48', NULL),
(1112, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 20:56:58', NULL),
(1113, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:00:25', NULL),
(1114, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:00:35', NULL),
(1115, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:00:40', NULL),
(1116, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.119', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:27:12', NULL),
(1117, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.119', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:27:38', NULL),
(1118, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.119', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:29:36', NULL),
(1119, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.119', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:31:23', NULL),
(1120, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:36:14', NULL),
(1121, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:36:23', NULL),
(1122, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:36:29', NULL),
(1123, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:36:53', NULL),
(1124, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:37:47', NULL),
(1125, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:37:56', NULL),
(1126, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:38:02', NULL),
(1127, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:38:55', NULL),
(1128, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:39:04', NULL),
(1129, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:39:13', NULL),
(1130, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:39:19', NULL),
(1131, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:39:28', NULL),
(1132, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:42:06', NULL),
(1133, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:42:15', NULL),
(1134, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:42:21', NULL),
(1135, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 21:42:31', NULL),
(1136, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.119', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'NUTRIENT_INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-28 22:01:21', NULL),
(1137, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:00:36', NULL),
(1138, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:00:46', NULL),
(1139, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:00:51', NULL),
(1140, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:01:01', NULL),
(1141, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:01:44', NULL),
(1142, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:01:53', NULL),
(1143, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:01:59', NULL),
(1144, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:02:09', NULL),
(1145, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:04:39', NULL),
(1146, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:04:49', NULL),
(1147, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:04:54', NULL),
(1148, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.119', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:11:23', NULL),
(1149, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.119', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'INGREDIENT_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:11:35', NULL),
(1150, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:16:38', NULL),
(1151, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:16:48', NULL),
(1152, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:16:53', NULL),
(1153, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:49:51', NULL),
(1154, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:57:18', NULL),
(1155, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:57:28', NULL),
(1156, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:57:33', NULL),
(1157, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 07:57:45', NULL),
(1158, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:03:49', NULL),
(1159, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:03:59', NULL),
(1160, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:04:05', NULL),
(1161, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:04:20', NULL),
(1162, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:14:20', NULL),
(1163, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:14:29', NULL),
(1164, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:14:34', NULL),
(1165, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:14:45', NULL),
(1166, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:17:45', NULL),
(1167, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:17:55', NULL),
(1168, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:18:00', NULL),
(1169, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:18:11', NULL),
(1170, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:20:39', NULL),
(1171, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:20:48', NULL),
(1172, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:20:53', NULL),
(1173, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:21:04', NULL),
(1174, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:27:39', NULL),
(1175, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:27:53', NULL),
(1176, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:27:58', NULL),
(1177, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:28:37', NULL),
(1178, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.119', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:30:59', NULL),
(1179, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:33:16', NULL),
(1180, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:36:53', NULL),
(1181, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:37:02', NULL),
(1182, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:37:08', NULL),
(1183, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.119', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 08:37:18', NULL),
(1184, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:02:30', NULL),
(1185, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:02:40', NULL),
(1186, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:02:45', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1187, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:02:57', NULL),
(1188, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:04:16', NULL),
(1189, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:04:25', NULL),
(1190, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:04:30', NULL),
(1191, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:05:25', NULL),
(1192, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:05:34', NULL),
(1193, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:05:39', NULL),
(1194, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:05:49', NULL),
(1195, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:05:58', NULL),
(1196, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:06:04', NULL),
(1197, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:06:38', NULL),
(1198, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:06:47', NULL),
(1199, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:06:52', NULL),
(1200, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:07:03', NULL),
(1201, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:08:11', NULL),
(1202, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:08:20', NULL),
(1203, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:08:25', NULL),
(1204, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:09:03', NULL),
(1205, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:09:43', NULL),
(1206, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:09:53', NULL),
(1207, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:09:58', NULL),
(1208, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:50:42', NULL),
(1209, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:50:52', NULL),
(1210, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:50:57', NULL),
(1211, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:51:07', NULL),
(1212, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:52:26', NULL),
(1213, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:55:11', NULL),
(1214, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:55:20', NULL),
(1215, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:55:26', NULL),
(1216, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 13:55:36', NULL),
(1217, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:19:07', NULL),
(1218, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:19:16', NULL),
(1219, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:19:22', NULL),
(1220, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:19:34', NULL),
(1221, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:21:14', NULL),
(1222, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:21:24', NULL),
(1223, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:21:29', NULL),
(1224, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:21:44', NULL),
(1225, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:22:22', NULL),
(1226, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:22:32', NULL),
(1227, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:22:37', NULL),
(1228, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:23:27', NULL),
(1229, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:23:36', NULL),
(1230, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:23:41', NULL),
(1231, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:23:53', NULL),
(1232, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:24:03', NULL),
(1233, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:24:08', NULL),
(1234, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:24:26', NULL),
(1235, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:24:36', NULL),
(1236, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:24:41', NULL),
(1237, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:25:29', NULL),
(1238, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:25:39', NULL),
(1239, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:25:42', NULL),
(1240, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:25:44', NULL),
(1241, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:25:51', NULL),
(1242, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:25:57', NULL),
(1243, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:26:15', NULL),
(1244, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:26:25', NULL),
(1245, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:26:30', NULL),
(1246, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:28:04', NULL),
(1247, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:28:15', NULL),
(1248, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:28:20', NULL),
(1249, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:31:05', NULL),
(1250, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:31:14', NULL),
(1251, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:31:19', NULL),
(1252, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:31:47', NULL),
(1253, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:31:56', NULL),
(1254, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:32:01', NULL),
(1255, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:32:10', NULL),
(1256, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:32:19', NULL),
(1257, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:32:24', NULL),
(1258, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:32:32', NULL),
(1259, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:32:42', NULL),
(1260, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:32:47', NULL),
(1261, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:32:58', NULL),
(1262, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:33:07', NULL),
(1263, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:33:12', NULL),
(1264, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:34:53', NULL),
(1265, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:35:02', NULL),
(1266, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:35:08', NULL),
(1267, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 14:35:17', NULL),
(1268, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:23:33', NULL),
(1269, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:23:43', NULL),
(1270, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:23:48', NULL),
(1271, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:24:00', NULL),
(1272, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:41:30', NULL),
(1273, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:41:40', NULL),
(1274, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:41:45', NULL),
(1275, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:42:01', NULL),
(1276, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:44:44', NULL),
(1277, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:44:54', NULL),
(1278, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:44:59', NULL),
(1279, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:46:31', NULL),
(1280, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:46:40', NULL),
(1281, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:46:45', NULL),
(1282, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:47:05', NULL),
(1283, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:48:30', NULL),
(1284, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:48:40', NULL),
(1285, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:48:45', NULL),
(1286, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:49:59', NULL),
(1287, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:50:09', NULL),
(1288, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:50:14', NULL),
(1289, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:50:27', NULL),
(1290, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:50:36', NULL),
(1291, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:50:42', NULL),
(1292, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:50:57', NULL),
(1293, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:51:06', NULL),
(1294, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:51:11', NULL),
(1295, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:51:35', NULL),
(1296, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:51:44', NULL),
(1297, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:51:50', NULL),
(1298, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:52:21', NULL),
(1299, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:52:31', NULL),
(1300, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:52:37', NULL),
(1301, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:52:43', NULL),
(1302, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:52:53', NULL),
(1303, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:52:58', NULL),
(1304, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:54:33', NULL),
(1305, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:54:43', NULL),
(1306, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:54:48', NULL),
(1307, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:55:59', NULL),
(1308, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:56:09', NULL),
(1309, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:56:14', NULL),
(1310, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:56:17', NULL),
(1311, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:56:27', NULL),
(1312, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:56:32', NULL),
(1313, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:57:01', NULL),
(1314, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:57:11', NULL),
(1315, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:57:16', NULL),
(1316, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:58:03', NULL),
(1317, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:58:12', NULL),
(1318, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:58:17', NULL),
(1319, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 16:58:27', NULL),
(1320, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:00:58', NULL),
(1321, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:01:08', NULL),
(1322, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:01:13', NULL),
(1323, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:01:23', NULL),
(1324, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:03:19', NULL),
(1325, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:03:28', NULL),
(1326, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:03:34', NULL),
(1327, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:03:36', NULL),
(1328, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:03:45', NULL),
(1329, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:03:51', NULL),
(1330, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:10:08', NULL),
(1331, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:10:17', NULL),
(1332, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:10:23', NULL),
(1333, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:44:44', NULL),
(1334, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 17:54:20', NULL),
(1335, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:04:20', NULL),
(1336, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:05:02', NULL),
(1337, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:07:18', NULL),
(1338, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:07:37', NULL),
(1339, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:32:30', NULL),
(1340, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:33:29', NULL),
(1341, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:33:37', NULL),
(1342, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:33:42', NULL),
(1343, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:52:16', NULL),
(1344, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:52:50', NULL),
(1345, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:52:57', NULL),
(1346, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:53:03', NULL),
(1347, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:53:43', NULL),
(1348, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:54:03', NULL),
(1349, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:54:11', NULL),
(1350, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:58:55', NULL),
(1351, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 18:59:27', NULL),
(1352, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:00:36', NULL),
(1353, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:00:43', NULL),
(1354, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:00:50', NULL),
(1355, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:00:57', NULL),
(1356, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:01:07', NULL),
(1357, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:09:17', NULL),
(1358, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:09:17', NULL),
(1359, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:10:08', NULL),
(1360, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:10:08', NULL),
(1361, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:10:20', NULL),
(1362, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:10:28', NULL),
(1363, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:10:41', NULL),
(1364, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:10:46', NULL),
(1365, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:10:53', NULL),
(1366, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:11:07', NULL),
(1367, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:11:07', NULL),
(1368, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:12:56', NULL),
(1369, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:12:56', NULL),
(1370, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:34:15', NULL),
(1371, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:34:20', NULL),
(1372, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:34:21', NULL),
(1373, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:34:40', NULL),
(1374, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:39:32', NULL),
(1375, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:39:36', NULL),
(1376, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:39:37', NULL),
(1377, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:39:40', NULL),
(1378, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:40:34', NULL),
(1379, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:40:38', NULL),
(1380, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:40:39', NULL),
(1381, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:41:27', NULL),
(1382, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:41:32', NULL),
(1383, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.138', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', NULL, '2018-04-29 19:41:32', NULL),
(1384, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 05:48:38', NULL),
(1385, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 05:48:44', NULL),
(1386, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 06:09:54', NULL),
(1387, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 07:56:18', NULL),
(1388, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 07:56:47', NULL),
(1389, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 08:05:38', NULL),
(1390, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 08:06:57', NULL),
(1391, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 08:08:16', NULL),
(1392, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 08:09:07', NULL),
(1393, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 08:12:05', NULL),
(1394, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', NULL, '2018-04-30 08:12:24', NULL),
(1395, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '2.12', '2018-04-30 09:53:45', NULL),
(1396, '04f9f4f1-c10c-4558-bd84-405094d68f33, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.56', '2018-04-30 10:23:11', NULL),
(1397, '04f9f4f1-c10c-4558-bd84-405094d68f33, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.47', '2018-04-30 10:23:13', NULL),
(1398, 'UNKNOWN', '159.203.42.143', 'UNKNOWN', 'Windows 7', 'Firefox', 200, '', 'CA', 'Toronto', '0.50', '2018-04-30 10:23:13', NULL),
(1399, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.92', '2018-04-30 10:25:01', NULL),
(1400, 'b5197c46-2586-4ca4-b693-b9c903dc856e, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.48', '2018-04-30 10:25:09', NULL),
(1401, 'b5197c46-2586-4ca4-b693-b9c903dc856e, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.47', '2018-04-30 10:25:11', NULL),
(1402, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.67', '2018-04-30 10:26:24', NULL),
(1403, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.79', '2018-04-30 11:03:32', NULL),
(1404, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.85', '2018-04-30 11:08:41', NULL),
(1405, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '2.10', '2018-04-30 13:46:57', NULL),
(1406, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', '1.29', '2018-04-30 13:47:00', NULL),
(1407, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'FOOD_TYPE_FETCH', 'IN', '', '1.28', '2018-04-30 13:47:02', NULL),
(1408, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_REGISTER', 'IN', '', '4.30', '2018-04-30 13:47:08', NULL),
(1409, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_SEARCH', 'IN', '', '3.01', '2018-04-30 13:47:24', NULL),
(1410, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOW_SUBMIT', 'IN', '', '2.33', '2018-04-30 13:47:30', NULL),
(1411, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWERS_FETCH', 'IN', '', '2.93', '2018-04-30 13:47:34', NULL),
(1412, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', '', '2.66', '2018-04-30 13:47:38', NULL),
(1413, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', '', '1.28', '2018-04-30 13:47:48', NULL),
(1414, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'INGREDIENT_FETCH', 'IN', '', '2.42', '2018-04-30 13:48:06', NULL),
(1415, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_RECIPE_FETCH', 'IN', '', '1.29', '2018-04-30 13:48:14', NULL),
(1416, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_FETCH_USERS', 'IN', '', '1.93', '2018-04-30 13:48:18', NULL),
(1417, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.75', '2018-04-30 13:48:22', NULL),
(1418, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.71', '2018-04-30 13:48:27', NULL),
(1419, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.54', '2018-04-30 13:48:32', NULL),
(1420, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.75', '2018-04-30 13:48:37', NULL),
(1421, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.70', '2018-04-30 13:48:42', NULL),
(1422, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.25', '2018-04-30 13:48:47', NULL),
(1423, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'LIKE_FETCH_USERS', 'IN', '', '0.47', '2018-04-30 13:48:49', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1424, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'LIKE_FETCH_USERS', 'IN', '', '0.47', '2018-04-30 13:48:51', NULL),
(1425, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'LIKE_FETCH_USERS', 'IN', '', '0.47', '2018-04-30 13:48:53', NULL),
(1426, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'LIKE_FETCH_USERS', 'IN', '', '0.47', '2018-04-30 13:48:55', NULL),
(1427, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'LIKE_FETCH_USERS', 'IN', '', '0.47', '2018-04-30 13:48:57', NULL),
(1428, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'LIKE_FETCH_USERS', 'IN', '', '0.53', '2018-04-30 13:48:59', NULL),
(1429, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_SCOPE_MODIFY', 'IN', '', '1.45', '2018-04-30 13:49:07', NULL),
(1430, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_DELETE', 'IN', '', '1.28', '2018-04-30 13:49:10', NULL),
(1431, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.79', '2018-04-30 13:49:16', NULL),
(1432, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.70', '2018-04-30 13:49:21', NULL),
(1433, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.52', '2018-04-30 13:49:25', NULL),
(1434, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.90', '2018-04-30 13:49:31', NULL),
(1435, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.89', '2018-04-30 13:49:36', NULL),
(1436, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.25', '2018-04-30 13:49:40', NULL),
(1437, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_DELETE', 'IN', '', '2.18', '2018-04-30 13:49:44', NULL),
(1438, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_SUBMIT', 'IN', '', '2.70', '2018-04-30 13:49:49', NULL),
(1439, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH', 'IN', '', '1.60', '2018-04-30 13:49:52', NULL),
(1440, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_AVG_RATING', 'IN', '', '1.28', '2018-04-30 13:50:03', NULL),
(1441, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_DELETE', 'IN', '', '2.00', '2018-04-30 13:50:07', NULL),
(1442, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_FETCH', 'IN', '', '1.60', '2018-04-30 13:50:10', NULL),
(1443, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.25', '2018-04-30 13:50:27', NULL),
(1444, 'be1448d2-ea70-4ea0-b698-45471c984f5f, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.56', '2018-04-30 13:52:35', NULL),
(1445, 'be1448d2-ea70-4ea0-b698-45471c984f5f, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.47', '2018-04-30 13:52:37', NULL),
(1446, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_DELETE', 'IN', '', '0.47', '2018-04-30 13:52:51', NULL),
(1447, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_DELETE', 'IN', '', '0.47', '2018-04-30 13:52:52', NULL),
(1448, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.25', '2018-04-30 13:54:01', NULL),
(1449, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'LIKE_FETCH_USERS', 'IN', '', '0.48', '2018-04-30 13:54:05', NULL),
(1450, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'LIKE_FETCH_USERS', 'IN', '', '0.47', '2018-04-30 13:54:07', NULL),
(1451, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'LIKE_FETCH_USERS', 'IN', '', '0.48', '2018-04-30 13:55:00', NULL),
(1452, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'LIKE_FETCH_USERS', 'IN', '', '0.48', '2018-04-30 13:55:02', NULL),
(1453, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.29', '2018-04-30 13:56:38', NULL),
(1454, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.60', '2018-04-30 13:57:24', NULL),
(1455, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.60', '2018-04-30 13:57:30', NULL),
(1456, '32517d19-3dc5-47e4-8a95-522e0cb1f821, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.56', '2018-04-30 13:57:38', NULL),
(1457, '32517d19-3dc5-47e4-8a95-522e0cb1f821, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.48', '2018-04-30 13:57:40', NULL),
(1458, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.56', '2018-04-30 14:18:35', NULL),
(1459, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.28', '2018-04-30 14:18:42', NULL),
(1460, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.60', '2018-04-30 14:19:18', NULL),
(1461, '757a920b-14c0-4ae0-9383-b69adc05a22b, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.49', '2018-04-30 14:19:53', NULL),
(1462, '757a920b-14c0-4ae0-9383-b69adc05a22b, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.48', '2018-04-30 14:19:55', NULL),
(1463, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.85', '2018-04-30 14:23:43', NULL),
(1464, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', '1.28', '2018-04-30 14:23:46', NULL),
(1465, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'FOOD_TYPE_FETCH', 'IN', '', '1.30', '2018-04-30 14:23:49', NULL),
(1466, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_REGISTER', 'IN', '', '3.86', '2018-04-30 14:23:54', NULL),
(1467, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_SEARCH', 'IN', '', '2.89', '2018-04-30 14:24:12', NULL),
(1468, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOW_SUBMIT', 'IN', '', '2.34', '2018-04-30 14:24:19', NULL),
(1469, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWERS_FETCH', 'IN', '', '3.00', '2018-04-30 14:24:24', NULL),
(1470, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', '', '2.90', '2018-04-30 14:24:29', NULL),
(1471, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', '', '1.32', '2018-04-30 14:24:40', NULL),
(1472, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'INGREDIENT_FETCH', 'IN', '', '2.41', '2018-04-30 14:25:00', NULL),
(1473, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_RECIPE_FETCH', 'IN', '', '1.29', '2018-04-30 14:25:08', NULL),
(1474, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_FETCH_USERS', 'IN', '', '1.93', '2018-04-30 14:25:13', NULL),
(1475, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.65', '2018-04-30 14:25:17', NULL),
(1476, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.64', '2018-04-30 14:25:21', NULL),
(1477, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.50', '2018-04-30 14:25:25', NULL),
(1478, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.72', '2018-04-30 14:25:29', NULL),
(1479, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.69', '2018-04-30 14:25:34', NULL),
(1480, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.58', '2018-04-30 14:25:38', NULL),
(1481, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.28', '2018-04-30 14:25:41', NULL),
(1482, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.28', '2018-04-30 14:25:43', NULL),
(1483, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.28', '2018-04-30 14:25:46', NULL),
(1484, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_SCOPE_MODIFY', 'IN', '', '1.53', '2018-04-30 14:25:52', NULL),
(1485, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_DELETE', 'IN', '', '1.34', '2018-04-30 14:25:55', NULL),
(1486, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.70', '2018-04-30 14:26:00', NULL),
(1487, 'f67ea675-3a79-48b8-ac3f-4d3260031054, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '2.33', '2018-04-30 14:26:01', NULL),
(1488, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '3.46', '2018-04-30 14:26:05', NULL),
(1489, 'f67ea675-3a79-48b8-ac3f-4d3260031054, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '3.72', '2018-04-30 14:26:06', NULL),
(1490, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '3.32', '2018-04-30 14:26:10', NULL),
(1491, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.90', '2018-04-30 14:26:14', NULL),
(1492, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.90', '2018-04-30 14:26:19', NULL),
(1493, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.58', '2018-04-30 14:26:23', NULL),
(1494, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_DELETE', 'IN', '', '2.17', '2018-04-30 14:26:26', NULL),
(1495, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_SUBMIT', 'IN', '', '2.69', '2018-04-30 14:26:31', NULL),
(1496, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH', 'IN', '', '1.60', '2018-04-30 14:26:34', NULL),
(1497, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_AVG_RATING', 'IN', '', '1.33', '2018-04-30 14:26:39', NULL),
(1498, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_DELETE', 'IN', '', '2.14', '2018-04-30 14:26:43', NULL),
(1499, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_FETCH', 'IN', '', '1.60', '2018-04-30 14:26:46', NULL),
(1500, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TREND_FETCH', 'IN', '', '8.34', '2018-04-30 14:28:16', NULL),
(1501, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH_ALL', 'IN', '', '2.18', '2018-04-30 14:28:44', NULL),
(1502, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_SUBMIT', 'IN', '', '2.65', '2018-04-30 14:29:38', NULL),
(1503, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.54', '2018-04-30 14:30:06', NULL),
(1504, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.50', '2018-04-30 14:32:17', NULL),
(1505, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.74', '2018-04-30 14:32:26', NULL),
(1506, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.66', '2018-04-30 14:33:24', NULL),
(1507, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.92', '2018-04-30 14:34:59', NULL),
(1508, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_DELETE', 'IN', '', '1.28', '2018-04-30 14:36:02', NULL),
(1509, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_DELETE', 'IN', '', '1.28', '2018-04-30 14:36:27', NULL),
(1510, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_DELETE', 'IN', '', '1.28', '2018-04-30 14:38:01', NULL),
(1511, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_DELETE', 'IN', '', '1.29', '2018-04-30 14:38:51', NULL),
(1512, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STORY_USER_FETCH', 'IN', '', '3.86', '2018-04-30 14:39:24', NULL),
(1513, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_USER_FETCH', 'IN', '', '3.02', '2018-04-30 14:40:06', NULL),
(1514, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.57', '2018-04-30 14:40:22', NULL),
(1515, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_SEARCH', 'IN', '', '15.58', '2018-04-30 14:46:49', NULL),
(1516, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_DELETE', 'IN', '', '4.77', '2018-04-30 14:48:12', NULL),
(1517, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_DELETE', 'IN', '', '4.30', '2018-04-30 14:51:18', NULL),
(1518, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_USER_VIEWED_FETCH', 'IN', '', '3.87', '2018-04-30 14:51:37', NULL),
(1519, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_USER_FETCH', 'IN', '', '9.46', '2018-04-30 14:52:04', NULL),
(1520, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FAVORITE_FETCH', 'IN', '', '9.34', '2018-04-30 14:52:29', NULL),
(1521, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_IMAGES_FETCH', 'IN', '', '3.22', '2018-04-30 14:52:51', NULL),
(1522, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FETCH', 'IN', '', '6.13', '2018-04-30 14:53:12', NULL),
(1523, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_GENDER', 'IN', '', '3.86', '2018-04-30 14:53:21', NULL),
(1524, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.88', '2018-04-30 14:54:32', NULL),
(1525, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', '1.28', '2018-04-30 14:54:35', NULL),
(1526, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'FOOD_TYPE_FETCH', 'IN', '', '1.28', '2018-04-30 14:54:38', NULL),
(1527, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_REGISTER', 'IN', '', '3.50', '2018-04-30 14:54:43', NULL),
(1528, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_LOGIN', 'IN', '', '3.66', '2018-04-30 14:54:48', NULL),
(1529, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_SELF', 'IN', '', '3.38', '2018-04-30 14:54:53', NULL),
(1530, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_SEARCH', 'IN', '', '2.90', '2018-04-30 14:54:57', NULL),
(1531, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_PUBLIC', 'IN', '', '2.90', '2018-04-30 14:55:01', NULL),
(1532, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOW_SUBMIT', 'IN', '', '3.05', '2018-04-30 14:55:06', NULL),
(1533, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWERS_FETCH', 'IN', '', '2.89', '2018-04-30 14:55:10', NULL),
(1534, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', '', '2.59', '2018-04-30 14:55:14', NULL),
(1535, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_NAME', 'IN', '', '3.63', '2018-04-30 14:55:20', NULL),
(1536, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_EMAIL', 'IN', '', '3.81', '2018-04-30 14:55:25', NULL),
(1537, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', '', '1.29', '2018-04-30 14:55:28', NULL),
(1538, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PHONE', 'IN', '', '3.81', '2018-04-30 14:55:33', NULL),
(1539, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_GENDER', 'IN', '', '3.82', '2018-04-30 14:55:38', NULL),
(1540, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FETCH', 'IN', '', '6.27', '2018-04-30 14:55:46', NULL),
(1541, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_IMAGES_FETCH', 'IN', '', '3.23', '2018-04-30 14:55:51', NULL),
(1542, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FAVORITE_FETCH', 'IN', '', '9.47', '2018-04-30 14:56:02', NULL),
(1543, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_USER_FETCH', 'IN', '', '9.37', '2018-04-30 14:56:13', NULL),
(1544, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_USER_VIEWED_FETCH', 'IN', '', '3.87', '2018-04-30 14:56:18', NULL),
(1545, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_DELETE', 'IN', '', '4.11', '2018-04-30 14:56:27', NULL),
(1546, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_SEARCH', 'IN', '', '15.52', '2018-04-30 14:56:44', NULL),
(1547, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'INGREDIENT_FETCH', 'IN', '', '2.44', '2018-04-30 14:56:49', NULL),
(1548, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_RECIPE_FETCH', 'IN', '', '1.28', '2018-04-30 14:56:56', NULL),
(1549, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_FETCH_USERS', 'IN', '', '1.93', '2018-04-30 14:56:59', NULL),
(1550, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.69', '2018-04-30 14:57:03', NULL),
(1551, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.85', '2018-04-30 14:57:08', NULL),
(1552, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.49', '2018-04-30 14:57:12', NULL),
(1553, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.73', '2018-04-30 14:57:16', NULL),
(1554, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.65', '2018-04-30 14:57:20', NULL),
(1555, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.27', '2018-04-30 14:57:24', NULL),
(1556, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.60', '2018-04-30 14:57:27', NULL),
(1557, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.60', '2018-04-30 14:57:30', NULL),
(1558, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.61', '2018-04-30 14:57:34', NULL),
(1559, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_USER_FETCH', 'IN', '', '3.05', '2018-04-30 14:57:38', NULL),
(1560, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STORY_USER_FETCH', 'IN', '', '3.87', '2018-04-30 14:57:44', NULL),
(1561, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_SCOPE_MODIFY', 'IN', '', '1.44', '2018-04-30 14:57:47', NULL),
(1562, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_DELETE', 'IN', '', '1.28', '2018-04-30 14:57:49', NULL),
(1563, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.68', '2018-04-30 14:57:54', NULL),
(1564, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.73', '2018-04-30 14:57:58', NULL),
(1565, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.50', '2018-04-30 14:58:02', NULL),
(1566, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.90', '2018-04-30 14:58:07', NULL),
(1567, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.90', '2018-04-30 14:58:11', NULL),
(1568, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.90', '2018-04-30 14:58:16', NULL),
(1569, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_DELETE', 'IN', '', '2.18', '2018-04-30 14:58:19', NULL),
(1570, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_SUBMIT', 'IN', '', '2.70', '2018-04-30 14:58:24', NULL),
(1571, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH', 'IN', '', '1.60', '2018-04-30 14:58:27', NULL),
(1572, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH_ALL', 'IN', '', '2.09', '2018-04-30 14:58:31', NULL),
(1573, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_AVG_RATING', 'IN', '', '1.28', '2018-04-30 14:58:34', NULL),
(1574, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_DELETE', 'IN', '', '1.99', '2018-04-30 14:58:37', NULL),
(1575, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_FETCH', 'IN', '', '1.61', '2018-04-30 14:58:40', NULL),
(1576, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TREND_FETCH', 'IN', '', '8.22', '2018-04-30 14:58:50', NULL),
(1577, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.77', '2018-04-30 14:59:40', NULL),
(1578, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.78', '2018-04-30 15:01:30', NULL),
(1579, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', '1.37', '2018-04-30 15:02:20', NULL),
(1580, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', '1.28', '2018-04-30 15:03:04', NULL),
(1581, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'FOOD_TYPE_FETCH', 'IN', '', '1.28', '2018-04-30 15:05:14', NULL),
(1582, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_EMAIL', 'IN', '', '3.86', '2018-04-30 15:05:46', NULL),
(1583, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_EMAIL', 'IN', '', '3.83', '2018-04-30 15:06:00', NULL),
(1584, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', '', '1.43', '2018-04-30 15:06:20', NULL),
(1585, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', '', '3.77', '2018-04-30 15:06:40', NULL),
(1586, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', '', '3.86', '2018-04-30 15:07:45', NULL),
(1587, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_IMAGES_FETCH', 'IN', '', '3.23', '2018-04-30 15:08:07', NULL),
(1588, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_IMAGES_FETCH', 'IN', '', '3.22', '2018-04-30 15:08:18', NULL),
(1589, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.66', '2018-04-30 15:08:44', NULL),
(1590, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TREND_FETCH', 'IN', '', '8.23', '2018-04-30 15:09:50', NULL),
(1591, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TREND_FETCH', 'IN', '', '8.22', '2018-04-30 15:10:55', NULL),
(1592, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.93', '2018-04-30 15:17:46', NULL),
(1593, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', '1.28', '2018-04-30 15:17:49', NULL),
(1594, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'FOOD_TYPE_FETCH', 'IN', '', '1.33', '2018-04-30 15:17:52', NULL),
(1595, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_REGISTER', 'IN', '', '3.80', '2018-04-30 15:17:57', NULL),
(1596, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_LOGIN', 'IN', '', '3.73', '2018-04-30 15:18:02', NULL),
(1597, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_SELF', 'IN', '', '3.40', '2018-04-30 15:18:07', NULL),
(1598, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_SEARCH', 'IN', '', '2.90', '2018-04-30 15:18:11', NULL),
(1599, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_PUBLIC', 'IN', '', '2.91', '2018-04-30 15:18:16', NULL),
(1600, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOW_SUBMIT', 'IN', '', '2.35', '2018-04-30 15:18:20', NULL),
(1601, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWERS_FETCH', 'IN', '', '2.90', '2018-04-30 15:18:25', NULL),
(1602, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', '', '2.90', '2018-04-30 15:18:30', NULL),
(1603, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_NAME', 'IN', '', '3.61', '2018-04-30 15:18:35', NULL),
(1604, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_EMAIL', 'IN', '', '3.77', '2018-04-30 15:18:41', NULL),
(1605, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', '', '3.83', '2018-04-30 15:18:46', NULL),
(1606, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PHONE', 'IN', '', '3.81', '2018-04-30 15:18:51', NULL),
(1607, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_GENDER', 'IN', '', '3.78', '2018-04-30 15:18:56', NULL),
(1608, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FETCH', 'IN', '', '6.17', '2018-04-30 15:19:04', NULL),
(1609, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_IMAGES_FETCH', 'IN', '', '3.22', '2018-04-30 15:19:09', NULL),
(1610, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FAVORITE_FETCH', 'IN', '', '9.36', '2018-04-30 15:19:20', NULL),
(1611, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_USER_FETCH', 'IN', '', '9.36', '2018-04-30 15:19:31', NULL),
(1612, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_USER_VIEWED_FETCH', 'IN', '', '3.87', '2018-04-30 15:19:36', NULL),
(1613, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_DELETE', 'IN', '', '4.12', '2018-04-30 15:19:45', NULL),
(1614, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_SEARCH', 'IN', '', '15.52', '2018-04-30 15:20:02', NULL),
(1615, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'INGREDIENT_FETCH', 'IN', '', '2.41', '2018-04-30 15:20:06', NULL),
(1616, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_RECIPE_FETCH', 'IN', '', '1.30', '2018-04-30 15:20:13', NULL),
(1617, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_FETCH_USERS', 'IN', '', '1.92', '2018-04-30 15:20:16', NULL),
(1618, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.70', '2018-04-30 15:20:21', NULL),
(1619, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.68', '2018-04-30 15:20:25', NULL),
(1620, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.61', '2018-04-30 15:20:29', NULL),
(1621, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.73', '2018-04-30 15:20:33', NULL),
(1622, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.76', '2018-04-30 15:20:37', NULL),
(1623, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.26', '2018-04-30 15:20:41', NULL),
(1624, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.28', '2018-04-30 15:20:44', NULL),
(1625, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.28', '2018-04-30 15:20:47', NULL),
(1626, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.36', '2018-04-30 15:20:50', NULL),
(1627, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_USER_FETCH', 'IN', '', '3.06', '2018-04-30 15:20:55', NULL),
(1628, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STORY_USER_FETCH', 'IN', '', '3.90', '2018-04-30 15:21:00', NULL),
(1629, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_SCOPE_MODIFY', 'IN', '', '1.44', '2018-04-30 15:21:03', NULL),
(1630, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_DELETE', 'IN', '', '1.30', '2018-04-30 15:21:06', NULL),
(1631, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.67', '2018-04-30 15:21:10', NULL),
(1632, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.67', '2018-04-30 15:21:14', NULL),
(1633, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.52', '2018-04-30 15:21:21', NULL),
(1634, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.93', '2018-04-30 15:21:25', NULL),
(1635, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.90', '2018-04-30 15:21:30', NULL),
(1636, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.93', '2018-04-30 15:21:34', NULL),
(1637, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_DELETE', 'IN', '', '2.21', '2018-04-30 15:21:38', NULL),
(1638, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_SUBMIT', 'IN', '', '2.75', '2018-04-30 15:21:42', NULL),
(1639, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH', 'IN', '', '1.60', '2018-04-30 15:21:46', NULL),
(1640, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH_ALL', 'IN', '', '2.09', '2018-04-30 15:21:49', NULL),
(1641, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_AVG_RATING', 'IN', '', '1.28', '2018-04-30 15:21:52', NULL),
(1642, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_DELETE', 'IN', '', '2.00', '2018-04-30 15:21:56', NULL),
(1643, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_FETCH', 'IN', '', '1.65', '2018-04-30 15:21:59', NULL),
(1644, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TREND_FETCH', 'IN', '', '8.23', '2018-04-30 15:22:09', NULL),
(1645, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.49', '2018-04-30 15:56:47', NULL),
(1646, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.77', '2018-04-30 15:57:39', NULL),
(1647, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', '1.28', '2018-04-30 15:57:42', NULL),
(1648, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'FOOD_TYPE_FETCH', 'IN', '', '1.29', '2018-04-30 15:57:46', NULL),
(1649, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_REGISTER', 'IN', '', '3.77', '2018-04-30 15:57:52', NULL),
(1650, 'b9524cd8-d092-470d-b20a-583fafcf7434, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '3.67', '2018-04-30 15:57:54', NULL),
(1651, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_LOGIN', 'IN', '', '3.54', '2018-04-30 15:57:58', NULL),
(1652, 'b9524cd8-d092-470d-b20a-583fafcf7434, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '4.57', '2018-04-30 15:58:00', NULL),
(1653, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_SELF', 'IN', '', '3.42', '2018-04-30 15:58:04', NULL),
(1654, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_SEARCH', 'IN', '', '2.90', '2018-04-30 15:58:09', NULL),
(1655, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_PUBLIC', 'IN', '', '2.92', '2018-04-30 15:58:15', NULL),
(1656, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOW_SUBMIT', 'IN', '', '2.47', '2018-04-30 15:58:20', NULL),
(1657, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWERS_FETCH', 'IN', '', '2.97', '2018-04-30 15:58:25', NULL),
(1658, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', '', '2.59', '2018-04-30 15:58:30', NULL),
(1659, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_NAME', 'IN', '', '3.74', '2018-04-30 15:58:37', NULL),
(1660, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_EMAIL', 'IN', '', '3.87', '2018-04-30 15:58:43', NULL),
(1661, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', '', '4.01', '2018-04-30 15:58:50', NULL),
(1662, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PHONE', 'IN', '', '3.77', '2018-04-30 15:58:56', NULL),
(1663, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_GENDER', 'IN', '', '3.91', '2018-04-30 15:59:02', NULL),
(1664, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FETCH', 'IN', '', '6.15', '2018-04-30 15:59:11', NULL),
(1665, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_IMAGES_FETCH', 'IN', '', '3.22', '2018-04-30 15:59:17', NULL),
(1666, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FAVORITE_FETCH', 'IN', '', '7.75', '2018-04-30 15:59:27', NULL),
(1667, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_USER_FETCH', 'IN', '', '9.36', '2018-04-30 15:59:39', NULL),
(1668, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_USER_VIEWED_FETCH', 'IN', '', '3.87', '2018-04-30 15:59:45', NULL),
(1669, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_DELETE', 'IN', '', '4.23', '2018-04-30 15:59:56', NULL),
(1670, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_SEARCH', 'IN', '', '15.49', '2018-04-30 16:00:14', NULL),
(1671, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'INGREDIENT_FETCH', 'IN', '', '2.41', '2018-04-30 16:00:19', NULL),
(1672, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_RECIPE_FETCH', 'IN', '', '1.28', '2018-04-30 16:00:28', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1673, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_FETCH_USERS', 'IN', '', '1.93', '2018-04-30 16:00:33', NULL),
(1674, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.73', '2018-04-30 16:00:38', NULL),
(1675, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.67', '2018-04-30 16:00:43', NULL),
(1676, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.52', '2018-04-30 16:00:49', NULL),
(1677, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.71', '2018-04-30 16:00:54', NULL),
(1678, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.75', '2018-04-30 16:00:59', NULL),
(1679, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.57', '2018-04-30 16:01:04', NULL),
(1680, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.60', '2018-04-30 16:01:08', NULL),
(1681, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.60', '2018-04-30 16:01:13', NULL),
(1682, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.60', '2018-04-30 16:01:17', NULL),
(1683, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_USER_FETCH', 'IN', '', '3.06', '2018-04-30 16:01:22', NULL),
(1684, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STORY_USER_FETCH', 'IN', '', '3.90', '2018-04-30 16:01:29', NULL),
(1685, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_SCOPE_MODIFY', 'IN', '', '1.44', '2018-04-30 16:01:33', NULL),
(1686, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_DELETE', 'IN', '', '1.28', '2018-04-30 16:01:37', NULL),
(1687, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.68', '2018-04-30 16:01:42', NULL),
(1688, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.75', '2018-04-30 16:01:47', NULL),
(1689, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.52', '2018-04-30 16:01:52', NULL),
(1690, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.89', '2018-04-30 16:01:58', NULL),
(1691, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.94', '2018-04-30 16:02:04', NULL),
(1692, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.92', '2018-04-30 16:02:09', NULL),
(1693, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_DELETE', 'IN', '', '2.17', '2018-04-30 16:02:14', NULL),
(1694, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_SUBMIT', 'IN', '', '2.71', '2018-04-30 16:02:19', NULL),
(1695, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH', 'IN', '', '1.61', '2018-04-30 16:02:23', NULL),
(1696, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH_ALL', 'IN', '', '2.09', '2018-04-30 16:02:28', NULL),
(1697, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_AVG_RATING', 'IN', '', '1.30', '2018-04-30 16:02:32', NULL),
(1698, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_DELETE', 'IN', '', '2.06', '2018-04-30 16:02:37', NULL),
(1699, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_FETCH', 'IN', '', '1.61', '2018-04-30 16:02:41', NULL),
(1700, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TREND_FETCH', 'IN', '', '8.23', '2018-04-30 16:02:52', NULL),
(1701, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'SG', 'Singapore', '2.02', '2018-04-30 16:18:07', NULL),
(1702, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'CUISINE_FETCH', 'SG', 'Singapore', '1.39', '2018-04-30 16:18:10', NULL),
(1703, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'FOOD_TYPE_FETCH', 'SG', 'Singapore', '1.30', '2018-04-30 16:18:12', NULL),
(1704, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_REGISTER', 'SG', 'Singapore', '3.59', '2018-04-30 16:18:17', NULL),
(1705, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_LOGIN', 'SG', 'Singapore', '3.55', '2018-04-30 16:18:22', NULL),
(1706, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'SG', 'Singapore', '3.38', '2018-04-30 16:18:27', NULL),
(1707, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_SEARCH', 'SG', 'Singapore', '2.90', '2018-04-30 16:18:31', NULL),
(1708, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'SG', 'Singapore', '2.91', '2018-04-30 16:18:35', NULL),
(1709, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FOLLOW_SUBMIT', 'SG', 'Singapore', '2.36', '2018-04-30 16:18:39', NULL),
(1710, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'SG', 'Singapore', '2.90', '2018-04-30 16:18:44', NULL),
(1711, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'SG', 'Singapore', '2.91', '2018-04-30 16:18:48', NULL),
(1712, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'SG', 'Singapore', '3.71', '2018-04-30 16:18:53', NULL),
(1713, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_EMAIL', 'SG', 'Singapore', '3.81', '2018-04-30 16:18:58', NULL),
(1714, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'SG', 'Singapore', '3.82', '2018-04-30 16:19:03', NULL),
(1715, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_PHONE', 'SG', 'Singapore', '3.80', '2018-04-30 16:19:09', NULL),
(1716, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_GENDER', 'SG', 'Singapore', '3.82', '2018-04-30 16:19:14', NULL),
(1717, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_FETCH', 'SG', 'Singapore', '6.13', '2018-04-30 16:19:21', NULL),
(1718, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'SG', 'Singapore', '3.30', '2018-04-30 16:19:26', NULL),
(1719, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_FAVORITE_FETCH', 'SG', 'Singapore', '9.36', '2018-04-30 16:19:37', NULL),
(1720, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_USER_FETCH', 'SG', 'Singapore', '9.38', '2018-04-30 16:19:48', NULL),
(1721, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_USER_VIEWED_FETCH', 'SG', 'Singapore', '3.87', '2018-04-30 16:19:53', NULL),
(1722, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_DELETE', 'SG', 'Singapore', '4.08', '2018-04-30 16:20:02', NULL),
(1723, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_SEARCH', 'SG', 'Singapore', '15.50', '2018-04-30 16:20:19', NULL),
(1724, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'INGREDIENT_FETCH', 'SG', 'Singapore', '2.41', '2018-04-30 16:20:23', NULL),
(1725, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'VIEW_RECIPE_FETCH', 'SG', 'Singapore', '1.31', '2018-04-30 16:20:29', NULL),
(1726, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'SG', 'Singapore', '1.93', '2018-04-30 16:20:33', NULL),
(1727, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'SG', 'Singapore', '2.65', '2018-04-30 16:20:37', NULL),
(1728, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'SG', 'Singapore', '2.65', '2018-04-30 16:20:41', NULL),
(1729, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'SG', 'Singapore', '2.50', '2018-04-30 16:20:45', NULL),
(1730, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'SG', 'Singapore', '2.66', '2018-04-30 16:20:49', NULL),
(1731, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'SG', 'Singapore', '2.70', '2018-04-30 16:20:53', NULL),
(1732, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_FETCH_USERS', 'SG', 'Singapore', '2.26', '2018-04-30 16:20:56', NULL),
(1733, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_FETCH_USERS', 'SG', 'Singapore', '1.28', '2018-04-30 16:20:59', NULL),
(1734, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_FETCH_USERS', 'SG', 'Singapore', '1.28', '2018-04-30 16:21:02', NULL),
(1735, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_FETCH_USERS', 'SG', 'Singapore', '1.28', '2018-04-30 16:21:04', NULL),
(1736, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'SG', 'Singapore', '3.09', '2018-04-30 16:21:09', NULL),
(1737, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'SG', 'Singapore', '3.90', '2018-04-30 16:21:14', NULL),
(1738, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_SCOPE_MODIFY', 'SG', 'Singapore', '1.45', '2018-04-30 16:21:17', NULL),
(1739, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_DELETE', 'SG', 'Singapore', '1.28', '2018-04-30 16:21:20', NULL),
(1740, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_SUBMIT', 'SG', 'Singapore', '2.64', '2018-04-30 16:21:24', NULL),
(1741, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_SUBMIT', 'SG', 'Singapore', '2.68', '2018-04-30 16:21:28', NULL),
(1742, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_SUBMIT', 'SG', 'Singapore', '2.51', '2018-04-30 16:21:32', NULL),
(1743, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_FETCH_ALL', 'SG', 'Singapore', '2.90', '2018-04-30 16:21:36', NULL),
(1744, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_FETCH_ALL', 'SG', 'Singapore', '2.91', '2018-04-30 16:21:41', NULL),
(1745, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_FETCH_ALL', 'SG', 'Singapore', '2.90', '2018-04-30 16:21:45', NULL),
(1746, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_DELETE', 'SG', 'Singapore', '2.17', '2018-04-30 16:21:49', NULL),
(1747, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_SUBMIT', 'SG', 'Singapore', '2.70', '2018-04-30 16:21:53', NULL),
(1748, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_USER_FETCH', 'SG', 'Singapore', '1.62', '2018-04-30 16:21:56', NULL),
(1749, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_USER_FETCH_ALL', 'SG', 'Singapore', '2.09', '2018-04-30 16:21:59', NULL),
(1750, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_RECIPE_AVG_RATING', 'SG', 'Singapore', '1.29', '2018-04-30 16:22:02', NULL),
(1751, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_DELETE', 'SG', 'Singapore', '2.04', '2018-04-30 16:22:05', NULL),
(1752, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_RECIPE_FETCH', 'SG', 'Singapore', '1.60', '2018-04-30 16:22:08', NULL),
(1753, 'fhbjgbiflinjbdggehcddcbncdddomop', '52.221.253.202', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'TREND_FETCH', 'SG', 'Singapore', '8.36', '2018-04-30 16:22:18', NULL),
(1754, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.34', '2018-04-30 16:23:28', NULL),
(1755, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.28', '2018-04-30 16:23:39', NULL),
(1756, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.68', '2018-04-30 16:24:30', NULL),
(1757, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.60', '2018-04-30 16:24:40', NULL),
(1758, 'fa3b6e6c-bb3f-4848-9b77-a40c27e04589, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.47', '2018-04-30 16:26:18', NULL),
(1759, 'fa3b6e6c-bb3f-4848-9b77-a40c27e04589, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.48', '2018-04-30 16:26:19', NULL),
(1760, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_DELETE', 'IN', '', '0.47', '2018-04-30 16:26:27', NULL),
(1761, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_DELETE', 'IN', '', '0.47', '2018-04-30 16:26:29', NULL),
(1762, '5c70ff11-8bbe-4b8c-a333-c6e34defd700, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.56', '2018-04-30 18:23:51', NULL),
(1763, '5c70ff11-8bbe-4b8c-a333-c6e34defd700, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.47', '2018-04-30 18:23:53', NULL),
(1764, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.76', '2018-04-30 18:24:20', NULL),
(1765, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'CUISINE_FETCH', 'IN', '', '1.28', '2018-04-30 18:24:24', NULL),
(1766, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'FOOD_TYPE_FETCH', 'IN', '', '1.28', '2018-04-30 18:24:28', NULL),
(1767, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_REGISTER', 'IN', '', '3.26', '2018-04-30 18:24:34', NULL),
(1768, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_LOGIN', 'IN', '', '3.54', '2018-04-30 18:24:41', NULL),
(1769, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_SELF', 'IN', '', '3.39', '2018-04-30 18:24:48', NULL),
(1770, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_SEARCH', 'IN', '', '2.92', '2018-04-30 18:24:53', NULL),
(1771, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_PUBLIC', 'IN', '', '2.90', '2018-04-30 18:24:59', NULL),
(1772, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOW_SUBMIT', 'IN', '', '2.35', '2018-04-30 18:25:04', NULL),
(1773, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWERS_FETCH', 'IN', '', '2.90', '2018-04-30 18:25:10', NULL),
(1774, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FOLLOWINGS_FETCH', 'IN', '', '2.60', '2018-04-30 18:25:16', NULL),
(1775, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_NAME', 'IN', '', '3.62', '2018-04-30 18:25:23', NULL),
(1776, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_EMAIL', 'IN', '', '3.83', '2018-04-30 18:25:30', NULL),
(1777, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PASSWORD', 'IN', '', '3.85', '2018-04-30 18:25:37', NULL),
(1778, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_PHONE', 'IN', '', '3.86', '2018-04-30 18:25:44', NULL),
(1779, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_UPDATE_GENDER', 'IN', '', '3.78', '2018-04-30 18:25:51', NULL),
(1780, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FETCH', 'IN', '', '6.17', '2018-04-30 18:26:00', NULL),
(1781, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_IMAGES_FETCH', 'IN', '', '3.22', '2018-04-30 18:26:06', NULL),
(1782, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FAVORITE_FETCH', 'IN', '', '7.76', '2018-04-30 18:26:17', NULL),
(1783, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_USER_FETCH', 'IN', '', '9.36', '2018-04-30 18:26:31', NULL),
(1784, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_USER_VIEWED_FETCH', 'IN', '', '4.63', '2018-04-30 18:26:39', NULL),
(1785, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_DELETE', 'IN', '', '4.21', '2018-04-30 18:26:51', NULL),
(1786, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_SEARCH', 'IN', '', '15.57', '2018-04-30 18:27:10', NULL),
(1787, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'INGREDIENT_FETCH', 'IN', '', '2.41', '2018-04-30 18:27:16', NULL),
(1788, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_RECIPE_FETCH', 'IN', '', '1.28', '2018-04-30 18:27:25', NULL),
(1789, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'VIEW_FETCH_USERS', 'IN', '', '1.93', '2018-04-30 18:27:30', NULL),
(1790, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '2.27', '2018-04-30 18:27:35', NULL),
(1791, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.64', '2018-04-30 18:27:40', NULL),
(1792, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.38', '2018-04-30 18:27:45', NULL),
(1793, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_FETCH_USERS', 'IN', '', '1.34', '2018-04-30 18:27:49', NULL),
(1794, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.66', '2018-04-30 18:27:55', NULL),
(1795, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.70', '2018-04-30 18:28:01', NULL),
(1796, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.51', '2018-04-30 18:28:07', NULL),
(1797, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.68', '2018-04-30 18:28:13', NULL),
(1798, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'LIKE_SUBMIT', 'IN', '', '2.72', '2018-04-30 18:28:19', NULL),
(1799, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_USER_FETCH', 'IN', '', '3.06', '2018-04-30 18:28:25', NULL),
(1800, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STORY_USER_FETCH', 'IN', '', '3.87', '2018-04-30 18:28:32', NULL),
(1801, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_SCOPE_MODIFY', 'IN', '', '1.45', '2018-04-30 18:28:37', NULL),
(1802, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TIMELINE_DELETE', 'IN', '', '1.29', '2018-04-30 18:28:40', NULL),
(1803, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.69', '2018-04-30 18:28:46', NULL),
(1804, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.77', '2018-04-30 18:28:52', NULL),
(1805, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_SUBMIT', 'IN', '', '2.51', '2018-04-30 18:28:58', NULL),
(1806, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.90', '2018-04-30 18:29:04', NULL),
(1807, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.89', '2018-04-30 18:29:10', NULL),
(1808, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_FETCH_ALL', 'IN', '', '2.89', '2018-04-30 18:29:16', NULL),
(1809, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'COMMENT_DELETE', 'IN', '', '2.23', '2018-04-30 18:29:21', NULL),
(1810, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_SUBMIT', 'IN', '', '2.67', '2018-04-30 18:29:27', NULL),
(1811, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH', 'IN', '', '1.61', '2018-04-30 18:29:32', NULL),
(1812, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_USER_FETCH_ALL', 'IN', '', '2.09', '2018-04-30 18:29:37', NULL),
(1813, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_AVG_RATING', 'IN', '', '1.28', '2018-04-30 18:29:41', NULL),
(1814, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_DELETE', 'IN', '', '2.01', '2018-04-30 18:29:47', NULL),
(1815, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'REVIEW_RECIPE_FETCH', 'IN', '', '1.61', '2018-04-30 18:29:52', NULL),
(1816, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'TREND_FETCH', 'IN', '', '8.23', '2018-04-30 18:30:03', NULL),
(1817, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.24', '2018-04-30 20:17:30', NULL),
(1818, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.48', '2018-04-30 20:17:35', NULL),
(1819, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-04-30 20:17:35', NULL),
(1820, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.27', '2018-04-30 20:42:28', NULL),
(1821, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.88', '2018-04-30 20:42:33', NULL),
(1822, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.88', '2018-04-30 20:42:42', NULL),
(1823, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.18', '2018-04-30 20:42:45', NULL),
(1824, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.23', '2018-04-30 20:43:04', NULL),
(1825, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.94', '2018-04-30 20:43:59', NULL),
(1826, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.24', '2018-04-30 20:44:04', NULL),
(1827, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-04-30 20:44:04', NULL),
(1828, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.15', '2018-04-30 20:44:12', NULL),
(1829, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.22', '2018-04-30 20:44:19', NULL),
(1830, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.02', '2018-04-30 20:46:20', NULL),
(1831, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.25', '2018-04-30 20:46:25', NULL),
(1832, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-04-30 20:46:25', NULL),
(1833, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.17', '2018-04-30 20:46:32', NULL),
(1834, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.23', '2018-04-30 20:46:39', NULL),
(1835, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.96', '2018-04-30 20:50:18', NULL),
(1836, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.24', '2018-04-30 20:50:23', NULL),
(1837, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-04-30 20:50:23', NULL),
(1838, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.13', '2018-04-30 20:50:30', NULL),
(1839, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.22', '2018-04-30 20:50:38', NULL),
(1840, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.87', '2018-04-30 20:52:01', NULL),
(1841, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.25', '2018-04-30 20:52:05', NULL),
(1842, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.73', '2018-04-30 20:52:06', NULL),
(1843, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.16', '2018-04-30 20:52:17', NULL),
(1844, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.22', '2018-04-30 20:52:25', NULL),
(1845, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.32', '2018-04-30 20:56:32', NULL),
(1846, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.10', '2018-04-30 21:05:33', NULL),
(1847, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.24', '2018-04-30 21:05:38', NULL),
(1848, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-04-30 21:05:39', NULL),
(1849, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.12', '2018-04-30 21:05:45', NULL),
(1850, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.13', '2018-04-30 21:05:46', NULL),
(1851, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.14', '2018-04-30 21:14:02', NULL),
(1852, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.27', '2018-04-30 21:14:06', NULL),
(1853, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.70', '2018-04-30 21:14:07', NULL),
(1854, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.87', '2018-04-30 21:14:40', NULL),
(1855, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.22', '2018-04-30 21:14:45', NULL),
(1856, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-04-30 21:14:45', NULL),
(1857, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.15', '2018-04-30 21:14:52', NULL),
(1858, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'FAV_SUBMIT', 'IN', 'Chennai', '1.76', '2018-04-30 21:15:30', NULL),
(1859, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'FAV_SUBMIT', 'IN', 'Chennai', '1.71', '2018-04-30 21:15:34', NULL),
(1860, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.95', '2018-04-30 21:19:31', NULL),
(1861, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.23', '2018-04-30 21:19:35', NULL),
(1862, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.72', '2018-04-30 21:19:36', NULL),
(1863, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.12', '2018-04-30 21:19:42', NULL),
(1864, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.87', '2018-04-30 21:20:29', NULL),
(1865, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.23', '2018-04-30 21:20:34', NULL),
(1866, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.88', '2018-04-30 21:20:34', NULL),
(1867, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.13', '2018-04-30 21:20:41', NULL),
(1868, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.93', '2018-04-30 21:21:05', NULL),
(1869, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.25', '2018-04-30 21:21:10', NULL),
(1870, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-04-30 21:21:10', NULL),
(1871, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.14', '2018-04-30 21:21:17', NULL),
(1872, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.97', '2018-04-30 21:27:14', NULL),
(1873, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.24', '2018-04-30 21:27:18', NULL),
(1874, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.70', '2018-04-30 21:27:19', NULL),
(1875, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.13', '2018-04-30 21:27:26', NULL),
(1876, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.14', '2018-04-30 21:27:26', NULL),
(1877, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.86', '2018-04-30 21:29:33', NULL),
(1878, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.21', '2018-04-30 21:29:38', NULL),
(1879, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-04-30 21:29:39', NULL),
(1880, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.87', '2018-04-30 21:31:16', NULL),
(1881, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.24', '2018-04-30 21:31:20', NULL),
(1882, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.70', '2018-04-30 21:31:21', NULL),
(1883, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.19', '2018-04-30 21:31:28', NULL),
(1884, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.00', '2018-04-30 21:32:33', NULL),
(1885, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.22', '2018-04-30 21:32:37', NULL),
(1886, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-04-30 21:32:38', NULL),
(1887, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.86', '2018-04-30 21:34:10', NULL),
(1888, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.23', '2018-04-30 21:34:20', NULL),
(1889, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.73', '2018-04-30 21:34:25', NULL),
(1890, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.12', '2018-04-30 21:45:56', NULL),
(1891, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.21', '2018-04-30 21:46:00', NULL),
(1892, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.70', '2018-04-30 21:46:01', NULL),
(1893, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.13', '2018-04-30 21:46:10', NULL),
(1894, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.34', '2018-04-30 21:46:18', NULL),
(1895, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.22', '2018-04-30 21:46:18', NULL),
(1896, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.54', '2018-05-01 03:57:05', NULL),
(1897, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.56', '2018-05-01 03:57:09', NULL),
(1898, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.70', '2018-05-01 03:57:10', NULL),
(1899, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.13', '2018-05-01 03:57:21', NULL),
(1900, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.26', '2018-05-01 03:58:15', NULL),
(1901, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.87', '2018-05-01 03:59:55', NULL),
(1902, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.23', '2018-05-01 03:59:59', NULL),
(1903, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.70', '2018-05-01 03:59:59', NULL),
(1904, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.13', '2018-05-01 04:00:11', NULL),
(1905, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.25', '2018-05-01 04:01:11', NULL),
(1906, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.96', '2018-05-01 04:02:40', NULL),
(1907, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.23', '2018-05-01 04:02:44', NULL),
(1908, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-05-01 04:02:44', NULL),
(1909, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.22', '2018-05-01 04:02:48', NULL),
(1910, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.88', '2018-05-01 04:04:24', NULL),
(1911, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.23', '2018-05-01 04:04:29', NULL),
(1912, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-05-01 04:04:29', NULL),
(1913, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.87', '2018-05-01 04:04:52', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1914, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.23', '2018-05-01 04:04:56', NULL),
(1915, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-05-01 04:04:57', NULL),
(1916, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.31', '2018-05-01 04:05:30', NULL),
(1917, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.97', '2018-05-01 04:08:29', NULL),
(1918, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.24', '2018-05-01 04:08:33', NULL),
(1919, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-05-01 04:08:34', NULL),
(1920, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.13', '2018-05-01 04:08:41', NULL),
(1921, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.22', '2018-05-01 04:08:53', NULL),
(1922, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.26', '2018-05-01 04:09:16', NULL),
(1923, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.41', '2018-05-01 04:11:51', NULL),
(1924, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.53', '2018-05-01 04:12:27', NULL),
(1925, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.43', '2018-05-01 04:34:17', NULL),
(1926, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.63', '2018-05-01 04:34:21', NULL),
(1927, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-05-01 04:34:22', NULL),
(1928, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.40', '2018-05-01 05:02:54', NULL),
(1929, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.22', '2018-05-01 05:03:01', NULL),
(1930, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.87', '2018-05-01 05:04:03', NULL),
(1931, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.23', '2018-05-01 05:04:08', NULL),
(1932, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-05-01 05:04:08', NULL),
(1933, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.12', '2018-05-01 05:04:19', NULL),
(1934, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'IN', 'Chennai', '3.22', '2018-05-01 05:04:25', NULL),
(1935, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.38', '2018-05-01 05:04:53', NULL),
(1936, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.87', '2018-05-01 05:05:41', NULL),
(1937, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.23', '2018-05-01 05:05:45', NULL),
(1938, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.72', '2018-05-01 05:05:45', NULL),
(1939, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.39', '2018-05-01 05:06:03', NULL),
(1940, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.88', '2018-05-01 05:07:12', NULL),
(1941, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.22', '2018-05-01 05:07:17', NULL),
(1942, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.71', '2018-05-01 05:07:17', NULL),
(1943, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.12', '2018-05-01 05:07:24', NULL),
(1944, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.48.145', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.38', '2018-05-01 05:07:35', NULL),
(1945, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.95', '2018-05-02 15:02:00', NULL),
(1946, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.31', '2018-05-02 15:02:04', NULL),
(1947, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.81', '2018-05-02 15:02:05', NULL),
(1948, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.62', '2018-05-02 15:06:00', NULL),
(1949, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.98', '2018-05-02 15:07:52', NULL),
(1950, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.23', '2018-05-02 15:07:56', NULL),
(1951, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 15:07:56', NULL),
(1952, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.58', '2018-05-02 15:09:42', NULL),
(1953, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.10', '2018-05-02 15:23:41', NULL),
(1954, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.34', '2018-05-02 15:23:44', NULL),
(1955, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 15:23:44', NULL),
(1956, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.97', '2018-05-02 15:28:37', NULL),
(1957, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.30', '2018-05-02 15:28:40', NULL),
(1958, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 15:28:41', NULL),
(1959, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.62', '2018-05-02 15:29:06', NULL),
(1960, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.93', '2018-05-02 15:31:06', NULL),
(1961, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.26', '2018-05-02 15:31:09', NULL),
(1962, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 15:31:10', NULL),
(1963, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.83.49.55', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-02 15:31:13', NULL),
(1964, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.72', '2018-05-02 16:32:17', NULL),
(1965, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_UPDATE_EMAIL', 'IN', 'Chennai', '2.90', '2018-05-02 16:32:56', NULL),
(1966, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 16:33:28', NULL),
(1967, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.32', '2018-05-02 16:35:10', NULL),
(1968, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.31', '2018-05-02 16:35:16', NULL),
(1969, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.26', '2018-05-02 18:11:48', NULL),
(1970, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.81', '2018-05-02 18:11:52', NULL),
(1971, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.31', '2018-05-02 18:11:53', NULL),
(1972, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.39', '2018-05-02 18:14:42', NULL),
(1973, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.64', '2018-05-02 18:14:45', NULL),
(1974, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 18:14:46', NULL),
(1975, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-02 18:14:48', NULL),
(1976, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.14', '2018-05-02 18:15:37', NULL),
(1977, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.14', '2018-05-02 18:15:41', NULL),
(1978, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.42', '2018-05-02 18:15:41', NULL),
(1979, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-02 18:15:45', NULL),
(1980, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.97', '2018-05-02 18:20:53', NULL),
(1981, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.23', '2018-05-02 18:20:57', NULL),
(1982, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 18:20:57', NULL),
(1983, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.56', '2018-05-02 18:21:18', NULL),
(1984, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-02 18:22:05', NULL),
(1985, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.23', '2018-05-02 18:22:08', NULL),
(1986, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 18:22:09', NULL),
(1987, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.56', '2018-05-02 18:22:27', NULL),
(1988, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-02 18:23:44', NULL),
(1989, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.22', '2018-05-02 18:23:47', NULL),
(1990, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 18:23:47', NULL),
(1991, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-02 18:24:01', NULL),
(1992, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-02 18:24:53', NULL),
(1993, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.23', '2018-05-02 18:24:57', NULL),
(1994, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 18:24:58', NULL),
(1995, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-02 18:25:19', NULL),
(1996, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.93', '2018-05-02 18:25:53', NULL),
(1997, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.28', '2018-05-02 18:25:57', NULL),
(1998, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.79', '2018-05-02 18:25:57', NULL),
(1999, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.56', '2018-05-02 18:26:01', NULL),
(2000, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-02 18:26:39', NULL),
(2001, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.24', '2018-05-02 18:26:42', NULL),
(2002, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 18:26:43', NULL),
(2003, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.56', '2018-05-02 18:26:46', NULL),
(2004, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.57', '2018-05-02 18:26:47', NULL),
(2005, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-02 18:26:50', NULL),
(2006, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-02 18:27:47', NULL),
(2007, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.23', '2018-05-02 18:27:51', NULL),
(2008, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.81', '2018-05-02 18:27:51', NULL),
(2009, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.57', '2018-05-02 18:27:55', NULL),
(2010, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.04', '2018-05-02 18:28:25', NULL),
(2011, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.22', '2018-05-02 18:28:28', NULL),
(2012, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 18:28:29', NULL),
(2013, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', '2.18', '2018-05-02 18:30:33', NULL),
(2014, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', '2.18', '2018-05-02 18:30:52', NULL),
(2015, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', '2.23', '2018-05-02 18:30:58', NULL),
(2016, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-02 18:33:19', NULL),
(2017, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.22', '2018-05-02 18:33:23', NULL),
(2018, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 18:33:23', NULL),
(2019, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', '2.18', '2018-05-02 18:33:27', NULL),
(2020, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.97', '2018-05-02 18:36:07', NULL),
(2021, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.23', '2018-05-02 18:36:10', NULL),
(2022, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 18:36:11', NULL),
(2023, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.94', '2018-05-02 18:37:30', NULL),
(2024, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.23', '2018-05-02 18:37:33', NULL),
(2025, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-02 18:37:34', NULL),
(2026, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', '2.21', '2018-05-02 18:37:38', NULL),
(2027, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-02 18:38:17', NULL),
(2028, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.26', '2018-05-02 18:38:20', NULL),
(2029, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.81', '2018-05-02 18:38:21', NULL),
(2030, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.210', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'IN', 'Chennai', '2.18', '2018-05-02 18:38:27', NULL),
(2031, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '2.02', '2018-05-03 17:20:32', NULL),
(2032, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '4.68', '2018-05-03 17:21:17', NULL),
(2033, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.98', '2018-05-03 17:28:57', NULL),
(2034, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.24', '2018-05-03 17:29:00', NULL),
(2035, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.81', '2018-05-03 17:29:01', NULL),
(2036, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.38', '2018-05-03 17:35:06', NULL),
(2037, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.13', '2018-05-03 17:36:17', NULL),
(2038, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.23', '2018-05-03 17:36:21', NULL),
(2039, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.82', '2018-05-03 17:36:21', NULL),
(2040, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.33', '2018-05-03 17:36:26', NULL),
(2041, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.93', '2018-05-03 17:38:55', NULL),
(2042, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.24', '2018-05-03 17:38:58', NULL),
(2043, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-03 17:38:59', NULL),
(2044, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.33', '2018-05-03 17:39:15', NULL),
(2045, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.01', '2018-05-03 17:46:45', NULL),
(2046, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.22', '2018-05-03 17:46:49', NULL),
(2047, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-03 17:46:49', NULL),
(2048, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.39', '2018-05-03 17:46:53', NULL),
(2049, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.56', '2018-05-03 17:47:20', NULL),
(2050, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.10', '2018-05-03 17:54:38', NULL),
(2051, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.25', '2018-05-03 17:54:41', NULL),
(2052, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-03 17:54:42', NULL),
(2053, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-03 17:55:06', NULL),
(2054, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.22', '2018-05-03 17:55:10', NULL),
(2055, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-03 17:55:10', NULL),
(2056, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-03 17:55:14', NULL),
(2057, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.39', '2018-05-03 17:56:26', NULL),
(2058, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.96', '2018-05-03 18:02:33', NULL),
(2059, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.21', '2018-05-03 18:02:37', NULL),
(2060, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.88', '2018-05-03 18:02:37', NULL),
(2061, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-03 18:03:24', NULL),
(2062, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-03 18:04:23', NULL),
(2063, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.21', '2018-05-03 18:04:26', NULL),
(2064, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.95', '2018-05-03 18:04:32', NULL),
(2065, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.22', '2018-05-03 18:04:36', NULL),
(2066, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-03 18:04:36', NULL),
(2067, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-03 18:04:40', NULL),
(2068, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-03 18:04:40', NULL),
(2069, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.91', '2018-05-03 18:04:50', NULL),
(2070, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.22', '2018-05-03 18:04:53', NULL),
(2071, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-03 18:04:54', NULL),
(2072, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-03 18:04:57', NULL),
(2073, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-03 18:05:32', NULL),
(2074, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.22', '2018-05-03 18:05:36', NULL),
(2075, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.16', '2018-05-03 18:05:36', NULL),
(2076, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.79', '2018-05-03 18:05:40', NULL),
(2077, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.29', '2018-05-03 18:08:29', NULL),
(2078, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.53', '2018-05-03 18:08:33', NULL),
(2079, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.92', '2018-05-03 18:08:39', NULL),
(2080, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '6.22', '2018-05-03 18:08:42', NULL),
(2081, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.80', '2018-05-03 18:08:44', NULL),
(2082, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '2.55', '2018-05-03 18:08:52', NULL),
(2083, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.116.237', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '4.81', '2018-05-03 18:13:29', NULL),
(2084, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'SG', 'Singapore', '2.11', '2018-05-09 12:01:33', NULL),
(2085, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'CUISINE_FETCH', 'SG', 'Singapore', '1.27', '2018-05-09 12:01:38', NULL),
(2086, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'FOOD_TYPE_FETCH', 'SG', 'Singapore', '1.27', '2018-05-09 12:01:42', NULL),
(2087, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_REGISTER', 'SG', 'Singapore', '4.13', '2018-05-09 12:01:50', NULL),
(2088, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_LOGIN', 'SG', 'Singapore', '3.51', '2018-05-09 12:01:57', NULL),
(2089, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'SG', 'Singapore', '3.34', '2018-05-09 12:02:04', NULL),
(2090, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_SEARCH', 'SG', 'Singapore', '2.86', '2018-05-09 12:02:10', NULL),
(2091, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FETCH_PUBLIC', 'SG', 'Singapore', '2.87', '2018-05-09 12:02:16', NULL),
(2092, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FOLLOW_SUBMIT', 'SG', 'Singapore', '2.35', '2018-05-09 12:02:22', NULL),
(2093, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FOLLOWERS_FETCH', 'SG', 'Singapore', '2.85', '2018-05-09 12:02:28', NULL),
(2094, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_FOLLOWINGS_FETCH', 'SG', 'Singapore', '2.85', '2018-05-09 12:02:34', NULL),
(2095, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_NAME', 'SG', 'Singapore', '3.58', '2018-05-09 12:02:41', NULL),
(2096, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_EMAIL', 'SG', 'Singapore', '3.74', '2018-05-09 12:02:48', NULL),
(2097, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_PASSWORD', 'SG', 'Singapore', '3.79', '2018-05-09 12:02:55', NULL),
(2098, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_PHONE', 'SG', 'Singapore', '3.80', '2018-05-09 12:03:02', NULL),
(2099, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'USER_UPDATE_GENDER', 'SG', 'Singapore', '3.76', '2018-05-09 12:03:09', NULL),
(2100, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_FETCH', 'SG', 'Singapore', '6.06', '2018-05-09 12:03:19', NULL),
(2101, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_IMAGES_FETCH', 'SG', 'Singapore', '3.20', '2018-05-09 12:03:25', NULL),
(2102, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_FAVORITE_FETCH', 'SG', 'Singapore', '9.25', '2018-05-09 12:03:38', NULL),
(2103, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_USER_FETCH', 'SG', 'Singapore', '9.25', '2018-05-09 12:03:50', NULL),
(2104, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_USER_VIEWED_FETCH', 'SG', 'Singapore', '3.87', '2018-05-09 12:03:58', NULL),
(2105, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_DELETE', 'SG', 'Singapore', '3.83', '2018-05-09 12:04:11', NULL),
(2106, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'RECIPE_SEARCH', 'SG', 'Singapore', '15.31', '2018-05-09 12:04:29', NULL),
(2107, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'INGREDIENT_FETCH', 'SG', 'Singapore', '2.38', '2018-05-09 12:04:35', NULL),
(2108, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'VIEW_RECIPE_FETCH', 'SG', 'Singapore', '1.26', '2018-05-09 12:04:42', NULL),
(2109, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'VIEW_FETCH_USERS', 'SG', 'Singapore', '1.90', '2018-05-09 12:04:47', NULL),
(2110, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_FETCH_USERS', 'SG', 'Singapore', '2.57', '2018-05-09 12:04:53', NULL),
(2111, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_FETCH_USERS', 'SG', 'Singapore', '1.26', '2018-05-09 12:04:58', NULL),
(2112, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_FETCH_USERS', 'SG', 'Singapore', '1.58', '2018-05-09 12:05:03', NULL),
(2113, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_FETCH_USERS', 'SG', 'Singapore', '1.60', '2018-05-09 12:05:08', NULL),
(2114, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'SG', 'Singapore', '2.63', '2018-05-09 12:05:14', NULL),
(2115, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'SG', 'Singapore', '2.67', '2018-05-09 12:05:20', NULL),
(2116, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'SG', 'Singapore', '2.47', '2018-05-09 12:05:26', NULL),
(2117, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'SG', 'Singapore', '2.75', '2018-05-09 12:05:32', NULL),
(2118, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'SG', 'Singapore', '2.64', '2018-05-09 12:05:38', NULL),
(2119, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'SG', 'Singapore', '3.02', '2018-05-09 12:05:44', NULL),
(2120, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'SG', 'Singapore', '3.82', '2018-05-09 12:05:51', NULL),
(2121, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_SCOPE_MODIFY', 'SG', 'Singapore', '1.42', '2018-05-09 12:05:56', NULL),
(2122, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'TIMELINE_DELETE', 'SG', 'Singapore', '1.26', '2018-05-09 12:06:01', NULL),
(2123, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_SUBMIT', 'SG', 'Singapore', '2.69', '2018-05-09 12:06:07', NULL),
(2124, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_SUBMIT', 'SG', 'Singapore', '2.62', '2018-05-09 12:06:13', NULL),
(2125, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_SUBMIT', 'SG', 'Singapore', '2.47', '2018-05-09 12:06:18', NULL),
(2126, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_FETCH_ALL', 'SG', 'Singapore', '2.99', '2018-05-09 12:06:25', NULL),
(2127, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_FETCH_ALL', 'SG', 'Singapore', '2.97', '2018-05-09 12:06:31', NULL),
(2128, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_FETCH_ALL', 'SG', 'Singapore', '3.01', '2018-05-09 12:06:37', NULL),
(2129, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'COMMENT_DELETE', 'SG', 'Singapore', '2.27', '2018-05-09 12:06:43', NULL),
(2130, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_SUBMIT', 'SG', 'Singapore', '2.64', '2018-05-09 12:06:49', NULL),
(2131, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_USER_FETCH', 'SG', 'Singapore', '1.66', '2018-05-09 12:06:54', NULL),
(2132, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_USER_FETCH_ALL', 'SG', 'Singapore', '2.06', '2018-05-09 12:06:59', NULL),
(2133, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_RECIPE_AVG_RATING', 'SG', 'Singapore', '1.26', '2018-05-09 12:07:04', NULL),
(2134, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_DELETE', 'SG', 'Singapore', '1.98', '2018-05-09 12:07:09', NULL),
(2135, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'REVIEW_RECIPE_FETCH', 'SG', 'Singapore', '1.58', '2018-05-09 12:07:14', NULL),
(2136, 'fhbjgbiflinjbdggehcddcbncdddomop', '13.229.231.210', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'UNKNOWN', 'UNKNOWN', 200, 'TREND_FETCH', 'SG', 'Singapore', '8.13', '2018-05-09 12:07:25', NULL),
(2137, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_DELETE', 'IN', '', '4.18', '2018-05-09 12:35:57', NULL),
(2138, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_DELETE', 'IN', '', '5.01', '2018-05-09 14:35:32', NULL),
(2139, '025bed98-322f-4901-a1dc-93c040ee5762, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.55', '2018-05-10 06:48:03', NULL),
(2140, '025bed98-322f-4901-a1dc-93c040ee5762, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.46', '2018-05-10 06:48:05', NULL),
(2141, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.90', '2018-05-10 06:52:43', NULL),
(2142, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_DELETE', 'IN', '', '0.57', '2018-05-10 06:54:01', NULL),
(2143, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_DELETE', 'IN', '', '0.46', '2018-05-10 06:54:02', NULL),
(2144, '4a53a6a6-0abb-48ed-9068-431b5b8ec582, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.46', '2018-05-10 06:54:08', NULL),
(2145, '4a53a6a6-0abb-48ed-9068-431b5b8ec582, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.47', '2018-05-10 06:54:10', NULL),
(2146, 'e297ed4c-0321-4883-91b4-6f9c99da0846, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.54', '2018-05-10 07:02:41', NULL),
(2147, 'e297ed4c-0321-4883-91b4-6f9c99da0846, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'STATS_DB_VIEW', 'IN', '', '0.46', '2018-05-10 07:02:43', NULL),
(2148, '9e3a1f7a-2618-474d-a04c-b2fce3189d7a, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STATS_DB_VIEW', 'IN', '', '0.55', '2018-05-10 07:08:24', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(2149, '6458e758-dfe7-46ce-a7ca-8902130e1617, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STATS_DB_VIEW', 'IN', '', '0.46', '2018-05-10 07:08:34', NULL),
(2150, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STATS_DB_DELETE', 'IN', '', '0.47', '2018-05-10 07:10:18', NULL),
(2151, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'RECIPE_SUBMIT', 'IN', '', '0.67', '2018-05-10 13:29:44', NULL),
(2152, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'RECIPE_SUBMIT', 'IN', '', '0.47', '2018-05-10 13:29:52', NULL),
(2153, 'UNKNOWN', '159.203.81.93', 'UNKNOWN', 'Windows 7', 'Firefox', 200, '', 'US', 'Clifton', '0.46', '2018-05-10 13:30:01', NULL),
(2154, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'RECIPE_SUBMIT', 'IN', '', '0.47', '2018-05-10 13:30:11', NULL),
(2155, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'RECIPE_SUBMIT', 'IN', '', '0.47', '2018-05-10 13:30:24', NULL),
(2156, 'c0f73835-db78-4589-bb40-e1225b98b969, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STATS_DB_VIEW', 'IN', '', '0.46', '2018-05-10 13:30:31', NULL),
(2157, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'RECIPE_SUBMIT', 'IN', '', '0.48', '2018-05-10 13:30:57', NULL),
(2158, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 500, 'RECIPE_SUBMIT', 'IN', '', '0.50', '2018-05-10 13:31:08', NULL),
(2159, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.09', '2018-05-10 14:25:55', NULL),
(2160, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.112.29', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 500, 'RECIPE_SUBMIT', 'IN', 'Chennai', '0.46', '2018-05-10 14:25:58', NULL),
(2161, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.33', '2018-05-10 14:25:59', NULL),
(2162, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.98', '2018-05-10 14:26:00', NULL),
(2163, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.112.29', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 500, 'RECIPE_SUBMIT', 'IN', 'Chennai', '0.47', '2018-05-10 14:27:04', NULL),
(2164, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.112.29', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'RECIPE_SUBMIT', 'IN', 'Chennai', '5.11', '2018-05-10 14:30:06', NULL),
(2165, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.112.29', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 500, 'RECIPE_SUBMIT', 'IN', 'Chennai', '0.55', '2018-05-10 14:31:37', NULL),
(2166, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.112.29', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'RECIPE_SUBMIT', 'IN', 'Chennai', '4.63', '2018-05-10 14:31:48', NULL),
(2167, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.112.29', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'RECIPE_SUBMIT', 'IN', 'Chennai', '3.32', '2018-05-10 14:33:51', NULL),
(2168, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.112.29', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'RECIPE_SUBMIT', 'IN', 'Chennai', '5.37', '2018-05-10 14:34:55', NULL),
(2169, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-10 14:35:39', NULL),
(2170, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.07', '2018-05-10 14:44:47', NULL),
(2171, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.50', '2018-05-10 14:44:52', NULL),
(2172, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.98', '2018-05-10 14:44:52', NULL),
(2173, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '4.31', '2018-05-10 14:45:02', NULL),
(2174, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.61', '2018-05-10 14:45:17', NULL),
(2175, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.83', '2018-05-10 14:47:11', NULL),
(2176, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-10 14:47:16', NULL),
(2177, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.97', '2018-05-10 14:47:17', NULL),
(2178, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.59', '2018-05-10 14:47:51', NULL),
(2179, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.59', '2018-05-10 14:48:36', NULL),
(2180, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'INGREDIENT_FETCH', 'IN', 'Chennai', '1.42', '2018-05-10 14:49:10', NULL),
(2181, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'INGREDIENT_FETCH', 'IN', 'Chennai', '1.42', '2018-05-10 14:49:13', NULL),
(2182, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'INGREDIENT_FETCH', 'IN', 'Chennai', '1.54', '2018-05-10 14:49:22', NULL),
(2183, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'INGREDIENT_FETCH', 'IN', 'Chennai', '1.42', '2018-05-10 14:49:25', NULL),
(2184, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_SUBMIT', 'IN', 'Chennai', '4.51', '2018-05-10 14:50:43', NULL),
(2185, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.83', '2018-05-10 14:50:53', NULL),
(2186, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.45', '2018-05-10 14:51:10', NULL),
(2187, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.112.29', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.50', '2018-05-10 14:51:37', NULL),
(2188, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.11', '2018-05-10 16:27:14', NULL),
(2189, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.35', '2018-05-10 16:27:19', NULL),
(2190, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.45', '2018-05-10 16:27:20', NULL),
(2191, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.59', '2018-05-10 16:27:21', NULL),
(2192, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.66', '2018-05-10 16:27:23', NULL),
(2193, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.01', '2018-05-10 16:28:07', NULL),
(2194, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.43', '2018-05-10 16:28:11', NULL),
(2195, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.59', '2018-05-10 16:28:12', NULL),
(2196, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.81', '2018-05-10 16:30:50', NULL),
(2197, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-10 16:30:54', NULL),
(2198, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.46', '2018-05-10 16:30:55', NULL),
(2199, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.58', '2018-05-10 16:31:00', NULL),
(2200, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.90', '2018-05-10 16:32:41', NULL),
(2201, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.15', '2018-05-10 16:32:46', NULL),
(2202, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.53', '2018-05-10 16:32:47', NULL),
(2203, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.58', '2018-05-10 16:32:48', NULL),
(2204, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.89', '2018-05-10 16:34:03', NULL),
(2205, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.15', '2018-05-10 16:34:07', NULL),
(2206, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.48', '2018-05-10 16:34:09', NULL),
(2207, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.92', '2018-05-10 16:35:59', NULL),
(2208, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.16', '2018-05-10 16:36:03', NULL),
(2209, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.46', '2018-05-10 16:36:04', NULL),
(2210, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.58', '2018-05-10 16:36:06', NULL),
(2211, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.07', '2018-05-10 16:58:48', NULL),
(2212, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.28', '2018-05-10 16:58:52', NULL),
(2213, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.53', '2018-05-10 16:58:53', NULL),
(2214, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.58', '2018-05-10 16:58:55', NULL),
(2215, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-10 17:01:35', NULL),
(2216, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.26', '2018-05-10 17:01:39', NULL),
(2217, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.45', '2018-05-10 17:01:40', NULL),
(2218, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.58', '2018-05-10 17:01:43', NULL),
(2219, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.91', '2018-05-10 17:04:32', NULL),
(2220, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-10 17:04:36', NULL),
(2221, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.46', '2018-05-10 17:04:37', NULL),
(2222, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.59', '2018-05-10 17:04:39', NULL),
(2223, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.81', '2018-05-10 17:07:20', NULL),
(2224, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-10 17:07:25', NULL),
(2225, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.51', '2018-05-10 17:07:26', NULL),
(2226, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.58', '2018-05-10 17:07:31', NULL),
(2227, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-10 17:08:13', NULL),
(2228, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.12', '2018-05-10 17:08:18', NULL),
(2229, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.46', '2018-05-10 17:08:19', NULL),
(2230, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.58', '2018-05-10 17:08:21', NULL),
(2231, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.91', '2018-05-10 17:11:58', NULL),
(2232, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.12', '2018-05-10 17:12:02', NULL),
(2233, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '4.45', '2018-05-10 17:12:04', NULL),
(2234, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.39.218', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.58', '2018-05-10 17:12:05', NULL),
(2235, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '2.44', '2018-05-11 07:56:11', NULL),
(2236, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.94', '2018-05-11 08:01:06', NULL),
(2237, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '1.87', '2018-05-11 08:02:53', NULL),
(2238, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '1.75', '2018-05-11 08:03:47', NULL),
(2239, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '1.98', '2018-05-11 08:08:29', NULL),
(2240, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.21', '2018-05-11 08:09:42', NULL),
(2241, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.26', '2018-05-11 08:11:09', NULL),
(2242, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.41', '2018-05-11 08:11:29', NULL),
(2243, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.45', '2018-05-11 08:17:29', NULL),
(2244, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.18', '2018-05-11 08:19:03', NULL),
(2245, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.46', '2018-05-11 08:20:24', NULL),
(2246, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.42', '2018-05-11 08:20:54', NULL),
(2247, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.41', '2018-05-11 08:21:26', NULL),
(2248, '4ff79cd3-9022-4495-9735-bc4ef73b6be5, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STATS_DB_VIEW', 'IN', '', '0.46', '2018-05-11 08:22:04', NULL),
(2249, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STATS_DB_DELETE', 'IN', '', '0.46', '2018-05-11 08:22:10', NULL),
(2250, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.64', '2018-05-11 09:40:03', NULL),
(2251, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', '', '4.37', '2018-05-11 09:40:18', NULL),
(2252, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_SELF', 'IN', '', '4.00', '2018-05-11 10:48:22', NULL),
(2253, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_SELF', 'IN', '', '3.46', '2018-05-11 10:48:39', NULL),
(2254, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_SELF', 'IN', '', '3.46', '2018-05-11 10:49:15', NULL),
(2255, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_FETCH_SELF', 'IN', '', '3.45', '2018-05-11 10:50:39', NULL),
(2256, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_FETCH', 'IN', '', '1.34', '2018-05-11 10:57:18', NULL),
(2257, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_FETCH', 'IN', '', '2.40', '2018-05-11 10:58:18', NULL),
(2258, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'USER_BIO_FETCH', 'IN', '', '1.25', '2018-05-11 10:58:36', NULL),
(2259, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FETCH', 'IN', '', '4.56', '2018-05-11 11:14:40', NULL),
(2260, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FETCH', 'IN', '', '9.80', '2018-05-11 11:35:55', NULL),
(2261, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FETCH', 'IN', '', '6.53', '2018-05-11 11:36:11', NULL),
(2262, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'RECIPE_FETCH', 'IN', '', '6.96', '2018-05-11 11:50:58', NULL),
(2263, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'MASTER_DATA_FETCH_ALL', 'IN', '', '1.61', '2018-05-11 11:51:20', NULL),
(2264, 'a30cd165-c239-421d-ad81-f76db6ff3227, fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STATS_DB_VIEW', 'IN', '', '0.46', '2018-05-11 11:51:54', NULL),
(2265, 'fhbjgbiflinjbdggehcddcbncdddomop', '180.211.71.153', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Windows 7', 'Safari', 200, 'STATS_DB_DELETE', 'IN', '', '0.46', '2018-05-11 11:53:02', NULL),
(2266, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.07', '2018-05-11 14:35:17', NULL),
(2267, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-11 14:35:19', NULL),
(2268, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.31', '2018-05-11 14:35:21', NULL),
(2269, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-11 14:35:24', NULL),
(2270, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.06', '2018-05-11 14:51:25', NULL),
(2271, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.40', '2018-05-11 14:51:28', NULL),
(2272, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.28', '2018-05-11 14:51:29', NULL),
(2273, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.75', '2018-05-11 14:51:32', NULL),
(2274, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.60', '2018-05-11 14:53:40', NULL),
(2275, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.96', '2018-05-11 14:57:46', NULL),
(2276, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.91', '2018-05-11 14:57:55', NULL),
(2277, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-11 15:00:11', NULL),
(2278, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-11 15:00:14', NULL),
(2279, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-11 15:00:15', NULL),
(2280, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-11 15:01:39', NULL),
(2281, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-11 15:01:42', NULL),
(2282, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-11 15:01:44', NULL),
(2283, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-11 15:02:20', NULL),
(2284, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-11 15:02:22', NULL),
(2285, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-11 15:02:24', NULL),
(2286, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-11 15:02:31', NULL),
(2287, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-11 15:02:34', NULL),
(2288, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.12', '2018-05-11 15:02:36', NULL),
(2289, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.95', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.53', '2018-05-11 15:02:45', NULL),
(2290, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.37', '2018-05-11 15:18:08', NULL),
(2291, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-11 15:18:10', NULL),
(2292, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.28', '2018-05-11 15:18:12', NULL),
(2293, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-11 15:18:14', NULL),
(2294, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.54', '2018-05-11 15:18:28', NULL),
(2295, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-11 15:19:03', NULL),
(2296, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-11 15:19:05', NULL),
(2297, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-11 15:19:07', NULL),
(2298, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.91', '2018-05-11 15:24:32', NULL),
(2299, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-11 15:24:34', NULL),
(2300, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-11 15:24:36', NULL),
(2301, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.71', '2018-05-11 15:24:38', NULL),
(2302, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.55', '2018-05-11 15:24:44', NULL),
(2303, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.08', '2018-05-11 16:06:23', NULL),
(2304, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.28', '2018-05-11 16:06:25', NULL),
(2305, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-11 16:06:27', NULL),
(2306, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.72', '2018-05-11 16:06:29', NULL),
(2307, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'MASTER_DATA_FETCH_ALL', 'IN', 'Chennai', '1.59', '2018-05-11 16:06:52', NULL),
(2308, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.53', '2018-05-11 16:07:04', NULL),
(2309, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.81', '2018-05-11 16:16:05', NULL),
(2310, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-11 16:16:07', NULL),
(2311, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-11 16:16:09', NULL),
(2312, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-11 16:16:11', NULL),
(2313, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-11 16:16:26', NULL),
(2314, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-11 16:16:28', NULL),
(2315, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-11 16:16:30', NULL),
(2316, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-11 16:16:34', NULL),
(2317, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.53', '2018-05-11 16:16:36', NULL),
(2318, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.90', '2018-05-11 16:17:48', NULL),
(2319, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-11 16:17:50', NULL),
(2320, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-11 16:17:52', NULL),
(2321, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.72', '2018-05-11 16:17:54', NULL),
(2322, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-11 16:20:22', NULL),
(2323, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-11 16:20:25', NULL),
(2324, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-11 16:20:26', NULL),
(2325, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-11 16:20:29', NULL),
(2326, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.92', '2018-05-11 18:59:48', NULL),
(2327, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.93', '2018-05-11 18:59:53', NULL),
(2328, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '7.27', '2018-05-11 19:00:18', NULL),
(2329, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'LIKE_SUBMIT', 'IN', 'Chennai', '2.61', '2018-05-11 19:01:37', NULL),
(2330, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.12', '2018-05-11 19:48:33', NULL),
(2331, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-11 19:48:36', NULL),
(2332, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.16', '2018-05-11 19:48:37', NULL),
(2333, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.71', '2018-05-11 19:48:40', NULL),
(2334, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-11 19:49:27', NULL),
(2335, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.91', '2018-05-11 19:49:30', NULL),
(2336, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-11 19:49:33', NULL),
(2337, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-11 19:49:34', NULL),
(2338, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.53', '2018-05-11 19:49:43', NULL),
(2339, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.114.102', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'INGREDIENT_FETCH', 'IN', 'Chennai', '2.49', '2018-05-11 19:53:44', NULL),
(2340, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.114.102', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.54', '2018-05-11 19:54:43', NULL),
(2341, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.10', '2018-05-11 20:04:56', NULL),
(2342, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.94', '2018-05-11 20:05:00', NULL),
(2343, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-11 20:05:01', NULL),
(2344, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.74', '2018-05-11 20:05:04', NULL),
(2345, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.54', '2018-05-11 20:05:11', NULL),
(2346, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.06', '2018-05-11 20:21:05', NULL),
(2347, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-11 20:21:09', NULL),
(2348, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.26', '2018-05-11 20:21:10', NULL),
(2349, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-11 20:21:15', NULL),
(2350, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.54', '2018-05-11 20:21:17', NULL),
(2351, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.91', '2018-05-11 20:29:42', NULL),
(2352, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-11 20:29:45', NULL),
(2353, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.12', '2018-05-11 20:29:46', NULL),
(2354, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.69', '2018-05-11 20:29:50', NULL),
(2355, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.114.102', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'RECIPE_FETCH', 'IN', 'Chennai', '6.58', '2018-05-11 20:29:56', NULL),
(2356, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_LOGIN', 'IN', 'Chennai', '4.84', '2018-05-12 08:28:55', NULL),
(2357, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_LOGIN', 'IN', 'Chennai', '3.67', '2018-05-12 08:29:22', NULL),
(2358, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_LOGIN', 'IN', 'Chennai', '3.67', '2018-05-12 08:30:47', NULL),
(2359, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_LOGIN', 'IN', 'Chennai', '3.67', '2018-05-12 08:32:22', NULL),
(2360, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_LOGIN', 'IN', 'Chennai', '3.66', '2018-05-12 08:33:26', NULL),
(2361, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.51', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_LOGIN', 'IN', 'Chennai', '3.76', '2018-05-12 08:34:19', NULL),
(2362, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.206.113.51', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_LOGIN', 'IN', 'Chennai', '3.76', '2018-05-12 08:36:06', NULL),
(2363, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_LOGIN', 'IN', 'Chennai', '3.66', '2018-05-12 08:36:20', NULL),
(2364, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-12 08:37:34', NULL),
(2365, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '2.02', '2018-05-12 08:37:38', NULL),
(2366, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.15', '2018-05-12 08:37:39', NULL),
(2367, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.78', '2018-05-12 08:37:42', NULL),
(2368, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.51', '2018-05-12 08:37:44', NULL),
(2369, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.90', '2018-05-12 08:39:21', NULL),
(2370, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.92', '2018-05-12 08:39:24', NULL),
(2371, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.12', '2018-05-12 08:39:26', NULL),
(2372, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 08:39:28', NULL),
(2373, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.206.113.51', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.50', '2018-05-12 08:40:24', NULL),
(2374, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.68', '2018-05-12 20:05:14', NULL),
(2375, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.91', '2018-05-12 20:05:17', NULL),
(2376, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.91', '2018-05-12 20:05:18', NULL),
(2377, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.71', '2018-05-12 20:05:21', NULL),
(2378, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.51', '2018-05-12 20:05:25', NULL),
(2379, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.38.182', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.50', '2018-05-12 20:06:11', NULL),
(2380, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.12', '2018-05-12 20:12:48', NULL),
(2381, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 20:12:51', NULL),
(2382, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.15', '2018-05-12 20:12:52', NULL),
(2383, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.51', '2018-05-12 20:12:56', NULL),
(2384, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.55', '2018-05-12 20:12:57', NULL),
(2385, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 20:13:00', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(2386, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.83', '2018-05-12 20:14:35', NULL),
(2387, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 20:14:38', NULL),
(2388, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-12 20:14:39', NULL),
(2389, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.49', '2018-05-12 20:14:43', NULL),
(2390, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 20:14:43', NULL),
(2391, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.38.182', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-12 20:17:42', NULL),
(2392, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.44', '2018-05-12 21:05:48', NULL),
(2393, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 21:05:51', NULL),
(2394, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.15', '2018-05-12 21:05:52', NULL),
(2395, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:05:56', NULL),
(2396, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-12 21:05:56', NULL),
(2397, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-12 21:08:00', NULL),
(2398, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 21:08:03', NULL),
(2399, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-12 21:08:04', NULL),
(2400, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-12 21:08:08', NULL),
(2401, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:08:08', NULL),
(2402, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.18', '2018-05-12 21:13:48', NULL),
(2403, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.96', '2018-05-12 21:13:52', NULL),
(2404, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.24', '2018-05-12 21:13:53', NULL),
(2405, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:13:56', NULL),
(2406, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-12 21:13:57', NULL),
(2407, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-12 21:16:02', NULL),
(2408, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 21:16:05', NULL),
(2409, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.16', '2018-05-12 21:16:06', NULL),
(2410, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:16:09', NULL),
(2411, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-12 21:16:21', NULL),
(2412, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.91', '2018-05-12 21:16:24', NULL),
(2413, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-12 21:16:25', NULL),
(2414, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:16:28', NULL),
(2415, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.72', '2018-05-12 21:16:44', NULL),
(2416, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.83', '2018-05-12 21:18:25', NULL),
(2417, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.91', '2018-05-12 21:18:28', NULL),
(2418, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.16', '2018-05-12 21:18:30', NULL),
(2419, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.67', '2018-05-12 21:18:33', NULL),
(2420, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-12 21:18:34', NULL),
(2421, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:18:37', NULL),
(2422, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.91', '2018-05-12 21:19:57', NULL),
(2423, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 21:20:00', NULL),
(2424, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-12 21:20:01', NULL),
(2425, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.81', '2018-05-12 21:20:04', NULL),
(2426, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.81', '2018-05-12 21:20:50', NULL),
(2427, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 21:20:53', NULL),
(2428, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-12 21:20:54', NULL),
(2429, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-12 21:20:58', NULL),
(2430, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:20:58', NULL),
(2431, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.05', '2018-05-12 21:31:53', NULL),
(2432, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 21:31:56', NULL),
(2433, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-12 21:31:58', NULL),
(2434, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.71', '2018-05-12 21:32:00', NULL),
(2435, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-12 21:32:05', NULL),
(2436, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-12 21:32:58', NULL),
(2437, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 21:33:01', NULL),
(2438, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-12 21:33:02', NULL),
(2439, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:33:05', NULL),
(2440, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.81', '2018-05-12 21:33:12', NULL),
(2441, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.91', '2018-05-12 21:33:15', NULL),
(2442, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-12 21:33:16', NULL),
(2443, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:33:19', NULL),
(2444, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-12 21:33:25', NULL),
(2445, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-12 21:36:19', NULL),
(2446, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.91', '2018-05-12 21:36:22', NULL),
(2447, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.23', '2018-05-12 21:36:23', NULL),
(2448, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-12 21:36:27', NULL),
(2449, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:36:27', NULL),
(2450, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.90', '2018-05-12 21:37:59', NULL),
(2451, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 21:38:02', NULL),
(2452, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-12 21:38:04', NULL),
(2453, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.83', '2018-05-12 21:39:13', NULL),
(2454, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 21:39:17', NULL),
(2455, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.15', '2018-05-12 21:39:17', NULL),
(2456, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 21:39:21', NULL),
(2457, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-12 21:39:24', NULL),
(2458, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.07', '2018-05-12 22:00:04', NULL),
(2459, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 22:00:08', NULL),
(2460, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.29', '2018-05-12 22:00:09', NULL),
(2461, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 22:00:12', NULL),
(2462, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-12 22:00:16', NULL),
(2463, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.68', '2018-05-12 22:00:29', NULL),
(2464, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.06', '2018-05-12 22:19:44', NULL),
(2465, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-12 22:19:48', NULL),
(2466, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-12 22:19:50', NULL),
(2467, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-12 22:19:51', NULL),
(2468, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-12 22:20:13', NULL),
(2469, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.69', '2018-05-12 22:20:27', NULL),
(2470, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-12 22:20:41', NULL),
(2471, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.69', '2018-05-12 22:21:07', NULL),
(2472, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-12 22:21:35', NULL),
(2473, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.38.182', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 500, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '0.86', '2018-05-13 07:13:08', NULL),
(2474, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.38.182', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.74', '2018-05-13 07:14:27', NULL),
(2475, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.38.182', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 500, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '0.47', '2018-05-13 07:14:53', NULL),
(2476, 'fhbjgbiflinjbdggehcddcbncdddomop', '183.82.38.182', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.79', '2018-05-13 07:15:43', NULL),
(2477, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.91', '2018-05-13 07:22:30', NULL),
(2478, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 07:22:33', NULL),
(2479, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.18', '2018-05-13 07:22:35', NULL),
(2480, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.80', '2018-05-13 07:22:37', NULL),
(2481, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.67', '2018-05-13 07:22:52', NULL),
(2482, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.69', '2018-05-13 07:23:07', NULL),
(2483, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-13 07:24:21', NULL),
(2484, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.33', '2018-05-13 07:24:24', NULL),
(2485, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.15', '2018-05-13 07:24:26', NULL),
(2486, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 07:24:28', NULL),
(2487, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-13 07:24:52', NULL),
(2488, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.69', '2018-05-13 07:25:06', NULL),
(2489, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.71', '2018-05-13 07:25:32', NULL),
(2490, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.93', '2018-05-13 07:28:01', NULL),
(2491, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-13 07:28:04', NULL),
(2492, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.16', '2018-05-13 07:28:06', NULL),
(2493, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 07:28:08', NULL),
(2494, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.82', '2018-05-13 07:28:18', NULL),
(2495, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.80', '2018-05-13 07:28:32', NULL),
(2496, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.83', '2018-05-13 07:30:58', NULL),
(2497, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-13 07:31:00', NULL),
(2498, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-13 07:31:02', NULL),
(2499, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.69', '2018-05-13 07:31:04', NULL),
(2500, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-13 07:31:35', NULL),
(2501, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.90', '2018-05-13 07:31:38', NULL),
(2502, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 07:31:40', NULL),
(2503, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-13 07:31:59', NULL),
(2504, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-13 07:32:16', NULL),
(2505, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.15', '2018-05-13 07:36:31', NULL),
(2506, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 07:36:34', NULL),
(2507, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.32', '2018-05-13 07:36:35', NULL),
(2508, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.94', '2018-05-13 07:36:38', NULL),
(2509, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-13 07:36:40', NULL),
(2510, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.90', '2018-05-13 07:39:29', NULL),
(2511, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 07:39:31', NULL),
(2512, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.24', '2018-05-13 07:39:33', NULL),
(2513, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '183.82.38.182', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 07:39:35', NULL),
(2514, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.85', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.11', '2018-05-13 12:42:23', NULL),
(2515, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.85', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '3.84', '2018-05-13 12:42:39', NULL),
(2516, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.85', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '7.27', '2018-05-13 12:46:44', NULL),
(2517, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-13 12:47:21', NULL),
(2518, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.90', '2018-05-13 12:49:37', NULL),
(2519, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-13 12:49:40', NULL),
(2520, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-13 12:49:42', NULL),
(2521, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.78', '2018-05-13 12:49:44', NULL),
(2522, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.74', '2018-05-13 12:55:01', NULL),
(2523, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.184.85', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.34', '2018-05-13 12:57:31', NULL),
(2524, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.67', '2018-05-13 12:57:54', NULL),
(2525, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.74', '2018-05-13 12:58:16', NULL),
(2526, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.25', '2018-05-13 12:58:27', NULL),
(2527, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.95', '2018-05-13 13:02:00', NULL),
(2528, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-13 13:02:03', NULL),
(2529, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.16', '2018-05-13 13:02:05', NULL),
(2530, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.184.85', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 13:02:06', NULL),
(2531, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.99', '2018-05-13 14:20:09', NULL),
(2532, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.67', '2018-05-13 14:20:23', NULL),
(2533, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.81', '2018-05-13 14:20:39', NULL),
(2534, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-13 14:20:42', NULL),
(2535, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-13 14:20:44', NULL),
(2536, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-13 14:20:47', NULL),
(2537, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.71', '2018-05-13 14:20:48', NULL),
(2538, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.27', '2018-05-13 14:21:04', NULL),
(2539, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.83', '2018-05-13 14:23:01', NULL),
(2540, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:23:03', NULL),
(2541, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-13 14:23:05', NULL),
(2542, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 14:23:07', NULL),
(2543, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-13 14:24:07', NULL),
(2544, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.71', '2018-05-13 14:24:21', NULL),
(2545, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.70', '2018-05-13 14:24:36', NULL),
(2546, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.17', '2018-05-13 14:25:05', NULL),
(2547, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.36', '2018-05-13 14:25:27', NULL),
(2548, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.23', '2018-05-13 14:25:46', NULL),
(2549, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.81', '2018-05-13 14:26:34', NULL),
(2550, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:26:36', NULL),
(2551, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-13 14:26:38', NULL),
(2552, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.69', '2018-05-13 14:26:40', NULL),
(2553, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-13 14:26:43', NULL),
(2554, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.78', '2018-05-13 14:26:58', NULL),
(2555, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-13 14:27:04', NULL),
(2556, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.22', '2018-05-13 14:27:16', NULL),
(2557, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.186.166', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-13 14:27:58', NULL),
(2558, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-13 14:28:22', NULL),
(2559, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-13 14:28:25', NULL),
(2560, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-13 14:28:27', NULL),
(2561, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.71', '2018-05-13 14:28:29', NULL),
(2562, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-13 14:30:03', NULL),
(2563, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-13 14:30:05', NULL),
(2564, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.12', '2018-05-13 14:30:08', NULL),
(2565, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.69', '2018-05-13 14:30:09', NULL),
(2566, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-13 14:30:13', NULL),
(2567, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.67', '2018-05-13 14:30:26', NULL),
(2568, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.74', '2018-05-13 14:30:31', NULL),
(2569, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.83', '2018-05-13 14:31:40', NULL),
(2570, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.30', '2018-05-13 14:31:43', NULL),
(2571, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-13 14:31:45', NULL),
(2572, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-13 14:31:48', NULL),
(2573, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 14:31:49', NULL),
(2574, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.16', '2018-05-13 14:32:11', NULL),
(2575, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-13 14:32:50', NULL),
(2576, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:32:52', NULL),
(2577, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-13 14:32:54', NULL),
(2578, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 14:32:56', NULL),
(2579, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-13 14:33:01', NULL),
(2580, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.68', '2018-05-13 14:33:19', NULL),
(2581, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.18', '2018-05-13 14:33:32', NULL),
(2582, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.15', '2018-05-13 14:33:45', NULL),
(2583, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.68', '2018-05-13 14:34:06', NULL),
(2584, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.21', '2018-05-13 14:34:46', NULL),
(2585, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.20', '2018-05-13 14:34:59', NULL),
(2586, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.84', '2018-05-13 14:35:17', NULL),
(2587, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.68', '2018-05-13 14:35:25', NULL),
(2588, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-13 14:35:30', NULL),
(2589, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.90', '2018-05-13 14:37:03', NULL),
(2590, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:37:06', NULL),
(2591, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-13 14:37:07', NULL),
(2592, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-13 14:37:11', NULL),
(2593, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 14:37:11', NULL),
(2594, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.27', '2018-05-13 14:37:23', NULL),
(2595, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.71', '2018-05-13 14:37:50', NULL),
(2596, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.68', '2018-05-13 14:37:56', NULL),
(2597, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.68', '2018-05-13 14:38:03', NULL),
(2598, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.78', '2018-05-13 14:38:10', NULL),
(2599, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.68', '2018-05-13 14:38:20', NULL),
(2600, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.186.166', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:38:25', NULL),
(2601, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.186.166', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:38:34', NULL),
(2602, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.186.166', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:38:37', NULL),
(2603, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.186.166', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:38:44', NULL),
(2604, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.70', '2018-05-13 14:39:20', NULL),
(2605, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.186.166', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:39:36', NULL),
(2606, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.78', '2018-05-13 14:39:59', NULL),
(2607, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.86', '2018-05-13 14:40:05', NULL),
(2608, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.186.166', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:40:17', NULL),
(2609, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.186.166', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.18', '2018-05-13 14:41:12', NULL),
(2610, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.186.166', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.16', '2018-05-13 14:41:27', NULL),
(2611, 'fhbjgbiflinjbdggehcddcbncdddomop', '49.207.186.166', 'AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0', 'Linux', 'Safari', 200, 'USER_BIO_FETCH', 'IN', 'Chennai', '1.27', '2018-05-13 14:41:50', NULL),
(2612, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.20', '2018-05-13 14:42:17', NULL),
(2613, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.76', '2018-05-13 14:42:36', NULL),
(2614, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.19', '2018-05-13 14:42:50', NULL),
(2615, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.81', '2018-05-13 14:43:47', NULL),
(2616, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:43:49', NULL),
(2617, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-13 14:43:51', NULL),
(2618, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 14:43:53', NULL),
(2619, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.65', '2018-05-13 14:44:19', NULL),
(2620, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.17', '2018-05-13 14:44:33', NULL);
INSERT INTO `AUDIT` (`AUDIT_ID`, `CLNT_ID`, `CLNT_IP_ADD`, `API_KEY`, `CLNT_OS`, `CLNT_BROWSER`, `HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `RESPONSE_TIME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(2621, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_DELETE', 'IN', 'Chennai', '4.13', '2018-05-13 14:44:44', NULL),
(2622, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '4.06', '2018-05-13 14:50:58', NULL),
(2623, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:51:00', NULL),
(2624, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.14', '2018-05-13 14:51:02', NULL),
(2625, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-13 14:51:05', NULL),
(2626, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 14:51:06', NULL),
(2627, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_BIO_SUBMIT', 'IN', 'Chennai', '4.71', '2018-05-13 14:51:17', NULL),
(2628, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.82', '2018-05-13 14:55:35', NULL),
(2629, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.27', '2018-05-13 14:55:38', NULL),
(2630, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-13 14:55:40', NULL),
(2631, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 14:55:42', NULL),
(2632, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-13 14:55:58', NULL),
(2633, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '3.90', '2018-05-13 14:57:37', NULL),
(2634, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TIMELINE_USER_FETCH', 'IN', 'Chennai', '1.26', '2018-05-13 14:57:39', NULL),
(2635, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'TREND_FETCH', 'IN', 'Chennai', '8.13', '2018-05-13 14:57:42', NULL),
(2636, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'STORY_USER_FETCH', 'IN', 'Chennai', '2.70', '2018-05-13 14:57:43', NULL),
(2637, 'android-ffffffff-c7a6-6b14-ffff-ffffef05ac4a', '49.207.186.166', 'AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo', 'Linux', 'UNKNOWN', 200, 'USER_FETCH_SELF', 'IN', 'Chennai', '3.66', '2018-05-13 14:57:47', NULL);

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
(169, 1, 'no I don\'t !', 'RECIPE', 4, 'N', '2018-04-16 21:29:20', NULL),
(170, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 52', 'RECIPE', 105, 'N', '2018-04-25 18:23:27', NULL),
(171, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 89', 'RECIPE', 105, 'N', '2018-04-30 15:56:21', NULL),
(172, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 29', 'RECIPE', 105, 'N', '2018-04-30 19:19:13', NULL),
(173, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 36', 'RECIPE_IMG', 96, 'N', '2018-04-30 19:19:18', NULL),
(174, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 40', 'USER', 1, 'N', '2018-04-30 19:19:23', NULL),
(175, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 19', 'RECIPE', 105, 'N', '2018-04-30 19:55:57', NULL),
(176, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 84', 'RECIPE_IMG', 96, 'N', '2018-04-30 19:56:02', NULL),
(177, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 90', 'USER', 1, 'N', '2018-04-30 19:56:07', NULL),
(178, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 85', 'USER', 1, 'N', '2018-04-30 20:00:04', NULL),
(179, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 26', 'USER', 1, 'N', '2018-04-30 20:02:15', NULL),
(180, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 49', 'RECIPE_IMG', 96, 'N', '2018-04-30 20:02:24', NULL),
(181, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 00', 'RECIPE_IMG', 96, 'N', '2018-04-30 20:03:22', NULL),
(182, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 42', 'RECIPE', 105, 'N', '2018-04-30 20:04:56', NULL),
(183, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 22', 'RECIPE', 105, 'N', '2018-04-30 20:27:51', NULL),
(184, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 50', 'RECIPE_IMG', 96, 'N', '2018-04-30 20:27:56', NULL),
(185, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 12', 'USER', 1, 'N', '2018-04-30 20:28:00', NULL),
(186, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 11', 'RECIPE', 105, 'N', '2018-04-30 20:51:08', NULL),
(187, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 41', 'RECIPE_IMG', 96, 'N', '2018-04-30 20:51:12', NULL),
(188, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 35', 'USER', 1, 'N', '2018-04-30 20:51:18', NULL),
(189, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 38', 'RECIPE', 105, 'N', '2018-04-30 21:31:40', NULL),
(190, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 37', 'RECIPE_IMG', 96, 'N', '2018-04-30 21:31:45', NULL),
(191, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 28', 'USER', 1, 'N', '2018-04-30 21:31:50', NULL),
(192, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 26', 'RECIPE', 105, 'N', '2018-04-30 21:51:21', NULL),
(193, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 06', 'RECIPE_IMG', 96, 'N', '2018-04-30 21:51:25', NULL),
(194, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 19', 'USER', 1, 'N', '2018-04-30 21:51:30', NULL),
(195, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 82', 'RECIPE', 105, 'N', '2018-04-30 23:58:43', NULL),
(196, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 31', 'RECIPE_IMG', 96, 'N', '2018-04-30 23:58:49', NULL),
(197, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 43', 'USER', 1, 'N', '2018-04-30 23:58:56', NULL),
(198, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 81', 'RECIPE', 105, 'N', '2018-05-09 17:36:04', NULL),
(199, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 10', 'RECIPE_IMG', 96, 'N', '2018-05-09 17:36:10', NULL),
(200, 1, 'Hi ! This is just a demo comment to demonstrate the comment api. The same api can be used for commenting on a recipe, a users photo as well as well as a recipe image - 87', 'USER', 1, 'N', '2018-05-09 17:36:16', NULL);

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
(6, 105, 1, 'N', '2018-03-26 18:34:55', '2018-05-01 02:45:32');

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
(12, 'ASIAN', 'N', 'N', 'app_data/master_data/cuisines/asian.jpg', '2018-03-06 07:26:30', NULL),
(13, 'BARBEQUE', 'N', 'N', 'app_data/master_data/cuisines/barbeque.jpg', '2018-03-06 07:26:30', NULL),
(18, 'AMERICAN', 'N', 'N', 'app_data/master_data/cuisines/american.jpg', '2018-03-06 07:26:59', NULL),
(21, 'BRAZILLIAN', 'N', 'N', 'app_data/master_data/cuisines/brazillian.jpg', '2018-03-06 07:26:59', NULL),
(22, 'BRITISH', 'N', 'N', 'app_data/master_data/cuisines/british.jpg', '2018-03-06 07:26:59', NULL),
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
-- Table structure for table `INGREDIENT_NUTRITION`
--

CREATE TABLE `INGREDIENT_NUTRITION` (
  `ING_NUT_ID` int(11) NOT NULL,
  `ING_ID` int(11) NOT NULL,
  `NUT_ID` int(11) NOT NULL,
  `ING_NUT_VAL` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` timestamp NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `INGREDIENT_NUTRITION`
--

INSERT INTO `INGREDIENT_NUTRITION` (`ING_NUT_ID`, `ING_ID`, `NUT_ID`, `ING_NUT_VAL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 4, '80', '2018-04-24 22:00:00', NULL),
(6, 1, 1, '0.2', '2018-04-24 22:00:00', NULL),
(7, 1, 2, '0.2', '2018-04-24 22:00:00', NULL),
(8, 1, 3, '0.2', '2018-04-24 22:00:00', NULL),
(9, 1, 14, '0', '2018-04-24 22:00:00', NULL),
(10, 1, 5, '13', '2018-04-24 22:00:00', NULL),
(11, 1, 18, '415', '2018-04-24 22:00:00', NULL),
(12, 1, 6, '2', '2018-04-24 22:00:00', NULL),
(15, 1, 23, '1.7', '2018-04-24 22:00:00', NULL),
(32, 1, 25, '1.8', '2018-04-24 22:00:00', NULL),
(33, 1, 7, '0', '2018-04-24 22:00:00', NULL),
(34, 1, 9, '8', '2018-04-24 22:00:00', NULL),
(35, 1, 8, '1', '2018-04-24 22:00:00', NULL),
(36, 1, 10, '3', '2018-04-24 22:00:00', NULL),
(37, 1, 20, '0', '2018-04-24 22:00:00', NULL),
(38, 1, 24, '10', '2018-04-24 22:00:00', NULL),
(39, 1, 19, '10', '2018-04-24 22:00:00', NULL),
(40, 1, 26, '0', '2018-04-24 22:00:00', NULL),
(41, 2, 4, '354', '2018-04-24 22:00:00', NULL),
(42, 2, 1, '3.1', '2018-04-24 22:00:00', NULL),
(43, 2, 2, '2.2', '2018-04-24 22:00:00', NULL),
(44, 2, 3, '1.7', '2018-04-24 22:00:00', NULL),
(45, 2, 14, '0', '2018-04-24 22:00:00', NULL),
(46, 2, 5, '38', '2018-04-24 22:00:00', NULL),
(47, 2, 18, '2525', '2018-04-24 22:00:00', NULL),
(48, 2, 6, '21', '2018-04-24 22:00:00', NULL),
(49, 2, 23, '3.2', '2018-04-24 22:00:00', NULL),
(50, 2, 25, '8', '2018-04-24 22:00:00', NULL),
(51, 2, 7, '0', '2018-04-24 22:00:00', NULL),
(52, 2, 9, '43', '2018-04-24 22:00:00', NULL),
(53, 2, 8, '18', '2018-04-24 22:00:00', NULL),
(54, 2, 10, '230', '2018-04-24 22:00:00', NULL),
(55, 2, 20, '0', '2018-04-24 22:00:00', NULL),
(56, 2, 24, '90', '2018-04-24 22:00:00', NULL),
(57, 2, 26, '0', '2018-04-24 22:00:00', NULL),
(58, 2, 19, '48', '2018-04-24 22:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `INGREDIENT_UOM`
--

CREATE TABLE `INGREDIENT_UOM` (
  `ING_UOM_ID` int(11) NOT NULL,
  `ING_UOM_NAME` varchar(25) NOT NULL,
  `IS_DEF` varchar(1) NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `INGREDIENT_UOM`
--

INSERT INTO `INGREDIENT_UOM` (`ING_UOM_ID`, `ING_UOM_NAME`, `IS_DEF`, `CREATE_DTM`, `MOD_DTM`) VALUES
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
-- Table structure for table `ING_AKA`
--

CREATE TABLE `ING_AKA` (
  `ING_AKA_ID` int(11) NOT NULL,
  `ING_ID` int(11) NOT NULL DEFAULT '99',
  `ING_AKA_NAME` varchar(25) NOT NULL,
  `SOURCE` varchar(30) DEFAULT NULL,
  `IS_REG` varchar(1) NOT NULL DEFAULT 'N',
  `IS_DEL` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'N',
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ING_AKA`
--

INSERT INTO `ING_AKA` (`ING_AKA_ID`, `ING_ID`, `ING_AKA_NAME`, `SOURCE`, `IS_REG`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 'GINGER', NULL, 'Y', 'N', '2017-09-08 00:00:00', NULL),
(2, 2, 'TURMERIC', NULL, 'Y', 'N', '2017-09-08 00:00:00', NULL),
(3, 3, 'SALT', NULL, 'Y', 'N', '2017-09-08 00:00:00', NULL),
(4, 4, 'ONION', NULL, 'Y', 'N', '2017-09-08 00:00:00', NULL),
(7, 7, 'CORN FLOUR', NULL, 'Y', 'N', '2017-12-30 14:36:23', NULL),
(8, 8, 'GARLIC', NULL, 'Y', 'N', '2017-12-30 14:36:23', NULL),
(9, 9, 'TOFU', NULL, 'Y', 'N', '2017-12-30 14:38:48', NULL),
(11, 11, 'BUTTER', NULL, 'Y', 'N', '2017-12-30 15:09:31', NULL),
(12, 12, 'PANEER', NULL, 'Y', 'N', '2017-12-30 15:11:48', NULL),
(13, 13, 'CHEESE', NULL, 'Y', 'N', '2017-12-30 23:23:32', NULL),
(14, 14, 'EGG', NULL, 'Y', 'N', '2018-01-12 22:02:29', NULL),
(15, 15, 'GARAM MASALA', NULL, 'Y', 'N', '2018-01-12 23:25:37', NULL),
(16, 16, 'BLACK SALT', NULL, 'Y', 'N', '2018-01-12 23:25:37', NULL),
(18, 18, 'PUDINA', NULL, 'Y', 'N', '2018-01-12 23:30:52', NULL),
(19, 19, 'MILK', NULL, 'Y', 'N', '2018-01-14 00:23:12', NULL),
(20, 20, 'PEPPER', NULL, 'Y', 'N', '2018-03-06 00:00:00', NULL),
(23, 23, 'TOMATO', NULL, 'Y', 'N', '2018-03-06 00:00:00', NULL),
(24, 24, 'BHINDI', NULL, 'Y', 'N', '2018-03-18 08:50:56', NULL),
(25, 25, 'MUSTARD SEEDS', NULL, 'Y', 'N', '2018-03-18 00:00:00', NULL),
(26, 26, 'POSTO SEEDS', NULL, 'Y', 'N', '2018-03-18 00:00:00', NULL),
(27, 2, 'HALDI', NULL, 'Y', 'N', '2018-03-18 00:00:00', NULL),
(28, 28, 'GREEN CHILLLY', NULL, 'Y', 'N', '2018-03-18 00:00:00', NULL),
(29, 29, 'CORIANDER', NULL, 'Y', 'N', '2018-03-18 00:00:00', NULL),
(31, 101, 'DALIA', NULL, 'Y', 'N', '2018-04-14 05:18:41', '2018-04-14 05:18:41'),
(32, 99, 'MALAI', NULL, 'N', 'N', '2018-04-16 00:00:00', NULL),
(33, 24, 'LADIES FINGER', NULL, 'Y', 'N', '2018-04-24 00:00:00', NULL);

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
(1, 'OTHERS', '2018-04-15 22:00:00', NULL),
(2, 'SPICES', '2018-04-23 22:00:00', NULL),
(3, 'FLOUR', '2018-04-23 22:00:00', NULL),
(4, 'VEGETABLES', '2018-04-23 22:00:00', NULL),
(5, 'DIARY', '2018-04-23 22:00:00', NULL),
(6, 'MEAT', '2018-04-23 22:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ING_HEALTH`
--

CREATE TABLE `ING_HEALTH` (
  `ING_HLTH_ID` int(11) NOT NULL,
  `ING_ID` int(10) NOT NULL,
  `ING_HLTH_IND` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ING_HLTH_DESC` text NOT NULL,
  `CREATE_DTM` timestamp NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ING_HEALTH`
--

INSERT INTO `ING_HEALTH` (`ING_HLTH_ID`, `ING_ID`, `ING_HLTH_IND`, `ING_HLTH_DESC`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 'G', 'Soothes stomach upset & nausea.', '2018-05-10 00:00:00', NULL),
(2, 1, 'G', 'Aids in digestion & saliva flow.', '2018-05-10 00:00:00', NULL),
(3, 1, 'G', 'Soothes stomach upset & nausea.', '2018-05-10 00:00:00', NULL),
(4, 1, 'G', 'Aids in digestion & saliva flow.', '2018-05-10 00:00:00', NULL),
(17, 1, 'G', 'May help in relieving pain.', '2018-05-10 00:00:00', NULL),
(18, 1, 'B', 'May be bad for pregnant women.', '2018-05-10 00:00:00', NULL),
(19, 1, 'B', 'May aggravate hypertension.', '2018-05-10 00:00:00', NULL),
(20, 1, 'B', 'Excess consumption may cause diarrhea.', '2018-05-10 00:00:00', NULL),
(21, 1, 'B', 'May cause blood sugar level to drop too low.', '2018-05-10 00:00:00', NULL),
(22, 1, 'B', 'May cause gas & bloating.', '2018-05-10 00:00:00', NULL),
(23, 1, 'G', 'May help in relieving pain.', '2018-05-10 00:00:00', NULL),
(24, 1, 'B', 'May be bad for pregnant women.', '2018-05-10 00:00:00', NULL),
(25, 1, 'B', 'May aggravate hypertension.', '2018-05-10 00:00:00', NULL),
(26, 1, 'B', 'Excess consumption may cause diarrhea.', '2018-05-10 00:00:00', NULL),
(27, 1, 'B', 'May cause blood sugar level to drop too low.', '2018-05-10 00:00:00', NULL),
(28, 1, 'B', 'May cause gas & bloating.', '2018-05-10 00:00:00', NULL),
(29, 2, 'G', 'Relieves pain.', '2018-05-10 00:00:00', NULL),
(30, 2, 'G', 'Aides in digestion.', '2018-05-10 00:00:00', NULL),
(31, 2, 'G', 'Contains healing properties.', '2018-05-10 00:00:00', NULL),
(32, 2, 'G', 'Delays diabetes by controlling blood sugar levels.', '2018-05-10 00:00:00', NULL),
(33, 2, 'G', 'Boosts immunity.', '2018-05-10 00:00:00', NULL),
(34, 2, 'G', 'Detoxifies liver.', '2018-05-10 00:00:00', NULL),
(35, 2, 'B', 'May cause nausea & Diarrhea if consumed more.', '2018-05-10 00:00:00', NULL),
(36, 2, 'B', 'May cause increased bleeding & liver functions.', '2018-05-10 00:00:00', NULL),
(37, 2, 'B', 'May cause hyperactive gallbladder contractions.', '2018-05-10 00:00:00', NULL),
(38, 2, 'B', 'May cause hypotension(lowered blood pressure).', '2018-05-10 00:00:00', NULL),
(39, 2, 'B', 'May cause uterine contractions in pregnant woman.', '2018-05-10 00:00:00', NULL),
(40, 1, 'W', 'Pungent odour may cause headache & nausea.', '2018-05-11 00:00:00', NULL),
(41, 1, 'W', 'Acidic nature may be harmful for gentle skin.', '2018-05-11 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ING_IMAGES`
--

CREATE TABLE `ING_IMAGES` (
  `ING_IMG_ID` int(11) NOT NULL,
  `ING_ID` int(11) NOT NULL,
  `ING_IMG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'app_data/master_data/ingredients/vegetable.jpg',
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
(25, 99, 'app_data/master_data/ingredients/vegetable.jpg', 'N', '2018-04-15 22:00:00', NULL),
(26, 2, 'app_data/master_data/ingredients/haldi.jpg', 'N', '2018-04-24 22:00:00', NULL);

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
(6, 1, 'REVIEW', 9, 'Y', '2017-12-06 18:19:18', '2018-05-09 17:35:36'),
(8, 1, 'COMMENT', 9, 'Y', '2017-12-18 15:53:32', '2018-05-09 17:35:30'),
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
(22, 1, 'RECIPE_IMG', 96, 'N', '2018-03-13 13:27:35', '2018-05-09 17:35:18'),
(23, 1, 'USER', 1, 'N', '2018-03-13 18:01:10', '2018-05-09 17:35:24'),
(24, 1, 'USER', 2, 'N', '2018-03-13 18:03:36', NULL),
(25, 1, 'USER', 3, 'N', '2018-03-13 18:07:08', NULL),
(26, 1, 'USER', 4, 'N', '2018-03-13 18:10:16', '2018-04-15 11:09:28'),
(27, 1, 'RECIPE_IMG', 94, 'Y', '2018-03-17 10:15:31', '2018-03-17 11:50:08'),
(28, 1, 'RECIPE_IMG', 95, 'N', '2018-03-17 10:56:37', '2018-03-17 11:49:51'),
(29, 1, 'RECIPE', 3, 'Y', '2018-03-17 11:14:54', '2018-03-17 11:17:53'),
(30, 1, 'RECIPE_IMG', 100, 'N', '2018-03-19 19:36:17', '2018-04-16 18:21:03'),
(31, 1, 'RECIPE_IMG', 102, 'Y', '2018-03-19 19:36:47', '2018-04-15 08:50:59'),
(32, 1, 'RECIPE_IMG', 97, 'Y', '2018-03-20 18:58:30', '2018-03-20 19:24:55'),
(33, 1, 'RECIPE', 105, 'N', '2018-03-23 19:00:11', '2018-05-12 00:31:35'),
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
(46, 1, 'COMMENT', 92, 'N', '2018-04-16 21:38:35', NULL),
(47, 1, 'RECIPE', 148, 'N', '2018-04-28 12:28:15', '2018-04-28 12:40:07');

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
-- Table structure for table `NUTRITION`
--

CREATE TABLE `NUTRITION` (
  `NUT_ID` int(11) NOT NULL,
  `NUT_NAME` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NUT_UOM_ID` int(11) NOT NULL DEFAULT '1',
  `NUT_CAT_ID` int(11) NOT NULL DEFAULT '99',
  `CREATE_DTM` timestamp NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `NUTRITION`
--

INSERT INTO `NUTRITION` (`NUT_ID`, `NUT_NAME`, `NUT_UOM_ID`, `NUT_CAT_ID`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'Saturated Fat', 1, 2, '2018-04-24 20:00:00', NULL),
(2, 'Poly Unsaturated Fat', 1, 2, '2018-04-24 20:00:00', NULL),
(3, 'Poly Monosaturated Fat', 1, 2, '2018-04-24 20:00:00', NULL),
(4, 'Calories', 6, 1, '2018-04-24 20:00:00', NULL),
(5, 'Sodium', 2, 4, '2018-04-24 20:00:00', NULL),
(6, 'Dietary Fiber', 3, 5, '2018-04-24 20:00:00', NULL),
(7, 'Vitamin A', 3, 6, '2018-04-24 20:00:00', NULL),
(8, 'Calcium', 3, 4, '2018-04-24 20:00:00', NULL),
(9, 'Vitamin C', 3, 6, '2018-04-24 20:00:00', NULL),
(10, 'Iron', 3, 4, '2018-04-24 20:00:00', NULL),
(14, 'Cholestrol', 3, 3, '2018-04-24 22:00:00', NULL),
(18, 'Pottasium', 3, 4, '2018-04-24 22:00:00', NULL),
(19, 'Magnesium', 3, 4, '2018-04-24 22:00:00', NULL),
(20, 'Vitamin D', 3, 6, '2018-04-24 22:00:00', NULL),
(23, 'Sugar', 6, 5, '2018-04-24 22:00:00', NULL),
(24, 'Vitamin B6', 1, 6, '2018-04-24 22:00:00', NULL),
(25, 'Protein', 1, 3, '2018-04-24 22:00:00', NULL),
(26, 'Vitamin B12', 1, 6, '2018-04-24 22:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `NUTRITION_CATEGORIES`
--

CREATE TABLE `NUTRITION_CATEGORIES` (
  `NUT_CAT_ID` int(10) NOT NULL,
  `NUT_CAT_NAME` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` timestamp NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `NUTRITION_CATEGORIES`
--

INSERT INTO `NUTRITION_CATEGORIES` (`NUT_CAT_ID`, `NUT_CAT_NAME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 'Energy', '2018-04-24 22:00:00', NULL),
(2, 'Fats', '2018-04-24 22:00:00', NULL),
(3, 'Nutrients', '2018-04-24 22:00:00', NULL),
(4, 'Minerals', '2018-04-24 22:00:00', NULL),
(5, 'Carbs', '2018-04-24 22:00:00', NULL),
(6, 'Vitamins', '2018-04-24 22:00:00', NULL),
(99, 'Others', '2018-04-24 22:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `NUTRITION_UOM`
--

CREATE TABLE `NUTRITION_UOM` (
  `NUT_UOM_ID` int(11) NOT NULL,
  `NUT_UOM_NAME` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATE_DTM` timestamp NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `NUTRITION_UOM`
--

INSERT INTO `NUTRITION_UOM` (`NUT_UOM_ID`, `NUT_UOM_NAME`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, '%', '2018-04-24 22:00:00', NULL),
(2, 'g', '2018-04-24 22:00:00', NULL),
(3, 'mg', '2018-04-24 22:00:00', NULL),
(6, 'Cal', '2018-04-24 22:00:00', NULL),
(7, 'KCal', '2018-04-24 22:00:00', NULL);

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
(105, 'TEST_RECIPE_NAME - 70', 1, 1, 'N', 1, '2018-03-18 11:14:26', '2018-05-10 20:04:50'),
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
(147, 'My Grandma\'s Loki Halwa', 3, 1, 'N', 1, '2018-04-23 20:37:13', NULL),
(148, 'Test 12345', 3, 1, 'N', 1, '2018-04-28 12:24:19', NULL),
(149, 'TEST_RECIPE_NAME - 72', 1, 1, 'N', 1, '2018-05-10 20:00:02', NULL),
(150, 'TEST_RECIPE_NAME - 49', 1, 1, 'N', 1, '2018-05-10 20:01:43', NULL),
(151, 'Veg Club Cheese Sandwich', 3, 1, 'N', 1, '2018-05-10 20:20:39', NULL);

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
(53, 76, 'app_data/users/1/recipes/76/images/5a23cf3c3ebf8.jpg', '2017-12-03 11:17:32', NULL),
(54, 77, 'app_data/users/1/recipes/77/images/5a23cf46c52f0.jpg', '2017-12-03 11:17:42', NULL),
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
(175, 147, 'app_data/users/1/recipes/147/images/5ade27db26dc7.jpg', '2018-04-23 20:37:15', NULL),
(176, 148, 'app_data/users/1/recipes/148/images/5ae41a9c9e177.jpg', '2018-04-28 12:24:20', NULL),
(177, 148, 'app_data/users/1/recipes/148/images/5ae41a9cc5ce9.jpg', '2018-04-28 12:24:20', NULL),
(178, 148, 'app_data/users/1/recipes/148/images/5ae41a9ced9a8.jpg', '2018-04-28 12:24:21', NULL),
(179, 149, 'app_data/users/1/recipes/149/images/5af4576abad81.jpg', '2018-05-10 20:00:02', NULL),
(180, 149, 'app_data/users/1/recipes/149/images/5af4576ae5d2b.jpg', '2018-05-10 20:00:03', NULL),
(181, 150, 'app_data/users/1/recipes/150/images/5af457d082e59.jpg', '2018-05-10 20:01:44', NULL),
(182, 150, 'app_data/users/1/recipes/150/images/5af457d0aa01d.jpg', '2018-05-10 20:01:44', NULL),
(184, 105, 'app_data/users/1/recipes/105/images/5af4588c119d7.jpg', '2018-05-10 20:04:52', NULL),
(185, 105, 'app_data/users/1/recipes/105/images/5af4588c39dcc.jpg', '2018-05-10 20:04:52', NULL),
(186, 151, 'app_data/users/1/recipes/151/images/5af45c40541cb.jpg', '2018-05-10 20:20:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `RECIPE_INGREDIENTS`
--

CREATE TABLE `RECIPE_INGREDIENTS` (
  `RCP_ING_ID` int(11) NOT NULL,
  `RCP_ID` int(11) NOT NULL,
  `ING_AKA_ID` int(11) NOT NULL,
  `ING_UOM_ID` int(11) NOT NULL,
  `ING_UOM_VALUE` int(11) NOT NULL,
  `CREATE_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RECIPE_INGREDIENTS`
--

INSERT INTO `RECIPE_INGREDIENTS` (`RCP_ING_ID`, `RCP_ID`, `ING_AKA_ID`, `ING_UOM_ID`, `ING_UOM_VALUE`, `CREATE_DTM`, `MOD_DTM`) VALUES
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
(235, 147, 19, 1, 1, '2018-04-23 20:37:14', NULL),
(236, 148, 27, 11, 1, '2018-04-28 12:24:19', NULL),
(237, 149, 1, 1, 5, '2018-05-10 20:00:02', NULL),
(238, 149, 2, 2, 6, '2018-05-10 20:00:02', NULL),
(239, 150, 1, 1, 5, '2018-05-10 20:01:43', NULL),
(240, 150, 2, 2, 6, '2018-05-10 20:01:44', NULL),
(243, 105, 1, 1, 5, '2018-05-10 20:04:51', NULL),
(244, 105, 2, 2, 6, '2018-05-10 20:04:51', NULL),
(245, 151, 19, 1, 1, '2018-05-10 20:20:39', NULL),
(246, 151, 2, 1, 1, '2018-05-10 20:20:40', NULL);

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
(165, 147, 'once upon a time there lived a king who lived untill he died.', '2018-04-23 20:37:14', NULL),
(166, 148, 'test 1', '2018-04-28 12:24:20', NULL),
(167, 149, 'TEST STEP !', '2018-05-10 20:00:02', NULL),
(168, 149, 'TEST STEP 2', '2018-05-10 20:00:02', NULL),
(169, 150, 'TEST STEP !', '2018-05-10 20:01:44', NULL),
(170, 150, 'TEST STEP 2', '2018-05-10 20:01:44', NULL),
(174, 105, 'This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. This is a step 1. ', '2018-05-10 20:04:51', NULL),
(175, 105, 'This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. This is a step 2. \r\n', '2018-05-10 20:04:51', NULL),
(176, 105, 'This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. This is a step 3. ', '2018-05-10 20:04:51', NULL),
(177, 151, 'preparing sandwich', '2018-05-10 20:20:40', NULL);

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
(10, 103, 1, 'TEST REVIEW - 32', 3, 'Y', '2017-12-16 11:11:28', '2018-02-15 10:46:02'),
(11, 103, 2, 'This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review. This is a test review.', 3, 'N', '2017-12-16 20:44:15', NULL),
(15, 105, 1, 'TEST REVIEW - 17', 3, 'N', '2018-03-26 17:04:40', '2018-05-09 17:36:47');

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
(1014, 1, 1, 'RECIPE_ADD', 147, 1, 'N', '2018-04-23 20:37:15', NULL),
(1015, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-04-24 17:11:12', NULL),
(1016, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-04-24 19:58:07', NULL),
(1017, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-04-25 14:48:05', NULL),
(1018, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-04-25 14:49:16', NULL),
(1019, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-04-25 14:49:35', NULL),
(1020, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-04-25 14:50:43', NULL),
(1021, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-04-25 14:51:23', NULL),
(1022, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-04-25 18:22:21', NULL),
(1023, 1, 1, 'COMMENT_RECIPE_ADD', 170, 1, 'N', '2018-04-25 18:23:28', NULL),
(1024, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-04-25 18:24:19', NULL),
(1025, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-04-25 18:25:15', NULL),
(1026, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-04-25 18:25:53', NULL),
(1027, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-04-25 18:27:13', NULL),
(1028, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2018-04-26 23:24:48', NULL),
(1029, 1, 2, 'USER_UNFOLLOW', 1, 1, 'N', '2018-04-27 00:04:28', NULL),
(1030, 1, 14, 'USER_UNFOLLOW', 6, 1, 'N', '2018-04-27 00:07:25', NULL),
(1031, 1, 14, 'USER_FOLLOW', 6, 1, 'N', '2018-04-27 00:07:36', NULL),
(1041, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-04-28 01:36:42', NULL),
(1042, 1, 1, 'USER_PHOTO_MODIFY', 1, 1, 'N', '2018-04-28 02:04:34', NULL),
(1043, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-04-28 03:14:13', NULL),
(1044, 1, 1, 'RECIPE_ADD', 148, 1, 'N', '2018-04-28 12:24:21', NULL),
(1045, 1, 1, 'LIKE_RECIPE_ADD', 47, 1, 'Y', '2018-04-28 12:28:15', NULL),
(1046, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-04-28 12:38:26', NULL),
(1047, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-04-28 12:38:53', NULL),
(1048, 1, 1, 'LIKE_RECIPE_REMOVE', 47, 1, 'N', '2018-04-28 12:40:00', NULL),
(1049, 1, 1, 'LIKE_RECIPE_ADD', 47, 1, 'Y', '2018-04-28 12:40:07', NULL),
(1050, 1, 1, 'COMMENT_RECIPE_ADD', 171, 1, 'N', '2018-04-30 15:56:22', NULL),
(1051, 113, 113, 'USER_ADD', 113, 1, 'N', '2018-04-30 19:17:04', NULL),
(1052, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-04-30 19:17:28', NULL),
(1053, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-04-30 19:18:21', NULL),
(1054, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-04-30 19:18:26', NULL),
(1055, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-04-30 19:18:30', NULL),
(1056, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2018-04-30 19:18:36', NULL),
(1057, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2018-04-30 19:18:41', NULL);
INSERT INTO `TIMELINES` (`TMLN_ID`, `USER_ID`, `REF_USER_ID`, `TYPE`, `TYPE_ID`, `SCOPE_ID`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1058, 1, 1, 'COMMENT_RECIPE_ADD', 172, 1, 'N', '2018-04-30 19:19:13', NULL),
(1059, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 173, 1, 'N', '2018-04-30 19:19:18', NULL),
(1060, 1, 1, 'COMMENT_RECIPE_ADD', 174, 1, 'N', '2018-04-30 19:19:23', NULL),
(1061, 1, 1, 'COMMENT_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 19:19:42', NULL),
(1062, 1, 1, 'REVIEW_RECIPE_ADD', 15, 1, 'N', '2018-04-30 19:19:47', NULL),
(1063, 1, 1, 'REVIEW_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 19:20:05', NULL),
(1064, 114, 114, 'USER_ADD', 114, 1, 'N', '2018-04-30 19:53:51', NULL),
(1065, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2018-04-30 19:54:17', NULL),
(1066, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-04-30 19:55:15', NULL),
(1067, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-04-30 19:55:19', NULL),
(1068, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-04-30 19:55:23', NULL),
(1069, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2018-04-30 19:55:27', NULL),
(1070, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2018-04-30 19:55:32', NULL),
(1071, 1, 1, 'COMMENT_RECIPE_ADD', 175, 1, 'N', '2018-04-30 19:55:58', NULL),
(1072, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 176, 1, 'N', '2018-04-30 19:56:03', NULL),
(1073, 1, 1, 'COMMENT_RECIPE_ADD', 177, 1, 'N', '2018-04-30 19:56:08', NULL),
(1074, 1, 1, 'COMMENT_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 19:56:25', NULL),
(1075, 1, 1, 'REVIEW_RECIPE_ADD', 15, 1, 'N', '2018-04-30 19:56:29', NULL),
(1076, 1, 1, 'REVIEW_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 19:56:41', NULL),
(1077, 1, 1, 'REVIEW_RECIPE_ADD', 15, 1, 'N', '2018-04-30 19:59:36', NULL),
(1078, 1, 1, 'COMMENT_RECIPE_ADD', 178, 1, 'N', '2018-04-30 20:00:04', NULL),
(1079, 1, 1, 'COMMENT_RECIPE_ADD', 179, 1, 'N', '2018-04-30 20:02:15', NULL),
(1080, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 180, 1, 'N', '2018-04-30 20:02:24', NULL),
(1081, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 181, 1, 'N', '2018-04-30 20:03:22', NULL),
(1082, 1, 1, 'COMMENT_RECIPE_ADD', 182, 1, 'N', '2018-04-30 20:04:56', NULL),
(1083, 1, 1, 'RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 20:18:08', NULL),
(1084, 1, 1, 'RECIPE_REMOVE', 66, 1, 'N', '2018-04-30 20:21:15', NULL),
(1085, 115, 115, 'USER_ADD', 115, 1, 'N', '2018-04-30 20:24:40', NULL),
(1086, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-04-30 20:25:04', NULL),
(1087, 1, 1, 'RECIPE_REMOVE', 66, 1, 'N', '2018-04-30 20:26:24', NULL),
(1088, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-04-30 20:27:01', NULL),
(1089, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-04-30 20:27:06', NULL),
(1090, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-04-30 20:27:10', NULL),
(1091, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2018-04-30 20:27:14', NULL),
(1092, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2018-04-30 20:27:18', NULL),
(1093, 1, 1, 'COMMENT_RECIPE_ADD', 183, 1, 'N', '2018-04-30 20:27:52', NULL),
(1094, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 184, 1, 'N', '2018-04-30 20:27:56', NULL),
(1095, 1, 1, 'COMMENT_RECIPE_ADD', 185, 1, 'N', '2018-04-30 20:28:00', NULL),
(1096, 1, 1, 'COMMENT_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 20:28:18', NULL),
(1097, 1, 1, 'REVIEW_RECIPE_ADD', 15, 1, 'N', '2018-04-30 20:28:22', NULL),
(1098, 1, 1, 'REVIEW_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 20:28:36', NULL),
(1099, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-04-30 20:38:42', NULL),
(1100, 116, 116, 'USER_ADD', 116, 1, 'N', '2018-04-30 20:47:54', NULL),
(1101, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2018-04-30 20:48:18', NULL),
(1102, 1, 1, 'RECIPE_REMOVE', 66, 1, 'N', '2018-04-30 20:49:42', NULL),
(1103, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-04-30 20:50:19', NULL),
(1104, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-04-30 20:50:23', NULL),
(1105, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-04-30 20:50:27', NULL),
(1106, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2018-04-30 20:50:31', NULL),
(1107, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2018-04-30 20:50:36', NULL),
(1108, 1, 1, 'COMMENT_RECIPE_ADD', 186, 1, 'N', '2018-04-30 20:51:08', NULL),
(1109, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 187, 1, 'N', '2018-04-30 20:51:12', NULL),
(1110, 1, 1, 'COMMENT_RECIPE_ADD', 188, 1, 'N', '2018-04-30 20:51:19', NULL),
(1111, 1, 1, 'COMMENT_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 20:51:36', NULL),
(1112, 1, 1, 'REVIEW_RECIPE_ADD', 15, 1, 'N', '2018-04-30 20:51:40', NULL),
(1113, 1, 1, 'REVIEW_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 20:51:54', NULL),
(1114, 117, 117, 'USER_ADD', 117, 1, 'N', '2018-04-30 21:27:49', NULL),
(1115, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-04-30 21:28:18', NULL),
(1116, 1, 1, 'RECIPE_REMOVE', 66, 1, 'N', '2018-04-30 21:29:53', NULL),
(1117, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-04-30 21:30:36', NULL),
(1118, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-04-30 21:30:42', NULL),
(1119, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-04-30 21:30:47', NULL),
(1120, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2018-04-30 21:30:52', NULL),
(1121, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2018-04-30 21:30:57', NULL),
(1122, 1, 1, 'COMMENT_RECIPE_ADD', 189, 1, 'N', '2018-04-30 21:31:40', NULL),
(1123, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 190, 1, 'N', '2018-04-30 21:31:45', NULL),
(1124, 1, 1, 'COMMENT_RECIPE_ADD', 191, 1, 'N', '2018-04-30 21:31:50', NULL),
(1125, 1, 1, 'COMMENT_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 21:32:12', NULL),
(1126, 1, 1, 'REVIEW_RECIPE_ADD', 15, 1, 'N', '2018-04-30 21:32:17', NULL),
(1127, 1, 1, 'REVIEW_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 21:32:35', NULL),
(1128, 118, 118, 'USER_ADD', 118, 1, 'N', '2018-04-30 21:48:14', NULL),
(1129, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2018-04-30 21:48:38', NULL),
(1130, 1, 1, 'RECIPE_REMOVE', 66, 1, 'N', '2018-04-30 21:49:59', NULL),
(1131, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-04-30 21:50:35', NULL),
(1132, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-04-30 21:50:39', NULL),
(1133, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-04-30 21:50:43', NULL),
(1134, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2018-04-30 21:50:47', NULL),
(1135, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2018-04-30 21:50:51', NULL),
(1136, 1, 1, 'COMMENT_RECIPE_ADD', 192, 1, 'N', '2018-04-30 21:51:22', NULL),
(1137, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 193, 1, 'N', '2018-04-30 21:51:26', NULL),
(1138, 1, 1, 'COMMENT_RECIPE_ADD', 194, 1, 'N', '2018-04-30 21:51:30', NULL),
(1139, 1, 1, 'COMMENT_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 21:51:47', NULL),
(1140, 1, 1, 'REVIEW_RECIPE_ADD', 15, 1, 'N', '2018-04-30 21:51:51', NULL),
(1141, 1, 1, 'REVIEW_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 21:52:04', NULL),
(1142, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-04-30 21:54:28', NULL),
(1143, 119, 119, 'USER_ADD', 119, 1, 'N', '2018-04-30 23:54:32', NULL),
(1144, 1, 3, 'USER_UNFOLLOW', 2, 1, 'N', '2018-04-30 23:55:03', NULL),
(1145, 1, 1, 'RECIPE_REMOVE', 66, 1, 'N', '2018-04-30 23:56:48', NULL),
(1146, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-04-30 23:57:53', NULL),
(1147, 1, 1, 'LIKE_RECIPE_IMG_REMOVE', 22, 1, 'N', '2018-04-30 23:57:59', NULL),
(1148, 1, 1, 'LIKE_USER_REMOVE', 23, 1, 'N', '2018-04-30 23:58:05', NULL),
(1149, 1, 1, 'LIKE_COMMENT_ADD', 8, 1, 'N', '2018-04-30 23:58:11', NULL),
(1150, 1, 1, 'LIKE_REVIEW_ADD', 6, 1, 'N', '2018-04-30 23:58:17', NULL),
(1151, 1, 1, 'COMMENT_RECIPE_ADD', 195, 1, 'N', '2018-04-30 23:58:44', NULL),
(1152, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 196, 1, 'N', '2018-04-30 23:58:50', NULL),
(1153, 1, 1, 'COMMENT_RECIPE_ADD', 197, 1, 'N', '2018-04-30 23:58:56', NULL),
(1154, 1, 1, 'COMMENT_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 23:59:20', NULL),
(1155, 1, 1, 'REVIEW_RECIPE_ADD', 15, 1, 'N', '2018-04-30 23:59:25', NULL),
(1156, 1, 1, 'REVIEW_RECIPE_REMOVE', 10, 1, 'N', '2018-04-30 23:59:46', NULL),
(1157, 120, 120, 'USER_ADD', 120, 1, 'N', '2018-05-09 17:31:47', NULL),
(1158, 1, 3, 'USER_FOLLOW', 2, 1, 'N', '2018-05-09 17:32:20', NULL),
(1159, 1, 1, 'RECIPE_REMOVE', 66, 1, 'N', '2018-05-09 17:34:07', NULL),
(1160, 1, 1, 'LIKE_RECIPE_REMOVE', 33, 1, 'N', '2018-05-09 17:35:12', NULL),
(1161, 1, 1, 'LIKE_RECIPE_IMG_ADD', 22, 1, 'N', '2018-05-09 17:35:18', NULL),
(1162, 1, 1, 'LIKE_USER_ADD', 23, 1, 'N', '2018-05-09 17:35:24', NULL),
(1163, 1, 1, 'LIKE_COMMENT_REMOVE', 8, 1, 'N', '2018-05-09 17:35:30', NULL),
(1164, 1, 1, 'LIKE_REVIEW_REMOVE', 6, 1, 'N', '2018-05-09 17:35:36', NULL),
(1165, 1, 1, 'COMMENT_RECIPE_ADD', 198, 1, 'N', '2018-05-09 17:36:05', NULL),
(1166, 1, 1, 'COMMENT_RECIPE_IMG_ADD', 199, 1, 'N', '2018-05-09 17:36:11', NULL),
(1167, 1, 1, 'COMMENT_RECIPE_ADD', 200, 1, 'N', '2018-05-09 17:36:16', NULL),
(1168, 1, 1, 'COMMENT_RECIPE_REMOVE', 10, 1, 'N', '2018-05-09 17:36:41', NULL),
(1169, 1, 1, 'REVIEW_RECIPE_ADD', 15, 1, 'N', '2018-05-09 17:36:47', NULL),
(1170, 1, 1, 'REVIEW_RECIPE_REMOVE', 10, 1, 'N', '2018-05-09 17:37:08', NULL),
(1171, 1, 1, 'RECIPE_REMOVE', 66, 1, 'N', '2018-05-09 18:05:54', NULL),
(1172, 1, 1, 'RECIPE_REMOVE', 81, 1, 'N', '2018-05-09 20:05:29', NULL),
(1173, 1, 1, 'RECIPE_ADD', 149, 1, 'N', '2018-05-10 20:00:03', NULL),
(1174, 1, 1, 'RECIPE_ADD', 150, 1, 'N', '2018-05-10 20:01:44', NULL),
(1175, 1, 1, 'RECIPE_MODIFY', 105, 1, 'N', '2018-05-10 20:04:52', NULL),
(1176, 1, 1, 'RECIPE_ADD', 151, 1, 'N', '2018-05-10 20:20:40', NULL),
(1177, 1, 1, 'USER_BIO_ADD', 3, 1, 'N', '2018-05-11 13:47:26', NULL),
(1178, 1, 1, 'USER_BIO_UPDATE', 1, 1, 'N', '2018-05-11 13:50:20', NULL),
(1179, 1, 1, 'USER_BIO_UPDATE', 5, 1, 'N', '2018-05-11 13:50:51', NULL),
(1180, 1, 1, 'USER_BIO_UPDATE', 1, 1, 'N', '2018-05-11 13:51:23', NULL),
(1181, 1, 1, 'USER_BIO_UPDATE', 1, 1, 'N', '2018-05-11 15:09:59', NULL),
(1182, 1, 1, 'USER_BIO_ADD', 4, 1, 'N', '2018-05-11 15:10:15', NULL),
(1183, 1, 1, 'LIKE_RECIPE_ADD', 33, 1, 'N', '2018-05-12 00:31:35', NULL),
(1184, 1, 1, 'USER_BIO_UPDATE', 4, 1, 'N', '2018-05-13 03:30:25', NULL),
(1185, 1, 1, 'USER_BIO_ADD', 5, 1, 'N', '2018-05-13 03:50:23', NULL),
(1186, 1, 1, 'USER_BIO_ADD', 6, 1, 'N', '2018-05-13 03:51:03', NULL),
(1187, 1, 1, 'USER_BIO_ADD', 1, 1, 'N', '2018-05-13 12:44:23', NULL),
(1188, 1, 1, 'USER_BIO_ADD', 2, 1, 'N', '2018-05-13 12:45:39', NULL),
(1189, 1, 1, 'USER_BIO_ADD', 7, 1, 'N', '2018-05-13 12:53:03', NULL),
(1190, 1, 1, 'USER_BIO_ADD', 8, 1, 'N', '2018-05-13 12:55:02', NULL),
(1191, 1, 1, 'USER_BIO_ADD', 9, 1, 'N', '2018-05-13 12:55:28', NULL),
(1192, 1, 1, 'USER_BIO_ADD', 10, 1, 'N', '2018-05-13 12:58:28', NULL),
(1193, 1, 1, 'USER_BIO_DELETE', 10, 1, 'N', '2018-05-13 18:16:40', NULL),
(1194, 1, 1, 'USER_BIO_DELETE', 10, 1, 'N', '2018-05-13 18:27:27', NULL),
(1195, 1, 1, 'USER_BIO_ADD', 11, 1, 'N', '2018-05-13 18:28:12', NULL),
(1196, 1, 1, 'USER_BIO_DELETE', 9, 1, 'N', '2018-05-13 18:28:23', NULL),
(1197, 1, 1, 'USER_BIO_ADD', 8, 1, 'N', '2018-05-13 19:50:18', NULL),
(1198, 1, 1, 'USER_BIO_DELETE', 7, 1, 'N', '2018-05-13 19:51:00', NULL),
(1199, 1, 1, 'USER_BIO_ADD', 12, 1, 'N', '2018-05-13 19:54:17', NULL),
(1200, 1, 1, 'USER_BIO_ADD', 11, 1, 'N', '2018-05-13 19:54:32', NULL),
(1201, 1, 1, 'USER_BIO_DELETE', 12, 1, 'N', '2018-05-13 19:55:01', NULL),
(1202, 1, 1, 'USER_BIO_DELETE', 8, 1, 'N', '2018-05-13 19:55:23', NULL),
(1203, 1, 1, 'USER_BIO_DELETE', 11, 1, 'N', '2018-05-13 19:55:42', NULL),
(1204, 1, 1, 'USER_BIO_ADD', 6, 1, 'N', '2018-05-13 19:56:54', NULL),
(1205, 1, 1, 'USER_BIO_DELETE', 6, 1, 'N', '2018-05-13 19:57:12', NULL),
(1206, 1, 1, 'USER_BIO_ADD', 5, 1, 'N', '2018-05-13 20:00:22', NULL),
(1207, 1, 1, 'USER_BIO_DELETE', 5, 1, 'N', '2018-05-13 20:02:07', NULL),
(1208, 1, 1, 'USER_BIO_ADD', 13, 1, 'N', '2018-05-13 20:03:15', NULL),
(1209, 1, 1, 'USER_BIO_DELETE', 13, 1, 'N', '2018-05-13 20:03:28', NULL),
(1210, 1, 1, 'USER_BIO_DELETE', 2, 1, 'N', '2018-05-13 20:03:41', NULL),
(1211, 1, 1, 'USER_BIO_ADD', 4, 1, 'N', '2018-05-13 20:04:02', NULL),
(1212, 1, 1, 'USER_BIO_DELETE', 1, 1, 'N', '2018-05-13 20:04:42', NULL),
(1213, 1, 1, 'USER_BIO_DELETE', 3, 1, 'N', '2018-05-13 20:04:55', NULL),
(1214, 1, 1, 'USER_BIO_ADD', 14, 1, 'N', '2018-05-13 20:05:13', NULL),
(1215, 1, 1, 'USER_BIO_ADD', 14, 1, 'N', '2018-05-13 20:05:21', NULL),
(1216, 1, 1, 'USER_BIO_DELETE', 4, 1, 'N', '2018-05-13 20:07:19', NULL),
(1217, 1, 1, 'USER_BIO_ADD', 15, 1, 'N', '2018-05-13 20:07:46', NULL),
(1218, 1, 1, 'USER_BIO_ADD', 15, 1, 'N', '2018-05-13 20:07:52', NULL),
(1219, 1, 1, 'USER_BIO_ADD', 15, 1, 'N', '2018-05-13 20:07:59', NULL),
(1220, 1, 1, 'USER_BIO_ADD', 15, 1, 'N', '2018-05-13 20:08:06', NULL),
(1221, 1, 1, 'USER_BIO_ADD', 15, 1, 'N', '2018-05-13 20:08:16', NULL),
(1222, 1, 1, 'USER_BIO_ADD', 16, 1, 'N', '2018-05-13 20:09:16', NULL),
(1223, 1, 1, 'USER_BIO_ADD', 17, 1, 'N', '2018-05-13 20:09:55', NULL),
(1224, 1, 1, 'USER_BIO_ADD', 18, 1, 'N', '2018-05-13 20:10:01', NULL),
(1225, 1, 1, 'USER_BIO_DELETE', 10, 1, 'N', '2018-05-13 20:11:08', NULL),
(1226, 1, 1, 'USER_BIO_DELETE', 18, 1, 'N', '2018-05-13 20:11:23', NULL),
(1227, 1, 1, 'USER_BIO_DELETE', 18, 1, 'N', '2018-05-13 20:12:13', NULL),
(1228, 1, 1, 'USER_BIO_ADD', 19, 1, 'N', '2018-05-13 20:12:32', NULL),
(1229, 1, 1, 'USER_BIO_DELETE', 17, 1, 'N', '2018-05-13 20:12:46', NULL),
(1230, 1, 1, 'USER_BIO_DELETE', 16, 1, 'N', '2018-05-13 20:14:29', NULL),
(1231, 1, 1, 'USER_BIO_DELETE', 19, 1, 'N', '2018-05-13 20:14:40', NULL),
(1232, 1, 1, 'USER_BIO_ADD', 15, 1, 'N', '2018-05-13 20:21:13', NULL);

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
(1, 'O\'reilly', 'ajitkamathk@gmail.com', 331404, 'app_data/users/1/profile/images/5ae3895a60f27.jpg', '2894232220', 'Q09PS0VSWXBuaUNT', 'F', 1, 1, 1, 1, '', 'cG5pQ1M=', '2018-05-02 22:02:53', '2017-09-23 00:00:00', '2018-05-09 17:33:06'),
(2, 'USER - 2', 'testemail@cookery.com', 0, NULL, '9962218578', 'aWFtdGVzdE15RkJE', 'm', 1, 1, 1, 1, 'BlsXt3B4aS', 'TXlGQkQ=', '2017-12-29 06:29:04', '2017-10-31 05:05:03', '2017-12-31 06:54:52'),
(3, 'USER - 3', 'testemail2@cookery.com', 0, NULL, '7503876065', 'aWFtdGVzdG9TS3Ay', 'm', 1, 1, 1, 1, 'UgbYfiDJNG', 'b1NLcDI=', '2017-12-29 06:29:04', '2017-10-31 05:22:11', NULL),
(4, 'USER - 4', 'vishal@cookery.com', 0, 'app_data/users/99/profile/images/5ab6b3f780f34.jpg', '8124627522', 'cm9jazJaUEtw', 'M', 1, 1, 1, 1, 'zXpcSp5CRx', 'MlpQS3A=', '2017-12-29 06:29:04', '2017-10-31 13:37:06', NULL),
(5, 'USER - 5', 'eVX723Dbff@gmail.com', 71946724, NULL, '1234567890', 'MTIzNDU2NzgxNjhjUg==', 'M', 1, 1, 1, 1, '8WGpsX2MsJ', 'MTY4Y1I=', '2018-05-09 17:32:44', '2017-12-05 09:28:53', '2018-05-09 17:32:44'),
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
(112, 'Vishal', 'dial2vishal@gmail.com', 0, NULL, NULL, 'cm9ja0lXUnV3', '', 1, 1, 1, 1, 'LcKqFOxrvf', 'SVdSdXc=', '2018-04-14 16:32:54', '2018-04-14 16:32:54', NULL),
(113, 'Test User -  17', 'Fbr07kYpVq@gmail.com', 5922610, NULL, NULL, 'Q09PS0VSWU9BS2o2', '', 1, 1, 1, 1, 'Bz7nP8bfCa', 'T0FLajY=', '2018-04-30 19:17:04', '2018-04-30 19:17:04', NULL),
(114, 'Test User -  36', 'ew2eZLEFlm@gmail.com', 98621198, NULL, NULL, 'Q09PS0VSWTFYRkRx', '', 1, 1, 1, 1, 'Wi7YdSxrcF', 'MVhGRHE=', '2018-04-30 19:53:51', '2018-04-30 19:53:51', NULL),
(115, 'Test User -  57', 'Ta9an56Pls@gmail.com', 11042480, NULL, NULL, 'Q09PS0VSWVNCUUlt', '', 1, 1, 1, 1, '4oUTgjlpiv', 'U0JRSW0=', '2018-04-30 20:24:40', '2018-04-30 20:24:40', NULL),
(116, 'Test User -  81', 'tIlq4mAlIm@gmail.com', 48918873, NULL, NULL, 'Q09PS0VSWWJOUEFQ', '', 1, 1, 1, 1, 'vMd6LYI9cz', 'Yk5QQVA=', '2018-04-30 20:47:54', '2018-04-30 20:47:54', NULL),
(117, 'Test User -  07', 'JITZck6OHH@gmail.com', 46350834, NULL, NULL, 'Q09PS0VSWWo0TXdp', '', 1, 1, 1, 1, 'yjoatdLdxR', 'ajRNd2k=', '2018-04-30 21:27:49', '2018-04-30 21:27:49', NULL),
(118, 'Test User -  61', 'UiMVyIAqaj@gmail.com', 85320901, NULL, NULL, 'Q09PS0VSWWVMYWJi', '', 1, 1, 1, 1, 'QKquTjJnec', 'ZUxhYmI=', '2018-04-30 21:48:14', '2018-04-30 21:48:14', NULL),
(119, 'Test User -  08', 'uhDlSF3Rpm@gmail.com', 23909873, NULL, NULL, 'Q09PS0VSWUo4TjN1', '', 1, 1, 1, 1, '3bJ4Da7Ofw', 'SjhOM3U=', '2018-04-30 23:54:32', '2018-04-30 23:54:32', NULL),
(120, 'Test User -  14', 'OS0Px5mr2j@gmail.com', 53408142, NULL, NULL, 'Q09PS0VSWU1zRGdE', '', 1, 1, 1, 1, 'g1BBa3GtjZ', 'TXNEZ0Q=', '2018-05-09 17:31:46', '2018-05-09 17:31:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `USER_BIO`
--

CREATE TABLE `USER_BIO` (
  `USER_BIO_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_BIO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IS_ACTIVE` varchar(1) NOT NULL DEFAULT 'N',
  `IS_DEL` varchar(1) NOT NULL DEFAULT 'N',
  `CREATE_DTM` timestamp NOT NULL,
  `MOD_DTM` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `USER_BIO`
--

INSERT INTO `USER_BIO` (`USER_BIO_ID`, `USER_ID`, `USER_BIO`, `IS_ACTIVE`, `IS_DEL`, `CREATE_DTM`, `MOD_DTM`) VALUES
(1, 1, 'This is a sample bio !', 'N', 'Y', '2018-05-11 08:11:05', '2018-05-13 14:34:42'),
(2, 1, 'This is a sample bio !', 'N', 'Y', '2018-05-11 08:11:26', '2018-05-13 14:33:41'),
(3, 1, 'This is a sample bio !', 'N', 'Y', '2018-05-11 08:17:25', '2018-05-13 14:34:55'),
(4, 1, 'This is a sample bio - 48', 'N', 'Y', '2018-05-11 09:40:15', '2018-05-13 14:37:19'),
(5, 1, 'This is a sample bio - 49', 'Y', 'Y', '2018-05-12 22:20:23', '2018-05-13 14:32:07'),
(6, 1, '000000000000000000000000000000', 'Y', 'Y', '2018-05-12 22:21:03', '2018-05-13 14:27:12'),
(7, 1, 'null', 'N', 'Y', '2018-05-13 07:23:03', '2018-05-13 14:21:00'),
(8, 1, 'null master', 'N', 'Y', '2018-05-13 07:25:02', '2018-05-13 14:25:23'),
(9, 1, 'null master - 2', 'N', 'Y', '2018-05-13 07:25:28', '2018-05-13 12:58:23'),
(10, 1, 'null master - 3', 'Y', 'Y', '2018-05-13 07:28:28', '2018-05-13 14:41:08'),
(11, 1, 'Test a new bio', 'Y', 'Y', '2018-05-13 12:58:11', '2018-05-13 14:25:42'),
(12, 1, 'null master1', 'N', 'Y', '2018-05-13 14:24:17', '2018-05-13 14:25:01'),
(13, 1, 'test bio -1', 'Y', 'Y', '2018-05-13 14:33:15', '2018-05-13 14:33:28'),
(14, 1, 'This is a sample bio - 2', 'N', 'N', '2018-05-13 14:35:13', '2018-05-13 14:37:45'),
(15, 1, 'This is a sample bio - 3', 'Y', 'N', '2018-05-13 14:37:45', '2018-05-13 14:51:13'),
(16, 1, 'This is a sample bio - 4', 'N', 'Y', '2018-05-13 14:39:16', '2018-05-13 14:44:29'),
(17, 1, 'This is a sample bio - 5', 'N', 'Y', '2018-05-13 14:39:55', '2018-05-13 14:42:46'),
(18, 1, 'This is a sample bio - 6', 'Y', 'Y', '2018-05-13 14:40:01', '2018-05-13 14:42:13'),
(19, 1, 'Test for 1', 'Y', 'Y', '2018-05-13 14:42:32', '2018-05-13 14:44:40');

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
(1, 1, 2, 'Y', '2017-12-27 08:20:02', '2018-04-27 00:04:28'),
(2, 1, 3, 'N', '2017-12-27 08:27:22', '2018-05-09 17:32:20'),
(3, 1, 4, 'N', '2018-01-08 08:37:17', '2018-03-26 19:18:13'),
(4, 1, 8, 'N', '2018-01-08 08:37:24', NULL),
(5, 1, 15, 'N', '2018-01-08 08:37:56', NULL),
(6, 1, 14, 'N', '2018-01-08 08:38:08', '2018-04-27 00:07:36'),
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
(14, 100, 105, '2018-03-27 23:47:50', NULL),
(15, 1, 148, '2018-04-28 12:24:45', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ADMIN_USER`
--
ALTER TABLE `ADMIN_USER`
  ADD PRIMARY KEY (`ADMIN_USER_ID`);

--
-- Indexes for table `AUDIT`
--
ALTER TABLE `AUDIT`
  ADD PRIMARY KEY (`AUDIT_ID`);

--
-- Indexes for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD PRIMARY KEY (`COM_ID`),
  ADD KEY `RCP_ID` (`TYPE_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

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
  ADD PRIMARY KEY (`FOOD_CSN_ID`),
  ADD UNIQUE KEY `FOOD_CSN_NAME` (`FOOD_CSN_NAME`);

--
-- Indexes for table `FOOD_TYPE`
--
ALTER TABLE `FOOD_TYPE`
  ADD PRIMARY KEY (`FOOD_TYP_ID`),
  ADD UNIQUE KEY `FOOD_TYP_NAME` (`FOOD_TYP_NAME`);

--
-- Indexes for table `INGREDIENT`
--
ALTER TABLE `INGREDIENT`
  ADD PRIMARY KEY (`ING_ID`),
  ADD KEY `INGREDIENT_FK1` (`ING_CAT_ID`);

--
-- Indexes for table `INGREDIENT_NUTRITION`
--
ALTER TABLE `INGREDIENT_NUTRITION`
  ADD PRIMARY KEY (`ING_NUT_ID`),
  ADD UNIQUE KEY `ING_NUT_ID` (`ING_NUT_ID`,`ING_ID`,`NUT_ID`),
  ADD KEY `INGREDIENT_NUTRITION_FK1` (`ING_ID`),
  ADD KEY `INGREDIENT_NUTRITION_FK2` (`NUT_ID`);

--
-- Indexes for table `INGREDIENT_UOM`
--
ALTER TABLE `INGREDIENT_UOM`
  ADD PRIMARY KEY (`ING_UOM_ID`),
  ADD UNIQUE KEY `ING_UOM_NAME` (`ING_UOM_NAME`);

--
-- Indexes for table `ING_AKA`
--
ALTER TABLE `ING_AKA`
  ADD PRIMARY KEY (`ING_AKA_ID`),
  ADD UNIQUE KEY `ING_AKA_NAME` (`ING_AKA_NAME`),
  ADD KEY `ING_AKA_FK1` (`ING_ID`);

--
-- Indexes for table `ING_CATEGORIES`
--
ALTER TABLE `ING_CATEGORIES`
  ADD PRIMARY KEY (`ING_CAT_ID`),
  ADD UNIQUE KEY `ING_CAT_NAME` (`ING_CAT_NAME`);

--
-- Indexes for table `ING_HEALTH`
--
ALTER TABLE `ING_HEALTH`
  ADD PRIMARY KEY (`ING_HLTH_ID`),
  ADD KEY `ING_HEALTH_FK1` (`ING_ID`);

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
-- Indexes for table `NUTRITION`
--
ALTER TABLE `NUTRITION`
  ADD PRIMARY KEY (`NUT_ID`),
  ADD UNIQUE KEY `NUT_NAME` (`NUT_NAME`),
  ADD KEY `NUTRITION_FK1` (`NUT_CAT_ID`),
  ADD KEY `NUTRITION_FK2` (`NUT_UOM_ID`);

--
-- Indexes for table `NUTRITION_CATEGORIES`
--
ALTER TABLE `NUTRITION_CATEGORIES`
  ADD PRIMARY KEY (`NUT_CAT_ID`),
  ADD UNIQUE KEY `NUT_CAT_NAME` (`NUT_CAT_NAME`);

--
-- Indexes for table `NUTRITION_UOM`
--
ALTER TABLE `NUTRITION_UOM`
  ADD PRIMARY KEY (`NUT_UOM_ID`),
  ADD UNIQUE KEY `NUT_UOM_NAME` (`NUT_UOM_NAME`),
  ADD UNIQUE KEY `NUT_UOM_NAME_2` (`NUT_UOM_NAME`);

--
-- Indexes for table `RANK`
--
ALTER TABLE `RANK`
  ADD PRIMARY KEY (`RANK_ID`);

--
-- Indexes for table `RECIPE`
--
ALTER TABLE `RECIPE`
  ADD PRIMARY KEY (`RCP_ID`),
  ADD KEY `RECIPE_FK1` (`FOOD_CSN_ID`),
  ADD KEY `RECIPE_FK2` (`FOOD_TYP_ID`),
  ADD KEY `RECIPE_FK3` (`USER_ID`);

--
-- Indexes for table `RECIPE_IMG`
--
ALTER TABLE `RECIPE_IMG`
  ADD PRIMARY KEY (`RCP_IMG_ID`),
  ADD KEY `RECIP_IMG_FK1` (`RCP_ID`);

--
-- Indexes for table `RECIPE_INGREDIENTS`
--
ALTER TABLE `RECIPE_INGREDIENTS`
  ADD PRIMARY KEY (`RCP_ING_ID`),
  ADD KEY `RECIPE_INGREDIENTS_FK1` (`ING_UOM_ID`),
  ADD KEY `RECIPE_INGREDIENTS_FK2` (`ING_AKA_ID`);

--
-- Indexes for table `RECIPE_STEPS`
--
ALTER TABLE `RECIPE_STEPS`
  ADD PRIMARY KEY (`RCP_STPS_ID`),
  ADD KEY `RCP_ID` (`RCP_ID`);

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
-- Indexes for table `USER_BIO`
--
ALTER TABLE `USER_BIO`
  ADD PRIMARY KEY (`USER_BIO_ID`),
  ADD KEY `USER_BIO_FK1` (`USER_ID`);

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
-- AUTO_INCREMENT for table `ADMIN_USER`
--
ALTER TABLE `ADMIN_USER`
  MODIFY `ADMIN_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `AUDIT`
--
ALTER TABLE `AUDIT`
  MODIFY `AUDIT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2638;

--
-- AUTO_INCREMENT for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  MODIFY `COM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `FAVOURITES`
--
ALTER TABLE `FAVOURITES`
  MODIFY `FAV_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `FOOD_CUISINE`
--
ALTER TABLE `FOOD_CUISINE`
  MODIFY `FOOD_CSN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `FOOD_TYPE`
--
ALTER TABLE `FOOD_TYPE`
  MODIFY `FOOD_TYP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `INGREDIENT`
--
ALTER TABLE `INGREDIENT`
  MODIFY `ING_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `INGREDIENT_NUTRITION`
--
ALTER TABLE `INGREDIENT_NUTRITION`
  MODIFY `ING_NUT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `INGREDIENT_UOM`
--
ALTER TABLE `INGREDIENT_UOM`
  MODIFY `ING_UOM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ING_AKA`
--
ALTER TABLE `ING_AKA`
  MODIFY `ING_AKA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `ING_CATEGORIES`
--
ALTER TABLE `ING_CATEGORIES`
  MODIFY `ING_CAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ING_HEALTH`
--
ALTER TABLE `ING_HEALTH`
  MODIFY `ING_HLTH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `ING_IMAGES`
--
ALTER TABLE `ING_IMAGES`
  MODIFY `ING_IMG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `LIKES`
--
ALTER TABLE `LIKES`
  MODIFY `LIKE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `MILESTONE`
--
ALTER TABLE `MILESTONE`
  MODIFY `MLT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `NUTRITION`
--
ALTER TABLE `NUTRITION`
  MODIFY `NUT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `NUTRITION_CATEGORIES`
--
ALTER TABLE `NUTRITION_CATEGORIES`
  MODIFY `NUT_CAT_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `NUTRITION_UOM`
--
ALTER TABLE `NUTRITION_UOM`
  MODIFY `NUT_UOM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `RANK`
--
ALTER TABLE `RANK`
  MODIFY `RANK_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `RECIPE`
--
ALTER TABLE `RECIPE`
  MODIFY `RCP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `RECIPE_IMG`
--
ALTER TABLE `RECIPE_IMG`
  MODIFY `RCP_IMG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `RECIPE_INGREDIENTS`
--
ALTER TABLE `RECIPE_INGREDIENTS`
  MODIFY `RCP_ING_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `RECIPE_STEPS`
--
ALTER TABLE `RECIPE_STEPS`
  MODIFY `RCP_STPS_ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

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
-- AUTO_INCREMENT for table `TIMELINES`
--
ALTER TABLE `TIMELINES`
  MODIFY `TMLN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1233;

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
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `USER_BIO`
--
ALTER TABLE `USER_BIO`
  MODIFY `USER_BIO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `VIEW_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD CONSTRAINT `FK_USER_COMMENTS` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `INGREDIENT_NUTRITION`
--
ALTER TABLE `INGREDIENT_NUTRITION`
  ADD CONSTRAINT `INGREDIENT_NUTRITION_FK1` FOREIGN KEY (`ING_ID`) REFERENCES `INGREDIENT` (`ing_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `INGREDIENT_NUTRITION_FK2` FOREIGN KEY (`NUT_ID`) REFERENCES `NUTRITION` (`nut_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ING_AKA`
--
ALTER TABLE `ING_AKA`
  ADD CONSTRAINT `ING_AKA_FK1` FOREIGN KEY (`ING_ID`) REFERENCES `INGREDIENT` (`ing_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ING_HEALTH`
--
ALTER TABLE `ING_HEALTH`
  ADD CONSTRAINT `ING_HEALTH_FK1` FOREIGN KEY (`ING_ID`) REFERENCES `INGREDIENT` (`ing_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `NUTRITION`
--
ALTER TABLE `NUTRITION`
  ADD CONSTRAINT `NUTRITION_FK1` FOREIGN KEY (`NUT_CAT_ID`) REFERENCES `NUTRITION_CATEGORIES` (`nut_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `NUTRITION_FK2` FOREIGN KEY (`NUT_UOM_ID`) REFERENCES `NUTRITION_UOM` (`nut_uom_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `RECIPE`
--
ALTER TABLE `RECIPE`
  ADD CONSTRAINT `RECIPE_FK1` FOREIGN KEY (`FOOD_CSN_ID`) REFERENCES `FOOD_CUISINE` (`food_csn_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RECIPE_FK2` FOREIGN KEY (`FOOD_TYP_ID`) REFERENCES `FOOD_TYPE` (`food_typ_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RECIPE_FK3` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `RECIPE_IMG`
--
ALTER TABLE `RECIPE_IMG`
  ADD CONSTRAINT `RECIP_IMG_FK1` FOREIGN KEY (`RCP_ID`) REFERENCES `RECIPE` (`rcp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `RECIPE_INGREDIENTS`
--
ALTER TABLE `RECIPE_INGREDIENTS`
  ADD CONSTRAINT `RECIPE_INGREDIENTS_FK1` FOREIGN KEY (`ING_UOM_ID`) REFERENCES `INGREDIENT_UOM` (`ing_uom_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RECIPE_INGREDIENTS_FK2` FOREIGN KEY (`ING_AKA_ID`) REFERENCES `ING_AKA` (`ing_aka_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `USER_BIO`
--
ALTER TABLE `USER_BIO`
  ADD CONSTRAINT `USER_BIO_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
