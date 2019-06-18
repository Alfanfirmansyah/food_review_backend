-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2019 at 09:22 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ws_foodreview`
--

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `restos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `pic`, `price`, `restos_id`) VALUES
(5, 'Kepiting Bakar', 'kepiting.jpg', 50000, 1),
(6, 'Pizza Melati', 'pizza.jpg', 35000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `restos`
--

CREATE TABLE `restos` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `gambar` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restos`
--

INSERT INTO `restos` (`id`, `name`, `address`, `category`, `website`, `gambar`, `description`) VALUES
(1, 'Restoran Melati', 'Jln. Kahuripan 3 Tugu Monument, Malang', 'Restaurant', 'https://www.tuguhotels.com/?utm_source=tripadvisor&utm_medium=referral', 'melati.jpg', 'Resto yang dimiliki oleh hotel Tugu ini memiliki nilai sejarah yang tinggi. di resto ini terdapat berbagai barang antik peninggalan belanda dan sekalgus perjalanan kisah si pendiri. Resto ini memberikan berbagai fasilitas untuk meeting bisnis maupun acara skala besar dengan berbgai keunikan yang dapat ditemukan. pengunjung dapat berselfi ria di berbagai spot yang menarik. menu makan lengkap dari ala Indonesia, chines, eropa, dan amerika. Resto ono menajdi salah satu favorit bule-bule untuk makan malam dan para pejabat. Suasa yang asri, sejuk dan keramahan pelayanan menajdikan resto ini dapat menjadi pilihan terbaik untuk menjamu tamu penting dan spesial');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `comment` text,
  `rating` int(11) DEFAULT NULL,
  `foods_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `email`, `comment`, `rating`, `foods_id`, `created_at`) VALUES
(8, 'Alfan Firmansyah', NULL, 'Makanan yang sedap khas berbeda dengan yang lain.', 4, 5, '2019-06-16 21:24:14'),
(9, 'Hafad', 'hafad@gmail.com', 'Enak', 1, 6, '2019-06-17 04:10:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foods_restos_idx` (`restos_id`);

--
-- Indexes for table `restos`
--
ALTER TABLE `restos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reviews_foods1_idx` (`foods_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `restos`
--
ALTER TABLE `restos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `fk_foods_restos` FOREIGN KEY (`restos_id`) REFERENCES `restos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_foods1` FOREIGN KEY (`foods_id`) REFERENCES `foods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
