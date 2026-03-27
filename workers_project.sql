-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2026 at 10:20 AM
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
-- Database: `workers_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add worker', 9, 'add_worker'),
(34, 'Can change worker', 9, 'change_worker'),
(35, 'Can delete worker', 9, 'delete_worker'),
(36, 'Can view worker', 9, 'view_worker'),
(37, 'Can add admin', 10, 'add_admin'),
(38, 'Can change admin', 10, 'change_admin'),
(39, 'Can delete admin', 10, 'delete_admin'),
(40, 'Can view admin', 10, 'view_admin'),
(41, 'Can add booking', 11, 'add_booking'),
(42, 'Can change booking', 11, 'change_booking'),
(43, 'Can delete booking', 11, 'delete_booking'),
(44, 'Can view booking', 11, 'view_booking'),
(45, 'Can add work status', 12, 'add_workstatus'),
(46, 'Can change work status', 12, 'change_workstatus'),
(47, 'Can delete work status', 12, 'delete_workstatus'),
(48, 'Can view work status', 12, 'view_workstatus'),
(49, 'Can add feedback', 13, 'add_feedback'),
(50, 'Can change feedback', 13, 'change_feedback'),
(51, 'Can delete feedback', 13, 'delete_feedback'),
(52, 'Can view feedback', 13, 'view_feedback');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `booking_date` datetime(6) NOT NULL,
  `scheduled_date` date NOT NULL,
  `category` varchar(100) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `booking_date`, `scheduled_date`, `category`, `service_type`, `status`, `description`, `user_id`, `worker_id`) VALUES
(1, '2026-03-11 12:15:59.946072', '2026-03-11', 'Logistics & Labor', 'Driver', 'completed', 'drive to cbe in car', 3, 4),
(2, '2026-03-12 10:25:09.529133', '2026-03-12', 'Home Maintenance', 'Plumber', 'cancelled', 'in house', 3, 5),
(4, '2026-03-13 08:47:24.360717', '2026-03-13', 'Home Maintenance', 'Plumber', 'completed', 'my office', 1, 5),
(5, '2026-03-13 11:20:01.379638', '2026-03-13', 'Logistics & Labor', 'Driver', 'cancelled', 'trip to covai', 2, 4),
(6, '2026-03-14 08:32:17.130160', '2026-03-14', 'Home Maintenance', 'Plumber', 'completed', 'in home', 4, 5),
(7, '2026-03-16 15:21:03.031012', '2026-03-16', 'Home Maintenance', 'Plumber', 'cancelled', 'in home', 3, 5),
(8, '2026-03-17 12:49:30.156954', '2026-03-17', 'Food & Event Support', 'Cook', 'completed', 'birth day event', 4, 6),
(9, '2026-03-17 13:01:32.436108', '2026-03-17', 'Home Maintenance', 'Electrician', 'completed', 'in home', 4, 1),
(10, '2026-03-18 09:01:58.767270', '2026-03-18', 'Home Maintenance', 'Electrician', 'completed', 'in office', 5, 7),
(11, '2026-03-18 11:23:06.373831', '2026-03-18', 'Home Maintenance', 'Plumber', 'cancelled', 'in home', 5, 8),
(12, '2026-03-18 11:26:21.219324', '2026-03-18', 'Home Maintenance', 'Plumber', 'cancelled', 'in home', 5, 8),
(14, '2026-03-18 13:35:06.450214', '2026-03-18', 'Home Maintenance', 'Plumber', 'completed', 'office', 5, 8),
(15, '2026-03-19 09:40:51.995064', '2026-03-19', 'Home Maintenance', 'Plumber', 'cancelled', 'in home', 3, 8),
(16, '2026-03-19 09:58:53.908724', '2026-03-19', 'Home Maintenance', 'Plumber', 'in_progress', 'in home', 3, 8),
(17, '2026-03-21 10:08:08.787567', '2026-03-21', 'Home Maintenance', 'Electrician', 'completed', 'new home ', 1, 1),
(18, '2026-03-21 10:50:20.381115', '2026-03-21', 'Home Maintenance', 'Electrician', 'completed', 'in home', 2, 7),
(19, '2026-03-25 13:40:16.476390', '2026-03-25', 'Construction Services', 'Carpenter', 'completed', 'in home', 8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `home_maintenance` varchar(100) NOT NULL,
  `construction_services` varchar(100) NOT NULL,
  `cleaning_services` varchar(100) NOT NULL,
  `outdoor_services` varchar(100) NOT NULL,
  `installation_services` varchar(100) NOT NULL,
  `logistics_labor` varchar(100) NOT NULL,
  `tailoring_crafts` varchar(100) NOT NULL,
  `food_event_support` varchar(100) NOT NULL,
  `personal_care` varchar(100) NOT NULL,
  `rural_services` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'myapp', 'admin'),
(11, 'myapp', 'booking'),
(7, 'myapp', 'category'),
(13, 'myapp', 'feedback'),
(8, 'myapp', 'user'),
(9, 'myapp', 'worker'),
(12, 'myapp', 'workstatus'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-03-02 13:37:32.809153'),
(2, 'auth', '0001_initial', '2026-03-02 13:37:33.864522'),
(3, 'admin', '0001_initial', '2026-03-02 13:37:34.165185'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-03-02 13:37:34.192093'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-03-02 13:37:34.224638'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-03-02 13:37:34.380673'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-03-02 13:37:34.476138'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-03-02 13:37:34.532742'),
(9, 'auth', '0004_alter_user_username_opts', '2026-03-02 13:37:34.550622'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-03-02 13:37:34.629791'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-03-02 13:37:34.638175'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-03-02 13:37:34.666604'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-03-02 13:37:34.709671'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-03-02 13:37:34.754577'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-03-02 13:37:34.802038'),
(16, 'auth', '0011_update_proxy_permissions', '2026-03-02 13:37:34.834472'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-03-02 13:37:34.877199'),
(18, 'myapp', '0001_initial', '2026-03-02 13:37:35.063958'),
(19, 'sessions', '0001_initial', '2026-03-02 13:37:35.168361'),
(20, 'myapp', '0002_admin_booking_workstatus_feedback', '2026-03-06 08:22:56.816177'),
(21, 'myapp', '0003_delete_admin', '2026-03-06 10:46:29.635175'),
(22, 'myapp', '0004_alter_booking_status_delete_workstatus', '2026-03-12 11:28:38.367867'),
(23, 'myapp', '0005_remove_booking_is_available_alter_booking_status', '2026-03-13 09:30:15.392660'),
(24, 'myapp', '0006_alter_booking_status', '2026-03-13 12:42:46.792078'),
(25, 'myapp', '0007_alter_booking_status', '2026-03-13 13:07:21.457864'),
(26, 'myapp', '0008_feedback_upload_image', '2026-03-21 09:58:58.378648'),
(27, 'myapp', '0009_feedback_upload_image2_feedback_upload_image3', '2026-03-21 10:46:42.729505');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `upload_image` varchar(100) DEFAULT NULL,
  `upload_image2` varchar(100) DEFAULT NULL,
  `upload_image3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `rating`, `comment`, `created_at`, `booking_id`, `user_id`, `worker_id`, `upload_image`, `upload_image2`, `upload_image3`) VALUES
