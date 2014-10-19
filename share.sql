-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 19, 2014 at 01:52 PM
-- Server version: 5.5.39
-- PHP Version: 5.5.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `share`
--
CREATE DATABASE IF NOT EXISTS `share` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `share`;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
CREATE TABLE IF NOT EXISTS `friends` (
  `user` varchar(16) DEFAULT NULL,
  `friend` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `user` varchar(16) DEFAULT NULL,
  `pass` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`user`, `pass`) VALUES
('TestUser', '123');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
`id` int(10) unsigned NOT NULL,
  `auth` varchar(16) DEFAULT NULL,
  `recip` varchar(16) DEFAULT NULL,
  `pm` char(1) DEFAULT NULL,
  `time` int(10) unsigned DEFAULT NULL,
  `message` varchar(4096) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE IF NOT EXISTS `picture` (
`picid` int(10) unsigned NOT NULL,
  `user` varchar(16) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `picture`
--

INSERT INTO `picture` (`picid`, `user`, `pic`) VALUES
(1, 'TestUser', 'http://localhost:80/share/images/1413740802.1.jpg'),
(2, 'TestUser', 'http://localhost:80/share/images/1413740855.2.jpg'),
(3, 'TestUser', 'http://localhost:80/share/images/1413740861.3.jpg'),
(4, 'TestUser', 'http://localhost:80/share/images/1413740864.4.jpg'),
(5, 'TestUser', 'http://localhost:80/share/images/1413740868.5.jpg'),
(6, 'TestUser', 'http://localhost:80/share/images/1413740872.6.jpg'),
(7, 'TestUser', 'http://localhost:80/share/images/1413740874.7.jpg'),
(8, 'TestUser', 'http://localhost:80/share/images/1413740877.8.jpg'),
(9, 'TestUser', 'http://localhost:80/share/images/1413740882.9.jpg'),
(10, 'TestUser', 'http://localhost:80/share/images/1413740885.10.jpg'),
(11, 'TestUser', 'http://localhost:80/share/images/1413740890.11.jpg'),
(12, 'TestUser', 'http://localhost:80/share/images/1413740895.12.jpg'),
(13, 'TestUser', 'http://localhost:80/share/images/1413740898.13.jpg'),
(14, 'TestUser', 'http://localhost:80/share/images/1413740900.14.jpg'),
(15, 'TestUser', 'http://localhost:80/share/images/1413740905.15.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `picturebig`
--

DROP TABLE IF EXISTS `picturebig`;
CREATE TABLE IF NOT EXISTS `picturebig` (
`picid` int(10) unsigned NOT NULL,
  `user` varchar(16) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `picturebig`
--

INSERT INTO `picturebig` (`picid`, `user`, `pic`) VALUES
(1, 'TestUser', 'http://localhost:80/share/images/1413740802big.1.jpg'),
(2, 'TestUser', 'http://localhost:80/share/images/1413740855big.2.jpg'),
(3, 'TestUser', 'http://localhost:80/share/images/1413740861big.3.jpg'),
(4, 'TestUser', 'http://localhost:80/share/images/1413740864big.4.jpg'),
(5, 'TestUser', 'http://localhost:80/share/images/1413740868big.5.jpg'),
(6, 'TestUser', 'http://localhost:80/share/images/1413740872big.6.jpg'),
(7, 'TestUser', 'http://localhost:80/share/images/1413740874big.7.jpg'),
(8, 'TestUser', 'http://localhost:80/share/images/1413740877big.8.jpg'),
(9, 'TestUser', 'http://localhost:80/share/images/1413740882big.9.jpg'),
(10, 'TestUser', 'http://localhost:80/share/images/1413740885big.10.jpg'),
(11, 'TestUser', 'http://localhost:80/share/images/1413740890big.11.jpg'),
(12, 'TestUser', 'http://localhost:80/share/images/1413740895big.12.jpg'),
(13, 'TestUser', 'http://localhost:80/share/images/1413740898big.13.jpg'),
(14, 'TestUser', 'http://localhost:80/share/images/1413740900big.14.jpg'),
(15, 'TestUser', 'http://localhost:80/share/images/1413740905big.15.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `user` varchar(16) DEFAULT NULL,
  `text` varchar(4096) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
 ADD KEY `user` (`user`(6)), ADD KEY `friend` (`friend`(6));

--
-- Indexes for table `members`
--
ALTER TABLE `members`
 ADD KEY `user` (`user`(6));

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`id`), ADD KEY `auth` (`auth`(6)), ADD KEY `recip` (`recip`(6));

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
 ADD PRIMARY KEY (`picid`);

--
-- Indexes for table `picturebig`
--
ALTER TABLE `picturebig`
 ADD PRIMARY KEY (`picid`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
 ADD KEY `user` (`user`(6));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
MODIFY `picid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `picturebig`
--
ALTER TABLE `picturebig`
MODIFY `picid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
