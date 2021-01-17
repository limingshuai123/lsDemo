/*
SQLyog v10.2 
MySQL - 5.5.40 : Database - productpos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`productpos` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `productpos`;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `nickName` varchar(50) NOT NULL,
  `phoneNum` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`name`,`nickName`,`phoneNum`,`email`) values (1,'张三','小三三','123213231','aa@163.com'),(2,'李四','李思思','123221133','bb@163.com');

/*Table structure for table `order_traveller` */

DROP TABLE IF EXISTS `order_traveller`;

CREATE TABLE `order_traveller` (
  `orderid` int(11) NOT NULL,
  `travellerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_traveller` */

insert  into `order_traveller`(`orderid`,`travellerid`) values (12,2),(13,2),(14,2),(12,3),(12,1),(14,1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderNum` varchar(50) NOT NULL COMMENT '订单编号',
  `orderTime` datetime NOT NULL COMMENT '时间',
  `orderStatus` int(11) NOT NULL COMMENT '订单状态',
  `peopleCount` int(11) NOT NULL COMMENT '订单人数',
  `payType` varchar(50) NOT NULL COMMENT '支付订单类型',
  `orderDesc` varchar(250) NOT NULL COMMENT '订单描述',
  `productId` int(11) NOT NULL COMMENT '产品id',
  `memberId` int(11) NOT NULL COMMENT '会员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`orderNum`,`orderTime`,`orderStatus`,`peopleCount`,`payType`,`orderDesc`,`productId`,`memberId`) values (12,'20002','2020-12-08 09:45:00',0,3,'1','南京欢迎你',3,1),(13,'20003','2020-12-30 10:50:00',0,1,'1','南京欢迎你',3,2),(14,'20004','2020-12-09 10:50:00',1,2,'1','南京欢迎你',3,2),(16,'20004','2021-01-02 23:26:00',1,2,'1','北京欢迎您',5,2);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`permissionName`,`url`) values (1,'角色管理','/role/findAll.do'),(2,'日志管理','/syslog/findAll.do'),(3,'用户管理','/user/findAll.do'),(4,'权限管理','/permission/findAll.do'),(5,'产品管理','/product/findAll.do'),(6,'订单管理','/order/findAll.do');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(20) NOT NULL,
  `cityName` varchar(20) NOT NULL,
  `departureTime` datetime NOT NULL,
  `productPrice` double NOT NULL,
  `productDesc` varchar(50) DEFAULT NULL,
  `productStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`productNum`,`productName`,`cityName`,`departureTime`,`productPrice`,`productDesc`,`productStatus`) values (1,'20001','天津一日游','天津','2020-12-01 05:25:00',4000,'游玩',1),(2,'20002','站南一日游','站南','2020-12-14 00:00:00',4220,'游玩         ',1),(3,'20003','南京一日游','南京','2020-12-21 18:45:00',200000,'游玩',1),(4,'20004','云南一日游','云南','2020-12-23 13:20:00',200000,'游玩',1),(5,'20005','北京天安门一日游','北京','2020-12-23 13:20:00',200000,'游玩',0),(7,'20006','贵州一日游','贵州','2021-01-06 09:05:00',300000,'游玩',1),(8,'20007','吉林一日游','吉林','2021-01-01 17:58:24',200,'游玩',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) NOT NULL,
  `roleDesc` varchar(50) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`roleName`,`roleDesc`) values (1,'ROLE_USER','ROLE_USER'),(2,'ROLE_ADMIN','ROLE_ADMIN'),(3,'ROLE_A','最大管理权限');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `permissionId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`permissionId`,`roleId`) values (1,2),(1,1),(1,3),(2,3),(3,3),(2,1),(3,1);

/*Table structure for table `syslog` */

DROP TABLE IF EXISTS `syslog`;

CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` datetime NOT NULL,
  `username` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `executionTime` int(50) NOT NULL,
  `method` varchar(300) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `syslog` */

