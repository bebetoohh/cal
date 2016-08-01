# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.10-MariaDB)
# Database: cal
# Generation Time: 2016-07-26 02:11:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `title` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cal_brand
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cal_brand`;

CREATE TABLE `cal_brand` (
  `bid` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `uid` tinyint(4) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cal_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cal_category`;

CREATE TABLE `cal_category` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `pid` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `uid` tinyint(4) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sort` smallint(6) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cal_category` WRITE;
/*!40000 ALTER TABLE `cal_category` DISABLE KEYS */;

INSERT INTO `cal_category` (`id`, `pid`, `name`, `uid`, `status`, `sort`)
VALUES
	(1,0,'学术',0,0,10),
	(2,0,'文化',0,0,11),
	(3,0,'通知',0,0,12),
	(4,3,'学术',0,0,1),
	(5,1,'学术',0,0,1),
	(6,3,'学术',0,0,1),
	(7,2,'学术',0,0,1),
	(8,1,'学术',0,0,1),
	(9,1,'学术',0,0,1),
	(10,2,'学术',0,0,1),
	(11,3,'学术',0,0,1),
	(12,1,'学术2',0,0,1),
	(13,3,'学术',0,0,1),
	(14,3,'学术',0,0,1);

/*!40000 ALTER TABLE `cal_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cal_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cal_content`;

CREATE TABLE `cal_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `model` varchar(20) DEFAULT NULL COMMENT '类型',
  `did` int(11) DEFAULT NULL COMMENT '详情ID',
  `title` int(11) DEFAULT NULL COMMENT '标题',
  `thumb` int(11) DEFAULT NULL COMMENT '缩略图',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `department` int(11) DEFAULT NULL COMMENT '承办单位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cal_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cal_department`;

CREATE TABLE `cal_department` (
  `id` int(6) unsigned NOT NULL,
  `class` int(6) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `sort` tinyint(3) DEFAULT '10',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `cal_department` WRITE;
/*!40000 ALTER TABLE `cal_department` DISABLE KEYS */;

INSERT INTO `cal_department` (`id`, `class`, `title`, `description`, `status`, `sort`)
VALUES
	(104000,100000,'党委宣传部','',1,10),
	(103000,100000,'党委组织部','',1,10),
	(102000,100000,'纪委监察处','',1,10),
	(101000,100000,'学校办公室','',1,10),
	(105000,100000,'党委统战部','',1,10),
	(109000,100000,'校工会','',1,10),
	(110000,100000,'学校办公室','',1,10),
	(201000,200000,'人事处','',1,10),
	(202000,200000,'教务处','',1,10),
	(203000,200000,'科学发展研究院','',1,10),
	(204000,200000,'研究生处（研究生院）','',1,10),
	(205000,200000,'学生工作部（处）','',1,10),
	(206000,200000,'计划财务处','',1,10),
	(207000,200000,'审计处','',1,10),
	(209000,200000,'发展规划处','',1,10),
	(210000,200000,'基建处','',1,10),
	(211000,200000,'国资设备处','',1,10),
	(212000,200000,'国际合作与交流处（国际学院）','',1,10),
	(213000,200000,'保卫处','',1,10),
	(214000,200000,'离退休工作处','',1,10),
	(215000,200000,'继续教育学院','',1,10),
	(216000,200000,'后勤管理处','',1,10),
	(309000,300000,'食品科学技术学院','',1,10),
	(308000,300000,'水产学院','',1,10),
	(307000,300000,'工程技术学院','',1,10),
	(306000,300000,'经济管理学院','',1,10),
	(305000,300000,'园艺林学学院','',1,10),
	(304000,300000,'生命科学技术学院','',1,10),
	(303000,300000,'资源与环境学院','',1,10),
	(302000,300000,'动科动医学院','',1,10),
	(301000,300000,'植物科学技术学院','',1,10),
	(310000,300000,'理学院','',1,10),
	(311000,300000,'文法学院','',1,10),
	(312000,300000,'外国语学院','',1,10),
	(313000,300000,'体育部','',1,10),
	(401000,400000,'图书馆','',1,10),
	(402000,400000,'期刊社','',1,10),
	(403000,400000,'现代教育技术中心','',1,10),
	(404000,400000,'作物遗传改良国家重点实验室','',1,10),
	(405000,400000,'农业微生物学国家重点实验室','',1,10),
	(406000,400000,'高等教育研究所','',1,10),
	(407000,400000,'后勤集团','',1,10),
	(408000,400000,'资产经营公司','',1,10),
	(409000,400000,'附属学校','',1,10),
	(411000,400000,'校医院','',1,10);

/*!40000 ALTER TABLE `cal_department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cal_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cal_user`;

CREATE TABLE `cal_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `ecard` varchar(13) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(10) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  `department` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `create_time` int(10) DEFAULT NULL,
  `reg_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `account` (`ecard`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cal_user` WRITE;
/*!40000 ALTER TABLE `cal_user` DISABLE KEYS */;

INSERT INTO `cal_user` (`uid`, `ecard`, `email`, `name`, `password`, `department`, `class`, `create_time`, `reg_ip`)
VALUES
	(5,'105042003115','bebetoo5@mail.hzau.edu.cn','王五','b618880ba3c46301d2d1450580676599',103000,0,1469425052,'127.0.0.1'),
	(6,'105042003111','bebetoo@mail.hzau.edu.cn','王五','b618880ba3c46301d2d1450580676599',104000,0,1469425083,'127.0.0.1'),
	(7,'105042003112','bebetoo2@mail.hzau.edu.cn','王五','b618880ba3c46301d2d1450580676599',101000,0,1469425161,'127.0.0.1'),
	(8,'105042003113','bebetoo3@mail.hzau.edu.cn','王五','b618880ba3c46301d2d1450580676599',104000,0,1469425211,'127.0.0.1'),
	(9,'105042003114','bebetoo4@mail.hzau.edu.cn','王五','b618880ba3c46301d2d1450580676599',104000,0,1469425252,'127.0.0.1');

/*!40000 ALTER TABLE `cal_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(8) NOT NULL,
  `cid` tinyint(4) NOT NULL,
  `title` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table notices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notices`;

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `title` int(11) NOT NULL,
  `host` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
