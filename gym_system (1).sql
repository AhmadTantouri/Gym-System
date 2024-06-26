-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 06:00 PM
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
-- Database: `gym system`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `member_type` varchar(50) NOT NULL,
  `member_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `status` enum('present','absent') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `member_type`, `member_id`, `first_name`, `last_name`, `date`, `status`) VALUES
(8, 'customer', 9, '', '', '2024-05-26', 'present'),
(9, 'trainer', 7, '', '', '2024-05-26', 'present'),
(12, 'customer', 10, '', '', '2024-05-31', 'present');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `class_date` date NOT NULL,
  `class_time` time NOT NULL,
  `class_duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `class_date`, `class_time`, `class_duration`) VALUES
(1, 'Zomba', '2024-12-10', '10:28:00', 45),
(2, 'Cardio', '2024-10-12', '10:28:00', 12),
(3, 'Body', '2024-05-31', '14:06:00', 15),
(4, 'Body', '2024-06-05', '18:53:00', 15);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `subscription_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `subscription_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `trainer_id` int(11) DEFAULT NULL,
  `dietitian_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `created_at`, `subscription_status`, `subscription_date`, `trainer_id`, `dietitian_id`) VALUES
(1, 'Samer', 'Ali', 'Samar22@gmail.com', '81004289', 'Hamra', '2024-05-14 22:17:24', 'active', '2024-05-16 17:55:53', 6, 0),
(6, 'Walid', 'Khatib', 'wae@gmail.com', '03011022', 'Shhim', '2024-05-14 23:06:54', 'active', '2024-05-16 17:55:53', NULL, NULL),
(7, 'Ahmed', 'Soafan', 'Ahmed@gmail.com', '71007492', 'Barja', '2024-05-14 23:16:51', 'active', '2024-05-16 17:55:53', NULL, NULL),
(9, 'Samer', 'Shebbo', 'Samo92@gmail.com', '71003941', 'Barja', '2024-05-26 10:12:48', 'active', '2024-05-26 10:12:48', NULL, NULL),
(10, 'Mohamad', 'Haj', 'moe@gmail.com', '03001122', 'Barja', '2024-05-31 10:50:48', 'active', '2024-05-31 10:50:48', NULL, NULL),
(12, 'Mohamad', 'Haj', 'moe1@gmail.com', '03001122', 'Barja', '2024-06-13 15:48:22', 'active', '2024-06-13 15:48:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dietitian`
--

CREATE TABLE `dietitian` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `expertise` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dietitian`
--

INSERT INTO `dietitian` (`id`, `first_name`, `last_name`, `email`, `phone`, `expertise`, `created_at`) VALUES
(1, 'Ruba', 'Said', 'ruby95@gmail.com', '03972910', 'diet', '2024-05-14 23:09:39'),
(3, 'Maria', 'Boutrus', 'maro98@hotmail.com', '70284910', 'Sante', '2024-05-14 23:39:18'),
(4, 'Israa', 'Sayed', 'isra01@hotmail.com', '70891864', 'BlaBla', '2024-05-26 10:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `id` int(11) NOT NULL,
  `exercise_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `sets` int(11) NOT NULL,
  `reps` int(11) NOT NULL,
  `duration_minutes` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `exercise_name`, `description`, `sets`, `reps`, `duration_minutes`, `image_path`, `created_at`) VALUES
