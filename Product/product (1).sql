-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 06:40 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Prod_ID` int(11) NOT NULL,
  `Product_Code` varchar(10) NOT NULL,
  `Prod_Name` varchar(100) NOT NULL,
  `Contributors` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Price` double(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Prod_ID`, `Product_Code`, `Prod_Name`, `Contributors`, `Email`, `Price`) VALUES
(6, 'PR007', 'LightPen', 'Sharmilan', 's@gmail.com', 1200.00),
(7, 'p1', 'handbag', 'malan', 'kathir@gmail', 1200.00),
(8, 'p1', 'handbag', 'malan', 'kathir@gmail', 1200.00),
(10, 'P001', 'Dress', 'nilu', 'mu@gmail.com', 5000.00),
(12, 'h1', 'pen', 'Nilaa', 'nilu26@gmailcom', 60000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Prod_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Prod_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
