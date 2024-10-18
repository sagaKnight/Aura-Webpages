-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2024 at 05:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auraproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `auracollections`
--

CREATE TABLE `auracollections` (
  `collectionName` varchar(50) NOT NULL,
  `headerImage` varchar(255) DEFAULT NULL,
  `collectionHeading` varchar(255) DEFAULT NULL,
  `collectionDesc` text DEFAULT NULL,
  `availableBtn` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auracollections`
--

INSERT INTO `auracollections` (`collectionName`, `headerImage`, `collectionHeading`, `collectionDesc`, `availableBtn`, `created_at`, `thumbnail`) VALUES
('adriane', 'header-image.jpg', 'The Adriane Collection', 'Adriane Collection embodies contemporary streetwear, merging minimalist style with luxury craftsmanship. It offers a curated selection of timeless pieces crafted from premium materials for unparalleled comfort and durability. With clean lines and neutral tones, the collection exudes understated sophistication, perfect for elevating any wardrobe with its versatile and refined appeal.', 'Not Available', '2024-10-13 22:18:04', 'adriane-collection.jpg'),
('kelly', 'header-image.jpg', 'The Kelly Collection', 'The Kelly Collection exudes an air of relaxed sophistication and effortless allure, presenting a curated selection of leisurewear essentials and laid-back accessories. Designed for comfort and style, each piece evokes a serene ambiance, seamlessly blending tranquil whites with hints of golden warmth.', 'Available', '2024-10-13 22:18:04', 'kelly-collection.jpg'),
('sora', 'header-image.jpg', 'The Sora Collection', 'The Sora Collection celebrates individuality and rebellion with bold colors, eclectic patterns, and distressed textures. Each piece features oversized fits, rugged fabrics, and eye-catching graphics, perfect for those who dare to stand out. Embrace chaos and unrestrained expression with the Sora Collection.', 'Available', '2024-10-13 22:18:04', 'sora-collection.jpg'),
('stow', 'header-image.jpg', 'The Stow Collection', 'The Stow Collection draws inspiration from the rich heritage of Japanese art, seamlessly blending traditional motifs with contemporary streetwear aesthetics. Each piece in the collection embodies a harmonious fusion of elegance and urban edge, paying homage to the intricate craftsmanship and timeless beauty of Japanese artistry.', 'Not Available', '2024-10-13 22:18:04', 'stow-collection.jpg'),
('von', 'header-image.jpg', 'The Von Collection', 'The Von Collection infuses Japanese-inspired improvisation with tradition and innovation, marrying refined suiting with artful deconstruction to create a uniquely sophisticated style that blurs the lines between tradition and modernity.', 'Available', '2024-10-13 22:18:04', 'von-collection.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `auraitems`
--

CREATE TABLE `auraitems` (
  `itemId` int(11) NOT NULL,
  `itemImage` varchar(255) DEFAULT NULL,
  `itemName` varchar(255) DEFAULT NULL,
  `itemPrice` decimal(10,2) DEFAULT NULL,
  `itemDescription` text DEFAULT NULL,
  `collectionName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auraitems`
--

INSERT INTO `auraitems` (`itemId`, `itemImage`, `itemName`, `itemPrice`, `itemDescription`, `collectionName`) VALUES
(21, 'item1.jpg', 'Adriane T-Shirt', 362.00, 'Experience luxury in the Adriane T-Shirt, crafted from the finest materials. This T-shirt blends minimalist design with premium comfort, perfect for a refined yet casual look.', 'adriane'),
(22, 'item2.jpg', 'Adriane Hoodie', 325.00, 'The Adriane Hoodie offers unparalleled warmth and style. Its minimalist aesthetic and luxurious craftsmanship make it a versatile addition to any wardrobe.', 'adriane'),
(23, 'item3.jpg', 'Adriane Joggers', 300.00, 'Step into comfort with the Adriane Joggers. These premium joggers are designed for both style and durability, featuring clean lines and a sophisticated fit.', 'adriane'),
(24, 'item4.jpg', 'Adriane Polo', 337.00, 'The Adriane Polo exudes understated elegance. Made from high-quality materials, it’s perfect for elevating casual wear with a touch of luxury.', 'adriane'),
(25, 'item1.jpg', 'Sora Psycho Shirt', 387.00, 'Make a statement with the Sora Psycho Shirt. Bold colors and eclectic patterns define this piece, perfect for those who embrace individuality.', 'sora'),
(26, 'item2.jpg', 'Sora My Muse Shirt', 262.00, 'The Sora My Muse Shirt combines rugged fabrics with oversized fits, creating a unique piece that stands out in any crowd.', 'sora'),
(27, 'item3.jpg', 'Sora Hello Pam Sweatshirt', 487.00, 'Embrace unrestrained expression with the Sora Hello Pam Sweatshirt. Distressed textures and eye-catching graphics make this sweatshirt a bold fashion choice.', 'sora'),
(28, 'item4.jpg', 'Sora Caramel Chow Pants', 500.00, 'The Sora Caramel Chow Pants feature rugged fabrics and eclectic patterns. These pants are designed for those who dare to stand out with their bold style.', 'sora'),
(29, 'item1.jpg', 'Stow Haunted Shorts', 275.00, 'The Stow Haunted Shorts blend traditional Japanese motifs with modern streetwear aesthetics, creating a harmonious fusion of elegance and urban edge.', 'stow'),
(30, 'item2.jpg', 'Stow White Base Shorts', 462.00, 'These shorts feature intricate craftsmanship inspired by Japanese art, offering a contemporary yet timeless piece for your wardrobe.', 'stow'),
(31, 'item3.jpg', 'Stow Teddy Shirt', 487.00, 'The Stow Teddy Shirt embodies the rich heritage of Japanese artistry, with traditional motifs seamlessly integrated into a modern streetwear design.', 'stow'),
(32, 'item4.jpg', 'Stow Gray Rayon Shirt', 475.00, 'This shirt is a perfect blend of elegance and urban edge, paying homage to the intricate craftsmanship and timeless beauty of Japanese artistry.', 'stow'),
(33, 'item1.jpg', 'Von Zipup Jacket', 300.00, 'The Von Zipup Jacket marries refined suiting with artful deconstruction, creating a sophisticated style that blurs the lines between tradition and modernity.', 'von'),
(34, 'item2.jpg', 'Von Bondage Pants', 250.00, 'These pants feature Japanese-inspired improvisation with traditional motifs, offering a unique and sophisticated style.', 'von'),
(35, 'item3.jpg', 'Von Classic Overcoat', 425.00, 'The Von Classic Overcoat combines innovation with tradition, providing a refined yet contemporary piece perfect for any sophisticated wardrobe.', 'von'),
(36, 'item4.jpg', 'Von Classic Short Jacket', 487.00, 'This jacket is a blend of tradition and modernity, featuring refined suiting with an artful twist, perfect for a uniquely sophisticated style.', 'von'),
(37, 'item1.jpg', 'Kelly Resort Shirt', 375.00, 'The Kelly Resort Shirt exudes relaxed sophistication, crafted for comfort and style. Its serene design blends tranquil whites with hints of golden warmth.', 'kelly'),
(38, 'item2.jpg', 'Kelly Silk Blouse', 312.00, 'This blouse offers an effortless allure, with luxurious silk and a relaxed fit, perfect for a laid-back yet elegant look.', 'kelly'),
(39, 'item3.jpg', 'Kelly Cream Jacket', 500.00, 'The Kelly Cream Jacket combines practicality with style, featuring a strong ambiance that complements any ensemble.', 'kelly'),
(40, 'item4.jpg', 'Kelly Mesh Baseball Jersey', 450.00, 'This jersey blends comfort with sophisticated design, offering a relaxed yet stylish piece that embodies the essence of the Kelly Collection.', 'kelly');

-- --------------------------------------------------------

--
-- Table structure for table `auraorders`
--

CREATE TABLE `auraorders` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fName` varchar(100) DEFAULT NULL,
  `lName` varchar(100) DEFAULT NULL,
  `pNumber` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `aptNumber` varchar(20) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `gift` varchar(255) DEFAULT NULL,
  `productNames` text DEFAULT NULL,
  `amountPaid` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auraorders`
--

INSERT INTO `auraorders` (`id`, `email`, `fName`, `lName`, `pNumber`, `address`, `aptNumber`, `city`, `state`, `country`, `zip`, `gift`, `productNames`, `amountPaid`) VALUES
(10, 'john.doe@example.com', 'John', 'Doe', '123-456-7890', '123 Elm St', 'Apt 1A', 'Springfield', 'IL', 'USA', '62701', '0', '[{\"itemName\": \"Widget A\", \"selectedSize\": \"M\"}, {\"itemName\": \"Widget B\", \"selectedSize\": \"L\"}]', 29.99),
(11, 'jane.smith@example.com', 'Jane', 'Smith', '987-654-3210', '456 Oak St', NULL, 'Springfield', 'IL', 'USA', '62702', '1', '[{\"itemName\": \"Gadget C\", \"selectedSize\": \"S\"}, {\"itemName\": \"Gadget D\", \"selectedSize\": \"XL\"}]', 49.50),
(12, 'alice.johnson@example.com', 'Alice', 'Johnson', '555-555-5555', '789 Pine St', 'Apt 2B', 'Springfield', 'IL', 'USA', '62703', '0', '[{\"itemName\": \"Thingamajig E\", \"selectedSize\": \"L\"}]', 15.00),
(13, 'bob.brown@example.com', 'Bob', 'Brown', '111-222-3333', '321 Maple Ave', NULL, 'Springfield', 'IL', 'USA', '62704', '1', '[{\"itemName\": \"Doohickey F\", \"selectedSize\": \"M\"}, {\"itemName\": \"Doohickey G\", \"selectedSize\": \"M\"}]', 75.00),
(14, 'charlie.davis@example.com', 'Charlie', 'Davis', '444-555-6666', '654 Cedar Blvd', NULL, 'Springfield', 'IL', 'USA', '62705', '0', '[{\"itemName\": \"Gizmo H\", \"selectedSize\": \"XL\"}]', 99.99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auracollections`
--
ALTER TABLE `auracollections`
  ADD PRIMARY KEY (`collectionName`);

--
-- Indexes for table `auraitems`
--
ALTER TABLE `auraitems`
  ADD PRIMARY KEY (`itemId`),
  ADD KEY `collectionName` (`collectionName`);

--
-- Indexes for table `auraorders`
--
ALTER TABLE `auraorders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auraitems`
--
ALTER TABLE `auraitems`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auraorders`
--
ALTER TABLE `auraorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auraitems`
--
ALTER TABLE `auraitems`
  ADD CONSTRAINT `auraitems_ibfk_1` FOREIGN KEY (`collectionName`) REFERENCES `auracollections` (`collectionName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
