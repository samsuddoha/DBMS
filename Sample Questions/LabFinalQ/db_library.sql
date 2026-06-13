-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2023 at 03:36 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `author_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `author_name`, `author_address`) VALUES
(1, 'Alexandar', 'UK'),
(2, 'PB Shelly', 'UK'),
(3, 'Neheru', 'India'),
(4, 'Nazrul ', 'Bangladesh'),
(5, 'Humayun Ahmed', 'Dhaka'),
(6, 'Zafar Iqbal', 'Dhaka'),
(7, 'Balagurusamy', 'Dhaka'),
(8, 'Herbert Schidlt', 'Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `bookingdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `availabledate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `book_id`, `borrower_id`, `bookingdate`, `availabledate`) VALUES
(1, 4, 2, '2019-11-11 21:11:45', '2019-11-30'),
(2, 4, 4, '2019-11-11 21:11:45', '2019-12-13');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `book_title` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `published_date` date NOT NULL,
  `no_of_copies` int(11) DEFAULT NULL,
  `book_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `book_title`, `author_id`, `publisher_id`, `published_date`, `no_of_copies`, `book_category`) VALUES
(1, 'Agnibina', 4, 1, '2020-08-17', 5, 1),
(2, 'FReedom of india', 3, 2, '2021-11-09', 4, 2),
(3, 'Himu', 5, 3, '2022-11-09', 10, 3),
(4, 'Fundamentals', 7, 2, '2020-11-01', 11, 4),
(5, 'Bear Story', 1, 2, '2019-11-02', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `borrower_id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`borrower_id`, `firstname`, `lastname`, `address`, `email`, `phone`, `department`) VALUES
(1, 'Kabir', 'Khan', 'barishal', 'kabir@gmail.com', '01899968590', 'CSE'),
(2, 'sabir', 'Ahmed', 'Dhaka', 'sabir@gmail.com', '01899969590', 'CSE'),
(3, 'abir', 'hossain', 'barishal', 'abir@gmail.com', '01839768590', 'Bangla'),
(4, 'Sadat', 'Ahmed', 'Dhaka', 'sadat@gmail.com', '01899969590', 'English'),
(5, 'Amant', 'Nayeb', 'Khulna', 'sadatt@gmail.com', '01837069590', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `borrow_book`
--

CREATE TABLE `borrow_book` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `borrowingdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `duedate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrow_book`
--

INSERT INTO `borrow_book` (`id`, `book_id`, `borrower_id`, `borrowingdate`, `duedate`) VALUES
(1, 1, 3, '2019-11-11 21:10:51', '2019-11-29'),
(2, 2, 5, '2019-11-11 21:10:51', '2019-11-20'),
(3, 5, 3, '2023-11-20 13:47:20', '2023-11-22'),
(4, 4, 3, '2023-11-20 13:47:20', '2023-11-29'),
(5, 2, 4, '2023-11-20 13:54:57', '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `description`) VALUES
(1, 'Academic', 'Educational academic book'),
(2, 'novel', 'novel'),
(3, 'fiction', 'fiction'),
(4, 'travel', 'travel');

-- --------------------------------------------------------

--
-- Table structure for table `fine`
--

CREATE TABLE `fine` (
  `fine_id` int(11) NOT NULL,
  `borrow_id` int(11) NOT NULL,
  `fine_amount` decimal(10,2) NOT NULL,
  `fine_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fine`
--

INSERT INTO `fine` (`fine_id`, `borrow_id`, `fine_amount`, `fine_date`) VALUES
(1, 2, '100.00', '2023-11-01'),
(2, 3, '300.00', '2023-11-03'),
(3, 1, '150.00', '2023-11-02'),
(4, 3, '500.00', '2023-11-08'),
(5, 4, '100.00', '2023-11-01'),
(6, 5, '100.00', '2023-11-02');

-- --------------------------------------------------------

--
-- Stand-in structure for view `fine_generate`
-- (See below for the actual view)
--
CREATE TABLE `fine_generate` (
`borrower_id` int(11)
,`firstname` varchar(255)
,`lastname` varchar(255)
,`address` varchar(255)
,`email` varchar(255)
,`phone` varchar(255)
,`department` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`, `address`) VALUES
(1, 'Binary Pub', 'Dhaka'),
(2, 'McGrawhill', 'Newyork'),
(3, 'Sobuj', 'Dhaka'),
(4, 'Panjeree', 'Dhaka'),
(5, 'Pearson', 'UK'),
(6, 'Wiley', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `return_book`
--

CREATE TABLE `return_book` (
  `return_id` int(11) NOT NULL,
  `borrow_id` int(11) NOT NULL,
  `return_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return_book`
--

INSERT INTO `return_book` (`return_id`, `borrow_id`, `return_date`) VALUES
(4, 2, '2023-11-08'),
(5, 3, '2023-11-20'),
(6, 3, '2023-11-08'),
(7, 4, '2023-11-30');

-- --------------------------------------------------------

--
-- Structure for view `fine_generate`
--
DROP TABLE IF EXISTS `fine_generate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fine_generate`  AS  select `borrowers`.`borrower_id` AS `borrower_id`,`borrowers`.`firstname` AS `firstname`,`borrowers`.`lastname` AS `lastname`,`borrowers`.`address` AS `address`,`borrowers`.`email` AS `email`,`borrowers`.`phone` AS `phone`,`borrowers`.`department` AS `department` from ((`borrowers` join `borrow_book`) join `return_book`) where ((`borrowers`.`borrower_id` = `borrow_book`.`borrower_id`) and (`borrow_book`.`id` = `return_book`.`borrow_id`) and (`borrow_book`.`duedate` < `return_book`.`return_date`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `book_category` (`book_category`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`borrower_id`);

--
-- Indexes for table `borrow_book`
--
ALTER TABLE `borrow_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine`
--
ALTER TABLE `fine`
  ADD PRIMARY KEY (`fine_id`),
  ADD KEY `borrow_id` (`borrow_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `return_book`
--
ALTER TABLE `return_book`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `borrow_id` (`borrow_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `borrower_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `borrow_book`
--
ALTER TABLE `borrow_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fine`
--
ALTER TABLE `fine`
  MODIFY `fine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `return_book`
--
ALTER TABLE `return_book`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`borrower_id`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`book_category`) REFERENCES `category` (`id`);

--
-- Constraints for table `borrow_book`
--
ALTER TABLE `borrow_book`
  ADD CONSTRAINT `borrow_book_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `borrow_book_ibfk_2` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`borrower_id`);

--
-- Constraints for table `fine`
--
ALTER TABLE `fine`
  ADD CONSTRAINT `fine_ibfk_1` FOREIGN KEY (`borrow_id`) REFERENCES `borrow_book` (`id`);

--
-- Constraints for table `return_book`
--
ALTER TABLE `return_book`
  ADD CONSTRAINT `return_book_ibfk_1` FOREIGN KEY (`borrow_id`) REFERENCES `borrow_book` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
