-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.31 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for student_management_system
CREATE DATABASE IF NOT EXISTS `student_management_system` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `student_management_system`;

-- Dumping structure for table student_management_system.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `admin_type_id` int NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`admin_no`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_admin_admin_type1_idx` (`admin_type_id`),
  KEY `fk_admin_gender1_idx` (`gender_id`),
  CONSTRAINT `fk_admin_admin_type1` FOREIGN KEY (`admin_type_id`) REFERENCES `admin_type` (`id`),
  CONSTRAINT `fk_admin_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.admin: ~3 rows (approximately)
INSERT INTO `admin` (`admin_no`, `name`, `email`, `password`, `admin_type_id`, `address`, `city`, `mobile`, `gender_id`) VALUES
	(1, 'Sahan Perera', 'sandi@gmail.com', '123', 1, 'Menewa', 'Kuliyapitiya', '0771112223', 1),
	(2, 'Sahan Perera', 'sahan@gmail.com', '456', 2, 'Dihana', 'Galle', '0762223334', 2),
	(3, 'Hashan Bandara', 'hashan@gmail.com', '789', 3, 'Gampola', 'Kandy', '0783334445', 1);

-- Dumping structure for table student_management_system.admin_type
CREATE TABLE IF NOT EXISTS `admin_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.admin_type: ~3 rows (approximately)
INSERT INTO `admin_type` (`id`, `type`) VALUES
	(1, 'Super Admin'),
	(2, 'Admin'),
	(3, 'Cashier');

-- Dumping structure for table student_management_system.attendance
CREATE TABLE IF NOT EXISTS `attendance` (
  `attend_no` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `attend_status_status_id` int NOT NULL,
  `student_student_no` int NOT NULL,
  `class_class_no` int NOT NULL,
  PRIMARY KEY (`attend_no`),
  KEY `fk_attendance_attend_status1_idx` (`attend_status_status_id`),
  KEY `fk_attendance_student1_idx` (`student_student_no`),
  KEY `fk_attendance_class1_idx` (`class_class_no`),
  CONSTRAINT `fk_attendance_attend_status1` FOREIGN KEY (`attend_status_status_id`) REFERENCES `attend_status` (`status_id`),
  CONSTRAINT `fk_attendance_class1` FOREIGN KEY (`class_class_no`) REFERENCES `class` (`class_no`),
  CONSTRAINT `fk_attendance_student1` FOREIGN KEY (`student_student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.attendance: ~7 rows (approximately)
INSERT INTO `attendance` (`attend_no`, `date`, `attend_status_status_id`, `student_student_no`, `class_class_no`) VALUES
	(1, '2023-07-11', 1, 4, 1),
	(4, '2023-07-11', 1, 4, 1),
	(6, '2023-07-11', 1, 6, 5),
	(8, '2023-07-12', 1, 5, 1),
	(9, '2023-07-12', 1, 4, 5),
	(10, '2023-07-12', 1, 5, 5),
	(11, '2023-07-12', 1, 3, 1),
	(12, '2023-07-12', 1, 6, 1),
	(13, '2023-07-14', 1, 5, 1),
	(14, '2024-12-01', 1, 3, 3);