(1, 'Chest', 'jjjj', 12, 10, 20, 'uploads/iul logo.png', '2024-06-13 13:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  `feedback_type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `customer_username`, `feedback_type`, `message`, `created_at`) VALUES
(5, 'Ali Chaaban', 'Trainer', '4444erttr', '2024-06-13 15:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('meals','drinks','snacks') NOT NULL,
  `stock` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('available','non_available') NOT NULL,
  `description` text NOT NULL,
  `date_added` date NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`id`, `name`, `type`, `stock`, `price`, `status`, `description`, `date_added`, `image`, `date`) VALUES
(11, 'Whey Integramedica', 'meals', 20, 65.00, 'available', 'Whey protein: a fast-absorbing, high-quality supplement essential for muscle recovery and growth.', '0000-00-00', 'uploads/Whey.jpg', '2024-05-15');

-- --------------------------------------------------------

--
-- Table structure for table `meal_plans`
--

CREATE TABLE `meal_plans` (
  `id` int(11) NOT NULL,
  `dietitian_username` varchar(50) DEFAULT NULL,
  `customer_username` varchar(50) DEFAULT NULL,
  `meal_date` date DEFAULT NULL,
  `breakfast` text DEFAULT NULL,
  `lunch` text DEFAULT NULL,
  `dinner` text DEFAULT NULL,
  `snacks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `breakfast_calories` int(11) DEFAULT NULL,
  `lunch_calories` int(11) DEFAULT NULL,
  `dinner_calories` int(11) DEFAULT NULL,
  `snacks_calories` int(11) DEFAULT NULL,
  `breakfast_image` varchar(255) DEFAULT NULL,
  `lunch_image` varchar(255) DEFAULT NULL,
  `dinner_image` varchar(255) DEFAULT NULL,
  `snacks_image` varchar(255) DEFAULT NULL,
  `total_calories_consumed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal_plans`
--

INSERT INTO `meal_plans` (`id`, `dietitian_username`, `customer_username`, `meal_date`, `breakfast`, `lunch`, `dinner`, `snacks`, `created_at`, `breakfast_calories`, `lunch_calories`, `dinner_calories`, `snacks_calories`, `breakfast_image`, `lunch_image`, `dinner_image`, `snacks_image`, `total_calories_consumed`) VALUES
(10, 'Ruba Hazem', 'Maria', '2024-05-15', 'Whey', 'Chocolate', 'Protein bar', 'Amino', '2024-05-17 23:47:50', 540, 450, 250, 150, 'uploads/Whey.jpg', 'uploads/chocolate.jpg', 'uploads/protein_bar.jpeg', 'uploads/amino acide.jpeg', 1390),
(13, 'Ruba Hazem', 'Ali Chaaban', '2024-06-21', 'Labneh', 'Tuna', 'Orange', 'Protein bar', '2024-06-13 15:54:59', 232, 500, 259, 120, 'uploads/chocolate.jpg', 'uploads/Whey.jpg', 'uploads/amino acide.jpeg', 'uploads/protein_bar.jpeg', 1111);

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `specialty` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainer`
--

INSERT INTO `trainer` (`id`, `first_name`, `last_name`, `email`, `phone`, `specialty`, `created_at`) VALUES
(1, 'Samouel', 'Shebbo', 'samo@gmail.com', '81004019', 'Body Builder', '2024-05-14 23:09:19'),
(2, 'Yehya', 'Zanati', 'Zanati@gmail.com', '81004732', 'Cardio', '2024-05-14 23:17:47'),
(6, 'Muhamd', 'Hamieh', 'Hmieh99@gmail.com', '81813942', 'Cardio', '2024-05-21 19:09:21'),
(7, 'Jamal', 'Nabulsi', 'nabulsi@gmail.com', '03190322', 'Soldier', '2024-05-26 10:14:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer','trainer','dietitian') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`id`, `username`, `password`, `role`) VALUES
(1, 'Baron', 'Baron_7X', 'admin'),
(3, 'Rabii', 'Rabii2019', 'trainer'),
(4, 'Ruba', 'Ruba$99', 'dietitian'),
(14, 'Ali Chaaban', 'ali123', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

CREATE TABLE `workouts` (
  `id` int(11) NOT NULL,
  `customer_username` varchar(255) NOT NULL,
  `exercises` text NOT NULL,
  `rounds` int(11) NOT NULL,
  `reps` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `difficulty` varchar(50) NOT NULL,
  `calories_consumed` int(11) NOT NULL,
  `day` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workouts`
--

INSERT INTO `workouts` (`id`, `customer_username`, `exercises`, `rounds`, `reps`, `duration`, `difficulty`, `calories_consumed`, `day`, `created_at`) VALUES
(22, 'Marwa', 'ssss', 12, 10, 45, 'hard', 200, '2024-05-30', '2024-05-16 20:46:43'),
(28, 'Ali Chaaban', 'Sholders', 10, 12, 25, 'Hard', 2, '2024-06-29', '2024-06-13 15:53:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `dietitian`
--
ALTER TABLE `dietitian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_username` (`customer_username`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_plans`
--
ALTER TABLE `meal_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dietitian`
--
ALTER TABLE `dietitian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `meal_plans`
--
ALTER TABLE `meal_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `workouts`
--
ALTER TABLE `workouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `user_account` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
