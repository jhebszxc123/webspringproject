-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2024 at 05:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clientdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `created_at` datetime(6) DEFAULT current_timestamp(6),
  `image_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand`, `category`, `description`, `name`, `price`, `created_at`, `image_file_name`) VALUES
(1, 'Predator', 'Lap-top', 'Latest model with advanced features', 'Predator Laptop', 456, '2024-08-09 16:02:14.000000', '1724092906062_predator.jpeg'),
(2, 'Samsung', 'Smartphone', 'High resolution display and powerful processor', 'Galaxy S21', 799.99, '2024-08-09 16:02:14.000000', 'Samsung.jpg'),
(3, 'Google', 'Smartphone', 'Clean Android experience with top-notch camera', 'Pixel 6', 599.99, '2024-08-09 16:02:14.000000', 'Google.jpg'),
(4, 'OnePlus', 'Smartphone', 'Fast performance and fluid user experience', 'OnePlus 9', 729.99, '2024-08-09 16:02:14.000000', 'OnePlus.jpg'),
(5, 'Xiaomi', 'Smartphone', 'Affordable flagship with premium features', 'Mi 11', 699.99, '2024-08-09 16:02:14.000000', 'Xiaomi.jpg'),
(6, 'Sony', 'Smartphone', 'Excellent display and audio quality', 'Xperia 5', 749.99, '2024-08-09 16:02:14.000000', 'Sony.jpg'),
(7, 'LG', 'Smartphone', 'Unique design and dual screen capability', 'LG Wing', 999.99, '2024-08-09 16:02:14.000000', 'Lg.jpg'),
(8, 'Nokia', 'Smartphone', 'Durable build with stock Android', 'Nokia 8.3', 499.99, '2024-08-09 16:02:14.000000', 'Nokia.jpg'),
(9, 'Motorola', 'Smartphone', 'Affordable phone with long battery life', 'Moto G30', 199.99, '2024-08-09 16:02:14.000000', 'Motorola.jpg'),
(10, 'Huawei', 'Smartphone', 'Powerful camera and sleek design', 'P40 Pro', 899.99, '2024-08-09 16:02:14.000000', 'Huawei.jpg'),
(11, 'Oppo', 'Smartphone', 'Innovative design and fast charging', 'Oppo Find X3', 699.99, '2024-08-09 16:02:14.000000', 'Oppo.jpg'),
(12, 'Vivo', 'Smartphone', 'Excellent camera and fast performance', 'Vivo X60', 599.99, '2024-08-09 16:02:14.000000', 'Vivo.jpg'),
(13, 'Realme', 'Smartphone', 'Budget-friendly with good performance', 'Realme 8', 249.99, '2024-08-09 16:02:14.000000', 'Realme.jpg'),
(14, 'Asus', 'Smartphone', 'Gaming phone with top specs', 'ROG Phone 5', 999.99, '2024-08-09 16:02:14.000000', 'Asus.jpg'),
(15, 'Lenovo', 'Smartphone', 'Affordable phone with decent specs', 'Lenovo K12', 179.99, '2024-08-09 16:02:14.000000', 'Lenovo.jpg'),
(16, 'ZTE', 'Smartphone', '5G phone with good features', 'ZTE Axon 20', 399.99, '2024-08-09 16:02:14.000000', 'Zte.jpg'),
(17, 'TCL', 'Smartphone', 'Good display and performance', 'TCL 20 Pro', 449.99, '2024-08-09 16:02:14.000000', 'Tcl.jpg'),
(18, 'Alcatel', 'Smartphone', 'Basic smartphone with essential features', 'Alcatel 1S', 129.99, '2024-08-09 16:02:14.000000', 'Alcatel.jpg'),
(19, 'Honor', 'Smartphone', 'Good camera and display', 'Honor 50', 499.99, '2024-08-09 16:02:14.000000', 'Honor.jpg'),
(20, 'Micromax', 'Smartphone', 'Budget-friendly with decent performance', 'Micromax In Note 1', 149.99, '2024-08-09 16:02:14.000000', 'Micromax.jpg'),
(52, 'awawawawa', 'Lap-top', 'sfgdfgfdgfdgdfg', 'awaw', 322, '2024-08-19 23:06:33.000000', '1724079993019_predator.jpeg'),
(53, 'Samsung naman', 'Lap-top', 'adsasdsadasdasd', 'Edit button nalang', 455, '2024-08-19 23:11:40.000000', '1724080300759_samsunglaptop.jpeg'),
(54, 'Predator', 'Lap-top', 'predator is a good laptop', 'Preadator Laptop', 299, '2024-08-19 23:13:13.000000', '1724221259637_predator.jpeg'),
(58, 'Samung', 'Lap-top', 'Samung is a good laptop', 'Samung Laptop', 399, '2024-08-21 14:19:47.000000', '1724221187873_samsunglaptop.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `address`, `created_at`, `email`, `first_name`, `last_name`, `password`, `phone`, `role`) VALUES
(1, 'Muntinlupa City', '2024-08-17 16:50:47.000000', 'client@gmail.com', 'Harold Kim', 'Tagapan', '$2a$10$v7vdb7/.67KSn0h0tBUI5uREaNfkeDKwUD6owBbKrAyZYVwlHAD9O', '09319051802', 'client'),
(2, 'Muntinlupa City', '2024-08-18 16:16:44.000000', 'admin@gmail.com', 'James', 'Gosling', '$2a$10$2cbHBlFhLDD.5ROiUvaoB.ZJRbKLGl1Xj6wotc4It6DowlaJHDL.S', '09971359045', 'admin'),
(3, 'Muntinlupa City', '2024-08-20 02:51:23.000000', 'admin123@gmail.com', 'Tony', 'Stark', '$2a$10$OmLqs0XlFKMRUFGZaVIN2u7A.eJrinuIPEKnZUtu3otQVPKkQulrW', '09123455678', 'admin'),
(4, 'Muntinlupa City', '2024-08-20 21:15:16.000000', 'tonystark123@gmail.com', 'Tony', 'Stark', '$2a$10$D8pScTqmQxgYsa7l258iWuUNOZLiDmCmvDi1bicbgAP1gfDBwBofq', '091131313', 'admin'),
(5, 'Muntinlupa City', '2024-08-21 14:17:14.000000', 'harold123@gmail.com', 'Harold', 'Tagapan', '$2a$10$ePfxr5dNz8zvhj.Rhd./cu2Nb9fxH.rOi1xXfQPml8M4f1dtFUvFS', '09092012', 'admin'),
(6, 'Muntinlupa City', '2024-08-21 14:22:19.000000', 'client123@gmail.com', 'Harold ', 'Tagapan', '$2a$10$vvpSodbR8T1hOBAcnLFK7OoeLO3OgplkV9QHO8FmMdhlX5JUQt.vG', '0918728718', 'client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
