-- skoocafesystem/home tables and structure
-- To be imported on xampp

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `skoocafesystem/home`

-- Table structure for table `categories`

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserting data for table `categories`

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, 'BREAKFAST', 'Start your day with warm and healthy made breakfast, it\'s softer and fresher', '2022-08-03 00:00:00'),
(2, 'SNACKS', 'Boost your energy levels from the skoocafesystem/home\'s Snack Bar.', '2022-08-03 00:00:02'),
(3, 'MAIN COURSE', 'Indulge into mouth-watering fine meals to your full', '2022-08-03 00:00:03'),
(4, 'SIDES ORDERS', 'Complement your Main with wide range of sides', '2022-08-03 00:00:04'),
(5, 'DRINKS', 'Complement your dish with wide range of beverages available ', '2022-08-03 00:00:05');

-- Table structure for table `contact`

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If the issue is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `contactreply`

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `deliverydetails`

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `orderitems`

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `menuid` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `orders`

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `building` varchar(255) NOT NULL,
  `floor` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=Mpesa ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `menu`

CREATE TABLE `menu` (
  `menuId` int(12) NOT NULL,
  `menuName` varchar(255) NOT NULL,
  `menuPrice` int(12) NOT NULL,
  `menuDesc` text NOT NULL,
  `menuCategorieId` int(12) NOT NULL,
  `menuPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserting data for table `menu`

INSERT INTO `menu` (`menuId`, `menuName`, `menuPrice`, `menuDesc`, `menuCategorieId`, `menuPubDate`) VALUES
(1, 'AFRICAN TEA', 100, 'A hugely popular cup of tea\r\n\r\n', 1, '2022-08-03 00:00:06'),
(2, 'MILK COFFEE', 100, 'The ever popular white coffee', 1, '2022-08-03 00:00:07'),
(3, 'BAKED BEANS', 150, 'Beans that goes ballistic at dawn!\r\n\r\n', 1, '2022-08-03 00:00:08'),
(4, 'POACHED EGGS', 50, 'Quite a delicious mouthful!\r\n\r\n', 1, '2022-08-03 00:00:09'),
(5, 'TOASTED BUNS',50 , 'Crunchy pan-burnt with roast taste.\r\n\r\n', 1, '2022-08-03 00:00:10'),
(6, 'RICE\r\n', 200, 'Looking for a BIG treat that goes easy on the spices, this one\'s got it all..\r\n\r\n', 3, '2022-08-03 00:00:11'),
(7, 'FRIES\r\n', 150, 'This decidedly staggers under an overload of bacon and sauces.\r\n\r\n', 3, '2022-08-03 00:00:12'),
(8, 'PASTA\r\n', 200, 'Every day is pasta day!', 3, '2022-08-03 00:00:13'),
(9, 'CHICKEN\r\n', 400, 'A good piece of chicken can make anybody believe in the existence of God.', 3, '2022-08-03 00:00:14'),
(10, 'FISH\r\n', 350, 'Fish can become an inexhaustible source of perpetual delight\r\n\r\n', 3, '2022-08-03 00:00:15'),
(11, 'POTATO CRISPS', 100, 'Chips with every damn thing.', 2, '2022-08-03 00:00:16'),
(12, 'CARAMEL POPCORN', 150, 'Have you ever pondered the miracle of popcorn?\r\n\r\n', 2, '2022-08-03 00:00:17'),
(13, 'FRIED CORN DOG', 180, ' That is all you ever wanted', 2, '2022-08-03 00:00:18'),
(14, 'CHEESY HOTDOG', 200, 'Hotdog you Cheese**', 2, '2022-08-03 00:00:19'),
(15, 'CHOCOLATE COOKIES', 75, 'Mmm! Keep a Cookie in Your Purse!\r\n\r\n', 2, '2022-08-03 00:00:20'),
(16, 'CHILLI SAUCE\r\n', 50, 'More Than Just A Hot Sauce.\r\n\r\n', 4, '2022-08-03 00:00:21'),
(17, 'COLESLAW', 100, 'Green cabbage with fennel and green apple and a light dressing of mayonnaise', 4, '2022-08-03 00:00:22'),
(18, 'GARLIC BREAD\r\n', 120, ' Garlic bread is the future , have you tasted it?', 4, '2022-08-03 00:00:23'),
(19, 'RANCH SALAD', 150, 'Ranch dressing is the future', 4, '2022-08-03 00:00:24'),
(20, 'CREAMY KALES', 80, 'Do not kale your vibe', 4, '2022-08-03 00:00:25'),
(21, 'DIET SODA', 100, 'It is simple to drink sodas', 5, '2022-08-03 00:00:26'),
(22, 'YOGHURT', 130, 'You have a yogurt to finish today!', 5, '2022-08-03 00:00:2'),
(23, 'SLUSHIES', 170, 'You are as pure as the driven slush.', 5, '2022-08-03 00:00:28'),
(24, 'SMOOTHES', 150, 'You cannot buy happiness, but you can buy smoothies.', 5, '2022-08-03 00:00:29'),
(25, 'COCKTAIL', 250, 'Drink happy thoughts.', 5, '2022-08-03 00:00:30');

-- Table structure for table `sitedetail`

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `sitedetail`

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'skoocafesystem/home', 'lkamau7@usiu.ac.ke', +254702723255, +254772304801, '7490 - 01000 THIKA Ave.<br> Thika Greens', '2022-08-03 00:00:40');

-- Table structure for table `users`

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserting data for table `users`

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', +254678901234, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2022-08-03 00:00:35');

-- Table structure for table `viewcart`

CREATE TABLE `viewcart` (
  `cartmenuid` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Indexes for inserted tables

-- Indexes for table `categories`

ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

-- Indexes for table `contact`

ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

-- Indexes for table `contactreply`

ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

-- Indexes for table `deliverydetails`

ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

-- Indexes for table `orderitems`

ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

-- Indexes for table `orders`

ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

-- Indexes for table `menu`

ALTER TABLE `menu`
  ADD PRIMARY KEY (`menuId`);
ALTER TABLE `menu` ADD FULLTEXT KEY `menuName` (`menuName`,`menuDesc`);

-- Indexes for table `sitedetail`

ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

-- Indexes for table `users`

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

-- Indexes for table `viewcart`

ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartmenuid`);

-- AUTO_INCREMENT for inserted tables

-- AUTO_INCREMENT for table `categories`

ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

-- AUTO_INCREMENT for table `contact`
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `contactreply`

ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `deliverydetails`

ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `orderitems`

ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `orders`

ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `menu`

ALTER TABLE `menu`
  MODIFY `menuId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

-- AUTO_INCREMENT for table `sitedetail`

ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- AUTO_INCREMENT for table `users`

ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- AUTO_INCREMENT for table `viewcart`

ALTER TABLE `viewcart`
  MODIFY `cartmenuid` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;