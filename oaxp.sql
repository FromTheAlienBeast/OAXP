/*
SQLyog v10.2 
MySQL - 5.5.49 : Database - oaxp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oaxp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `oaxp`;

/*Table structure for table `jbpm4_deployment` */

DROP TABLE IF EXISTS `jbpm4_deployment`;

CREATE TABLE `jbpm4_deployment` (
  `DBID_` bigint(20) NOT NULL,
  `NAME_` longtext,
  `TIMESTAMP_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_deployment` */

insert  into `jbpm4_deployment`(`DBID_`,`NAME_`,`TIMESTAMP_`,`STATE_`) values (1,NULL,0,'active');

/*Table structure for table `jbpm4_deployprop` */

DROP TABLE IF EXISTS `jbpm4_deployprop`;

CREATE TABLE `jbpm4_deployprop` (
  `DBID_` bigint(20) NOT NULL,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `OBJNAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `STRINGVAL_` varchar(255) DEFAULT NULL,
  `LONGVAL_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  KEY `IDX_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  CONSTRAINT `FK_DEPLPROP_DEPL` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_deployprop` */

insert  into `jbpm4_deployprop`(`DBID_`,`DEPLOYMENT_`,`OBJNAME_`,`KEY_`,`STRINGVAL_`,`LONGVAL_`) values (4,1,'QingJiaLiuCheng','langid','jpdl-4.4',NULL),(5,1,'QingJiaLiuCheng','pdid','QingJiaLiuCheng-1',NULL),(6,1,'QingJiaLiuCheng','pdkey','QingJiaLiuCheng',NULL),(7,1,'QingJiaLiuCheng','pdversion',NULL,1);

/*Table structure for table `jbpm4_execution` */

DROP TABLE IF EXISTS `jbpm4_execution`;

CREATE TABLE `jbpm4_execution` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ACTIVITYNAME_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `HISACTINST_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `INSTANCE_` bigint(20) DEFAULT NULL,
  `SUPEREXEC_` bigint(20) DEFAULT NULL,
  `SUBPROCINST_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  UNIQUE KEY `ID_` (`ID_`),
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `FK_EXEC_PARENT` (`PARENT_`),
  KEY `IDX_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `IDX_EXEC_PARENT` (`PARENT_`),
  KEY `IDX_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `IDX_EXEC_INSTANCE` (`INSTANCE_`),
  CONSTRAINT `FK_EXEC_INSTANCE` FOREIGN KEY (`INSTANCE_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUBPI` FOREIGN KEY (`SUBPROCINST_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUPEREXEC` FOREIGN KEY (`SUPEREXEC_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_execution` */

insert  into `jbpm4_execution`(`DBID_`,`CLASS_`,`DBVERSION_`,`ACTIVITYNAME_`,`PROCDEFID_`,`HASVARS_`,`NAME_`,`KEY_`,`ID_`,`STATE_`,`SUSPHISTSTATE_`,`PRIORITY_`,`HISACTINST_`,`PARENT_`,`INSTANCE_`,`SUPEREXEC_`,`SUBPROCINST_`,`PARENT_IDX_`) values (10001,'pvm',2,'ShaFuDaoYuan','QingJiaLiuCheng-1','',NULL,NULL,'QingJiaLiuCheng.10001','active-root',NULL,0,10006,NULL,10001,NULL,NULL,NULL),(20001,'pvm',2,'ShaFuDaoYuan','QingJiaLiuCheng-1','',NULL,NULL,'QingJiaLiuCheng.20001','active-root',NULL,0,20006,NULL,20001,NULL,NULL,NULL);

/*Table structure for table `jbpm4_hist_actinst` */

DROP TABLE IF EXISTS `jbpm4_hist_actinst`;

CREATE TABLE `jbpm4_hist_actinst` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSITION_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HTI_HTASK` (`HTASK_`),
  KEY `IDX_HTI_HTASK` (`HTASK_`),
  KEY `IDX_HACTI_HPROCI` (`HPROCI_`),
  CONSTRAINT `FK_HACTI_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HTI_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_hist_actinst` */

insert  into `jbpm4_hist_actinst`(`DBID_`,`CLASS_`,`DBVERSION_`,`HPROCI_`,`TYPE_`,`EXECUTION_`,`ACTIVITY_NAME_`,`START_`,`END_`,`DURATION_`,`TRANSITION_`,`NEXTIDX_`,`HTASK_`) values (11,'task',1,8,'task','QingJiaLiuCheng.8','ShaStudent','2019-06-11 14:58:16','2019-06-11 14:58:16',210,'jbpm_no_task_outcome_specified_jbpm',1,10),(13,'task',1,8,'task','QingJiaLiuCheng.8','ShaFuDaoYuan','2019-06-11 14:58:16','2019-06-11 16:18:21',4805038,'jbpm_no_task_outcome_specified_jbpm',1,12),(17,'task',1,14,'task','QingJiaLiuCheng.14','ShaStudent','2019-06-11 15:10:00','2019-06-11 15:10:00',51,'jbpm_no_task_outcome_specified_jbpm',1,16),(19,'task',1,14,'task','QingJiaLiuCheng.14','ShaFuDaoYuan','2019-06-11 15:10:00','2019-06-16 16:38:18',437298249,'jbpm_no_task_outcome_specified_jbpm',1,18),(10004,'task',1,10001,'task','QingJiaLiuCheng.10001','ShaStudent','2019-06-11 15:35:49','2019-06-11 15:35:49',88,'jbpm_no_task_outcome_specified_jbpm',1,10003),(10006,'task',0,10001,'task','QingJiaLiuCheng.10001','ShaFuDaoYuan','2019-06-11 15:35:49',NULL,0,NULL,1,10005),(20004,'task',1,20001,'task','QingJiaLiuCheng.20001','ShaStudent','2019-06-11 15:43:09','2019-06-11 15:43:09',107,'jbpm_no_task_outcome_specified_jbpm',1,20003),(20006,'task',0,20001,'task','QingJiaLiuCheng.20001','ShaFuDaoYuan','2019-06-11 15:43:09',NULL,0,NULL,1,20005),(30002,'task',1,8,'task','QingJiaLiuCheng.8','ShaYuanZhang','2019-06-11 16:18:22','2019-06-11 16:19:49',87749,'jbpm_no_task_outcome_specified_jbpm',1,30001),(40004,'task',1,40001,'task','QingJiaLiuCheng.40001','ShaStudent','2019-06-16 13:54:12','2019-06-16 13:54:12',108,'jbpm_no_task_outcome_specified_jbpm',1,40003),(40006,'task',1,40001,'task','QingJiaLiuCheng.40001','ShaFuDaoYuan','2019-06-16 13:54:12','2019-06-16 16:38:50',9878175,'jbpm_no_task_outcome_specified_jbpm',1,40005),(40010,'task',1,40007,'task','QingJiaLiuCheng.40007','ShaStudent','2019-06-16 13:54:12','2019-06-16 13:54:12',44,'jbpm_no_task_outcome_specified_jbpm',1,40009),(40012,'task',1,40007,'task','QingJiaLiuCheng.40007','ShaFuDaoYuan','2019-06-16 13:54:12','2019-06-16 13:58:11',239222,'jbpm_no_task_outcome_specified_jbpm',1,40011),(40014,'task',1,40007,'task','QingJiaLiuCheng.40007','ShaYuanZhang','2019-06-16 13:58:11','2019-06-16 16:39:50',9699613,'jbpm_no_task_outcome_specified_jbpm',1,40013),(50002,'task',0,14,'task','QingJiaLiuCheng.14','ShaYuanZhang','2019-06-16 16:38:19',NULL,0,NULL,1,50001),(50004,'task',0,40001,'task','QingJiaLiuCheng.40001','ShaYuanZhang','2019-06-16 16:38:50',NULL,0,NULL,1,50003),(50008,'task',1,50005,'task','QingJiaLiuCheng.50005','ShaStudent','2019-06-16 16:43:42','2019-06-16 16:43:42',39,'jbpm_no_task_outcome_specified_jbpm',1,50007),(50010,'task',1,50005,'task','QingJiaLiuCheng.50005','ShaFuDaoYuan','2019-06-16 16:43:42','2019-06-16 16:45:13',91649,'jbpm_no_task_outcome_specified_jbpm',1,50009),(50012,'task',1,50005,'task','QingJiaLiuCheng.50005','ShaYuanZhang','2019-06-16 16:45:13','2019-06-16 16:46:08',55332,'jbpm_no_task_outcome_specified_jbpm',1,50011);

/*Table structure for table `jbpm4_hist_detail` */

DROP TABLE IF EXISTS `jbpm4_hist_detail`;

CREATE TABLE `jbpm4_hist_detail` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HPROCIIDX_` int(11) DEFAULT NULL,
  `HACTI_` bigint(20) DEFAULT NULL,
  `HACTIIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  `HTASKIDX_` int(11) DEFAULT NULL,
  `HVAR_` bigint(20) DEFAULT NULL,
  `HVARIDX_` int(11) DEFAULT NULL,
  `MESSAGE_` longtext,
  `OLD_STR_` varchar(255) DEFAULT NULL,
  `NEW_STR_` varchar(255) DEFAULT NULL,
  `OLD_INT_` int(11) DEFAULT NULL,
  `NEW_INT_` int(11) DEFAULT NULL,
  `OLD_TIME_` datetime DEFAULT NULL,
  `NEW_TIME_` datetime DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_HDETAIL_HVAR` (`HVAR_`),
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`),
  KEY `FK_HDETAIL_HTASK` (`HTASK_`),
  KEY `FK_HDETAIL_HACTI` (`HACTI_`),
  KEY `IDX_HDET_HVAR` (`HVAR_`),
  KEY `IDX_HDET_HACTI` (`HACTI_`),
  KEY `IDX_HDET_HTASK` (`HTASK_`),
  KEY `IDX_HDET_HPROCI` (`HPROCI_`),
  CONSTRAINT `FK_HDETAIL_HACTI` FOREIGN KEY (`HACTI_`) REFERENCES `jbpm4_hist_actinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HVAR` FOREIGN KEY (`HVAR_`) REFERENCES `jbpm4_hist_var` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_hist_detail` */

/*Table structure for table `jbpm4_hist_procinst` */

DROP TABLE IF EXISTS `jbpm4_hist_procinst`;

CREATE TABLE `jbpm4_hist_procinst` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ENDACTIVITY_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_hist_procinst` */

insert  into `jbpm4_hist_procinst`(`DBID_`,`DBVERSION_`,`ID_`,`PROCDEFID_`,`KEY_`,`START_`,`END_`,`DURATION_`,`STATE_`,`ENDACTIVITY_`,`NEXTIDX_`) values (8,1,'QingJiaLiuCheng.8','QingJiaLiuCheng-1',NULL,'2019-06-11 14:58:16','2019-06-11 16:19:49',4893787,'ended','end1',1),(14,1,'QingJiaLiuCheng.14','QingJiaLiuCheng-1',NULL,'2019-06-11 15:10:00','2019-06-16 16:38:19',437299194,'ended','ShaYuanZhang',1),(10001,0,'QingJiaLiuCheng.10001','QingJiaLiuCheng-1',NULL,'2019-06-11 15:35:49',NULL,NULL,'active',NULL,1),(20001,0,'QingJiaLiuCheng.20001','QingJiaLiuCheng-1',NULL,'2019-06-11 15:43:09',NULL,NULL,'active',NULL,1),(40001,1,'QingJiaLiuCheng.40001','QingJiaLiuCheng-1',NULL,'2019-06-16 13:54:12','2019-06-16 16:38:50',9878265,'ended','ShaYuanZhang',1),(40007,1,'QingJiaLiuCheng.40007','QingJiaLiuCheng-1',NULL,'2019-06-16 13:54:12','2019-06-16 16:39:50',9938645,'ended','end1',1),(50005,1,'QingJiaLiuCheng.50005','QingJiaLiuCheng-1',NULL,'2019-06-16 16:43:42','2019-06-16 16:46:08',146365,'ended','end1',1);

/*Table structure for table `jbpm4_hist_task` */

DROP TABLE IF EXISTS `jbpm4_hist_task`;

CREATE TABLE `jbpm4_hist_task` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `OUTCOME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`),
  KEY `IDX_HSUPERT_SUB` (`SUPERTASK_`),
  CONSTRAINT `FK_HSUPERT_SUB` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_hist_task` */

insert  into `jbpm4_hist_task`(`DBID_`,`DBVERSION_`,`EXECUTION_`,`OUTCOME_`,`ASSIGNEE_`,`PRIORITY_`,`STATE_`,`CREATE_`,`END_`,`DURATION_`,`NEXTIDX_`,`SUPERTASK_`) values (10,1,'QingJiaLiuCheng.8','jbpm_no_task_outcome_specified_jbpm','ä¸å‚»å­',0,'completed','2019-06-11 14:58:16','2019-06-11 14:58:16',208,1,NULL),(12,1,'QingJiaLiuCheng.8','jbpm_no_task_outcome_specified_jbpm','å®‹å‚»å­',0,'completed','2019-06-11 14:58:16','2019-06-11 16:18:21',4805048,1,NULL),(16,1,'QingJiaLiuCheng.14','jbpm_no_task_outcome_specified_jbpm','ä¸å‚»å­',0,'completed','2019-06-11 15:10:00','2019-06-11 15:10:00',50,1,NULL),(18,1,'QingJiaLiuCheng.14','jbpm_no_task_outcome_specified_jbpm','å®‹å‚»å­',0,'completed','2019-06-11 15:10:00','2019-06-16 16:38:18',437298257,1,NULL),(10003,1,'QingJiaLiuCheng.10001','jbpm_no_task_outcome_specified_jbpm','ä¸å‚»å­',0,'completed','2019-06-11 15:35:49','2019-06-11 15:35:49',86,1,NULL),(10005,0,'QingJiaLiuCheng.10001',NULL,'å®‹å‚»å­',0,NULL,'2019-06-11 15:35:49',NULL,0,1,NULL),(20003,1,'QingJiaLiuCheng.20001','jbpm_no_task_outcome_specified_jbpm','ä¸å‚»å­',0,'completed','2019-06-11 15:43:09','2019-06-11 15:43:09',105,1,NULL),(20005,0,'QingJiaLiuCheng.20001',NULL,'å®‹å‚»å­',0,NULL,'2019-06-11 15:43:09',NULL,0,1,NULL),(30001,1,'QingJiaLiuCheng.8','jbpm_no_task_outcome_specified_jbpm','ç‹å‚»å­',0,'completed','2019-06-11 16:18:22','2019-06-11 16:19:49',87755,1,NULL),(40003,1,'QingJiaLiuCheng.40001','jbpm_no_task_outcome_specified_jbpm','ä¸å‚»å­',0,'completed','2019-06-16 13:54:12','2019-06-16 13:54:12',104,1,NULL),(40005,1,'QingJiaLiuCheng.40001','jbpm_no_task_outcome_specified_jbpm','å®‹å‚»å­',0,'completed','2019-06-16 13:54:12','2019-06-16 16:38:50',9878184,1,NULL),(40009,1,'QingJiaLiuCheng.40007','jbpm_no_task_outcome_specified_jbpm','ä¸å‚»å­',0,'completed','2019-06-16 13:54:12','2019-06-16 13:54:12',44,1,NULL),(40011,1,'QingJiaLiuCheng.40007','jbpm_no_task_outcome_specified_jbpm','å®‹å‚»å­',0,'completed','2019-06-16 13:54:12','2019-06-16 13:58:11',239230,1,NULL),(40013,1,'QingJiaLiuCheng.40007','jbpm_no_task_outcome_specified_jbpm','ç‹å‚»å­',0,'completed','2019-06-16 13:58:11','2019-06-16 16:39:50',9699617,1,NULL),(50001,0,'QingJiaLiuCheng.14',NULL,'ç‹å‚»å­',0,NULL,'2019-06-16 16:38:19',NULL,0,1,NULL),(50003,0,'QingJiaLiuCheng.40001',NULL,'ç‹å‚»å­',0,NULL,'2019-06-16 16:38:50',NULL,0,1,NULL),(50007,1,'QingJiaLiuCheng.50005','jbpm_no_task_outcome_specified_jbpm','ä¸å‚»å­',0,'completed','2019-06-16 16:43:42','2019-06-16 16:43:42',39,1,NULL),(50009,1,'QingJiaLiuCheng.50005','jbpm_no_task_outcome_specified_jbpm','å®‹å‚»å­',0,'completed','2019-06-16 16:43:42','2019-06-16 16:45:13',91656,1,NULL),(50011,1,'QingJiaLiuCheng.50005','jbpm_no_task_outcome_specified_jbpm','ç‹å‚»å­',0,'completed','2019-06-16 16:45:13','2019-06-16 16:46:08',55337,1,NULL);

/*Table structure for table `jbpm4_hist_var` */

DROP TABLE IF EXISTS `jbpm4_hist_var`;

CREATE TABLE `jbpm4_hist_var` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `PROCINSTID_` varchar(255) DEFAULT NULL,
  `EXECUTIONID_` varchar(255) DEFAULT NULL,
  `VARNAME_` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_HVAR_HPROCI` (`HPROCI_`),
  KEY `FK_HVAR_HTASK` (`HTASK_`),
  KEY `IDX_HVAR_HTASK` (`HTASK_`),
  KEY `IDX_HVAR_HPROCI` (`HPROCI_`),
  CONSTRAINT `FK_HVAR_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HVAR_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_hist_var` */

/*Table structure for table `jbpm4_id_group` */

DROP TABLE IF EXISTS `jbpm4_id_group`;

CREATE TABLE `jbpm4_id_group` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_GROUP_PARENT` (`PARENT_`),
  KEY `IDX_GROUP_PARENT` (`PARENT_`),
  CONSTRAINT `FK_GROUP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_id_group` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_id_group` */

/*Table structure for table `jbpm4_id_membership` */

DROP TABLE IF EXISTS `jbpm4_id_membership`;

CREATE TABLE `jbpm4_id_membership` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_MEM_GROUP` (`GROUP_`),
  KEY `FK_MEM_USER` (`USER_`),
  KEY `IDX_MEM_GROUP` (`GROUP_`),
  KEY `IDX_MEM_USER` (`USER_`),
  CONSTRAINT `FK_MEM_GROUP` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm4_id_group` (`DBID_`),
  CONSTRAINT `FK_MEM_USER` FOREIGN KEY (`USER_`) REFERENCES `jbpm4_id_user` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_id_membership` */

/*Table structure for table `jbpm4_id_user` */

DROP TABLE IF EXISTS `jbpm4_id_user`;

CREATE TABLE `jbpm4_id_user` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  `GIVENNAME_` varchar(255) DEFAULT NULL,
  `FAMILYNAME_` varchar(255) DEFAULT NULL,
  `BUSINESSEMAIL_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_id_user` */

/*Table structure for table `jbpm4_job` */

DROP TABLE IF EXISTS `jbpm4_job`;

CREATE TABLE `jbpm4_job` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKEXPTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` longtext,
  `RETRIES_` int(11) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `CFG_` bigint(20) DEFAULT NULL,
  `SIGNAL_` varchar(255) DEFAULT NULL,
  `EVENT_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_JOB_CFG` (`CFG_`),
  KEY `IDX_JOBRETRIES` (`RETRIES_`),
  KEY `IDX_JOBDUEDATE` (`DUEDATE_`),
  KEY `IDX_JOBLOCKEXP` (`LOCKEXPTIME_`),
  KEY `IDX_JOB_CFG` (`CFG_`),
  KEY `IDX_JOB_EXE` (`EXECUTION_`),
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`),
  CONSTRAINT `FK_JOB_CFG` FOREIGN KEY (`CFG_`) REFERENCES `jbpm4_lob` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_job` */

/*Table structure for table `jbpm4_lob` */

DROP TABLE IF EXISTS `jbpm4_lob`;

CREATE TABLE `jbpm4_lob` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `BLOB_VALUE_` longblob,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `NAME_` longtext,
  PRIMARY KEY (`DBID_`),
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  KEY `IDX_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  CONSTRAINT `FK_LOB_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_lob` */

insert  into `jbpm4_lob`(`DBID_`,`DBVERSION_`,`BLOB_VALUE_`,`DEPLOYMENT_`,`NAME_`) values (2,0,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0^\0\0Œ\0\0\0EÓä¨\0\0-ÈIDATxœíİoPçàñ­Ú—~çTªö”­”/[©ºxÏ»NmmJ®Ê^‘Ú\\ySu·^o²qÖ{Ù8q\"é6r\'–í$–…@\nrŒSø$G\"\"ÉÈÂ– \"H ?H€°È\Z4	#ĞÀì€4€á~3OOwÏ0£~˜îï§¢†îfúÍ·işd\Z\0\0\0ˆùİ\0\0\0€¥‚4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€4\0\0€Á»i855õIÌäääÄ,ä)µ¬¬ûx\0\0î;/¦¡ŠB)¿H$266‡ïÜ¹32ƒ,”§dYMV&\0€ëy+\rÍ(¼{÷®”ßá3[6îú×ÿûË¿ù×W>ûÏ?ùô?ıøS2äü*å©÷No…B²²lB \0\0wóJ\ZÚ£px$´åÀêäüÕ7×,û¼¿ıÕ»ÿ^^ŸŞäã;2äü*å)YAV“•oõ÷ƒA\0\0¸›\'ÒPuáøøøèèhQuöŠÜ¿şîº‡ßÚ·òJÿéàdÏCVÕdeÙäİêìP($;‘]Q‡\0\0À}ÜŸ†ª#‘H8Şğ»o>ı³‡\nJWÌ]„3‡l\"Êæ½½½CCC²+Ù!u\0\0\\Æåihva_ÀÿÒÿûŸ«__Şpyß|»P\rÙP6—|äo###Ô!\0\0p7§¡Ù…’q’t¯l~¼ì£…u¡\Z²¹ìDvuıúõÛ·oS‡\0\0ÀeÜœ†êó…áp8·ğ_V¿¾|‘]hÖ¡ìJv(udçês‡ºÿV\0\0€4pm\ZNMMMLLŒî9úêÓ?{hÁ×‘S^Y–î>òjOOÏĞĞ¼„¼‡\0\0À\\›†Ÿ|òÉİ»wƒÿ9øƒÜ¿¾×ïLÌã[)²ÛËí½½½¡PH^ˆ‰C\0\0àîLC5exçÎ‚²•ß]÷…@¤+¹v{¼KF@~F®EDD«!O]‹-‰®,›Ü–_ÇÕ\nÑ\r£ËÇãÇ¯Éneç>Ÿo``@^ˆ‰C\0\0àîLCcÊ0üşúÿşfÉ³}£Û†üÚıT¿†cËÕ’pgßhg_|5kıQcóWÙ­ì¼­­íÆòBL\0\0pa\ZšS†eu¿ú—5Ëš»?èµÆÆ‡òóºz<} _n5VşP­Ó]òáõè°V6W¸Û¤Ùÿ¾ì¼¤6ïêÕ«L\0\0wpa\ZªÖ„B¡ìß>¹rã¯N_<ó‘\ZÓj\\	ÈcµäÌ•èˆ-Œ=­ûy:¶<ö«ù¬úU\Z<-;_÷Û\'ÛÛÛoŞ¼)/§nd£û¯\0\0X8w¦áØØØà`ô(R‡m·şĞÖ·şp1>bkeáÅ¾?+ÜªmSËÕƒ¾Øj±¢›Ä´Y›ÿAºP^¢¥¥Åï÷ËËÉ‹’†\0\0 £¹0\r\'\'\'ÃáğíÛ·ŸzùÏ·şIóšo¼û-êA¹P~¾ß[Ò\"Õòµ¹U|‰m¡¬,;——8{ö¬Ïç“—“•—Öı×\0\0,œÓP}Ğ°¿¿ÿÉ>}°ñ×§¯<í¯8}­âŒß\ZÑ%şƒgüÕƒÓÆÂƒ²rlõ”úU\rc5sMY(;——8uêÔ•+WäåÔÇ\ruÿõ\0\0\0çÎ4éëëû§êØå=õ¾}2\Zb?WÕ¯e±_Ë\Z®–%>+Ë£KÔÂ†«ææeÆ¯Ñõ£+Ô^Ú#/ÑĞĞĞÑÑ!/\'/J\Z\0€Œæò4ü}ûïTrü£½ñQ’ğëÕè¯\'>Ú{âê^õàøÕ½Ñ_ÕBcıø³W÷Ú÷#ëÔ´ï’—¨¯¯\'\r\0€;¸9\rŸ|áÓe§6E“îj‰ÑyWUğIí©F,‰Ga‰zV=6º0Ş‚\'âÕh¬cl»wßÉMò’†—/_&\r\0€¸9\rŸzéÏ7WüP]nğ™—‰ËÁêjr½Ïºšl®Po­¦V0Ç>Ûƒ}²sy	Ò\0\0¸†›Óğû9übÛÿ²ûäLwÂ—QR/™{¹mÈÎå%¸ \0\0\\ÃÍi¸vÛÿşAî_™·­Qw®i1ï_c>¾i-oI^íHKt|<b›ÈÎå%ø\Z\n\0\0p\rw¦¡ºyÍ»5Ùÿòâ9ÑYÒv«.~;kc´Û~ÆŸ­k7Wè«³6‰ß.;~gì:µ¤¾£Dv¾ûÈkÜ¼\0\0¸†ÓĞ¼åµÏçû^ö_nz÷ÿÿÏø_yÆ°ş{Ş`â³3~5şuí)Y\"»•9r„[^\0\0×pa\Zšÿ(Ïï÷çïıî3¯ı·îá¯‡Z¯Ø-?C­İ¡££#şkìYc¡,V#ºÄØ0úàCµ‡ØN>”İÊÎ;Æ?Ê\0\0®áÎ4ŒD\"¡PèæÍ›mm¾Ÿóˆ4ÜÇ£}£æÏÇÆ¯áNõTŸ±Bgüq§µZ.—ÊnW½W__ßŞŞ./$/\'/J\Z\0€ŒæÂ4œššR7¸zõêo¯yúghÛ{;Ò¿v;r- c¼+ú3Òu{\\=îŠşï2\\»[3º‰Z9:®ÅF×‰ö½²Ãï­©®®>wîœ¼„¼ú ¡¼´î¿\0\0`á\\˜†Ó±‰Ã»wïƒÁ7n´µµ­ßùõÕ¯/ïû(8Ù³È!;‘]É>\\__/;——’—cÊ\0\0d:w¦¡}âĞçó577¯yëï_Ùüxª:¼>¯.”È®***jkke·²s¦\0€k¸3\r§ã‡¡P¨···£££áÜ1IºÕ¯/o¸¼o!ó…=²¡l.;9td_MMMcc£ìVv./Á”!\0\0p×¦¡š8\Z\Zêéé¹téÒéÓ§sv~ıéŸ=TPºb¾i(›È†²ùÁƒ«««eW²CÙ­ì\\^‚)C\0\0à®MÃéØÄáøøx8×¯_ooo—¤+¬zù¹ıİu¿µoå•şÓs¡¬ «ÉÊ²ÉÎÃ/WTTÔÔÔÈNdW²CÙ­ì\\^‚)C\0\0ànNÃ©©)u#›‘‘‘Û·oKÌ]ºt©±±±öÇ\nö­ü~Î#ß\\³ì?òşöWïş{y}şyÿ‘ïtÈò«,”§dYMV.?xàğáÃµµµ²¹ìDv%;”İªÖ0e\0\0ÜÁÍi8X‡@ §§§£££¹¹¹¾¾¾ºººäØ/s¿¹jãßüë+ŸıçŸ|úŸ~ü)ò@~•…ò”¬P^^.Q(+Ë&²¡l.;‘]Ñ…\0\0À}\\†Ó¶:‡ÃCCC½½½>Ÿ¯­­íÜ¹sR{Ç;räHUU•ôß{ï½w(FÈ¯²P’d5YY6‘\resÙ‰ìŠ.\0\0îãş4œ×áøøøèèh(\Z¸qãÆÕ«WÛÛÛ[ZZÎ={êÔ©†††zùUÊS²‚¬&+Ë&²¡l.;QŸ/¤\0€Ëx\"\r§ãu811q÷îİ;wîƒAé¼›7oúı~ŸÏwåÊ•˜Ë1ê±,”§dYMV–MdCÙ\\vB\0\0Wra\ZNnÍ®èLùTR †B¡ÁÁÁÛ·o÷÷÷÷Í å)YAV#\n\0€x+\r£OÉsñ@ŒD\"cccápXÊodY(OÉ\n²\ZQ\0\0¼Àñ4œ#ÜÒ²şl[tVdggo­¨0ŸS3ˆbrrrbò”Z‡(\0\0^à™4¼‡½UUUIÎç¥\0\0\0\\Åé4Ì6Å\n-v…×¾ QlªÏş´µÀ\\ÛÚÅÖ“øõ¬zÊ¾ß9Ó°   ¦ñ\0\0È,:g\r£œKú%õú†Ö#cå­_ÍÈä$\r\0\0f§1\r“3ÍÌ½YÖ7M˜7TìÆ¶¨HÑ…)^3i\0\0<.ƒÒ03.\Z›Û&ÆâÖ­)\'!çLÃ-[¶Ü¾}{Á\0\0@¦Ë Ê¶Ä±4>¬xr¶kÌ©ö8g\ZîŞ½Ûï÷/ö\0\0ÈXÎß×0~I8ék%)»0q}ëbrÅI+ñÌ]ÄwH~.éz4i\0\0šoy½`¤!\0\0ğ8ÒĞRTTtõêUİG\0\0 \rih©¬¬lmmÕ}\0\0\0Ú†Ò\0\0xih!\r\0€Ç‘†–ªªª¦¦&İG\0\0 \rih©‹Ñ}\0\0\0Ú†Ò\0\0xih!\r\0€Ç‘†–†††cÇé>\n\0\0\0mHCKkkkee¥î£\0\0\0Ğ†4´†\0\0ÀãHCi\0\0<4´´µµ8p@÷Q\0\0\0hC\ZZü~ÿîİ»u\0\0€6¤¡…4\0\0G\ZZHC\0\0àq¤¡åÆ;wîÔ}\0\0\0Ú†Q7nÌN´mÛ6İ\0\0à4Ò0ª¸¸ØŞ…‡*--Õ}P\0\0\0N#\r£nİº•““£ºpÃ†\r………~¿_÷A\0\0844lÙ²E¥aYYW“\0€7‘††ÖÖÖõë×«4ljjÒ}8\0\0\0\Z†–¼¼<IÃ‚‚‚‰‰	İÇ\0\0 ih©©©‘4<zô¨î\0\0Ğƒ4´LLLäääŒŒŒè>\0\0\0=HC\0\0\0HC\0\0\0HC\0\0\0HC\0\0\0HC\0\0\0HC\0\0\04§áÔÔôûz^«lÎÊ¯’ñ§«v0–çUÊ[ñ|é™âF_82©÷\0\0OÑ–†ƒw\"/8÷à»µ§ØßÙuÜ×?¬ë4\0\0OÑ“†E¾ekŠTú<š[¾¶¢¹ºícCÃ“£cÓê­x£ú¢9úÀs…¯U6OMi9W\0\0ÀCœNCé›çKÏ¨âyü­#­İAí)¶”GGïğSÛkÕÛõÄojïD>_\0\0ÀSœNCÕ…<W¸ùØeíá•)£ºícuå=+¿Š¹C\0\0pÿ8š†E>Õ…Ò:Ú{+³FkwP]‚ùÀ9\'O\0\0ğçÒğæPXÅÍW´—V&ıRÕò¶t;k\0\0ÀSœKCu)ù‰·k´7VæµÍê²²cg\r\0\0xŠCiLª/¾w²˜14<©f^Ï_gâ\0\0¤ŸCiXŞâWÓ]Úë*ÓÇŠwä\\w¨Ù™\0\0<Å¡4\\U\ršÜªVíi•éã½ó=òN~qC¹3\'\0\0xŠCi¨îŞÌ“?ú‚y\'—­)ræÄ\0\0Oq(\r?÷ó	šŞaíiå‚¡>µéÌ‰\0\0âP\ZªÿçÁÿÁ#\r\0ÀRæh\ZŞ§Tò•¬ÊÚÔèT™5æe­Ú{Mg\Zª7Ó™\0\0<%óÒ0\Z‚ÊÊı¾ù§áÌÍIC\0\0\0%ÃÒ0\ZvfÒ5äç5Ì/\rSn>zmÿŠ¬üúûš†ó{	Ò\0\0è‘aiX¿)Ëè¹¤à»·4L¹9i\0\0 dX\Z&Lû%¦¡dŸbÆŸ¹ÄÇ›7ägeY«É&+Jz­§â+[»Š²ÒĞZxu;á`_‚4\0\0KV†¥áèXïŞ•ÑÄ².şñAëâ²ª4ózqÂ<_ŠÍíSz)Ó0é2´™†²Ü\\Ùœ¹L}0Ì\Z\0€LqihÖ^–=Ñ¬Ù8{„E\'O%ÎÜü¥a´&m››¡iT¦ÅìÈ™C\Z\0€L¡i8c¢.¹ÆbİfLõ%µ]òæ‹IÃ?òÁGÒ\0\0d”ÌJC©1ës~s¦at^Ğè¶ØGıbSonï6Ûµc+.£´”Ğ>[9÷×¥IC\0\0Q2+\r§ã×‚g¿¯a<Â¬ûnÚo›ŞK±¹ui8ºs…U{Kò21K}Hq^Ê¯¡Ø¿é’âê¶ı%HC\0\0°De\\\Z2HC\0\0p¿†™7HC\0\0pŸ†™7HC\0\0pŸ8”†ËÖIÍtôkï*õf:sâ\0\0€§8”†Ëó*¥fNtökï*y\'|a·3\'\0\0xŠCiø­µ4;N\\ÑŞU™>Îvä|x]™3\'\0\0xŠCiøvİe	š§¶×jO«Lk+šå\\UÔàÌ‰\0\0âP\Zv\rKĞ<ğ\\¡ ¬½®2z<š[.ïäû{œ9q\0\0ÀSJCñÄoj¤i~TrF{]eîxç´OŞÃekŠF#“8\0\0àÎ¥aKw@Mí\nho¬L}ÁˆúnòÛu—;k\0\0ÀSœKCñß—²ùÜÏK¸¬<ß14<™•_%ïŞò¼Ê©)\'O\Z\0\0ğGÓ0™Tw±yx]YkwP{oeÊèFT.[SÔ50ìä)\0\0âh\Z\n_ÿğ£ÊÕù6»¬½º–ş(kò«ëÈòµ\\8|¾\0\0€§8†\"|wò©ØmÕôáÚŠf>}8stô¿Q}Q}Y†ô4ó…\0\0à~Ó†bjjºêBt¡ê5ÔÜcæÛòæï/òùB\0\0à\0=i¨Hî”Ÿ÷¯*j \ng_ØıÌ®ãÅ>îS\0\0£3\r\0\0°¤†\0\0\00¸3\r\'·fWtê>\n\0\0€ã©4Œ.6\0\0\03èHÃùÎéÍ0å²0¾,úüÖ“Ü#\0\0 ‡Òpq»\0\0p?\ri˜pU×v•7U­uV$­o-0×¶vaLZå§JŞï¬³†•••éüS\0\02ŠæYÃ„F›-ØìS|Ö#cå3€ñEÑŒœ™›Ñ¥³\\N–Œ\\è_\0\0ñô¦arÕ™¹7Ëúæ¯	ó†j}ÃØ©º06ç8û¥dÒ\0\0xYf¥a,g\\46·MŒÅ­[“&!ïáË\'¤!\0\0ğ²Ìº l»@lMÿNœí\ZsÂSwg\"Ò\0\0x™–û\ZÆ/	\'}­dÖr³Ö·.&Wœ´ÓÜE|äçäû×]f}5Ò\0\0x™;oy½`¤!\0\0ğ2Ò0i\0\0¼Œ4L@\Z\0\0/#\r†\0\0ÀËHÃ¤!\0\0ğ2Ò0i\0\0¼Œ4L@\Z\0\0/#\r†\0\0ÀËHÃ¤!\0\0ğ2Ò0i\0\0¼Œ4L@\Z\0\0/#\r†\0\0ÀËHÃ¤!\0\0ğ2Ò0i\0\0¼Œ4L@\Z\0\0/#\r†\0\0ÀËHÃ¤!\0\0ğ2Ò0i\0\0¼Œ4ŒÚ¸qcv¢mÛ¶é>(\0\0\0§‘†QÅÅÅö.<tèPii©îƒ\0\0p\ZiuëÖ­œœÕ…6l(,,ôûıº\n\0\0Ài¤¡aË–-*\rËÊÊ¸š\0\0¼‰44´¶¶®_¿^¥aSS“îÃ\0\0Ğ€4´äååI\ZLLLè>\0\0\0\rHCKMM¤áÑ£Gu\0\0€¤¡ebb\"\'\'gddD÷\0\0\0èA\Z\0\0À@\Z\0\0À@\Z\0\0À@\Z\0\0À@\Z\0\0À@\Z\0\0À 3\r§¦¦ß¿ĞóZesV~•Œ?]µƒ!cy^¥¼Ï—)nô…#“\ZO\0\0ğ\Z=i8x\'òòs¾°[{‡-ıñ]Ç}ıÃZN\0\0ğ\Z\riXÔè[¶¦HuÏ£¹åk+š«Û>–14<9:6ÍPïÆÕÍ™Ô+|­²yjÊùs\0\0¼ÅÑ4”¸y¾ôŒÊÇß:ÒÚÔŞaK|tô?µ½V½cOü¦fğNÄÉó\0\0¼ÆÑ4T]øÀs…›]Ö^]4ªÛ>Vß³ò«˜;\0\0÷siXÔèS](¡£=¶2n´vÕUø—œsì”\0\0¯q(\ro…UÙì8qE{feè8ÑÙ/a-ïaKwÀ™³\0\0¼Æ¡4T—’Ÿx»F{`eôX[Ñ¬.+;sÖ\0\0€×8‘†áÈ¤šîâ{\'‹CÃ“jòõüu&\0@ú9‘†å-~5×¥=­\\0V¼Û oæºCÍœ8\0\0à5N¤áª¢hÍäVµjï*Œ÷Î÷È›ùÅ\råœ8\0\0à5N¤¡ºu3_LNËèFäÍ\\¶¦È\0\0¼Æ‰4üÜÏK¤f:z‡µw•;†úà¦\'\0\0xi¨ş™ÿ4\0\0Kœsi¸àò•¬ÊÚÔ¨=È–ÎPï§\'\0\0xÍ’KÃh*+÷ûæ›†\rùY6y\r÷´ÚŠ’Ş…$Úµı+²Ví½f.éİ»r¡»\"\r\0ÀÒ°´Ò0Zñ\"”€Sm7¿447¿çÕê7eİÓV3FtCóÀ¢¥˜_ÿ»4\0\0÷ÏÒJC‰­™S}÷;\rÕë.dÂÏ–ƒÜi\0\0–’¥•†	³†‰i¢K¼Ll.±Âqîæ3ŸY¶%)vk¿ÌxÚØÿl8çngû»HC\0\0 ËÒJCõ‰½¤Ïÿ©,³..Çó.ŞRyægş>D]x¯ih¶]ªİ&kÒGc»ª/Ye¾Êl¯˜z·3ÿ.Ò\0\0è³ÔÒĞì\'£íF“.(Û?Ò}œ8å–YÃ»ÖjŠ™Â„–µ>e8Û¬áÌ£õï\"\r\0€&K3\rÊ)UBÅ‚Ì¨.[º-4\rã«¥ÜíÜi˜üQÈT¯˜úhIC\0\0°Ô,©4”l²®ÕÎ™†ÑiE+gŸ5´]¨µõÙ¬ßPN½Û¹.(ÏHÃT¯8ûnIC\0\0°”,©4œ_Jı¾†ñ„²¾²iÿ³†¶®Ú[b›5œå¾†©wkÿIbÎLÃ”¯˜r·¤!\0\0Xj–Z\Z2HC\0\0 \ri˜yƒ4\0\0÷	i˜yƒ4\0\0÷‰i¸lM‘¤LGï°ö¨rÇPï§\'\0\0xi¸<¯RRæDg¿ö¨rÇ7óÁv;pâ\0\0€×8‘†ßÚQ+5³ãÄíQå‚q¶+ oæÃëÊ8q\0\0ÀkœHÃ·ë.KÍ<µ½V{W¹`¬­h–7sUQƒ\'\0\0xiØ50,5óÀs…ş°ö´Êôñhn¹¼™ï_ìqàÄ\0\0¯q\"\rÅ¿©‘ ùQÉíi•ÑãÓ>y—­)\ZL:sâ\0\0€§8”†-İ5qx¶+ =°2tô#ê»Éo×]væ¬\0\0¯q(\rÅw~w\\²æs?/á²òÆĞğdV~•¼Ëó*§¦;i\0\0À[œKÃpdRİÅæáue­İAí±•A£/Q]¸lMQ×À°c§\0\0xsi(|ıÃn(W·åÛ|ì²öäÊˆQÖäW×‘åMk¹pò|\0\0¯q4\rEøîäS±ÛªéÃµÍ|ú0åèè~£ú¢ú>²Ijæ\0Àıæt\ZŠ©©éª=Ò…*zÔPcUÌIïÌ›¿¿Èç\0€4¤¡\"­S~Ş¿ª¨(L9|a÷3»7ú¸O\r\0\0pŒ¶4\0\0ÀRC\Z\0\0ÀàÎ4œÜš]Ñ©û(\0\0\02Œ·Ò0º<fëIî\0\0LG\ZÎwNoşs€©·è¬0Š0ú4q\0\0ÌKi¸˜=\0\0x€†4Ì6ÅêÌ¼È_¨³\"i}k¹¶µÛ´ zV=•´ßÙË°²²2)\0\0@fÑ<k˜piw¶ë¼ö’ë¬°+§½ø¢hFÚŸŠgå¬3†òÜ\"ş0\0\0€Ì¦7\r“«ÎÌ½YÖ7M˜7TìÆ¶¨¨˜µ““ÑD\Z\0\0/Ë¬4ŒEàŒ‹Ææ¶‰±¸uëì_6™í’2i\0\0¼,³.(Ûfûb%h|Xñäl×˜öh~A™YC\0\0€”´Ü×0~I8ék%sÎñ©õ­‹É\'­À4wßA ù9«,ç~%Ò\0\0x™;oy½`¤!\0\0ğ2Ò0i\0\0¼Œ4L@\Z\0\0/#\r†\0\0ÀËHÃ¤!\0\0ğ2Ò0i\0\0¼Œ4L@\Z\0\0/#\r†\0\0ÀËHÃ¤!\0\0ğ2Ò0i\0\0¼Œ4L@\Z\0\0/#\r†\0\0ÀËHÃ¤!\0\0ğ2Ò0i\0\0¼Œ4L@\Z\0\0/#\r†\0\0ÀËHÃ¤!\0\0ğ2Ò0i\0\0¼Œ4ŒÚ¸qcv¢mÛ¶é>(\0\0\0§‘†QÅÅÅö.<tèPii©îƒ\0\0p\ZiuëÖ­œœÕ…6l(,,ôûıº\n\0\0Ài¤¡aË–-*\rËÊÊ¸š\0\0¼‰44´¶¶®_¿^¥aSS“îÃ\0\0Ğ€4´äååI\ZLLLè>\0\0\0\rHCKMM¤áÑ£Gu\0\0€¤¡ebb\"\'\'gddD÷\0\0\0èA\Z\0\0À@\Z\0\0À@\Z\0\0À@\Z\0\0À@\Z\0\0À@\Z\0\0ÀpÓpjjúı=¯U6gåWÉøÓU;é\ZËó*å-}¾ôLq£/™¼\'\0\0xÊ}IÃÁ;‘—œ{ğ…İÚÊ#ã;»ûú‡ïÇ©\0\0’ş4,jô-[S¤’åÑÜòµÍÕmË\Z›f¤e¨·ôê‹ætìÏ¾VÙ<5•öó	\0\0<$i(]ò|éU*¿u¤µ;¨=¡¼0:z‡ŸÚ^«Şö\'~S3x\'’Æs\n\0\0<%i¨ºğç\n7»¬=˜¼6ªÛ>VWğ³ò«˜;\0\0“¶4,jô©.”FÑŞIŞ­İAu)ÿåçÒuZ\0€§¤\'\ro…U”ì8qE{!yyœèì—:—ÑÒHË™\0\0’4T—’Ÿx»F{1ÖV4«ËÊi9³\0\0ÀSÒ†áÈ¤š©â{\'Ka\rOªÜó×™8\0\0ó“†4,oñ«i*íUÄPcÅ»\rrFÖj^üÉ\0\0’†4\\U\r‘ÜªVíIÄPã½ó=rF¾¸¡|ñ\'\0\0xJ\ZÒPİu™/&/ÑŒÈY¶¦hñ\'\0\0xJ\ZÒğs?/‘éèÖDs¨O.şä\0\0OIC\ZªÿÃÁÿÁ[Rƒ4\0\0¶4¼¯¡ã+Y•µ©Q{o-ñC²uRr\0€§,Å4ŒV—²r¿o^vmÿŠ¬U{¯™Kz÷®ÌZQÒ»¸ã‰î$‰ì“4\0\0î³äÒ0š\\ñ\"mÈÏk˜O\ZM×oÊ²ÖŒ–b~}z««!_i\0\0ÜgÉ¥¡´ÊÁä^¼Ç³å ìjÑS†I£1/>+I\Z\0\0÷Yri˜0k˜˜†ÑÁ³Í%öJ3Šp¶FŒOû¥Ü|¶Š„ËÓ÷~HtÍ%ûó®ƒ“†\0\0@%—†ægûì~êÓ‡ÖÅeÕvñËÍöÉ<3şêKV™{H†©6OıB©šõŞ)åšö½ÅV \r\0€~K0\rÍ´ÊÊJyõÖş	Âèã™3|*.­OÎ6k8só9_(¡ŞîıR­=BÛ72k\0\0–‚%›†	Q5[]Å#/©´’?˜*\rSo>Kğ¥ø¦ó½i\0\02ÅRKCi&+’æLÃè´¢QWR{Ys¥¡íê­Yo©7O™†s|üñ^)å>£4ä‚2\0\0Xb–Z\ZNÇ/%Ï~_C{±_øØ?÷¬¡mŸ«ö–Øî>3có/d»@<ë}\rç<¤9f\"ù\Z\n\0\0XR–`\ZzoÜ‡û/’†\0\0`HCMÃú.sâmºIC\0\0 i¨mXw@œñAFÒ\0\0h‘†4\\¶¦H*¤£wX{l1Ì¡NÊâO.\0\0ğ”4¤áò¼J©ıÚ{ˆa9#¾°{ñ\'\0\0xJ\ZÒğ[;j%Dvœ¸¢½‡jœí\nÈyx]ÙâO.\0\0ğ”4¤áÛu—%DÚ^«=‰j¬­h–3²ª¨añ\'\0\0xJ\ZÒ°k`XBäç\nıaíUÄñhn¹œ‘÷/ö,şä\0\0OIC\ZŠ\'~S#-ò£’3Ú«ˆñÎiŸœ‹ekŠF#“i9¹\0\0À;Ò“†-İ5qx¶+ ½¼<ú‚õİä·ë.§åÌ\0\0OIO\ZŠïüî¸Éç~^Âee]chx2+¿JÎÂò¼Ê©©tX\0\0à!iKÃpdRİÅæáue­İAíäµÑŒ¨.\\¶¦¨k`8]§\0\0xJÚÒPøú‡İP®î¨·ùØeíµäQÖäW×‘åo¹Hã9\0\0’Î4á»“OÅns¨¦×V4óéÃû7:z‡ß¨¾¨¾,CºœùB\0\0°iNC155]u¡GºPõŠ\ZjN‹‘®1óí}ó÷ù|!\0\0X¤ô§¡\"™R~Ş¿ª¨(¼ãÁv?³ëxq£ûÔ\0\0€´¸_i\0\0€ŒC\Z\0\0Ààî4ì¬ÈŞz’/ì\0\0Üo¥aàäÖììŠN}\0\0°”iJÃh£9h¶4”‡ÙÙ[+*y]\0\0€Œä™4tôu\0\02’4Ì6Å:-v×¾ …Ø¬_L<öTæ™ËÍ\r­5íkOÛ¶™ıÀ*++Óñ÷\0\0d$ı³†Ñ‡f¿%ü’°zÂ*¶ T{1·KØA4ç—†²ÃEÿm\0\0\0™J{\Z&ÇZª/Ûg­©À„-_’ö6ïÊ¤!\0\0ğ²ŒIÃ™AG\Z\0\0¤—ö4¼×ÊöËÄ)¢2ş‹ı\Zrl²qi866¶iÓ¦Eÿm\0\0\0™J×}\rã×ˆcfûâÈ¬w¨¶Ö‰§]Ê4´_}Şzòä¼f\rƒÁ`AAA:ş:\0\0€Œäî[^Ïi\0\0<4´†\0\0ÀãHCË7vîÜ©û(\0\0\0´!\r-~¿÷îİº\0\0@ÒĞB\Z\0\0#\r-¤!\0\0ğ8ÒĞÒÖÖvàÀİG\0\0 \rihimm­¬¬Ô}\0\0\0Ú†Ò\0\0xih!\r\0€Ç‘†–ºİG\0\0 \rih!\r\0€Ç‘†Ò\0\0xih!\r\0€Ç‘†–ÊÊÊÖÖVİG\0\0 \rih!\r\0€Ç‘†Ò\0\0xih9pà@[[›î£\0\0\0Ğ†4œŞ¸qcv¢mÛ¶é>(\0\0\0\rHÃéââb{:t¨´´T÷A\0\0h@\ZNßºu+\'\'Guannnaa¡ßï×}P\0\0\0\Z†Q[¶lQi¸gÏ®&\0\0Ï\"\r£Z[[×¯_/iX\\\\ÜÔÔ¤ûp\0\0\0ô \r\ryyy¹¹¹¿şõ¯\'&&t\0\0€¤¡¡¦¦fıúõ‡Ò} \0\0\0Ú††‰‰‰ÜÜÜ@  û@\0\0\0´!\r\0\0` \r\0\0` \r\0\0` \r\0\0` \r\rS³Ğ}\\\0\0\0Îñn\Zªòû$frrrbbb|Y(O©u(E\0\0àz^LC3\n¥üÂ¡á®s-m¿¯;şÛ=uÛw©!¿~túl00‡ÇÆÆîŞ½«2‘@\0\0îæ­44£PŠğÔ;%;Ÿ~öÅÏ|áÇŸú¯)‡<µıß–dìïí‘L”F$\0€‹y(\rUJŞÕmßµöá/Ùğõ¿û‡‚¯}½èÙÕ2äüjOFYùè[[·g¢î¿	\0\0 ¼’†ª{/un|ì«*ø^úì_îzfå…wŠÇ®^ìéI\Z²ğü½²‚Ùˆ¹_úÊ¥úSƒƒƒˆcccãããÔ!\0\0pO¤¡êÂU÷Â§ÿ¢ô‡?\r¶~8³gY­èÙÕ²‰š_<^¼o`` \n…Ãaê\0\0¸ŒûÓĞìB•wûjï‰†{‰Bû¸Qw\"÷K_QYY»§¸¯¯/R‡\0\0Àe\\†ªÛ~_§ºpû7¾òòñ½ÙpËßRux¼xu\0\0ÜÇÍih~¾ğ•‡‘¤+øÚ×Ç»»Ö…jÈæo>ş¤úœâùãõÔ!\0\0p—§áØØ˜ºœıè—ï\\º”2ø\ZÏÕå½¹ıßŞüø“j=»úì–m)W–d?ò˜Úá•ÎÎşşşP($¯211A\Z\0€LçÚ4TS†Õon–ŒûÉŸ}>åç¥ó¤g»¯á+=\"É8s+Ù•ìPVxçÕ¿ß?00022r÷î]&\0@¦sm\ZªûZ«KÉï½ø‹™…×s¬N=;÷ØşoÏœn¬xş%uYùâùó²§ÁÁèÿMQ7;Ôıw\0\0,œ;ÓPMÿípÃÚ\"]]öáÿàè½t¡\Z¿zì«I›ËÕ}pöÿò\rŸÏ×××\n…˜8\0\0™Îµi811Qğµ¯K½=»úÎ¥KIãWñ_ßãxïÅ_$ì¡ıÒ®gVFo…ó?¾ÖŞŞnŸ8$\r\0@ærg\Zª«Éê†5Šö››ƒÍM±ŸÍÁ¦¦êµ¹óêB5ü•mı45_x§XİÈ¦¹ñ¬ÏçëïïQ_UÖı×\0\0,kÓğ£ÓgÕÿ/8q\"iØÿò½¢gW\'íG}åğ¢+½½½æ5eİ=\0\0À¹3\r\'\'\'Oï+—n{ıïşáæÑ#Ñqä¨\Zg·l[@Ê ¼ñşûÑÄw¨şsi~ıš²¼´î¿\0\0`\\˜†êƒ†uÛw©ï_;xĞ>Ş{ñKCI»RŸe|çÕœ.øı~>n\0\02;Óp||¼vk¡tÛÎ§Ÿıhï^û(ú·ï-8\rOmÊ·ïJºS¥áùóç}>ßÀÀ€úÏ(¤!\0\0ÈPîOÃ={ìc‘ihßUR\ZšßD!\r\0@†ry\Znyâ[I³†ênÕI»2/(“†\0\0À\\›†æ×P’> ¸˜¯¡$íJıwæı¿|ƒ4\0\0îàÚ4¼TêÇ±›×D¿V¬¾S¼yÍ¿}ÏøšsìëÉ²[óæ5¤!\0\0p×¦a00¨ny}vË¶¤û.ì–××´ïDÍ>ÊKÔÕÖò5\0\0àîLÃ‰‰	©´7Rêm×3+ƒMÑÿ_òŸ¶Ÿ›b×‚ï}T<ÿRìÿ 4Åÿ±JÓÎ§Ÿ•åûê©S§¸y\r\0\0p¦átì–×RiGßÚ*õöÒgÿòö™Æ¤ÿ¡ì«<üÊCÜc¾õ÷ÿx§=asÙá‹Ÿù‚<UøÒ«’†Üò\Z\0\0¸ƒ;Óğ“O>¹{÷no¯t¡\\é\ZéêJ\Zşf?òØíÂè¤cë‡IÛ=»ZEç±£GÏ;×ÑÑÁ?Ê\0\0.àæ4‡†÷ÿò\ri¸ŸüÙç{ÕMöô$;—.Íq/	Ç³[¶ÍÜJv¥¾€²mõOO:eÿ\ni\0\02š;ÓĞü¸áÀ­[ê3Ù~ùNû¥™§±.ïÍ¢gWo~üI5¤ÏïÙ›zåöKj®qíÃ_ª«­=wîœıj24\0\0Íµi¨&C¡Ğ¥3gÕeå7r¼»;eğİãÍ_ÿê?ªKÉ‡÷©/ ø|¾¾¾>ój2i\0\02—;Óp:vMy||<ŞW®ndSğµ¯ß¹”zîğÙP}åYvUš_ ]¨>ehNÊËq5\0\0d4×¦¡9q822200p¼xŸªÃìGë=Ñ0ß.”MÔ²UÖ××«KÉ~¿_vn~Ê)C\0\0Ñ\\›†ÓñO…B¡şş~©Cueù\'öù]Ï¬œí£‡IcøB›¬¬¾w\"›Û»P}ûDv./Á§\0€¸<\rÍËÊÁ`°¯¯ïüñúìG¿¬¾€üâg¾°óégÏïÙéêšY„²P’ÔıÕtãá=Eö.”ÊnÍKÉ¤!\0\0ÈtnNÃéTux¥³sÿ/ß°ßïZâ/÷K_yóñ\'w=³R†<_Í\"T“……/½ZW[«nUC\0\0·ry\ZNÏ¨Ãşşşîîî‹çÏ—æHª+Å)‡<õúWÿñWs=ª¾tráÂ…Ù\\vB\0\0÷q\ZN\'Öa(\Zèééñù|íííMg\Zï;¸y«$ 9ä×Ã{ŠÔ4¡¬ ¢PMÊ†²¹ì„.\0\0îã‰4œ¶ÕáØØØÈÈÈàà`¿\nÄ+’}bÎÛ¨%ò”¬ ¢P6‘\resÙ	]\0\0ÜÇ+i8¯Ã‰‰‰èÿĞ‡Í@ìíí•ìëîîöûı>ùUÊS²‚ŠB5Y(›ËNèB\0\0à>JÃéXÎD	¾¡¡!)¿˜şõXÊS²‚¬–…t!\0\0po¥¡bÄññqÕˆÊˆ¹PVÕˆB\0\0àz^LCÅD199©21‰,”§Ô:D!\0\0p=ï¦a’©Yè>.\0\0\0çüœ ×fNVô•\0\0\0\0IEND®B`‚',1,'QingJiaLiuCheng.png'),(3,0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<process name=\"QingJiaLiuCheng\" xmlns=\"http://jbpm.org/4.4/jpdl\">\n   <start name=\"start1\" g=\"66,16,48,48\">\n      <transition name=\"to task1\" to=\"ShaStudent\" g=\"-52,-22\"/>\n   </start>\n   <end name=\"end1\" g=\"66,348,48,48\"/>\n   <task name=\"ShaStudent\" g=\"28,96,125,52\" assignee=\"ä¸å‚»å­\">\n      <transition name=\"to task2\" to=\"ShaFuDaoYuan\" g=\"-52,-22\"/>\n   </task>\n   <task name=\"ShaFuDaoYuan\" g=\"27,180,126,52\" assignee=\"å®‹å‚»å­\">\n      <transition name=\"to task3\" to=\"ShaYuanZhang\" g=\"-52,-22\"/>\n   </task>\n   <task name=\"ShaYuanZhang\" g=\"16,264,149,52\" assignee=\"ç‹å‚»å­\">\n      <transition name=\"to end1\" to=\"end1\" g=\"-50,-22\"/>\n   </task>\r\n</process>',1,'QingJiaLiuCheng.jpdl.xml');

/*Table structure for table `jbpm4_participation` */

DROP TABLE IF EXISTS `jbpm4_participation`;

CREATE TABLE `jbpm4_participation` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `GROUPID_` varchar(255) DEFAULT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_PART_TASK` (`TASK_`),
  KEY `IDX_PART_TASK` (`TASK_`),
  CONSTRAINT `FK_PART_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`),
  CONSTRAINT `FK_PART_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_participation` */

/*Table structure for table `jbpm4_property` */

DROP TABLE IF EXISTS `jbpm4_property`;

CREATE TABLE `jbpm4_property` (
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_property` */

insert  into `jbpm4_property`(`KEY_`,`VERSION_`,`VALUE_`) values ('next.dbid',6,'60001');

/*Table structure for table `jbpm4_swimlane` */

DROP TABLE IF EXISTS `jbpm4_swimlane`;

CREATE TABLE `jbpm4_swimlane` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`),
  KEY `IDX_SWIMLANE_EXEC` (`EXECUTION_`),
  CONSTRAINT `FK_SWIMLANE_EXEC` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_swimlane` */

/*Table structure for table `jbpm4_task` */

DROP TABLE IF EXISTS `jbpm4_task`;

CREATE TABLE `jbpm4_task` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCR_` longtext,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `FORM_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROGRESS_` int(11) DEFAULT NULL,
  `SIGNALLING_` bit(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKDEFNAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_TASK_SWIML` (`SWIMLANE_`),
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`),
  KEY `IDX_TASK_SUPERTASK` (`SUPERTASK_`),
  CONSTRAINT `FK_TASK_SUPERTASK` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_task` (`DBID_`),
  CONSTRAINT `FK_TASK_SWIML` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_task` */

insert  into `jbpm4_task`(`DBID_`,`CLASS_`,`DBVERSION_`,`NAME_`,`DESCR_`,`STATE_`,`SUSPHISTSTATE_`,`ASSIGNEE_`,`FORM_`,`PRIORITY_`,`CREATE_`,`DUEDATE_`,`PROGRESS_`,`SIGNALLING_`,`EXECUTION_ID_`,`ACTIVITY_NAME_`,`HASVARS_`,`SUPERTASK_`,`EXECUTION_`,`PROCINST_`,`SWIMLANE_`,`TASKDEFNAME_`) values (10005,'T',1,'ShaFuDaoYuan',NULL,'open',NULL,'å®‹å‚»å­',NULL,0,'2019-06-11 15:35:49',NULL,NULL,'','QingJiaLiuCheng.10001','ShaFuDaoYuan','\0',NULL,10001,10001,NULL,'ShaFuDaoYuan'),(20005,'T',1,'ShaFuDaoYuan',NULL,'open',NULL,'å®‹å‚»å­',NULL,0,'2019-06-11 15:43:09',NULL,NULL,'','QingJiaLiuCheng.20001','ShaFuDaoYuan','\0',NULL,20001,20001,NULL,'ShaFuDaoYuan');

/*Table structure for table `jbpm4_variable` */

DROP TABLE IF EXISTS `jbpm4_variable`;

CREATE TABLE `jbpm4_variable` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CONVERTER_` varchar(255) DEFAULT NULL,
  `HIST_` bit(1) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `LOB_` bigint(20) DEFAULT NULL,
  `DATE_VALUE_` datetime DEFAULT NULL,
  `DOUBLE_VALUE_` double DEFAULT NULL,
  `CLASSNAME_` varchar(255) DEFAULT NULL,
  `LONG_VALUE_` bigint(20) DEFAULT NULL,
  `STRING_VALUE_` varchar(255) DEFAULT NULL,
  `TEXT_VALUE_` longtext,
  `EXESYS_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_VAR_EXESYS` (`EXESYS_`),
  KEY `FK_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_TASK` (`TASK_`),
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`),
  KEY `IDX_VAR_EXESYS` (`EXESYS_`),
  KEY `IDX_VAR_TASK` (`TASK_`),
  KEY `IDX_VAR_EXECUTION` (`EXECUTION_`),
  KEY `IDX_VAR_LOB` (`LOB_`),
  CONSTRAINT `FK_VAR_EXECUTION` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_EXESYS` FOREIGN KEY (`EXESYS_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_LOB` FOREIGN KEY (`LOB_`) REFERENCES `jbpm4_lob` (`DBID_`),
  CONSTRAINT `FK_VAR_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_variable` */

insert  into `jbpm4_variable`(`DBID_`,`CLASS_`,`DBVERSION_`,`KEY_`,`CONVERTER_`,`HIST_`,`EXECUTION_`,`TASK_`,`LOB_`,`DATE_VALUE_`,`DOUBLE_VALUE_`,`CLASSNAME_`,`LONG_VALUE_`,`STRING_VALUE_`,`TEXT_VALUE_`,`EXESYS_`) values (10002,'hib-long',0,'application',NULL,'\0',10001,NULL,NULL,NULL,NULL,'cn.oa.domain.Application',3,NULL,NULL,NULL),(20002,'hib-long',0,'application',NULL,'\0',20001,NULL,NULL,NULL,NULL,'cn.oa.domain.Application',4,NULL,NULL,NULL);

/*Table structure for table `oa_application` */

DROP TABLE IF EXISTS `oa_application`;

CREATE TABLE `oa_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `applyTime` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK86604663E092B3E0` (`templateId`),
  KEY `FK86604663C62932C2` (`userId`),
  CONSTRAINT `FK86604663C62932C2` FOREIGN KEY (`userId`) REFERENCES `oa_user` (`id`),
  CONSTRAINT `FK86604663E092B3E0` FOREIGN KEY (`templateId`) REFERENCES `oa_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `oa_application` */

insert  into `oa_application`(`id`,`title`,`applyTime`,`status`,`filePath`,`templateId`,`userId`) values (1,'è¯·å‡å•_ä¸å‚»å­_2019-06-11','2019-06-11 14:58:16','å·²é€šè¿‡','E:\\WEB\\è½¯ä»¶\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/11/7c7236fc-2a96-4d0c-a01e-fdb62f254efd.doc',1,11),(2,'è¯·å‡å•_å¾å‚»å­_2019-06-11','2019-06-11 15:10:00','æœªé€šè¿‡','E:\\WEB\\è½¯ä»¶\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/11/eae2cfec-e0c8-4bfe-afcc-df945f1746a2.doc',1,7),(3,'è¯·å‡å•_ä¸å‚»å­_2019-06-11','2019-06-11 15:35:47','å®¡æ‰¹ä¸­','E:\\WEB\\è½¯ä»¶\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/11/dd3ddb4b-9850-4753-ab54-1e454fecae40.doc',1,11),(4,'è¯·å‡å•_ä¸å‚»å­_2019-06-11','2019-06-11 15:43:08','å®¡æ‰¹ä¸­','E:\\WEB\\è½¯ä»¶\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/11/c43322f8-9c47-4bf6-b592-3f1633323c13.doc',1,11),(5,'è¯·å‡å•_ä¸å‚»å­_2019-06-16','2019-06-16 13:54:11','æœªé€šè¿‡','E:\\WEB\\è½¯ä»¶\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/16/102c021f-4c9b-4b92-b10b-c5327bd91e4c.doc',1,11),(6,'è¯·å‡å•_ä¸å‚»å­_2019-06-16','2019-06-16 13:54:12','å·²é€šè¿‡','E:\\WEB\\è½¯ä»¶\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/16/91c744b2-681e-47b1-bdf3-556e1c6f23b3.doc',1,11),(7,'è¯·å‡å•_ä¸å‚»å­_2019-06-16','2019-06-16 16:43:42','å·²é€šè¿‡','E:\\WEB\\è½¯ä»¶\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/16/eeeabd16-4ce5-4b1b-afdb-bc2161aca67a.doc',1,11);

/*Table structure for table `oa_approveinfo` */

DROP TABLE IF EXISTS `oa_approveinfo`;

CREATE TABLE `oa_approveinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approveTime` datetime DEFAULT NULL,
  `approval` bit(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `applicationId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK539DAEAE910C11CA` (`applicationId`),
  KEY `FK539DAEAEC62932C2` (`userId`),
  CONSTRAINT `FK539DAEAE910C11CA` FOREIGN KEY (`applicationId`) REFERENCES `oa_application` (`id`),
  CONSTRAINT `FK539DAEAEC62932C2` FOREIGN KEY (`userId`) REFERENCES `oa_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `oa_approveinfo` */

insert  into `oa_approveinfo`(`id`,`approveTime`,`approval`,`comment`,`applicationId`,`userId`) values (1,'2019-06-11 16:18:20','','ç»™ä¸å‚»å­ä¸€ä¸ªå‡',1,10),(2,'2019-06-11 16:19:49','','å›­é•¿åŒä¸€ç»™å‚»å­ä¸€ä¸ªå‡äº†',1,9),(3,'2019-06-16 13:58:11','','',6,10),(4,'2019-06-16 16:38:18','\0','',2,10),(5,'2019-06-16 16:38:50','\0','',5,10),(6,'2019-06-16 16:39:50','','',6,9),(7,'2019-06-16 16:45:13','','å‘ä¸€ä¸ªå§',7,10),(8,'2019-06-16 16:46:08','','é€šç”¨',7,9);

/*Table structure for table `oa_book` */

DROP TABLE IF EXISTS `oa_book`;

CREATE TABLE `oa_book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oa_book` */

/*Table structure for table `oa_department` */

DROP TABLE IF EXISTS `oa_department`;

CREATE TABLE `oa_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB56F87C7729C9286` (`parentId`),
  CONSTRAINT `FKB56F87C7729C9286` FOREIGN KEY (`parentId`) REFERENCES `oa_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `oa_department` */

insert  into `oa_department`(`id`,`name`,`description`,`parentId`) values (7,'åŠå…¬å®¤','æ€»åŠå…¬å®¤',NULL),(8,'æ ¡é•¿åŠå…¬å®¤',NULL,7),(9,'é™¢é•¿åŠå…¬å®¤',NULL,7),(10,'ä¸»ä»»åŠå…¬å®¤',NULL,7),(11,'è¾…å¯¼å‘˜åŠå…¬å®¤',NULL,7),(12,'æ•™å¸ˆåŠå…¬å®¤',NULL,7),(18,'æ•™åŠ¡å¤„',NULL,NULL),(19,'æ€»åŠ¡å¤„',NULL,NULL),(20,'åå‹¤å¤„',NULL,19),(21,'å­¦ç”Ÿå¤„',NULL,NULL),(22,'äººäº‹å¤„',NULL,19),(23,'è´¢åŠ¡å¤„',NULL,19);

/*Table structure for table `oa_forum` */

DROP TABLE IF EXISTS `oa_forum`;

CREATE TABLE `oa_forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `position_` int(11) DEFAULT NULL,
  `topicCount` int(11) DEFAULT NULL,
  `articleCount` int(11) DEFAULT NULL,
  `topicId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBDCCD874C3CA9D08` (`topicId`),
  CONSTRAINT `FKBDCCD874C3CA9D08` FOREIGN KEY (`topicId`) REFERENCES `oa_topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `oa_forum` */

insert  into `oa_forum`(`id`,`name`,`description`,`position_`,`topicCount`,`articleCount`,`topicId`) values (1,'ç®¡ç†å‘˜æ–°å»ºäº†ä¸€ä¸ªç‰ˆå—','è¿™æ˜¯ç®¡ç†å‘˜ç¬¬ä¸€æ¬¡æ–°å»ºçš„ä¸€ä¸ªç‰ˆå—',1,3,8,3),(2,'java web','è¿™æ˜¯java webè¯¾è®¾å­¦ä¹ ç‰ˆå—',2,1,6,4);

/*Table structure for table `oa_privilege` */

DROP TABLE IF EXISTS `oa_privilege`;

CREATE TABLE `oa_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2A54CF9CE7D51427` (`parentId`),
  CONSTRAINT `FK2A54CF9CE7D51427` FOREIGN KEY (`parentId`) REFERENCES `oa_privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `oa_privilege` */

insert  into `oa_privilege`(`id`,`name`,`url`,`parentId`) values (1,'ç³»ç»Ÿç®¡ç†',NULL,NULL),(2,'å²—ä½ç®¡ç†','/role_list',1),(3,'éƒ¨é—¨ç®¡ç†','/department_list',1),(4,'ç”¨æˆ·ç®¡ç†','/user_list',1),(5,'å²—ä½å¢åŠ ','/role_add',2),(6,'å²—ä½åˆ é™¤','/role_delete',2),(7,'å²—ä½ä¿®æ”¹','/role_edit',2),(8,'å²—ä½æŸ¥çœ‹','/role_list',2),(9,'éƒ¨é—¨å¢åŠ ','/department_add',3),(10,'éƒ¨é—¨åˆ é™¤','/department_delete',3),(11,'éƒ¨é—¨ä¿®æ”¹','/department_edit',3),(12,'éƒ¨é—¨æŸ¥çœ‹','/department_list',3),(13,'ç”¨æˆ·å¢åŠ ','/user_add',4),(14,'ç”¨æˆ·åˆ é™¤','/user_delete',4),(15,'ç”¨æˆ·ä¿®æ”¹','/user_edit',4),(16,'ç”¨æˆ·æŸ¥æ‰¾','/user_list',4),(17,'ä¸ªäººåŠå…¬','/rtr',NULL),(18,'å®¡æ‰¹æµè½¬',NULL,NULL),(19,'ç½‘ä¸Šäº¤æµ',NULL,NULL),(20,'ç”¨æˆ·åˆå§‹åŒ–å¯†ç ','/user_intiPassword',4),(21,'è®ºå›','/forum_list',19),(22,'è®ºå›ç®¡ç†','/forumManage_list',19),(23,'å®¡æ‰¹æµç¨‹ç®¡ç†','/processDefinition_list',18),(24,'è¡¨å•æ¨¡æ¿ç®¡ç†','/template_list',18),(25,'èµ·è‰ç”³è¯·','/flow_templateList',18),(26,'å¾…æˆ‘å®¡æ‰¹','/flow_myTaskList',18),(27,'æˆ‘çš„ç”³è¯·æŸ¥è¯¢','/flow_myApplicationList',18);

/*Table structure for table `oa_reply` */

DROP TABLE IF EXISTS `oa_reply`;

CREATE TABLE `oa_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `topicId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBE715E3DC3CA9D08` (`topicId`),
  KEY `FKBE715E3DC62932C2` (`userId`),
  CONSTRAINT `FKBE715E3DC3CA9D08` FOREIGN KEY (`topicId`) REFERENCES `oa_topic` (`id`),
  CONSTRAINT `FKBE715E3DC62932C2` FOREIGN KEY (`userId`) REFERENCES `oa_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `oa_reply` */

insert  into `oa_reply`(`id`,`content`,`ipAddress`,`postTime`,`deleted`,`userId`,`topicId`) values (1,'<p>å‚»å­å­¦ç”Ÿå›å¤ä¸€ä¸‹è¾…å¯¼å‘˜</p>\r\n',NULL,'2019-06-11 17:24:11',0,NULL,2),(2,'<p>å­¦ç”Ÿåˆæ¥äº†</p>\r\n',NULL,'2019-06-11 17:25:11',0,NULL,2),(3,'<p>æˆ‘æ˜¯å­¦ç”Ÿ1å·</p>\r\n',NULL,'2019-06-16 13:55:45',0,NULL,1),(4,'<p>æˆ‘å›å¤è‡ªå·±&nbsp; æ˜¯æŒºå‚»çš„</p>\r\n',NULL,'2019-06-16 14:43:31',0,NULL,3),(5,'<p>ä½ å’‹ä¸å¥½å¥½å­¦ä¹ </p>\r\n',NULL,'2019-06-16 14:44:00',0,NULL,1),(6,'<p>å“ çœŸçš„å¥½éš¾å“¦</p>\r\n',NULL,'2019-06-16 16:59:02',0,NULL,4),(7,'<p><span style=\"font-family:times new roman,times,serif\"><strong><img alt=\"wink\" src=\"http://localhost:8080/OAXP/ckeditor/plugins/smiley/images/wink_smile.gif\" style=\"height:20px; width:20px\" title=\"wink\" />è¾…å¯¼å‘˜ä¹Ÿè§‰å¾—å¥½éš¾å“¦</strong></span></p>\r\n',NULL,'2019-06-16 17:00:37',0,NULL,4),(8,'<p>å•Šå•Šå•Š<img alt=\"angel\" src=\"http://localhost:8080/OAXP/ckeditor/plugins/smiley/images/angel_smile.gif\" style=\"height:20px; width:20px\" title=\"angel\" /></p>\r\n',NULL,'2019-06-16 17:01:22',0,NULL,4),(9,'<p>å‘ƒå‘ƒå‘ƒ</p>\r\n',NULL,'2019-06-16 17:01:35',0,NULL,4),(10,'<p>ereret</p>\r\n',NULL,'2019-06-16 17:01:58',0,NULL,4);

/*Table structure for table `oa_role` */

DROP TABLE IF EXISTS `oa_role`;

CREATE TABLE `oa_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `oa_role` */

insert  into `oa_role`(`id`,`name`,`description`) values (6,'æ ¡é•¿','æ ¡é•¿'),(13,'å›­é•¿','å‚»å­å›­é•¿'),(14,'è¾…å¯¼å‘˜','è¾…å¯¼å‘˜'),(15,'æ•™å¸ˆ','æ•™å¸ˆ'),(17,'å­¦ç”Ÿ','å­¦ç”Ÿ');

/*Table structure for table `oa_role_privilege` */

DROP TABLE IF EXISTS `oa_role_privilege`;

CREATE TABLE `oa_role_privilege` (
  `privilegeId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`privilegeId`),
  KEY `FK350BD81DB0E19C6E` (`privilegeId`),
  KEY `FK350BD81DBB0AE3B6` (`roleId`),
  CONSTRAINT `FK350BD81DB0E19C6E` FOREIGN KEY (`privilegeId`) REFERENCES `oa_privilege` (`id`),
  CONSTRAINT `FK350BD81DBB0AE3B6` FOREIGN KEY (`roleId`) REFERENCES `oa_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oa_role_privilege` */

insert  into `oa_role_privilege`(`privilegeId`,`roleId`) values (1,6),(1,13),(1,14),(1,15),(2,6),(2,13),(3,6),(3,13),(3,14),(4,13),(4,14),(4,15),(5,6),(6,6),(7,6),(8,6),(8,13),(9,6),(10,6),(11,6),(12,6),(12,13),(12,14),(16,13),(16,14),(16,15),(17,6),(17,13),(17,14),(17,15),(17,17),(18,6),(18,13),(18,14),(18,17),(19,6),(19,13),(19,14),(19,15),(19,17),(21,6),(21,13),(21,14),(21,15),(21,17),(25,6),(25,17),(26,13),(26,14),(27,6),(27,17);

/*Table structure for table `oa_template` */

DROP TABLE IF EXISTS `oa_template`;

CREATE TABLE `oa_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `processDefinitionKey` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `oa_template` */

insert  into `oa_template`(`id`,`name`,`processDefinitionKey`,`filePath`) values (1,'è¯·å‡å•','QingJiaLiuCheng','E:\\WEB\\è½¯ä»¶\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/16/5299f269-8602-4cf6-8aad-530e176c05ff.doc');

/*Table structure for table `oa_topic` */

DROP TABLE IF EXISTS `oa_topic`;

CREATE TABLE `oa_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `replyCount` int(11) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `replyId` bigint(20) DEFAULT NULL,
  `forumId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBE92188248CEA5BE` (`replyId`),
  KEY `FKBE921882DE8FE86C` (`forumId`),
  KEY `FKBE921882C62932C2` (`userId`),
  CONSTRAINT `FKBE92188248CEA5BE` FOREIGN KEY (`replyId`) REFERENCES `oa_reply` (`id`),
  CONSTRAINT `FKBE921882C62932C2` FOREIGN KEY (`userId`) REFERENCES `oa_user` (`id`),
  CONSTRAINT `FKBE921882DE8FE86C` FOREIGN KEY (`forumId`) REFERENCES `oa_forum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `oa_topic` */

insert  into `oa_topic`(`id`,`title`,`content`,`ipAddress`,`postTime`,`lastUpdateTime`,`type`,`replyCount`,`userId`,`replyId`,`forumId`) values (1,'å‚»å­¦ç”Ÿä¸»é¢˜ ','<p>æˆ‘æ˜¯å‚»å­¦ç”Ÿ æˆ‘æ¥å‘æ–°ä¸»é¢˜</p>\r\n',NULL,'2019-06-11 16:16:49','2019-06-16 14:44:00',0,2,NULL,5,1),(2,'æˆ‘æ˜¯è¾…å¯¼å‘˜','<p>å‚»è¾…å¯¼å‘˜æ¥å‘æ–°è´´</p>\r\n',NULL,'2019-06-11 16:19:09','2019-06-11 17:25:11',0,2,NULL,2,1),(3,'æ ¡é•¿æ¥å‘å¸–äº†','<p>å•Šå“ˆå“ˆå“ˆå“ˆ&nbsp; æˆ‘æ˜¯å‚»å­</p>\r\n',NULL,'2019-06-16 14:42:50','2019-06-16 14:43:31',0,1,NULL,4,1),(4,'å­¦ç”Ÿ','<p>java web è¯¾è®¾å¤ªéš¾äº†</p>\r\n',NULL,'2019-06-16 16:58:45','2019-06-16 17:01:58',0,5,NULL,10,2);

/*Table structure for table `oa_user` */

DROP TABLE IF EXISTS `oa_user`;

CREATE TABLE `oa_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `departmentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4ADEC00F49BC32E` (`departmentId`),
  CONSTRAINT `FK4ADEC00F49BC32E` FOREIGN KEY (`departmentId`) REFERENCES `oa_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `oa_user` */

insert  into `oa_user`(`id`,`loginName`,`name`,`password`,`phone`,`email`,`gender`,`description`,`departmentId`) values (7,'admin','å¾å‚»å­','81dc9bdb52d04dc20036dbd8313ed055','123','123@qq.com',0,'å‚»å­ç®¡ç†å‘˜',NULL),(8,'äºå‚»å­','äºå‚»å­','81dc9bdb52d04dc20036dbd8313ed055','1515155','4151516',0,'äºå‚»å­  å‚»æ ¡é•¿',8),(9,'ç‹å‚»å­','ç‹å‚»å­','81dc9bdb52d04dc20036dbd8313ed055','1521621','15215202',0,'ç‹å¤§å‚»å­  å‚»å›­é•¿',10),(10,'å®‹å‚»å­','å®‹å‚»å­','81dc9bdb52d04dc20036dbd8313ed055','151651','15610',0,'å®‹å‚»å­ è¾…å¯¼å‘˜',11),(11,'ä¸å‚»å­','ä¸å‚»å­','81dc9bdb52d04dc20036dbd8313ed055','1556132465','51206',1,'ä¸å‚»å­  å‚»å­¦ç”Ÿ',21);

/*Table structure for table `oa_user_role` */

DROP TABLE IF EXISTS `oa_user_role`;

CREATE TABLE `oa_user_role` (
  `roleId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK9C95CD55BB0AE3B6` (`roleId`),
  KEY `FK9C95CD55C0603920` (`userId`),
  CONSTRAINT `FK9C95CD55BB0AE3B6` FOREIGN KEY (`roleId`) REFERENCES `oa_role` (`id`),
  CONSTRAINT `FK9C95CD55C0603920` FOREIGN KEY (`userId`) REFERENCES `oa_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oa_user_role` */

insert  into `oa_user_role`(`roleId`,`userId`) values (6,8),(13,9),(14,10),(17,11);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
