-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2019 at 02:29 AM
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
(1, 'Prasmanan Ayam Goreng', 'ayamgorengcaksul.jpg', 15000, 1),
(2, 'Prasmanan Telor Goreng', 'telorgorengcaksul.jpg', 10000, 1),
(3, 'Tahu Telor', 'tahutelor.jpg', 12000, 2),
(4, 'Lalapan Ayam Goreng', 'lalapan.jpg', 15000, 2);

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
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restos`
--

INSERT INTO `restos` (`id`, `name`, `address`, `category`, `website`, `description`) VALUES
(1, 'Warung Cak Sul', 'Jl sigura-gura no 05 ', 'Prasmanan', 'warungcaksul.com', 'Didirikan tahun 2002, Atmosphere Resort Café adalah restoran modern dengan desain interior Bali. Atmosphere Resort Café ini memiliki beragam desain setting ruangan, seperti area jamuan makan di lantai satu gedung utama, 11 tatami (tikar dengan meja untuk 10 orang) di lantai dua, dan 12 Gazebo di halaman belakang, yang dihiasi dengan pohon-pohon dan kolam ikan yang akan memberikan suasana alam di tengah-tengah kota.'),
(2, 'Warung Wareg', 'Suku, Malang ', 'Cafe', 'warungwareg.com', 'Restoran ini menyediakan hidangan khas Indonesia, hidangan laut, dan hidangan Barat. Spesialisasi makanan mereka adalah Iga Sapi Bakar Rica, sop buntut, chicken sicilia, dan lainnya. Mereka juga menyediakan minuman beralkohol seperti anggur, sampanye, cognan, dan lainnya.');

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
(1, 'Hafad', 'dwiindra@gmail.com', 'Wenak, murah manteb coyy', 4, 3, '2019-05-02 06:11:10'),
(2, 'Dwi Indra', 'dwiindra@gmail.com', 'Makanan yang khas, sedap bgtzz', 5, 1, '2019-05-02 06:11:10'),
(5, 'Fahmy', 'dwiindra@gmail.com', 'Murah tapi rasa tidak bohong', 4, 4, '2019-05-02 07:53:35'),
(6, 'Angga', 'dwiindra@gmail.com', 'Langganan saya disini', 4, 4, '2019-05-02 07:55:06'),
(7, 'Dika', 'dwiindra@gmail.com', 'Wenak kuyy', 4, 4, '2019-05-02 08:25:37');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restos`
--
ALTER TABLE `restos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
