-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2025 at 08:50 AM
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
-- Database: `exam_9b`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `assessment_title` varchar(100) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`id`, `course_id`, `assessment_title`, `total_marks`) VALUES
(1, 1, 'Midterm Exam', 20),
(2, 1, 'Final Exam', 60),
(3, 1, 'Project Evaluation', 20),
(4, 2, 'Class Test', 20),
(5, 2, 'Assignment', 20),
(6, 2, 'Quiz', 20),
(7, 2, 'Final', 40),
(8, 3, 'Lab Test', 50),
(9, 3, 'Final', 50),
(10, 4, 'Project', 50),
(11, 4, 'Lab Exam', 50),
(12, 5, 'Classwork', 20),
(13, 5, 'Report', 30),
(14, 5, 'Practical Exam', 50),
(15, 15, 'Case Study', 40),
(16, 16, 'Seminar', 50),
(17, 17, 'Research Paper', 80),
(18, 18, 'Field Work', 100),
(19, 19, 'Online Test', 60),
(20, 20, 'Mock Exam', 90),
(21, 21, 'Coursework', 50),
(22, 22, 'Lab Report', 40),
(23, 23, 'Thesis', 200),
(24, 24, 'Capstone Project', 150),
(25, 25, 'Technical Paper', 75);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `course_code` varchar(20) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `credits` decimal(3,1) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `course_code`, `level`, `credits`, `instructor_id`) VALUES
(1, 'Introduction to Computer Science', 'CSE101', 'Undergraduate', 3.0, 1),
(2, 'Data Structures', 'CSE201', 'Undergraduate', 3.5, 2),
(3, 'Database Systems', 'CSE301', 'Undergraduate', 3.0, 3),
(4, 'Software Engineering', 'CSE401', 'Undergraduate', 4.0, 4),
(5, 'Machine Learning', 'CSE501', 'Postgraduate', 4.0, 5),
(6, 'Artificial Intelligence', 'CSE502', 'Postgraduate', 4.0, 1),
(7, 'Operating Systems', 'CSE202', 'Undergraduate', 3.5, 2),
(8, 'Computer Networks', 'CSE303', 'Undergraduate', 3.0, 3),
(9, 'Algorithms', 'CSE204', 'Undergraduate', 3.5, 4),
(10, 'Cybersecurity', 'CSE505', 'Postgraduate', 4.0, 5),
(11, 'Discrete Mathematics', 'CSE102', 'Undergraduate', 3.0, 6),
(12, 'Cloud Computing', 'CSE504', 'Postgraduate', 4.0, 7),
(13, 'Big Data', 'CSE506', 'Postgraduate', 4.0, 8),
(14, 'Theory of Computation', 'CSE305', 'Undergraduate', 3.0, 9),
(15, 'Computer Graphics', 'CSE402', 'Undergraduate', 4.0, 10),
(16, 'Human-Computer Interaction', 'CSE403', 'Undergraduate', 4.0, 11),
(17, 'Mobile Application Development', 'CSE406', 'Undergraduate', 3.0, 12),
(18, 'Distributed Systems', 'CSE507', 'Postgraduate', 4.0, 13),
(19, 'Data Mining', 'CSE508', 'Postgraduate', 4.0, 14),
(20, 'Robotics', 'CSE509', 'Postgraduate', 4.0, 15),
(21, 'Compiler Design', 'CSE306', 'Undergraduate', 3.0, 16),
(22, 'Parallel Computing', 'CSE510', 'Postgraduate', 4.0, 17),
(23, 'Information Retrieval', 'CSE511', 'Postgraduate', 4.0, 18),
(24, 'Quantum Computing', 'CSE512', 'Postgraduate', 4.0, 19),
(25, 'Digital Image Processing', 'CSE407', 'Undergraduate', 4.0, 20);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `student_id`, `course_id`, `enrollment_date`, `status`) VALUES
(1, 1, 1, '2023-01-15', 'Enrolled'),
(2, 2, 2, '2023-01-16', 'Enrolled'),
(3, 3, 3, '2023-01-17', 'Enrolled'),
(4, 4, 4, '2023-01-18', 'Enrolled'),
(5, 5, 5, '2023-01-19', 'Completed'),
(6, 6, 6, '2023-01-20', 'Enrolled'),
(7, 7, 7, '2023-01-21', 'Enrolled'),
(8, 8, 8, '2023-01-22', 'Completed'),
(9, 9, 9, '2023-01-23', 'Enrolled'),
(10, 10, 10, '2023-01-24', 'Enrolled'),
(11, 11, 11, '2023-01-25', 'Completed'),
(12, 12, 12, '2023-01-26', 'Enrolled'),
(13, 13, 13, '2023-01-27', 'Completed'),
(14, 14, 14, '2023-01-28', 'Enrolled'),
(15, 15, 15, '2023-01-29', 'Enrolled'),
(16, 16, 16, '2023-01-30', 'Completed'),
(17, 17, 17, '2023-01-31', 'Enrolled'),
(18, 18, 18, '2023-02-01', 'Enrolled'),
(19, 19, 19, '2023-02-02', 'Completed'),
(20, 20, 20, '2023-02-03', 'Enrolled'),
(21, 21, 21, '2023-02-04', 'Enrolled'),
(22, 22, 22, '2023-02-05', 'Completed'),
(23, 23, 23, '2023-02-06', 'Enrolled'),
(24, 24, 24, '2023-02-07', 'Completed'),
(25, 25, 25, '2023-02-08', 'Enrolled');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `name`, `email`, `designation`, `phone`, `salary`) VALUES
(1, 'Md. Rahim', 'rahim@univ.edu.bd', 'Professor', '01710000001', 90000.00),
(2, 'Ayesha Begum', 'ayesha@univ.edu.bd', 'Assistant Professor', '01710000002', 70000.00),
(3, 'Tanvir Hossain', 'tanvir@univ.edu.bd', 'Lecturer', '01710000003', 50000.00),
(4, 'Samira Akter', 'samira@univ.edu.bd', 'Associate Professor', '01710000004', 85000.00),
(5, 'Jahidul Islam', 'jahidul@univ.edu.bd', 'Lecturer', '01710000005', 55000.00),
(6, 'Fahim Ahmed', 'fahim@univ.edu.bd', 'Professor', '01710000006', 92000.00),
(7, 'Rakibul Hasan', 'rakibul@univ.edu.bd', 'Assistant Professor', '01710000007', 72000.00),
(8, 'Nadia Khatun', 'nadia@univ.edu.bd', 'Lecturer', '01710000008', 51000.00),
(9, 'Zakir Hossain', 'zakir@univ.edu.bd', 'Lecturer', '01710000009', 53000.00),
(10, 'Maruf Rahman', 'maruf@univ.edu.bd', 'Associate Professor', '01710000010', 83000.00),
(11, 'Shirin Akter', 'shirin@univ.edu.bd', 'Professor', '01710000011', 91000.00),
(12, 'Mahmudul Hassan', 'mahmudul@univ.edu.bd', 'Lecturer', '01710000012', 52000.00),
(13, 'Rana Chowdhury', 'rana@univ.edu.bd', 'Assistant Professor', '01710000013', 71000.00),
(14, 'Asma Khatun', 'asma@univ.edu.bd', 'Professor', '01710000014', 93000.00),
(15, 'Nazmul Huda', 'nazmul@univ.edu.bd', 'Lecturer', '01710000015', 54000.00),
(16, 'Tania Rahman', 'tania@univ.edu.bd', 'Assistant Professor', '01710000016', 70000.00),
(17, 'Imran Khan', 'imran@univ.edu.bd', 'Lecturer', '01710000017', 50000.00),
(18, 'Badrul Alam', 'badrul@univ.edu.bd', 'Professor', '01710000018', 95000.00),
(19, 'Farzana Begum', 'farzana@univ.edu.bd', 'Lecturer', '01710000019', 52000.00),
(20, 'Sajib Khan', 'sajib@univ.edu.bd', 'Associate Professor', '01710000020', 87000.00),
(21, 'Sadia Sultana', 'sadia@univ.edu.bd', 'Professor', '01710000021', 94000.00),
(22, 'Masum Billah', 'masum@univ.edu.bd', 'Lecturer', '01710000022', 54000.00),
(23, 'Rafiul Islam', 'rafiul@univ.edu.bd', 'Lecturer', '01710000023', 51000.00),
(24, 'Mohammad Hasan', 'hasan@univ.edu.bd', 'Assistant Professor', '01710000024', 73000.00),
(25, 'Moushumi Akter', 'moushumi@univ.edu.bd', 'Lecturer', '01710000025', 56000.00);

