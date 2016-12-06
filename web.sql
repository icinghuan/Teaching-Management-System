/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.0.18-nt : Database - web
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`web` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `web`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `aid` varchar(10) NOT NULL default '' COMMENT '管理员id',
  `pwd` varchar(20) NOT NULL default '' COMMENT '管理员密码',
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`aid`,`pwd`) values ('1','1');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `cid` varchar(10) NOT NULL default '' COMMENT '课程编号',
  `cname` varchar(20) NOT NULL default '' COMMENT '课程名',
  `point` varchar(10) NOT NULL COMMENT '学分',
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`cid`,`cname`,`point`) values ('1001','数据结构','4'),('1002','计算机网络','4'),('1003','数据库系统原理','3'),('1004','操作系统','4'),('1005','Java程序设计','2');

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `cid` varchar(10) NOT NULL COMMENT '课程编号',
  `sid` varchar(10) NOT NULL COMMENT '学生学号',
  `score` varchar(10) default NULL COMMENT '成绩',
  PRIMARY KEY  (`cid`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `score` */

insert  into `score`(`cid`,`sid`,`score`) values ('1001','1001','80'),('1001','1002','88'),('1001','1003',NULL),('1001','1004',NULL),('1001','1005',NULL),('1002','1002','83'),('1003','1003','92'),('1004','1004','70'),('1005','1005','88');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` varchar(10) NOT NULL COMMENT '学生学号',
  `sname` varchar(10) NOT NULL COMMENT '学生姓名',
  `pwd` varchar(20) NOT NULL default '123' COMMENT '学生密码',
  `major` varchar(20) NOT NULL COMMENT '学生专业',
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`sid`,`sname`,`pwd`,`major`) values ('1001','student1','123','计算机'),('1002','student2','123','计算机'),('1003','student3','123','计算机'),('1004','student4','123','计算机'),('1005','student5','123','计算机');

/*Table structure for table `teach` */

DROP TABLE IF EXISTS `teach`;

CREATE TABLE `teach` (
  `cid` varchar(10) NOT NULL COMMENT '课程编号',
  `tid` varchar(10) NOT NULL COMMENT '教师编号',
  PRIMARY KEY  (`cid`,`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teach` */

insert  into `teach`(`cid`,`tid`) values ('1001','1001'),('1002','1002'),('1003','1003'),('1004','1004'),('1005','1005');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `tid` varchar(10) NOT NULL default '' COMMENT '教师编号',
  `tname` varchar(10) NOT NULL default '' COMMENT '教师姓名',
  `pwd` varchar(20) NOT NULL default '123' COMMENT '教师密码',
  `depart` varchar(20) NOT NULL COMMENT '所在院系',
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`tid`,`tname`,`pwd`,`depart`) values ('1001','teacher1','123','计算机'),('1002','teacher2','123','计算机'),('1003','teacher3','123','计算机'),('1004','teacher4','123','计算机'),('1005','teacher5','123','计算机');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
