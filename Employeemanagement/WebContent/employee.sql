/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.1.36-community : Database - employeemanagement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`employeemanagement` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `employeemanagement`;

/*Table structure for table `educationqualification` */

DROP TABLE IF EXISTS `educationqualification`;

CREATE TABLE `educationqualification` (
  `eduquali_id` int(10) NOT NULL AUTO_INCREMENT,
  `qualification` varchar(10) DEFAULT NULL,
  `college` varchar(50) DEFAULT NULL,
  `percentage` int(5) DEFAULT NULL,
  `completionyear` int(6) DEFAULT NULL,
  `qualificationvalue` int(5) DEFAULT NULL,
  `qemp_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`eduquali_id`),
  KEY `qemp_id` (`qemp_id`),
  CONSTRAINT `qemp_id` FOREIGN KEY (`qemp_id`) REFERENCES `employeee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

/*Data for the table `educationqualification` */

insert  into `educationqualification`(`eduquali_id`,`qualification`,`college`,`percentage`,`completionyear`,`qualificationvalue`,`qemp_id`) values (46,'SSlc','GJC halagur',66,2008,1,'BSOL100'),(47,'Diploma','Aps college',80,2014,2,'BSOL100'),(48,'BE','National institute of engineering Mysore',82,2017,3,'BSOL100');

/*Table structure for table `employeee` */

DROP TABLE IF EXISTS `employeee`;

CREATE TABLE `employeee` (
  `emp_id` varchar(20) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `dateofjoin` varchar(20) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  `salary` int(10) DEFAULT NULL,
  `experience` varchar(10) DEFAULT NULL,
  `permanent_address` varchar(100) DEFAULT NULL,
  `present_address` varchar(100) DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `activestatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employeee` */

insert  into `employeee`(`emp_id`,`first_name`,`last_name`,`dateofjoin`,`department`,`salary`,`experience`,`permanent_address`,`present_address`,`contact_no`,`email`,`activestatus`) values ('BSOL100','Punith','Kumar','07/26/2018','Development',25000,'YES','#644 SRIMANTHANAGAR HALAGUR','#644 SRIMANTHANAGAR HALAGUR','9738562088','punithkumar325@gmail.com','Active');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
