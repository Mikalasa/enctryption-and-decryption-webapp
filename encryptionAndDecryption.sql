-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 19, 2024 at 08:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `encryptionAndDecryption`
--

-- --------------------------------------------------------

--
-- Table structure for table `aes`
--

CREATE TABLE `aes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `aes_encrypt_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aes`
--

INSERT INTO `aes` (`id`, `user_id`, `aes_encrypt_text`) VALUES
(12, 7, 'U2FsdGVkX19nQFT33MFBneDA5q3yFJkAty43LnRm3FJwaJqsBMgcsw7c3uiQjJ+/N9zxu46wHzu+nBHStVJ5qa4KK1CzV1mJyGJ7wijEtuTbuM17+ETBn1YcJxBlQgNnJwstwwdk/fRXy1CJsuXixovNlLoShXVQocK2H2FiJfwyqpxOwu1LexUmVYoahq0UJ9I7jFoDfyPdd4kBGPxUdddwCAwMNEfC7b20xSeYyE661sIT80XD6uxUj2Yyvvrw0wXEfe58RXXvkW7XvrQR7kCPfe+VAgs0N2DTaMYQW7ztBxsLFSgGRjZJMFrypZj+zUR9GPcg1fvhuKay88wKj/QhiEX/WI7/lraTktrx7o+CIgZ/RDYlCqq3k8yG4yjlVZmA+QEK32AYP5aK0WIR/KzegXdXFStXQ3U6YNI0iHsv5Ie7f1m5SLdEA64jq4D3KSRxATIw4FwsKhcnHFQYR/5aQ0c1JAKxbuZhb6GG0asN8z050XNuCOzouyXTRxBW0VigGX+kol5Ttl2D/WeCIBI/AIyVjNxmOJvBpGzIr2JJRYQBvz87VG7GBnN2FRk2jvcusAh6itswOEv9v+X77mAwgMIWFILWv5LCECb7ie/Y2xBt2jSKNtv1798++fvpiYoP/wrhObdAx/DBR9tLSQ==');

-- --------------------------------------------------------

--
-- Table structure for table `caesar`
--

CREATE TABLE `caesar` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `caesar_content` text DEFAULT NULL,
  `step` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `caesar`
--

INSERT INTO `caesar` (`id`, `user_id`, `caesar_content`, `step`, `time`) VALUES
(40, 7, 'Hyhub qljkw lq pb guhdpv\nL vhh brx, L ihho brx\nWkdw lv krz L nqrz brx jr rq\nIdu dfurvv wkh glvwdqfh\nDqg vsdfhv ehwzhhq xv\nBrx kdyh frph wr vkrz brx jr rq\nQhdu, idu, zkhuhyhu brx duh\nL eholhyh wkdw wkh khduw grhv jr rq\nRqfh pruh, brx rshq wkh grru\nDqg brx\'uh khuh lq pb khduw\nDqg pb khduw zloo jr rq dqg rq\nOryh fdq wrxfk xv rqh wlph\nDqg odvw iru d olihwlph\nDqg qhyhu ohw jr \'wlo zh\'uh jrqh\nOryh zdv zkhq L oryhg brx\nRqh wuxh wlph L\'g krog wr\nLq pb olih, zh\'oo dozdbv jr rq', '3', '2024-02-19 07:31:11');

-- --------------------------------------------------------

--
-- Table structure for table `des`
--

CREATE TABLE `des` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `des_encrypt_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `des`
--

INSERT INTO `des` (`id`, `user_id`, `des_encrypt_text`) VALUES
(14, 7, 'U2FsdGVkX1+te1WDBs6w32auQ+F7AuJuBalSa6QLrXK20Xa4FQ0ZAZAMTb1z21jjv+CbC4WWJAnpv1Led62A0vKtLqm9bUbfo777m9zarZHufr1oY/6NWeh2Ww8cdNsnNwsG+JQmBQAn+lqtOhOaP/ZAHj9deS2RnPxfM5vIGdE0ZBNJ/SQWh7GJvon2dia57fPbjil2qwIZ33KUkZgwGHyr35MfruwLSiWnrKAF+egKwT9PYfDuML3m4bGNJg6n+tE/bHERrRQfySwXJ1lu+t9MW9+4yVKH4b+vm9EWepYr1fRoUfG72baWd39AfBZL1122bZr62bclH1YdnrhnV3r+yrg1kWIC+xugfTeTs7+ju2AMoHXjskHaCC+TmXBpmn+4mznTeSEH8ePRjMnHZ054jZ2PU3Dj9HxhsfnidJoeKr9TXXKiD9nFsHjA+F4NmDvMepfgw0vNIrurMm5wuAL44HtL6BWNodfQdejeIeYes/1H8JdLVlCy72zrzT+h0FliFSAEgYo0xdptGyn/WDvEAr8rwDgjO0BzXb6X1PXy7RkDqTIjfNrEgML+Y8JrpUGiXjLf7+lAYBIghjvM414buaUn4ltsMRi6euVbzEV6xt5VkQPzS8gJ7Dy8/zC1NMjAka1hdlmuXTQnNDvlpg==');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`) VALUES
(7, '123456', '$2b$10$bOPMjvt6W0mniLgf69sGhO7gbpsrUh0lnaW6/wBgDA7027NWzCrHG', 'De', 'mo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aes`
--
ALTER TABLE `aes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aes_user_id_fk` (`user_id`);

--
-- Indexes for table `caesar`
--
ALTER TABLE `caesar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caesar_user_id_fk` (`user_id`);

--
-- Indexes for table `des`
--
ALTER TABLE `des`
  ADD PRIMARY KEY (`id`),
  ADD KEY `des_user_id_fk` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aes`
--
ALTER TABLE `aes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `caesar`
--
ALTER TABLE `caesar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `des`
--
ALTER TABLE `des`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aes`
--
ALTER TABLE `aes`
  ADD CONSTRAINT `aes_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `caesar`
--
ALTER TABLE `caesar`
  ADD CONSTRAINT `caesar_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `des`
--
ALTER TABLE `des`
  ADD CONSTRAINT `des_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