(2, 5, 'finished on time ...', '2026-03-14 11:21:04.096449', 6, 4, 5, NULL, NULL, NULL),
(3, 1, 'good ', '2026-03-14 11:52:45.978710', 1, 3, 4, NULL, NULL, NULL),
(4, 5, 'good work ..', '2026-03-17 12:57:34.895322', 8, 4, 6, NULL, NULL, NULL),
(5, 3, 'good work ', '2026-03-18 11:20:43.614901', 10, 5, 7, NULL, NULL, NULL),
(6, 5, 'good work , satisfied .', '2026-03-21 10:12:23.963085', 9, 4, 1, 'feedback_images/6.jpg', NULL, NULL),
(7, 5, 'good work', '2026-03-21 10:16:27.827328', 17, 1, 1, 'feedback_images/47.jpg', NULL, NULL),
(8, 4, 'satisfied..', '2026-03-21 10:57:54.198932', 18, 2, 7, 'feedback_images/electric.webp', 'feedback_images/electric2.webp', 'feedback_images/electric3.webp'),
(9, 5, 'work was perfect and the worker karan to get fair cost ..', '2026-03-25 13:51:52.857867', 19, 8, 10, 'feedback_images/carpenter1.webp', 'feedback_images/carpenter2.webp', 'feedback_images/carpenter3.webp');