-- Dumping structure for table student_management_system.attend_status
CREATE TABLE IF NOT EXISTS `attend_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.attend_status: ~2 rows (approximately)
INSERT INTO `attend_status` (`status_id`, `status`) VALUES
	(1, 'Attend'),
	(2, 'Absent');

-- Dumping structure for table student_management_system.class
CREATE TABLE IF NOT EXISTS `class` (
  `class_no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `day` varchar(20) NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `teacher_has_subject_teacher_teacher_no` int NOT NULL,
  `teacher_has_subject_subject_subject_no` int NOT NULL,
  PRIMARY KEY (`class_no`),
  KEY `fk_class_teacher_has_subject1_idx` (`teacher_has_subject_teacher_teacher_no`,`teacher_has_subject_subject_subject_no`),
  CONSTRAINT `fk_class_teacher_has_subject1` FOREIGN KEY (`teacher_has_subject_teacher_teacher_no`, `teacher_has_subject_subject_subject_no`) REFERENCES `teacher_has_subject` (`teacher_teacher_no`, `subject_subject_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.class: ~4 rows (approximately)
INSERT INTO `class` (`class_no`, `name`, `day`, `from`, `to`, `teacher_has_subject_teacher_teacher_no`, `teacher_has_subject_subject_subject_no`) VALUES
	(1, 'Biology_1_Tuesday12:00:0014:00:00', 'Tuesday', '12:00:00', '14:00:00', 1, 1),
	(3, 'Maths_5_Friday09:00:0013:00:00', 'Friday', '09:00:00', '13:00:00', 5, 2),
	(5, 'Biology_1_Tuesday12:00:0014:00:00', 'Tuesday', '12:00:00', '14:00:00', 1, 1),
	(6, 'Maths_2_Wednesday15:00:0018:00:00', 'Wednesday', '15:00:00', '18:00:00', 2, 2);

-- Dumping structure for table student_management_system.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.gender: ~2 rows (approximately)
INSERT INTO `gender` (`id`, `name`) VALUES
	(1, 'Male'),
	(2, 'Female');

-- Dumping structure for table student_management_system.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_no` int NOT NULL AUTO_INCREMENT,
  `month_id` int NOT NULL,
  `value` decimal(10,0) NOT NULL,
  `student_student_no` int NOT NULL,
  `class_class_no` int NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`invoice_no`),
  KEY `fk_invoice_student1_idx` (`student_student_no`),
  KEY `fk_invoice_class1_idx` (`class_class_no`),
  KEY `fk_invoice_month1_idx` (`month_id`),
  CONSTRAINT `fk_invoice_class1` FOREIGN KEY (`class_class_no`) REFERENCES `class` (`class_no`),
  CONSTRAINT `fk_invoice_month1` FOREIGN KEY (`month_id`) REFERENCES `month` (`id`),
  CONSTRAINT `fk_invoice_student1` FOREIGN KEY (`student_student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.invoice: ~18 rows (approximately)
INSERT INTO `invoice` (`invoice_no`, `month_id`, `value`, `student_student_no`, `class_class_no`, `datetime`) VALUES
	(1, 2, 2400, 5, 6, '2023-07-13 11:09:15'),
	(2, 4, 2400, 5, 6, '2023-07-13 11:18:17'),
	(3, 2, 2500, 4, 5, '2023-07-14 20:48:16'),
	(4, 1, 2000, 4, 6, '2023-07-11 10:26:42'),
	(5, 1, 2500, 5, 6, '2023-07-11 11:08:57'),
	(6, 3, 2500, 4, 5, '2023-07-11 13:47:09'),
	(8, 1, 2500, 3, 1, '2023-07-11 21:04:55'),
	(9, 3, 2400, 3, 6, '2023-07-11 21:08:27'),
	(11, 3, 2500, 4, 5, '2023-07-11 22:19:29'),
	(14, 1, 2500, 3, 5, '2023-07-11 23:21:36'),
	(17, 7, 2500, 4, 1, '2023-07-12 11:45:54'),
	(18, 6, 2400, 4, 6, '2023-07-12 11:46:01'),
	(19, 7, 2500, 4, 1, '2023-07-12 11:48:56'),
	(20, 4, 2500, 4, 5, '2023-07-12 11:49:06'),
	(23, 3, 2400, 3, 6, '2023-07-12 13:41:18'),
	(24, 4, 2500, 3, 5, '2023-07-12 13:41:29'),
	(25, 3, 2500, 4, 1, '2023-07-12 23:02:41'),
	(26, 2, 2400, 4, 6, '2023-07-12 23:03:18'),
	(27, 1, 2400, 3, 6, '2023-07-13 11:16:15'),
	(28, 5, 2400, 6, 3, '2023-07-13 11:20:57'),
	(29, 3, 2400, 3, 3, '2024-12-01 11:37:41');

-- Dumping structure for table student_management_system.month
CREATE TABLE IF NOT EXISTS `month` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.month: ~11 rows (approximately)
INSERT INTO `month` (`id`, `name`) VALUES
	(1, 'January'),
	(2, 'February'),
	(3, 'March'),
	(4, 'April'),
	(5, 'May'),
	(6, 'June'),
	(7, 'July'),
	(8, 'August'),
	(9, 'September'),
	(10, 'October'),
	(11, 'November'),
	(12, 'December');

-- Dumping structure for table student_management_system.student
CREATE TABLE IF NOT EXISTS `student` (
  `student_no` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `guardian_name` varchar(45) NOT NULL,
  `guardian_mobile` varchar(10) NOT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`student_no`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `fk_student_gender1_idx` (`gender_id`),
  CONSTRAINT `fk_student_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.student: ~4 rows (approximately)
INSERT INTO `student` (`student_no`, `first_name`, `last_name`, `address`, `city`, `dob`, `mobile`, `email`, `guardian_name`, `guardian_mobile`, `gender_id`) VALUES
	(3, 'Saduni', 'Perera', 'Wattala', 'Colombo', '2006-07-05', '0761234567', 'saduni@gmail.com', 'Kamal', '0751234567', 2),
	(4, 'Kasun', 'Fernado', 'Kadana', 'Kadawatha', '2004-03-09', '0780123456', 'kasun@gmail.com', 'Kasal', '0763459876', 1),
	(5, 'Sarana', 'Kasun', 'Meegoda', 'Panadura', '2020-07-08', '0761236784', 'sarana12@gmail.com', 'Karan', '0789012654', 1),
	(6, 'Sahan', 'Perera', 'Kalavana', 'Ratnapura', '2006-07-02', '0772345890', 'sahan@gmail.com', 'Saman', '0761235671', 1);

-- Dumping structure for table student_management_system.student_has_class
CREATE TABLE IF NOT EXISTS `student_has_class` (
  `student_student_no` int NOT NULL,
  `class_class_no` int NOT NULL,
  PRIMARY KEY (`student_student_no`,`class_class_no`),
  KEY `fk_student_has_class_class1_idx` (`class_class_no`),
  KEY `fk_student_has_class_student1_idx` (`student_student_no`),
  CONSTRAINT `fk_student_has_class_class1` FOREIGN KEY (`class_class_no`) REFERENCES `class` (`class_no`),
  CONSTRAINT `fk_student_has_class_student1` FOREIGN KEY (`student_student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.student_has_class: ~7 rows (approximately)
INSERT INTO `student_has_class` (`student_student_no`, `class_class_no`) VALUES
	(3, 1),
	(4, 1),
	(5, 1),
	(3, 5),
	(3, 6),
	(4, 6),
	(5, 6);

-- Dumping structure for table student_management_system.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_no` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(45) NOT NULL,
  `description` longtext,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`subject_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.subject: ~2 rows (approximately)
INSERT INTO `subject` (`subject_no`, `subject`, `description`, `price`) VALUES
	(1, 'Biology', 'AL Biology Class', 2500),
	(2, 'Maths', 'AL Maths Class', 2400),
	(5, 'Chemistry', 'AL Chemistry Class', 2500);

-- Dumping structure for table student_management_system.teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_no` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`teacher_no`),
  KEY `fk_teacher_gender1_idx` (`gender_id`),
  CONSTRAINT `fk_teacher_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.teacher: ~5 rows (approximately)
INSERT INTO `teacher` (`teacher_no`, `first_name`, `last_name`, `address`, `city`, `mobile`, `email`, `gender_id`) VALUES
	(1, 'Saman', 'Edirisinghe', 'Wellawa', 'Kegalle', '0771235678', 'saman@gmail.com', 1),
	(2, 'Kamal', 'Ranasinghe', 'Malkaduwawa', 'Kurunegala', '0761234567', 'kamal@gmail.com', 1),
	(5, 'Susila', 'Kottegoda', 'Digana', 'Kandy', '0775674321', 'susila@gmail.com', 2),
	(7, 'Kosala', 'Rajapakshe', 'Kanadulla', 'Kuliyapitiya', '0751234098', 'kosala@gmail.com', 1);

-- Dumping structure for table student_management_system.teacher_has_subject
CREATE TABLE IF NOT EXISTS `teacher_has_subject` (
  `teacher_teacher_no` int NOT NULL,
  `subject_subject_no` int NOT NULL,
  PRIMARY KEY (`teacher_teacher_no`,`subject_subject_no`),
  KEY `fk_teacher_has_subject_subject1_idx` (`subject_subject_no`),
  KEY `fk_teacher_has_subject_teacher_idx` (`teacher_teacher_no`),
  CONSTRAINT `fk_teacher_has_subject_subject1` FOREIGN KEY (`subject_subject_no`) REFERENCES `subject` (`subject_no`),
  CONSTRAINT `fk_teacher_has_subject_teacher` FOREIGN KEY (`teacher_teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table student_management_system.teacher_has_subject: ~8 rows (approximately)
INSERT INTO `teacher_has_subject` (`teacher_teacher_no`, `subject_subject_no`) VALUES
	(1, 1),
	(2, 1),
	(7, 1),
	(2, 2),
	(5, 2),
	(1, 5),
	(7, 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
