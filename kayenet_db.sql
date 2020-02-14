-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 14, 2019 at 10:44 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kayenet_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `adminID` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`adminID`, `username`, `password`) VALUES
(2, 'Administrator', '?Ü›ÛRÐMÂ\06ÛØ1>ÐU');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `bagID` varchar(6) NOT NULL,
  `name` varchar(15) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(20) NOT NULL,
  `price` int(15) NOT NULL,
  `qtty_sold` int(15) NOT NULL,
  `qtty_available` int(15) NOT NULL,
  PRIMARY KEY (`bagID`),
  UNIQUE KEY `bagID` (`bagID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`bagID`, `name`, `description`, `image`, `price`, `qtty_sold`, `qtty_available`) VALUES
('NAK-00', 'LUOIS VUITTON', 'This is an expensive bag, great, classy and stylish.', '5.jpg', 1000000, 50, 200);

-- --------------------------------------------------------

--
-- Table structure for table `sales_person`
--

DROP TABLE IF EXISTS `sales_person`;
CREATE TABLE IF NOT EXISTS `sales_person` (
  `ref_name` varchar(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(40) NOT NULL,
  `shopID` varchar(6) NOT NULL,
  PRIMARY KEY (`ref_name`),
  UNIQUE KEY `ref_name` (`ref_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_person`
--

INSERT INTO `sales_person` (`ref_name`, `fname`, `lname`, `username`, `phone_no`, `password`, `address`, `shopID`) VALUES
('L.K', 'Louis', 'Kasiyegwanga', 'Louis K', '07782127710', '12345', 'Kampala,Uganda', 'NAK-00');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
CREATE TABLE IF NOT EXISTS `shop` (
  `shopRef` varchar(3) NOT NULL,
  `bagID` varchar(6) NOT NULL,
  `sales` int(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
