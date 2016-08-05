# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.10-MariaDB)
# Database: cal
# Generation Time: 2016-08-05 04:31:39 +0000
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



# Dump of table cal_brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cal_brands`;

CREATE TABLE `cal_brands` (
  `bid` int(4) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `did` int(6) DEFAULT NULL COMMENT '部门ID',
  `name` varchar(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `thumb` varchar(100) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `uid` tinyint(4) NOT NULL COMMENT '用户ID',
  `listorder` int(3) DEFAULT '10',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cal_brands` WRITE;
/*!40000 ALTER TABLE `cal_brands` DISABLE KEYS */;

INSERT INTO `cal_brands` (`bid`, `did`, `name`, `content`, `thumb`, `create_time`, `status`, `uid`, `listorder`)
VALUES
	(1,104000,'科学传播暑期社会研修班通知','这里应该放简介','/Public/img/pic1.jpg',1469935854,1,9,10),
	(2,104000,'干部大讲坛','干部大讲坛咯','/Public/img/pic2.jpg',1469935931,1,9,10),
	(3,104000,'爱在西元前','哈哈哈哈哈这里应该放简介','/Public/img/pic3.jpg',1469935954,1,9,10),
	(4,104000,'爱在西元前yyy','哈哈哈哈哈这里应该放简介','/Public/img/pic4.jpg',1469983242,1,9,10),
	(5,104000,'爱在西元前ddd','哈哈哈哈哈这里应该放简介','/Public/img/pic5.jpg',1469983386,-1,9,110);

/*!40000 ALTER TABLE `cal_brands` ENABLE KEYS */;
UNLOCK TABLES;


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
  `title` varchar(120) DEFAULT NULL COMMENT '标题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `end_time` int(11) DEFAULT NULL COMMENT '承办单位',
  `ip` varchar(14) DEFAULT NULL,
  `limitday` tinyint(2) DEFAULT NULL,
  `modify_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cal_content` WRITE;
/*!40000 ALTER TABLE `cal_content` DISABLE KEYS */;

INSERT INTO `cal_content` (`id`, `model`, `did`, `title`, `thumb`, `create_time`, `status`, `uid`, `end_time`, `ip`, `limitday`, `modify_time`)
VALUES
	(5,'2',104000,'修改一下',NULL,1470212041,0,9,1470816841,NULL,7,NULL),
	(6,'2',104000,'看看modifytime和ip的更新',NULL,1470212061,0,9,1470384861,'127.0.0.1',2,1470236036),
	(7,'2',104000,'0',NULL,1470212084,0,9,1470298484,NULL,1,NULL),
	(8,'2',104000,'0',NULL,1470212111,0,9,1470298511,NULL,7,NULL),
	(9,'2',104000,'0',NULL,1470212118,0,9,1470298518,NULL,15,NULL),
	(10,'2',104000,'科学传播暑期社会研修班通知',NULL,1470212360,0,9,1470298760,NULL,7,NULL),
	(11,'2',104000,'科学传播暑期社会研修班通知',NULL,1470212510,0,9,1470298910,'127.0.0.1',30,NULL),
	(12,'2',104000,'0',NULL,1470232683,0,9,1470405483,'127.0.0.1',NULL,NULL),
	(13,'2',104000,'这是修改的文件',NULL,1470233204,0,9,1470406004,'127.0.0.1',2,NULL),
	(14,'2',104000,'这是修改的文件',NULL,1470235214,0,9,1470321614,'127.0.0.1',NULL,NULL),
	(15,'2',104000,'这是修改的文件11111',NULL,1470235359,0,9,1470840159,'127.0.0.1',5,NULL);

/*!40000 ALTER TABLE `cal_content` ENABLE KEYS */;
UNLOCK TABLES;


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


# Dump of table cal_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cal_events`;

CREATE TABLE `cal_events` (
  `id` int(8) NOT NULL,
  `cid` tinyint(4) NOT NULL COMMENT '海报类型',
  `bid` int(11) DEFAULT NULL COMMENT '品牌ID',
  `bno` int(11) DEFAULT NULL COMMENT '品牌期号',
  `title` varchar(255) NOT NULL,
  `content` blob,
  `address` varchar(255) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `host` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cal_notices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cal_notices`;

CREATE TABLE `cal_notices` (
  `id` int(11) NOT NULL,
  `title` varchar(120) NOT NULL DEFAULT '',
  `content` blob NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cal_notices` WRITE;
/*!40000 ALTER TABLE `cal_notices` DISABLE KEYS */;

INSERT INTO `cal_notices` (`id`, `title`, `content`)
VALUES
	(5,'0',X'30'),
	(6,'0',X'30'),
	(7,'0',X'30'),
	(8,'0',X'30'),
	(9,'0',X'30'),
	(10,'',X'266C743B702667743B68656C6C6F6467736466676466676473666764736667646667646667736466266C743B2F702667743B'),
	(11,'科学传播暑期社会研修班通知',X'266C743B702667743B68656C6C6F266C743B2F702667743B'),
	(12,'0',''),
	(13,'这是修改的文件',X'266C743B702667743BE8BF99E698AFE4BFAEE694B9E79A84E69687E4BBB6266C743B2F702667743B'),
	(14,'这是修改的文件',X'266C743B70207374796C653D2671756F743B746578742D616C69676E3A206C6566743B20746578742D696E64656E743A2032656D3B2671756F743B2667743BE8BF99E698AFE4BFAEE694B9E79A84E69687E4BBB6686168616861E68891E68993E587BBE5B0B1E59BB0E4BA86E5B0B1E69292E5BC80E688BFE997B4E788B1E4B88AE79A84E7A6BBE5BC80E688BFE997B4E788B1E9809FE5BAA6E5BC80E4BA86E688BFE997B4E5958AE68980E58F91E7949FE79A84E688BFE4BBB7E882AFE5AE9AE58F91E993BEE68EA5E788B1E4B88AE5AFB9E696B9E5B0B1E58DA1E4BA86E6B0B4E794B5E8B4B9E998BFE696AFE89282E88AAC266C743B2F702667743B'),
	(15,'这是修改的文件',X'266C743B70207374796C653D2671756F743B746578742D616C69676E3A206C6566743B20746578742D696E64656E743A2032656D3B2671756F743B2667743BE8BF99E698AFE4BFAEE694B9E79A84E69687E4BBB6686168616861E68891E68993E587BBE5B0B1E59BB0E4BA86E5B0B1E69292E5BC80E688BFE997B4E788B1E4B88AE79A84E7A6BBE5BC80E688BFE997B4E788B1E9809FE5BAA6E5BC80E4BA86E688BFE997B4E5958AE68980E58F91E7949FE79A84E688BFE4BBB7E882AFE5AE9AE58F91E993BEE68EA5E788B1E4B88AE5AFB9E696B9E5B0B1E58DA1E4BA86E6B0B4E794B5E8B4B9E998BFE696AFE89282E88AAC266C743B2F702667743B');

/*!40000 ALTER TABLE `cal_notices` ENABLE KEYS */;
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



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
