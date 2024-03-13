-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.28-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for personalfinancedb
CREATE DATABASE IF NOT EXISTS `personalfinancedb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `personalfinancedb`;

-- Dumping structure for table personalfinancedb.account
CREATE TABLE IF NOT EXISTS `account` (
  `accountId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `bankId` int(11) DEFAULT NULL,
  `accountName` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`accountId`),
  KEY `userId` (`userId`),
  KEY `bankId` (`bankId`),
  KEY `idx_userId` (`userId`),
  KEY `idx_bankId` (`bankId`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`bankId`) REFERENCES `bank` (`bankId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table personalfinancedb.account: ~10 rows (approximately)
INSERT INTO `account` (`accountId`, `userId`, `bankId`, `accountName`, `type`, `balance`) VALUES
	(1, 1, 1, 'Savings', 'Savings', 1000.00),
	(2, 1, 2, 'Checking', 'Checking', 500.00),
	(3, 2, 1, 'Personal Savings', 'Savings', 1500.00),
	(4, 2, 2, 'Business Checking', 'Checking', 2000.00),
	(5, 3, 1, 'Vacation Fund', 'Savings', 3000.00),
	(6, 3, 3, 'Investment', 'Investment', 50000.00),
	(7, 4, 2, 'Emergency Fund', 'Savings', 1000.00),
	(8, 4, 3, 'Credit Card', 'Credit Card', -500.00),
	(9, 5, 1, 'Holiday Expenses', 'Expense', -300.00),
	(10, 5, 3, 'Salary', 'Income', 2500.00);

-- Dumping structure for table personalfinancedb.bank
CREATE TABLE IF NOT EXISTS `bank` (
  `bankId` int(11) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bankId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table personalfinancedb.bank: ~11 rows (approximately)
INSERT INTO `bank` (`bankId`, `bankName`, `location`, `remark`, `currency`, `bank_name`) VALUES
	(1, 'DBS Bank', '6 Shenton Way, Singapore', 'Leading financial services group in Asia', 'SGD', NULL),
	(2, 'OCBC Bank', '65 Chulia Street, Singapore', 'One of the largest local banks in Singapore', 'SGD', NULL),
	(3, 'United Overseas Bank (UOB)', '80 Raffles Place, Singapore', 'Global bank with a strong presence in Southeast Asia', 'SGD', NULL),
	(4, 'Standard Chartered Bank', '8 Marina Boulevard, Singapore', 'International bank with a history in Singapore since 1859', 'SGD', NULL),
	(5, 'CitiBank', '23 Church Street, Singapore', 'Global bank with a significant presence in Singapore', 'SGD', NULL),
	(6, 'HSBC Bank', '21 Collyer Quay, Singapore', 'One of the world\'s largest banking and financial services organizations', 'SGD', NULL),
	(7, 'Maybank', '2 Battery Road, Singapore', 'Leading Malaysian bank with a strong presence in Singapore', 'SGD', NULL),
	(8, 'Bank of China', '4 Battery Road, Singapore', 'One of China\'s largest banks with a presence in Singapore', 'SGD', NULL),
	(9, 'RHB Bank', '90 Cecil Street, Singapore', 'Malaysian financial group with operations in Singapore', 'SGD', NULL),
	(10, 'Mizuho Bank', '30 Raffles Place, Singapore', 'Japanese bank with a branch in Singapore', 'SGD', NULL),
	(11, 'Tien Phong Bank', 'Hanoi, Vietnam', 'One of the leading banks in Vietnam with a strong focus on modern banking services and technology.', 'VND', NULL);

-- Dumping structure for table personalfinancedb.category
CREATE TABLE IF NOT EXISTS `category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table personalfinancedb.category: ~10 rows (approximately)
INSERT INTO `category` (`categoryId`, `categoryName`) VALUES
	(1, 'Groceries'),
	(2, 'Utilities'),
	(3, 'Entertainment'),
	(4, 'Healthcare'),
	(5, 'Travel'),
	(6, 'Clothing'),
	(7, 'Education'),
	(8, 'Home Maintenance'),
	(9, 'Gifts'),
	(10, 'Miscellaneous');

-- Dumping structure for table personalfinancedb.transaction
CREATE TABLE IF NOT EXISTS `transaction` (
  `transactionId` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`transactionId`),
  KEY `accountId` (`accountId`),
  KEY `idx_accountId` (`accountId`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table personalfinancedb.transaction: ~10 rows (approximately)
INSERT INTO `transaction` (`transactionId`, `accountId`, `date`, `description`, `amount`, `type`) VALUES
	(1, 1, '2024-03-11', 'Deposit', 200.00, 'Deposit'),
	(2, 2, '2024-03-10', 'Grocery shopping', 50.00, 'Expense'),
	(3, 3, '2024-03-09', 'Interest', 20.00, 'Income'),
	(4, 4, '2024-03-08', 'Credit Card Payment', -100.00, 'Expense'),
	(5, 5, '2024-03-07', 'Salary', 2500.00, 'Income'),
	(6, 6, '2024-03-06', 'Stock Investment', -2000.00, 'Expense'),
	(7, 7, '2024-03-05', 'Emergency Withdrawal', -200.00, 'Expense'),
	(8, 8, '2024-03-04', 'Holiday Gift Shopping', -50.00, 'Expense'),
	(9, 9, '2024-03-03', 'Utility Bill', -80.00, 'Expense'),
	(10, 10, '2024-03-02', 'Dinner Out', -30.00, 'Expense');

-- Dumping structure for table personalfinancedb.transaction_category
CREATE TABLE IF NOT EXISTS `transaction_category` (
  `transactionId` int(11) NOT NULL DEFAULT '0',
  `categoryId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transactionId`,`categoryId`),
  KEY `categoryId` (`categoryId`),
  KEY `idx_transactionId` (`transactionId`),
  KEY `idx_categoryId` (`categoryId`),
  CONSTRAINT `transaction_category_ibfk_1` FOREIGN KEY (`transactionId`) REFERENCES `transaction` (`transactionId`),
  CONSTRAINT `transaction_category_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table personalfinancedb.transaction_category: ~10 rows (approximately)
INSERT INTO `transaction_category` (`transactionId`, `categoryId`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10);

-- Dumping structure for table personalfinancedb.user
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `idx_username` (`username`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table personalfinancedb.user: ~10 rows (approximately)
INSERT INTO `user` (`userId`, `username`, `password`, `email`, `remark`) VALUES
	(1, 'viet', 'viet', 'vietmaihuy@gmail.com', 'Remark 1'),
	(2, 'user2', 'password2', 'user2@email.com', 'Remark 2'),
	(3, 'user3', 'password3', 'user3@email.com', 'Remark 3'),
	(4, 'user4', 'password4', 'user4@email.com', 'Remark 4'),
	(5, 'user5', 'password5', 'user5@email.com', 'Remark 5'),
	(6, 'user6', 'password6', 'user6@email.com', 'Remark 6'),
	(7, 'user7', 'password7', 'user7@email.com', 'Remark 7'),
	(8, 'user8', 'password8', 'user8@email.com', 'Remark 8'),
	(9, 'user9', 'password9', 'user9@email.com', 'Remark 9'),
	(10, 'user10', 'password10', 'user10@email.com', 'Remark 10');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