insert  into `syslog`(`id`,`visitTime`,`username`,`ip`,`executionTime`,`method`,`url`) values (1,'2021-01-02 16:39:24','xiaozhang','0:0:0:0:0:0:0:1',4,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(2,'2021-01-02 16:39:26','xiaozhang','0:0:0:0:0:0:0:1',11,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(3,'2021-01-02 16:39:41','xiaozhang','0:0:0:0:0:0:0:1',7,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(4,'2021-01-02 16:39:49','xiaozhang','0:0:0:0:0:0:0:1',4,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(5,'2021-01-02 16:40:09','xiaozhang','0:0:0:0:0:0:0:1',6,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(6,'2021-01-02 16:40:13','xiaozhang','0:0:0:0:0:0:0:1',19,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(7,'2021-01-02 16:40:17','xiaozhang','0:0:0:0:0:0:0:1',20,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(8,'2021-01-02 16:40:18','xiaozhang','0:0:0:0:0:0:0:1',10,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(9,'2021-01-02 16:40:20','xiaozhang','0:0:0:0:0:0:0:1',23,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(10,'2021-01-02 16:40:21','xiaozhang','0:0:0:0:0:0:0:1',10,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(11,'2021-01-02 16:40:23','xiaozhang','0:0:0:0:0:0:0:1',12,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(12,'2021-01-02 16:40:25','xiaozhang','0:0:0:0:0:0:0:1',8,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(13,'2021-01-02 16:40:26','xiaozhang','0:0:0:0:0:0:0:1',13,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(14,'2021-01-02 16:40:27','xiaozhang','0:0:0:0:0:0:0:1',11,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(15,'2021-01-02 16:40:31','xiaozhang','0:0:0:0:0:0:0:1',19,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(16,'2021-01-02 16:41:03','xiaozhang','0:0:0:0:0:0:0:1',5,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do'),(17,'2021-01-02 16:41:06','xiaozhang','0:0:0:0:0:0:0:1',3,'[类名]com.controller.PermissionController[方法名]findAll','/permission/findAll.do'),(18,'2021-01-02 16:41:10','xiaozhang','0:0:0:0:0:0:0:1',11,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(19,'2021-01-02 16:41:14','xiaozhang','0:0:0:0:0:0:0:1',27,'[类名]com.controller.ProductController[方法名]findAll','/product/findAll.do'),(20,'2021-01-02 16:41:17','xiaozhang','0:0:0:0:0:0:0:1',24,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(21,'2021-01-02 16:41:27','xiaozhang','0:0:0:0:0:0:0:1',14,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(22,'2021-01-02 16:41:33','xiaozhang','0:0:0:0:0:0:0:1',5,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(23,'2021-01-02 16:41:35','xiaozhang','0:0:0:0:0:0:0:1',5,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(24,'2021-01-02 16:41:39','xiaozhang','0:0:0:0:0:0:0:1',3,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(25,'2021-01-02 16:41:46','xiaozhang','0:0:0:0:0:0:0:1',5,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(26,'2021-01-02 16:41:48','xiaozhang','0:0:0:0:0:0:0:1',7,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(27,'2021-01-02 16:41:49','xiaozhang','0:0:0:0:0:0:0:1',5,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(28,'2021-01-02 16:41:53','xiaozhang','0:0:0:0:0:0:0:1',8,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(29,'2021-01-02 16:41:55','xiaozhang','0:0:0:0:0:0:0:1',39,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(30,'2021-01-02 16:42:00','xiaozhang','0:0:0:0:0:0:0:1',9,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(31,'2021-01-02 16:42:04','xiaozhang','0:0:0:0:0:0:0:1',6,'[类名]com.controller.OrderController[方法名]findAll','/order/findAll.do'),(32,'2021-01-02 16:43:14','xiaozhang','0:0:0:0:0:0:0:1',10,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(33,'2021-01-02 17:02:57','xiaozhang','0:0:0:0:0:0:0:1',6,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(34,'2021-01-02 17:03:00','xiaozhang','0:0:0:0:0:0:0:1',11,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(35,'2021-01-02 17:04:45','xiaozhang','0:0:0:0:0:0:0:1',20,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(36,'2021-01-02 17:04:49','xiaozhang','0:0:0:0:0:0:0:1',17,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(37,'2021-01-02 17:15:34','xiaozhang','0:0:0:0:0:0:0:1',26,'[类名]com.controller.ProductController[方法名]addSave','/product/add.do'),(38,'2021-01-02 17:23:22','xiaozhang','0:0:0:0:0:0:0:1',6,'[类名]com.controller.ProductController[方法名]addSave','/product/add.do'),(39,'2021-01-02 17:23:41','xiaozhang','0:0:0:0:0:0:0:1',7,'[类名]com.controller.ProductController[方法名]addSave','/product/add.do'),(42,'2021-01-02 21:15:49','xiaoming','0:0:0:0:0:0:0:1',15,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(43,'2021-01-02 21:15:51','xiaoming','0:0:0:0:0:0:0:1',14,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(44,'2021-01-02 21:15:59','xiaoming','0:0:0:0:0:0:0:1',24,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(45,'2021-01-02 21:16:01','xiaoming','0:0:0:0:0:0:0:1',15,'[类名]com.controller.ProductController[方法名]addSave','/product/add.do'),(46,'2021-01-02 21:16:15','xiaoming','0:0:0:0:0:0:0:1',13,'[类名]com.controller.ProductController[方法名]addSave','/product/add.do'),(47,'2021-01-02 21:16:18','xiaoming','0:0:0:0:0:0:0:1',17,'[类名]com.controller.ProductController[方法名]addSave','/product/add.do'),(48,'2021-01-02 21:17:56','xiaozhang','0:0:0:0:0:0:0:1',24,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(49,'2021-01-02 21:18:01','xiaozhang','0:0:0:0:0:0:0:1',10,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(50,'2021-01-02 21:18:17','xiaozhang','0:0:0:0:0:0:0:1',23,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(51,'2021-01-02 21:18:21','xiaozhang','0:0:0:0:0:0:0:1',8,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(52,'2021-01-02 21:18:24','xiaozhang','0:0:0:0:0:0:0:1',12,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(53,'2021-01-02 21:18:29','xiaozhang','0:0:0:0:0:0:0:1',15,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(54,'2021-01-02 21:18:31','xiaozhang','0:0:0:0:0:0:0:1',8,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(55,'2021-01-02 21:18:34','xiaozhang','0:0:0:0:0:0:0:1',20,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(56,'2021-01-02 21:18:35','xiaozhang','0:0:0:0:0:0:0:1',11,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(57,'2021-01-02 21:18:37','xiaozhang','0:0:0:0:0:0:0:1',9,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(58,'2021-01-02 21:18:39','xiaozhang','0:0:0:0:0:0:0:1',7,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(59,'2021-01-02 21:18:59','xiaozhang','0:0:0:0:0:0:0:1',8,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(60,'2021-01-02 21:19:10','xiaozhang','0:0:0:0:0:0:0:1',21,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(61,'2021-01-02 21:19:11','xiaozhang','0:0:0:0:0:0:0:1',11,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(62,'2021-01-02 21:19:15','xiaozhang','0:0:0:0:0:0:0:1',15,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(63,'2021-01-02 21:19:26','xiaozhang','0:0:0:0:0:0:0:1',6,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(64,'2021-01-02 21:19:28','xiaozhang','0:0:0:0:0:0:0:1',12,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(65,'2021-01-02 21:19:33','xiaozhang','0:0:0:0:0:0:0:1',5,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(66,'2021-01-02 21:19:52','xiaozhang','0:0:0:0:0:0:0:1',10,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(67,'2021-01-02 21:58:43','xiaozhang','0:0:0:0:0:0:0:1',25,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do'),(68,'2021-01-02 21:58:58','xiaozhang','0:0:0:0:0:0:0:1',6,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do'),(69,'2021-01-02 21:59:03','xiaozhang','0:0:0:0:0:0:0:1',4,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do'),(70,'2021-01-02 21:59:07','xiaozhang','0:0:0:0:0:0:0:1',10,'[类名]com.controller.UserController[方法名]findAll','/user/findAll.do'),(71,'2021-01-02 23:26:39','admin','0:0:0:0:0:0:0:1',12,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(72,'2021-01-02 23:27:17','admin','0:0:0:0:0:0:0:1',9,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(73,'2021-01-02 23:27:17','admin','0:0:0:0:0:0:0:1',8,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(74,'2021-01-02 23:27:25','admin','0:0:0:0:0:0:0:1',14,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(75,'2021-01-02 23:27:31','admin','0:0:0:0:0:0:0:1',16,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(76,'2021-01-02 23:30:33','admin','0:0:0:0:0:0:0:1',29,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(77,'2021-01-02 23:30:43','admin','0:0:0:0:0:0:0:1',26,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(78,'2021-01-02 23:31:10','admin','0:0:0:0:0:0:0:1',12,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(79,'2021-01-02 23:31:45','admin','0:0:0:0:0:0:0:1',8,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(80,'2021-01-02 23:31:58','admin','0:0:0:0:0:0:0:1',18,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(81,'2021-01-02 23:32:11','admin','0:0:0:0:0:0:0:1',7,'[类名]com.controller.OrderController[方法名]addSave','/order/add.do'),(82,'2021-01-02 23:32:26','admin','0:0:0:0:0:0:0:1',30,'[类名]com.controller.ProductController[方法名]addSave','/product/add.do'),(83,'2021-01-02 23:32:57','admin','0:0:0:0:0:0:0:1',6,'[类名]com.controller.ProductController[方法名]addSave','/product/add.do'),(84,'2021-01-02 23:33:04','admin','0:0:0:0:0:0:0:1',36,'[类名]com.controller.UserController[方法名]addSave','/user/add.do'),(85,'2021-01-02 23:33:10','admin','0:0:0:0:0:0:0:1',36,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do'),(86,'2021-01-02 23:33:13','admin','0:0:0:0:0:0:0:1',11,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do'),(87,'2021-01-02 23:33:14','admin','0:0:0:0:0:0:0:1',4,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do'),(88,'2021-01-02 23:33:22','admin','0:0:0:0:0:0:0:1',40,'[类名]com.controller.PermissionController[方法名]findAll','/permission/findAll.do'),(89,'2021-01-02 23:33:29','admin','0:0:0:0:0:0:0:1',31,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(90,'2021-01-02 23:33:36','admin','0:0:0:0:0:0:0:1',22,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(91,'2021-01-02 23:33:40','admin','0:0:0:0:0:0:0:1',9,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(92,'2021-01-02 23:34:41','admin','0:0:0:0:0:0:0:1',18,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(93,'2021-01-02 23:38:12','admin','0:0:0:0:0:0:0:1',5,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(94,'2021-01-02 23:38:14','admin','0:0:0:0:0:0:0:1',8,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(95,'2021-01-02 23:38:16','admin','0:0:0:0:0:0:0:1',15,'[类名]com.controller.SysLogController[方法名]findAll','/syslog/findAll.do'),(96,'2021-01-03 00:20:18','xiaozhang','0:0:0:0:0:0:0:1',21,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do'),(97,'2021-01-03 00:20:40','admin','0:0:0:0:0:0:0:1',34,'[类名]com.controller.PermissionController[方法名]findAll','/permission/findAll.do'),(98,'2021-01-03 00:20:42','admin','0:0:0:0:0:0:0:1',7,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do'),(99,'2021-01-03 00:20:48','admin','0:0:0:0:0:0:0:1',8,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do'),(100,'2021-01-03 00:20:57','admin','0:0:0:0:0:0:0:1',4,'[类名]com.controller.RoleController[方法名]findAll','/role/findAll.do');

/*Table structure for table `traveller` */

DROP TABLE IF EXISTS `traveller`;

CREATE TABLE `traveller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `phoneNum` varchar(50) NOT NULL,
  `credentialsType` int(11) NOT NULL,
  `credentialsNum` varchar(50) NOT NULL,
  `travellerType` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `traveller` */

insert  into `traveller`(`id`,`name`,`sex`,`phoneNum`,`credentialsType`,`credentialsNum`,`travellerType`) values (1,'zhansan','男','1234567890',0,'123123213123',0),(2,'李四','男','1234567890',1,'123453242423',0),(3,'xiaohong','女','123488899',0,'123132131233',0);

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(70) NOT NULL,
  `phoneNum` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `loginTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

insert  into `userinfo`(`id`,`email`,`username`,`password`,`phoneNum`,`status`,`loginTime`) values (2,'@110.com','xiaozhang','$2a$10$tWnIysFISvNkSmSlLUvtcOuJSbuwiIUYTMRyxz4P2ULGTGDIDuSlS','15296758889',1,'2021-01-03 00:20:02'),(5,'@110.com','admin','$2a$10$BTXJDD0TU6D9t95O6xmZz.MfXok9Z6uxs0b74N9B734M4r2/HaH/O','15296758889',1,'2021-01-03 00:20:32'),(6,'@110.com','xiaoming','$2a$10$dfMKQP9fwhAeOlkTHq//3.arsljbLWwECSqXSAJHlWP./rcEP1gXq','15296758889',1,'2021-01-02 21:52:09');

/*Table structure for table `users_role` */

DROP TABLE IF EXISTS `users_role`;

CREATE TABLE `users_role` (
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_role` */

insert  into `users_role`(`userid`,`roleid`) values (5,3),(2,1),(2,2),(5,1),(5,2),(6,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