-- --------------------------------------------------------

--
-- Table structure for table `user_register`
--

CREATE TABLE `user_register` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `password` varchar(128) NOT NULL,
  `state` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `full_address` varchar(100) NOT NULL,
  `landmark` varchar(50) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_register`
--

INSERT INTO `user_register` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `state`, `district`, `city`, `full_address`, `landmark`, `pincode`, `created_at`) VALUES
(1, 'Arul', 'P', 'aravinthp@gmail.com', '9698678912', 'arul@02', 'Tamil Nadu', 'Erode', 'Erode', '42/1,Rail Nagar.', 'GH', '638009', '2026-03-03 10:37:28.020443'),
(2, 'Raja', 'M', 'raja@gmail.com', '9698678911', 'raja@003', 'Tamil Nadu', 'Tiruppur', 'Palladam', '42/1,palladam', 'Bank', '638009', '2026-03-04 09:14:34.694296'),
(3, 'John', 'C', 'john@gmail.com', '9698678917', 'john@123', 'Tamil Nadu', 'Coimbatore', 'Valparai', '154,valparai', 'Bank', '638009', '2026-03-04 09:16:12.212377'),
(4, 'Vijay', 'S', 'vijay@gmail.com', '9698677908', 'vijay@00', 'Tamil Nadu', 'Karur', 'Pugalur', '10/2,pugalur', 'Temple', '638005', '2026-03-14 08:27:53.528292'),
(5, 'Ravi', 'C', 'ravi@gmail.com', '9698678345', 'ravi@123', 'Tamil Nadu', 'Tiruppur', 'Tiruppur', '154,railway station ', 'Temple', '638012', '2026-03-18 06:57:01.709492'),
(6, 'Arun', 'G', 'arun@gmail.com', '9698678907', 'arun@00', 'Tamil Nadu', 'Erode', 'Perundurai', '154,railway station ', 'Temple', '638005', '2026-03-18 14:11:25.470575'),
(7, 'Balu', 'K', 'balu@gmail.com', '9894897117', 'balu@00', 'Tamil Nadu', 'Karur', 'Krishnarayapuram', '154,railway station ', 'Bank', '638015', '2026-03-18 14:14:40.743952'),
(8, 'Pooja', 'R', 'pooja@gmail.com', '9698663223', 'pooja@00', 'Tamil Nadu', 'Coimbatore', 'Pollachi', '154,pollachi', 'Mall', '638005', '2026-03-25 13:34:06.756785');

-- --------------------------------------------------------

--
-- Table structure for table `worker_register`
--

CREATE TABLE `worker_register` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(20) NOT NULL,
  `worker_type` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `experience` int(10) UNSIGNED NOT NULL CHECK (`experience` >= 0),
  `service_area` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `worker_register`
--

INSERT INTO `worker_register` (`id`, `first_name`, `last_name`, `phone`, `email`, `password`, `dob`, `gender`, `worker_type`, `category`, `experience`, `service_area`, `state`, `district`, `city`, `pincode`, `created_at`) VALUES
(1, 'Aravinth', 'D', '9698678911', 'aravinth@gmail.com', 'aravi@02', '2004-02-10', 'Male', 'Electrician', 'Home Maintenance', 3, 'Perundurai', 'Tamil Nadu', 'Erode', 'Perundurai', '638005', '2026-03-03 10:39:11.012013'),
(2, 'Ram', 'S', '9698678912', 'ram@gmail.com', 'ram@005', '2004-03-10', 'Male', 'Mobile_Repair_Technician', 'Tailoring & Crafts', 3, 'Erode', 'Tamil Nadu', 'Erode', 'Erode', '638009', '2026-03-04 09:10:01.547063'),
(3, 'Mani', 'S', '9698678917', 'mani@gmail.com', 'mani@001', '2004-04-12', 'Male', 'Sweeper', 'Cleaning Services', 3, 'Bhavani', 'Tamil Nadu', 'Erode', 'Bhavani', '638009', '2026-03-04 09:12:06.650707'),
(4, 'Raj', 'M', '9698678915', 'raj@gmail.com', 'raj@123', '2005-02-20', 'Male', 'Driver', 'Logistics & Labor', 5, 'Sathyamangalam', 'Tamil Nadu', 'Erode', 'Sathyamangalam', '638009', '2026-03-10 12:12:45.123020'),
(5, 'Sai ', 'A', '9698678002', 'sai@gmail.com', 'sai@123', '2004-01-21', 'Male', 'Plumber', 'Home Maintenance', 5, 'Tiruppur', 'Tamil Nadu', 'Tiruppur', 'Tiruppur', '638009', '2026-03-11 14:22:45.448091'),
(6, 'Navin', 'D', '9698678945', 'navin@gmail.com', 'navin@12', '2004-10-02', 'Male', 'Cook', 'Food & Event Support', 10, 'Tiruppur', 'Tamil Nadu', 'Tiruppur', 'Tiruppur', '638003', '2026-03-16 12:47:18.769773'),
(7, 'Hari', 'M', '9698678923', 'hari@gmail.com', 'hari@11', '2003-10-02', 'Male', 'Electrician', 'Home Maintenance', 3, 'Coimbatore', 'Tamil Nadu', 'Coimbatore', 'Coimbatore', '638012', '2026-03-18 05:43:17.566418'),
(8, 'Kalai', 'P', '9698678987', 'kalai@gmail.com', 'kalai@12', '2000-12-12', 'Male', 'Plumber', 'Home Maintenance', 7, 'Erode', 'Tamil Nadu', 'Erode', 'Erode', '638009', '2026-03-18 06:54:28.940786'),
(9, 'Nanda', 'E', '9698285282', 'nanda@gmail.com', 'nanda@00', '2001-10-22', 'Male', 'Cook', 'Food & Event Support', 5, 'Anthiyur', 'Tamil Nadu', 'Erode', 'Anthiyur', '638012', '2026-03-18 14:26:47.703092'),
(10, 'Karan', 'S', '9698200887', 'karan@gmail.com', 'karan@11', '1999-08-15', 'Male', 'Carpenter', 'Construction Services', 5, 'Pollachi', 'Tamil Nadu', 'Coimbatore', 'Coimbatore', '638005', '2026-03-25 13:37:25.429984');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_user_id_1bd7cb6e_fk_user_register_id` (`user_id`),
  ADD KEY `booking_worker_id_aa336e23_fk_worker_register_id` (`worker_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_booking_id_714027bd_fk_booking_id` (`booking_id`),
  ADD KEY `feedback_user_id_0104a377_fk_user_register_id` (`user_id`),
  ADD KEY `feedback_worker_id_3242ea1b_fk_worker_register_id` (`worker_id`);

--
-- Indexes for table `user_register`
--
ALTER TABLE `user_register`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `worker_register`
--
ALTER TABLE `worker_register`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_register`
--
ALTER TABLE `user_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `worker_register`
--
ALTER TABLE `worker_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_user_id_1bd7cb6e_fk_user_register_id` FOREIGN KEY (`user_id`) REFERENCES `user_register` (`id`),
  ADD CONSTRAINT `booking_worker_id_aa336e23_fk_worker_register_id` FOREIGN KEY (`worker_id`) REFERENCES `worker_register` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_booking_id_714027bd_fk_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `feedback_user_id_0104a377_fk_user_register_id` FOREIGN KEY (`user_id`) REFERENCES `user_register` (`id`),
  ADD CONSTRAINT `feedback_worker_id_3242ea1b_fk_worker_register_id` FOREIGN KEY (`worker_id`) REFERENCES `worker_register` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