-- --------------------------------------------------------

--
-- Table structure for table `learners`
--

CREATE TABLE `learners` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `roll` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `learners`
--

INSERT INTO `learners` (`id`, `name`, `roll`, `email`, `date_of_birth`, `city`) VALUES
(1, 'Hasibul Alam', '20181001', 'hasibul@univ.edu.bd', '1998-07-15', 'Dhaka'),
(2, 'Shirin Akter', '20181002', 'shirin@univ.edu.bd', '1999-04-12', 'Chittagong'),
(3, 'Arif Hossain', '20181003', 'arif@univ.edu.bd', '2000-01-25', 'Rajshahi'),
(4, 'Farzana Rahman', '20181004', 'farzana@univ.edu.bd', '1998-09-05', 'Khulna'),
(5, 'Tanvir Ahmed', '20181005', 'tanvir@univ.edu.bd', '1999-12-14', 'Sylhet'),
(6, 'Nazmul Huda', '20181006', 'nazmul@univ.edu.bd', '1998-11-17', 'Dhaka'),
(7, 'Sadia Khatun', '20181007', 'sadia@univ.edu.bd', '1999-06-22', 'Barisal'),
(8, 'Nayem Islam', '20181008', 'nayem@univ.edu.bd', '1998-05-19', 'Rangpur'),
(9, 'Mitu Sultana', '20181009', 'mitu@univ.edu.bd', '1999-03-30', 'Sylhet'),
(10, 'Ashraf Siddique', '20181010', 'ashraf@univ.edu.bd', '1998-09-11', 'Dhaka'),
(11, 'Rubina Chowdhury', '20181011', 'rubina@univ.edu.bd', '1999-02-21', 'Chittagong'),
(12, 'Farhan Ahmed', '20181012', 'farhan@univ.edu.bd', '2000-04-03', 'Khulna'),
(13, 'Imran Hossain', '20181013', 'imran@univ.edu.bd', '1999-07-09', 'Sylhet'),
(14, 'Alif Chowdhury', '20181014', 'alif@univ.edu.bd', '1998-10-22', 'Dhaka'),
(15, 'Maya Akter', '20181015', 'maya@univ.edu.bd', '1999-05-12', 'Barisal'),
(16, 'Rafiq Hasan', '20181016', 'rafiq@univ.edu.bd', '1998-06-17', 'Rajshahi'),
(17, 'Sumiya Rahman', '20181017', 'sumiya@univ.edu.bd', '2000-02-11', 'Rangpur'),
(18, 'Tarek Islam', '20181018', 'tarek@univ.edu.bd', '1998-12-29', 'Sylhet'),
(19, 'Afroza Begum', '20181019', 'afroza@univ.edu.bd', '1999-11-15', 'Dhaka'),
(20, 'Nabil Hossain', '20181020', 'nabil@univ.edu.bd', '1999-08-23', 'Chittagong'),
(21, 'Hassan Chowdhury', '20181021', 'hassan@univ.edu.bd', '1998-04-18', 'Khulna'),
(22, 'Mariya Sultana', '20181022', 'mariya@univ.edu.bd', '1999-09-25', 'Barisal'),
(23, 'Shakib Khan', '20181023', 'shakib@univ.edu.bd', '2000-05-14', 'Rajshahi'),
(24, 'Minhaj Rahman', '20181024', 'minhaj@univ.edu.bd', '1998-03-09', 'Dhaka'),
(25, 'Sajida Akter', '20181025', 'sajida@univ.edu.bd', '1999-12-20', 'Sylhet');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `marks_obtained` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `student_id`, `assessment_id`, `marks_obtained`) VALUES
(1, 1, 1, 15),
(2, 1, 2, 50),
(3, 1, 3, 15),
(4, 4, 4, 18),
(5, 5, 5, 9),
(6, 6, 6, 23),
(7, 7, 7, 28),
(8, 8, 8, 45),
(9, 9, 9, 35),
(10, 10, 10, 52),
(11, 11, 11, 12),
(12, 12, 12, 19),
(13, 13, 13, 29),
(14, 14, 14, 65),
(15, 15, 15, 35),
(16, 16, 16, 50),
(17, 17, 17, 80),
(18, 18, 18, 90),
(19, 19, 19, 55),
(20, 20, 20, 89),
(21, 21, 21, 45),
(22, 22, 22, 37),
(23, 23, 23, 150),
(24, 24, 24, 130),
(25, 25, 25, 60);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `learners`
--
ALTER TABLE `learners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roll` (`roll`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `assessment_id` (`assessment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `learners`
--
ALTER TABLE `learners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessments`
--
ALTER TABLE `assessments`
  ADD CONSTRAINT `assessments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `learners` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `learners` (`id`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
