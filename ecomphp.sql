-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2023 at 09:05 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `name`) VALUES
(1, 'Mobile'),
(2, 'Laptop'),
(5, 'Jewellry'),
(7, 'Furniture'),
(25, 'moter bike'),
(28, 'Fan');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `user_phone` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `subtotal` double(8,2) NOT NULL,
  `delivery_charge` double(8,2) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `zipcode` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `first_name`, `last_name`, `user_phone`, `user_email`, `address`, `subtotal`, `delivery_charge`, `total_price`, `created_at`, `zipcode`, `city`, `country`, `state`) VALUES
(1, 52, 'ahmad', 'ubaid', '03400427832', 'ahmadubaid089@gmail.com', 'westride 3 rawalpindi', 420.00, 100.00, 520.00, '2023-05-03', '4402', 'rawapindi', 'pakistan', 'punjab'),
(2, 52, 'Azmat', 'Ullah', '03400427832', 'ahmadubaid089@gmail.com', 'westride 3 rawalpindi', 822.00, 100.00, 922.00, '2023-05-05', '4402', 'rawapindi', 'pakistan', 'punjab'),
(3, 53, 'Ali', 'ahmad', '0317978237', 'azlaq@gmail.com', 'westride 3 rawalpindi', 561.00, 100.00, 661.00, '2023-05-05', '235', 'rawapindi', 'pakistan', 'punjab');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_subtotal` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_name`, `unit_price`, `quantity`, `product_subtotal`) VALUES
(1, 1, 'Silver Necklace', 40.00, 3, '120.00'),
(2, 1, 'samsung', 150.00, 2, '300.00'),
(3, 2, 'hp', 137.00, 4, '548.00'),
(4, 2, 'asus', 154.00, 1, '154.00'),
(5, 2, 'Silver Necklace', 40.00, 3, '120.00'),
(6, 3, 'samsung', 150.00, 1, '150.00'),
(7, 3, 'hp', 137.00, 3, '411.00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `sale_price` double(8,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(255) NOT NULL,
  `thumbnail_image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `sale_price`, `category_id`, `status`, `thumbnail_image`) VALUES
(41, 'Silver Necklace', 40.00, 5, 3, '1682865485.jpeg'),
(42, 'samsung', 150.00, 1, 15, '1682863169.jpeg'),
(46, 'hp', 137.00, 2, 12, '1682864481.jpeg'),
(47, 'asus', 154.00, 2, 40, '1682864722.jpeg'),
(48, 'Dell', 126.00, 2, 31, '1682865068.jpeg'),
(64, 'table', 400.00, 1, 4, '1683121531.jpeg'),
(65, 'Celing fan', 30.00, 28, 120, '1683302480.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `thumbnail_image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `thumbnail_image`) VALUES
(0, 20, '1682571716.png', ''),
(0, 21, '1682572043.png', ''),
(0, 22, '1682572120.png', ''),
(0, 23, '1682581178.jpeg', ''),
(0, 24, '1682581241.jpeg', ''),
(0, 25, '1682593268.jpeg', ''),
(0, 26, '1682599198.jpeg', ''),
(0, 27, '1682599932.jpeg', ''),
(0, 28, '1682600225.jpeg', ''),
(0, 29, '1682600574.png', ''),
(0, 30, '1682609616.png', ''),
(0, 31, '1682654413.jpeg', ''),
(0, 32, '1682656184.jpeg', ''),
(0, 33, '1682656286.jpeg', ''),
(0, 34, '1682656374.jpeg', ''),
(0, 35, '1682660017.png', ''),
(0, 36, '1682660124.png', ''),
(0, 37, '1682660515.jpeg', ''),
(0, 38, '1682660910.jpeg', ''),
(0, 41, '1682676202.jpeg', ''),
(0, 42, '1682772704.jpeg', ''),
(0, 0, '1682814777.jpg', ''),
(0, 0, '1682814899.jpg', ''),
(0, 0, '1682814959.jpg', ''),
(0, 0, '1682814989.jpg', ''),
(0, 43, '1682863294.jpeg', ''),
(0, 44, '1682863557.jpeg', ''),
(0, 45, '1682863822.jpeg', ''),
(0, 46, '1682864481.jpeg', ''),
(0, 47, '1682864722.jpeg', ''),
(0, 48, '1682865068.jpeg', ''),
(0, 49, '1682866461.jpeg', ''),
(0, 50, '1682866701.jpeg', ''),
(0, 51, '1682866818.jpeg', ''),
(0, 52, '1682866937.png', ''),
(0, 62, '1683113226.jpeg', ''),
(0, 64, '1683121531.jpeg', ''),
(0, 65, '1683302480.jpeg', '');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(100) NOT NULL,
  `meta_value` varchar(100) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `meta_key`, `meta_value`, `remarks`, `created_at`, `updated_at`) VALUES
(8, 'Delivery Charge', '100', 'null', '2020-07-21 06:53:07', '2020-07-21 15:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(500) NOT NULL,
  `email` varchar(255) NOT NULL,
  `User_Role` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `User_Role`, `password`) VALUES
(52, 'Ahmad Ubaid ', '03400427832', 'ahmadubaid089@gmail.com', 'admin', 'xyz777'),
(53, 'Azmat Ullah', '0317978237', 'azlaq@gmail.com', 'costumer', 'abc777');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
