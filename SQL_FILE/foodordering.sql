-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2022 at 11:29 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `food_ordering`
--

CREATE DATABASE IF NOT EXISTS `food_ordering`;
USE `food_ordering`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--
-- admin : reB50o3njK0'

INSERT INTO `admins` (`adminname`, `email`, `mypassword`) VALUES
('admin', 'admin@gmail.com', '$2y$10$1fKU73XS1pq9lbfFx6ivjOGNJPVVVmYRcsmr.X9jfuaCLqkCtiQfq');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pro_id` int(3) NOT NULL,
  `pro_title` varchar(200) NOT NULL,
  `pro_image` varchar(200) NOT NULL,
  `pro_price` int(10) NOT NULL,
  `pro_qty` int(10) NOT NULL,
  `pro_subtotal` int(10) NOT NULL,
  `user_id` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`name`, `image`, `icon`, `description`) VALUES
('FRUITS', 'img_fruit.jpg', 'bistro-apple', 'Edible plant parts, such as roots, leaves, stems, and flowers, rich in vitamins, minerals, and fiber. Examples: carrots, spinach, potatoes.'),
('VEGETABLES', 'img_vegetable.jpg', 'bistro-carrot', 'Edible animal flesh, high in protein and nutrients. Common types: beef, chicken, pork, lamb.'),
('MEATS', 'img_meat.png', 'bistro-roast-leg', 'Aquatic animals consumed for protein and omega-3s. Examples: salmon, tuna, cod.'),
('FISHES', 'img_fish.jpg', 'bistro-fish-1', 'Sweet or sour plant parts, often eaten raw, packed with vitamins, minerals, and fiber. Examples: apples, bananas, berries.');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `zip_code` int(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` int(20) NOT NULL,
  `order_notes` text NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'sent to admins',
  `price` int(20) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(10) NOT NULL,
  `quantity` int(3) NOT NULL DEFAULT 1,
  `image` varchar(200) NOT NULL,
  `exp_date` varchar(200) NOT NULL,
  `category_id` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`title`, `description`, `price`, `quantity`, `image`, `exp_date`, `category_id`, `status`) VALUES
('Banana', 'A soft, sweet fruit with a yellow peel when ripe. Bananas are rich in potassium and often eaten as a snack or used in smoothies and desserts.', '1.5', 1, 'img_banana.jpg', '2025', 1, 1),
('Watermelon', 'A large, juicy fruit with a thick green rind and sweet red or yellow flesh. Watermelons are refreshing and high in water content, perfect for hot weather.', '2', 1, 'img_watermelon.jpg', '2025', 1, 1),
('Tomato', 'A round, usually red fruit that’s often treated like a vegetable in cooking. Tomatoes are juicy and tangy, used in salads, sauces, and countless dishes.', '2.5', 1, 'img_tomato.jpg', '2025', 2, 1),
('Carrot', 'A crunchy, sweet root vegetable that is typically orange. Carrots are rich in beta-carotene (vitamin A) and often eaten raw, cooked, or juiced.', '5', 1, 'img_carrot.jpg', '2025', 2, 1),
('Beef Steak', 'A thick cut of beef, usually grilled, pan-fried, or broiled. It’s juicy and rich in flavor, popular for its tenderness and protein content.', '25', 1, 'img_beef_steak.jpeg', '2025', 3, 1),
('Pork Steak', 'A flavorful cut of pork, often marbled with fat, making it juicy when cooked. It can be grilled, pan-seared, or baked.', '15', 1, 'img_pork_steak.jpg', '2025', 3, 1),
('Salmon', 'A popular pink-fleshed fish known for its rich, buttery flavor. Salmon is high in omega-3 fatty acids and can be grilled, baked, or eaten raw in sushi.', '50', 1, 'img_salmon.jpg', '2025', 4, 1),
('Tuna', 'A firm, meaty fish with a mild flavor. Tuna is often served raw as sashimi, canned for easy meals, or grilled as steaks.', '150', 1, 'img_tuna.jpg', '2025', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--
-- pw : 123456

INSERT INTO `users` (`fullname`, `email`, `username`, `mypassword`, `image`, `address`, `city`, `country`, `zip_code`, `phone_number`) VALUES
('John Wick', 'johnwick@gmail.com', 'Mr. Wick', '$2y$10$PFr3Y35xz7ZQnWDxfLjoveT89D2eIcLrpliaOMbJIvaJ0UFeKqrhi', 'user.png', 'Russian Federation Blvd (110), Phnom Penh 120404', 'Phnom Penh', 'Cambodia', '120000', '012345678');

COMMIT;