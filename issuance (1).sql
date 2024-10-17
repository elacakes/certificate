-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2024 at 03:23 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `issuance`
--

-- --------------------------------------------------------

--
-- Table structure for table `certificate_requests`
--

CREATE TABLE `certificate_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `certificate_type` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` text COLLATE utf8_unicode_ci NOT NULL,
  `pickup_datetime` datetime NOT NULL,
  `status` enum('Pending','Approved','Declined','Released') COLLATE utf8_unicode_ci DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `certificate_requests`
--

INSERT INTO `certificate_requests` (`id`, `user_id`, `certificate_type`, `purpose`, `pickup_datetime`, `status`, `created_at`) VALUES
(11, 12, 'clearance', '1st job seeker', '2024-10-18 07:00:00', 'Released', '2024-10-17 10:27:49'),
(12, 12, 'indigency', 'getting voters certification', '2024-10-18 08:40:00', 'Released', '2024-10-17 10:39:49'),
(13, 12, 'residency', 'getting voters certification', '2024-10-18 09:20:00', 'Released', '2024-10-17 11:16:44'),
(14, 12, 'clearance', 'getting voters certification', '2024-10-17 19:29:00', 'Released', '2024-10-17 11:29:44');

-- --------------------------------------------------------

--
-- Table structure for table `officials`
--

CREATE TABLE `officials` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `term_start` date DEFAULT NULL,
  `term_end` date DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','End Term') COLLATE utf8_unicode_ci DEFAULT 'Active',
  `is_signatory` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `officials`
--

INSERT INTO `officials` (`id`, `fullname`, `position`, `contact`, `term_start`, `term_end`, `image`, `status`, `is_signatory`) VALUES
(1, 'Renato A. Venturina', 'Barangay Captain', '09159285614', '2023-06-30', '2024-06-11', '', 'End Term', 'inactive'),
(5, 'Renato A. Venturina', 'Barangay Captain', '09159285613', '2023-07-30', '2025-07-30', 'Screenshot (7).png', 'Active', 'active'),
(6, 'Juan Miguel Dela Cruz', 'Barangay Councilor', '09159285613', '2023-06-30', '2024-10-11', 'Screenshot (8).png', 'End Term', 'inactive'),
(7, 'maria', 'Barangay Councilor', '1234567890', '2023-09-02', '2024-10-15', 'Screenshot (6).png', 'End Term', 'inactive'),
(8, 'Clemente ChanGE', 'Barangay Treasurer', '0987654321', '2023-06-30', '2023-10-12', '', 'End Term', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bday` date NOT NULL,
  `gender` enum('Male','Female','Other') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Single','Married','Widowed','Separated','Divorced') COLLATE utf8_unicode_ci NOT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stay` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barangay` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `municipality` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pendingcase` enum('Yes','No','','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `caseDetails` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `verify_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verify_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0=no,1=yes',
  `role` enum('admin','resident') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'resident',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `age`, `phone`, `bday`, `gender`, `status`, `place`, `stay`, `postal`, `zone`, `barangay`, `municipality`, `province`, `mother_name`, `father_name`, `pendingcase`, `caseDetails`, `verify_token`, `verify_status`, `role`, `created_at`) VALUES
(9, 'Barangay Puncan', 'brgypuncan@gmail.com', '$2y$10$iFHpe.bhA6rtnAeqKx5oBOFBd.JBTMI3vHzCW2nNxFNe9HDgYIUgi', 0, NULL, '0000-00-00', 'Male', 'Single', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, 'admin', '2024-10-17 00:46:44'),
(10, 'Juan Miguel Dela Cruz', 'example@gmail.com', '$2y$10$4Cha6.7YYtU6MV62P5jxj.B68bvN0agZve8Jp.22RQdUtZqS1hEtq', 25, '91787836', '1999-09-02', 'Male', 'Single', 'Carranglan', '2002', '3123', 'Sitio Boring', 'Puncan', 'Carranglan', 'Nueva Ecija', 'Elsa Manaloto', 'Pepito Manaloto', 'No', '', 'd3608ddc052d344e63a5ebb627518b47', 0, 'resident', '2024-10-17 01:32:03'),
(11, 'Juan Miguel Dela Cruz', 'exam@gmail.com', '$2y$10$UANNRmhDScEaScr5itpE3OCECgI518tev6IYm51CNqUN6zsfVU0NO', 25, '91787836', '1999-09-02', 'Male', 'Single', 'Carranglan', '2002', '3123', 'Sitio Boring', 'Puncan', 'Carranglan', 'Nueva Ecija', 'Elsa Manaloto', 'Pepito Manaloto', 'No', '', 'e0cafc62efb25f23e911cf6ca064de46', 0, 'resident', '2024-10-17 02:35:04'),
(12, 'Juan Dela Cruz', 'elagorjaas@gmail.com', '$2y$10$dnnPbopUKX0lAeR.r1hgLuRT./RA5JttvpPqB8/Qw.ZkjMIBCmZfO', 25, '91787836', '1999-09-02', 'Male', 'Single', 'Carranglan', '2002', '3123', 'Sitio Lahud', 'Puncan', 'Carranglan', 'Nueva Ecija', 'Elsa Manaloto', 'Pepito Manaloto', 'No', '', 'd7e2ad2c180916070b280888d8f185cf', 1, 'resident', '2024-10-17 02:46:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `officials`
--
ALTER TABLE `officials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `officials`
--
ALTER TABLE `officials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  ADD CONSTRAINT `certificate_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
