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

insert  into `jbpm4_hist_task`(`DBID_`,`DBVERSION_`,`EXECUTION_`,`OUTCOME_`,`ASSIGNEE_`,`PRIORITY_`,`STATE_`,`CREATE_`,`END_`,`DURATION_`,`NEXTIDX_`,`SUPERTASK_`) values (10,1,'QingJiaLiuCheng.8','jbpm_no_task_outcome_specified_jbpm','丁傻子',0,'completed','2019-06-11 14:58:16','2019-06-11 14:58:16',208,1,NULL),(12,1,'QingJiaLiuCheng.8','jbpm_no_task_outcome_specified_jbpm','宋傻子',0,'completed','2019-06-11 14:58:16','2019-06-11 16:18:21',4805048,1,NULL),(16,1,'QingJiaLiuCheng.14','jbpm_no_task_outcome_specified_jbpm','丁傻子',0,'completed','2019-06-11 15:10:00','2019-06-11 15:10:00',50,1,NULL),(18,1,'QingJiaLiuCheng.14','jbpm_no_task_outcome_specified_jbpm','宋傻子',0,'completed','2019-06-11 15:10:00','2019-06-16 16:38:18',437298257,1,NULL),(10003,1,'QingJiaLiuCheng.10001','jbpm_no_task_outcome_specified_jbpm','丁傻子',0,'completed','2019-06-11 15:35:49','2019-06-11 15:35:49',86,1,NULL),(10005,0,'QingJiaLiuCheng.10001',NULL,'宋傻子',0,NULL,'2019-06-11 15:35:49',NULL,0,1,NULL),(20003,1,'QingJiaLiuCheng.20001','jbpm_no_task_outcome_specified_jbpm','丁傻子',0,'completed','2019-06-11 15:43:09','2019-06-11 15:43:09',105,1,NULL),(20005,0,'QingJiaLiuCheng.20001',NULL,'宋傻子',0,NULL,'2019-06-11 15:43:09',NULL,0,1,NULL),(30001,1,'QingJiaLiuCheng.8','jbpm_no_task_outcome_specified_jbpm','王傻子',0,'completed','2019-06-11 16:18:22','2019-06-11 16:19:49',87755,1,NULL),(40003,1,'QingJiaLiuCheng.40001','jbpm_no_task_outcome_specified_jbpm','丁傻子',0,'completed','2019-06-16 13:54:12','2019-06-16 13:54:12',104,1,NULL),(40005,1,'QingJiaLiuCheng.40001','jbpm_no_task_outcome_specified_jbpm','宋傻子',0,'completed','2019-06-16 13:54:12','2019-06-16 16:38:50',9878184,1,NULL),(40009,1,'QingJiaLiuCheng.40007','jbpm_no_task_outcome_specified_jbpm','丁傻子',0,'completed','2019-06-16 13:54:12','2019-06-16 13:54:12',44,1,NULL),(40011,1,'QingJiaLiuCheng.40007','jbpm_no_task_outcome_specified_jbpm','宋傻子',0,'completed','2019-06-16 13:54:12','2019-06-16 13:58:11',239230,1,NULL),(40013,1,'QingJiaLiuCheng.40007','jbpm_no_task_outcome_specified_jbpm','王傻子',0,'completed','2019-06-16 13:58:11','2019-06-16 16:39:50',9699617,1,NULL),(50001,0,'QingJiaLiuCheng.14',NULL,'王傻子',0,NULL,'2019-06-16 16:38:19',NULL,0,1,NULL),(50003,0,'QingJiaLiuCheng.40001',NULL,'王傻子',0,NULL,'2019-06-16 16:38:50',NULL,0,1,NULL),(50007,1,'QingJiaLiuCheng.50005','jbpm_no_task_outcome_specified_jbpm','丁傻子',0,'completed','2019-06-16 16:43:42','2019-06-16 16:43:42',39,1,NULL),(50009,1,'QingJiaLiuCheng.50005','jbpm_no_task_outcome_specified_jbpm','宋傻子',0,'completed','2019-06-16 16:43:42','2019-06-16 16:45:13',91656,1,NULL),(50011,1,'QingJiaLiuCheng.50005','jbpm_no_task_outcome_specified_jbpm','王傻子',0,'completed','2019-06-16 16:45:13','2019-06-16 16:46:08',55337,1,NULL);

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

insert  into `jbpm4_lob`(`DBID_`,`DBVERSION_`,`BLOB_VALUE_`,`DEPLOYMENT_`,`NAME_`) values (2,0,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0^\0\0�\0\0\0E��\0\0-�IDATx���oP���ڗ~�T�����/[��xϻNmmJ��^��\\ySu�^o�q�{�8q\"�6r\'��$��@\nr�S�$G\"\"���� \"H�?H���\Z4	#���4��~3OOw�0�~��吏����f�ͷ��i�d\Z\0\0\0���\0\0\0���4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0��4\0\0���i855�I�����,�)�����x\0\0�;/���B)�H$266��ܹ32�,��dYMV&\0��y+\r�(�{�����3[6�����˿��W>��?��?��S2��*��No�B��lB \0\0w�J\Zڣpx$�������7�,�����ջ�^^����;2��*�)YAV��o���A\0\0��\'�Pu������hQu��ܿ��ڷ�J���d�CV��de����쁁�P($;�]Q�\0\0�}ܟ��#�H8��o>���\nJW�]�3�l\"�潽�CCC�+�!u\0\0\\��ihva_�������__�py�|�P\r�P6��|�o###�!\0\0p7��م�q�t�l~�죅u�\Z���Dvu���۷oS�\0\0�eܜ����p8��_V��|�]h֡�Jv(ud��s���V\0\0�4pm\ZNMMMLL����9���?{h�בS^Y��>�jOO��А����\0\0�\\���|��ݻw��9��ܿ���L��[)������PH^��C\0\0��LC5ex�Ν����]��@�+�v{�KF@~F�E�DD��!O]�-��,�ܖ_��\n�\r����ǯ�ne�>�o``@^��C\0\0��LCc�0�����fɳ}�ۆ����T��c�Ւpg�hg_|5k�Qc�W٭켭��ƍ�BL\0\0pa\Z�S�eu���5˚�?���Ƈ��z<}�_n5V�P��]����V6W�ۤ���켤6��իL\0\0wpa\Z�քB���>�r��N_<�\Z��j\\	�c��̕�-�=���y:�<�����U�\Z<-;_��\'���o޼)/�nd���\0\0X8w������`�(R�m������p1>bke�ž?+ܪmS�Ճ��j�����Y��A�P^��������ɋ��\0\0 ��0\r\'\'\'����۷�z�Ϸ�I��o��-�A��P~��[�\"������U|�m��,;��8{���瓗������\0\0,��P}а����>}��ק�<�8}���\Z�%��g�Ճ���rl���U\rc5sMY(;��8u�ԕ+W����\ru��\0\0\0��4��������=��}2\Zb?�Wկe�_�\Z��%>+ˣK����eƯ���+�^�#/������!/\'/J\Z\0����4�}��Tr����Q�����\'>�{��^���ս�_�Bc���W���#�Դ���\'\r\0�;�9\r�|��e�6E��j��yWU�I�F,�Ga�zV=6�0ނ\'��h�cl�w��M����/_&\r\0��9\r�z��7W�P]n𙗉����jr�Ϻ�l�Po��V0�>ۃ}�sy	�\0\0������9��b�����LwQR/�{�m���%��\0\0\\��i�v���A�_���Qw�i1�_c>�i-oI^�HKt|�<b����%�\Z\n\0\0p\rw���yͻ5����9�Y�v�.~;kc��~Ɵ�k7W諳6��.;~g�:����Dv���kܼ\0\0���м����^�_nz�����_yư�{�`�3~5�u��)Y\"���9r�[^\0\0�pa\Z��(�������3�������Z��-?C�ݡ���#�k�Yc�,V#���0��C���N>���Ώ;�?�\0\0���4�D\"�P��͛mm���4�ǣ}��Ϗ�ǝƯ�N�T��Bg�q���Z�.��nW�W__���./$/\'/J\Z\0����4���R7�z��o�y�g�h�{;��v;r- c�+�3�u{\\=���2��\\�[3��Z9:��F׉����ﭩ��>w���������\0\0`�\\��ӱ�ûw���7n�������կ/��(8ٳ�!;�]�>\\__/;�����c�\0\0d:w��}����577�y��_��x�:�>�.��Ȯ***jkke��s�\0�k�3\r����P���������1I�կ/o��o!�=��l.;9td_MMMcc��Vv./��!\0\0pצ��8\Z\Z���t���ӧsv~��=TP�b�i(�Ȇ�������eW�C٭�\\^�)C\0\0��M�������x8ׯ_ooo��+�z����u��o���s�� ��ʲ���/WTT����NdW�C٭�\\^�)C\0\0�nNé�)u#����۷oK�]�t������\n���~�#�\\��?���W��{y}�y����tȐ�,��dYMV.?x���õ�����Dv%;�ݪ�0e\0\0���i8�X��@������������������/s��j����+���|��~�)�@~���P^^.Q(+�&��l.;�]х\0\0�}\\��Ӷ:��CCC���>�����ܹsR{ǎ;r�HUU���{�w(Fȯ�P��d5YY6�\resى�.\0\0���4���������h(\Z�q��իW���[ZZΞ={�ԩ���z�U�S���&+�&��l.;Q�/�\0��x\"\r��u811q���;w��A鼛7o��~��w�ʕ���1�,��dYMV�MdC�\\vB\0\0Wra\ZNnͮ�L�TR �B����۷o����� �)YAV#\n\0�x+\r�O�s�@�D\"ccc�pX�odY(O�\n�\ZQ\0\0���4�#�Ҳ�l[tVdggo��0�S3�brrrb�Z�(\0\0^��4���UUUI��\0\0\0\\��4�6�\n-v�׾ Ql������\\���֓����zʾ�9Ӱ�� ��\0\0�,:g\r���K�%����#c��_���$\r\0\0f�1\r�3�̽Y�7M�7T�ƶ�Hх)^3i\0\0<.��0�3.\Z��&��֭)\'!�L�-[�ܾ}{�\0\0@�ˠʶı4>�xr�k̩�8g\Z�޽���/�\0\0�X���0~I8�k%)�0q}�br�I+��]�wH~.�z4i\0\0��oy�`�!\0\0�8��RTTt��U�G\0\0�\rih���lmm�}\0\0\0ڐ��\0\0xih!\r\0�Ǒ�������&�G\0\0�\rih���}\0\0\0ڐ��\0\0xih!\r\0�Ǒ�����cǎ�>\n\0\0\0mHCKkkkee��\0\0\0І4���\0\0��HCi\0\0<�4����8p@�Q\0\0\0hC\ZZ�~��ݻu\0\0�6���4\0\0G\ZZHC\0\0�q���ƍ;w��}\0\0\0ڐ�Q7n�N�m�6�\0\0�4�0����ޅ�*--�}P\0\0\0N#\r�nݺ�����pÆ\r���~�_�A\0\08�44lٲE�aYYW�\0�7��������׫4ljj�}8\0\0\0\Z�����<IÂ����	��\0\0�ih����4<z���\0\0Ѓ4�LLL��䌌��>\0\0\0=HC\0\0\0HC\0\0\0HC\0\0\0HC\0\0\0HC\0\0\0HC\0\0\04������z^�l�ʯ��v0��U�[�|��F_82��\0\0Oі��w\"/8��������u��?��4\0\0Oѓ�E��ek�T�<�[������cCÓ�c��x���9���s��U6OMi9W\0\0�C�NC��KϨ�y��#��A�)��GG��S�k����oj�D>_\0\0�S�NCՅ<W���e��)���cu�=+���C\0\0p�8��E�>Յ�:�{+�FkwP]���9\'O\0\0�����PX�͎W��V&���R���t;k\0\0�S�KCu)���k�7V掵�겲cg\r\0\0x�Ci�L�/�w��14<�f^�_g�\0\0��CiX��W�]��*�Ǌw�\\w�ٙ\0\0<š4\\U\r�ܪV�i����=�N~qC�3\'\0\0x�Ci�����?��y\'��)r��\0\0Oq(\r?��	���a�i傡>��̉\0\0��P\Z������#\r\0�R�h\ZާT�����T�5�e��{Mg\Z�7ә\0\0<%��0\Z����������IC\0\0\0%��0\Zvf�5��5�/\rSn>zm���������{	�\0\0�aiX�)�蹤໷4L�9i\0\0�dX\Z&L�%��d�bƟ����7�geY��&+Jz���+[�����Z�xu;�`_�4\0\0KV����X�ޕ�Ĳ.��A�Ⲫ4�zq�<_���Sz)�0�2�����\\ٜ�L}0�\Z\0�L�qih�^�=Ѭ�8{�E\'O%�����a�&m���iT���șC\Z\0�L��i8c�.��b�fL�%�]��I�?��G�\0\0d��JC�1�s~s�at^���G�b�Son�6۵c+.����>[9�ץIC\0\0�Q2+\r��ׂg��a<¬�n�o��K��ui8�s�U{K�21K}Hq^ʯ�ؿ����%HC\0\0�De\\\Z2HC\0\0p����7HC\0\0p����7HC\0\0p�8����I�t�k�*�f:s�\0\0��8����*�fNt�k�*y\'|a�3\'\0\0x�Ci���4;N\\��U�>�v�|x]�3\'\0\0x�Ci�v�e	����jO�Lk+��\\U��̉\0\0��P\Zv\rK�<�\\� ���2z<�[.���{�9q\0\0�SJC��oj�i~TrF{]e�x�O��ek�F#���8\0\0�ΥaKw@M��\nho�L}���n��u�;k\0\0�S�KC�������K��<�14<��_%���ʩ)\'O\Z\0\0�G�0�Tw�yx]YkwP{oe��FT.[S�50��)\0\0��h\Z\n_���՝�6������(k����\\8|�\0\0��8��\"|w��m���ڊf>}8st��Q}Q}Y��4�\0\0�~Ӑ�bjj��B�t��5��c�����/��B\0\0�\0=i�H��*j \ng�_��̮�ō>�S\0\0�3\r\0\0����\0\0\00�3\r\'�fWt�>\n\0\0��4�.6�\0\0\03�H�����0��0�,��֓�#\0\0 ���pq�\0\0p?\ri���pU�v�7U�uV$�o-0׶vaLZ姞J�דּ������S\0\02��YÄF�-��S|��#c�3��Eь���ѥ�\\N��\\�_\0\0����arՙ�7���	�j�}����06�8��d�\0\0xYf�a,g\\46�M�ŭ[�&!���\'�!\0\0�̺�l�@lM�N���\Zs�Swg\"�\0\0x���\Z�/	\'}�d�r�ַ.&W����E|������]f}5�\0\0x�;oy�`�!\0\0�2�0i\0\0��4L@\Z\0\0/#\r��\0\0��H��!\0\0�2�0i\0\0��4L@\Z\0\0/#\r��\0\0��H��!\0\0�2�0i\0\0��4L@\Z\0\0/#\r��\0\0��H��!\0\0�2�0i\0\0��4L@\Z\0\0/#\r��\0\0��H��!\0\0�2�0i\0\0��4�ڸqcv�m۶�>(\0\0\0���Q����.<t�Pii��\0\0p\Ziu�֭��Յ6l(,,����\n\0\0�i��a˖-*\r��ʸ�\0\0��44����_�^�aSS���\0\0Ѐ4����I\ZLLL�>\0\0\0\rHCKMM���ѣGu\0\0���ebb\"\'\'gddD��\0\0\0�A\Z\0\0�@\Z\0\0�@\Z\0\0�@\Z\0\0�@\Z\0\0�@\Z\0\0��3\r���߿��ZesV~��?]��!cy^��ϗ�)n�#�\ZO\0\0�\Z=i8x\'��s��[{�-��]�}��ZN\0\0�\Z\riX��[��Huϣ��k+���>�14<9:6�P���͙��+|��yj��s\0\0���4��y��ʝ��:����aK|t�?��V�cO��f�N���\0\0���4T]��s���]�^]4��>V߳�;\0\0��siX��S](��=�2n�v�U���s�\0\0�q(\ro�U��8qE{fe�8��/a-�aKw���\0\0�ơ4T���x�F{`e�X[Ѭ.+;s�\0\0��8���Ȥ���{\'�CÓj���u&\0@�9���-~5ץ=�\\0V�� o�C��8\0\0�5N�᪢h��V�j�*����ț��\r��8\0\0�5N���u3_LN��F��\\��ȁ\0\0�Ɖ4���K�f:z��w�;���\'\0\0x�i�����4\0\0K�si�����Ԩ=Ȗ�P�\'\0\0x͒K�h*+��曆\r�Y6y\r��ڊ�ޅ$ڵ�+�V�f.�ݻr��\"\r\0�Ұ��0Z��\"��Sm7�447����7e��V3FtC�����_���4\0\0���JC���S}�;\r��.d�ϖ��i\0\0�����	���i��K�Ll.��q��3��Y��%)vk�̝x����l�8�ng��HC\0\0���JC�������,�..��.�R�y�g�>D]x�ih�]��&k�Gc��/Ye��l��z�3�.�\0\0�����\'��F�.(�?�}�8喎Y����j����>e8۬�̣���\"\r\0�&K3\r�)UBł̨.[�-4\r㫥���i��Q�T���hIC\0\0��,�4�l���Ι��iE+g�5�]���٬�PN�۹.(�H�T�8�nIC\0\0��,�4��_J����񄲾�i������[b�5�徆�wk�Ib�LÔ��r��!\0\0Xj�Z\Z2HC\0\0�\ri�y�4\0\0�	i�y�4\0\0��i�lM��LG���r�P�\'\0\0x�i�<�RR�Dg���rǐ7��v;p�\0\0��8����Q+5����Q�q�+ o����8q\0\0�k�H÷�.K�<��V{W�`��h�7sUQ�\'\0\0x�i�50,5��s���������hn����_�q��\0\0�q\"\r������Q��i����>y��)\Z�L:s�\0\0��8��-�5qx�+�=�2t�#��o�]v�\0\0�q(\r�w~w\\��s?/�����dV~�����*��;i\0\0�[�K�pdR����ue��A�A�/Q]�lMQ���c�\0\0x�si(|�Ïn(W���|���ʈQ��Wב�Mk�p�|\0\0�q4\rE���S����õ�|�0���~����>�Ij�\0���t\Z����=҅*z�PcU�I�̛����\0�4��\"�S~޿���(L9|a�3��7��O\r\0\0p��4\0\0�RC\Z\0\0���4�ܚ]ѩ�(\0\0\02���0�<f�I�\0\0�LG\Z�wNo�s����0�0�4q\0\0��Ki��=\0\0x��4�6��̼�_���\"i}k����۴�zV=����˰��2�)\0\0@f�<k�piw����묰+����hFڟ�g�3���\"�0\0\0�̦7\r���̽Y�7M�7T�ƶ�������D\Z\0\0/ˬ4�E����涉��u��_6��2i\0\0�,�.(�f�b%h|X��lט�h~A�YC\0\0�����0~I8�k%s������\'��4w�A �9�,�~%�\0\0x�;oy�`�!\0\0�2�0i\0\0��4L@\Z\0\0/#\r��\0\0��H��!\0\0�2�0i\0\0��4L@\Z\0\0/#\r��\0\0��H��!\0\0�2�0i\0\0��4L@\Z\0\0/#\r��\0\0��H��!\0\0�2�0i\0\0��4L@\Z\0\0/#\r��\0\0��H��!\0\0�2�0i\0\0��4�ڸqcv�m۶�>(\0\0\0���Q����.<t�Pii��\0\0p\Ziu�֭��Յ6l(,,����\n\0\0�i��a˖-*\r��ʸ�\0\0��44����_�^�aSS���\0\0Ѐ4����I\ZLLL�>\0\0\0\rHCKMM���ѣGu\0\0���ebb\"\'\'gddD��\0\0\0�A\Z\0\0�@\Z\0\0�@\Z\0\0�@\Z\0\0�@\Z\0\0�@\Z\0\0�p�pjj��=�U6g�W���U;�\Z��*�-}��Lq�/��\'\0\0x�}I��;���{�����#�;������ǩ\0\0���4,j�-[S��������m�\Z��f�e�����t���V�<5���	\0\0<$�i(]�|�U*��u��;�=��0:z���^���\'~S3x\'��s\n\0\0<%�i�����\n7��=��6��>VW��;\0\0��4,j��.�F��I���Au)����uZ\0���\'\ro�U��8qE{!yy���:���H˙\0\0���4T���x�F{1�V4���i9�\0\0�SҐ��Ȥ���{\'Ka\rO���י8\0\0�4,o�i*�U�PcŻ\rrF�j^��\0\0���4\\U\r�ܪV�I�P��=rF���|�\'\0\0xJ\Z�P�u�/&/����Y��h�\'\0\0xJ\Z��s?/���֞Ds�O.��\0\0OIC\Z������[R�4\0\0��4����+Y���Q{o-�C�uRr\0��,�4�V��r�o^vm���U{��Kz���ZQһ���$��4\0\0���0�\\�\"m��k�O\Z�M�oʲ֌�b~}z��!_i\0\0�gɥ������^�����j�S�I�1/>+I\Z\0\0�Yri�0k�������%�J3�p�F�O���|�������~Ht�%������\0\0@�%���g��~�Ӈ��e�v�����<3��KV�{H���6O�B����)����V \r\0�~K0\rʹ��Jy���	���3|*.�O�6k8s�9_(�����R�=B�72k\0\0��%��	Q5[]�#/���?�*\rSo>K����i\0\02�RKCi&+��L�财QWR{Ys����Yo�7O��s|��^)�>�4�2\0\0Xb�Z\ZN�/%�~_C{�_��?���m������>3c�/d�@<�}\r�<�9f\"�\Z\n\0\0XR�`\Zzo܇�/��\0\0`HCM��.s�m�IC\0\0�i�mXw@��AF�\0\0h��4\\��H*��wX{l1̡N��O.\0\0�4���J�����{�a9#��{�\'\0\0xJ\Z��[;j%Dv�����j��\n�yx]��O.\0\0�4���u�%D��^�=�j��h�3���a�\'\0\0xJ\ZҰk`XB��\n�a�UĐ�hn����/�,��\0\0OIC\Z�\'~S#-�3ګ���i���ek�F#�i9�\0\0�;ғ�-�5qx�+����<������.���\0\0OIO\Z������~^�ee]chx2+�J���ʩ�t�X\0\0�!iK�pdR����ue��A�����.\\���k`8]�\0\0xJ��P����P���e��Q��Wב�o�H�9\0\0���4ồO�ns���V4����7:z�ߨ����,C���B\0\0�iNC155]u�G�P��\ZjN���1��}���|!\0\0X����\"�R~޿���(���v?��xq����\0\0���_i\0\0��C\Z\0\0���4���z�/�\0\0�o�a�����N}\0\0��iJ�h�9�h�4����[+*y]\0\0���4t�u\0\02��4�6�:-v�׾ �ج_L<�T���\r�5�kO۶���*++���\0\0d$���чf�%���z�*��T{1�K�A4痆��E�m\0\0\0�J{\Z&�Z�/�g����-�_��6�ʤ!\0\0�IÙAG\Z\0\0���4������)�2���\Zrl�qi866�iӦE�m\0\0\0�J�}\r�׈c�f��Ȭw��։�]�4�_}�z��f\r��`AAA:�:\0\0����[^�i\0\0<�4���\0\0��HCˍ7v�ܩ�(\0\0\0�!\r-~���ݺ�\0\0@��B\Z\0\0�#\r-�!\0\0�8�����v���G\0\0�\rihimm����}\0\0\0ڐ��\0\0xih!\r\0�Ǒ����G\0\0�\rih!\r\0�Ǒ��\0\0xih!\r\0�Ǒ�������V�G\0\0�\rih!\r\0�Ǒ��\0\0xih9p�@[[��\0\0\0І4�޸qcv�m۶�>(\0\0\0\rH����b{:t���T�A\0\0h@\ZNߺu+\'\'Guannnaa����}P\0\0\0\Z��Q[�lQi�g��&\0\0�\"\r�Z[[ׯ_/iX\\\\��Ԥ�p\0\0\0� \r\ryyy�������\'&&t\0\0������f�����} \0\0\0ڐ��������@ ��@\0\0\0�!\r\0\0` \r\0\0` \r\0\0` \r\0\0` \r\rS��}\\\0\0\0��n\Z���$frrrbbb|Y(O�u(E\0\0�z^LC3\n��¡�s-m��;��=u�w�!�~t�l00�����޽�2�@\0\0��44�P���;%;�~���|�ǟ��)�<��ߖd����L�F$\0��y(\rUJ��mߵ��/��������}����2��jOFY��[[�g��	\0\0 �����{/un|�*�^��_�zf�w�Ǯ^���I\Z�������و�_�ʥ�S����ccc����!\0\0pO����U��§���?\r�~8�gY���ղ��_<^�o`` \n��a�\0\0������B�w�j{�B��Qw\"�K_QYY�����/R�\0\0�e\\����~_��p�7������p��Rux�xu\0\0���ih~����+���ǻ�օj��o>���������!\0\0p����ؘ�����\\��2�\Z��役������j=���m)W��d?��������P($�211A\Z\0�L��4TS��on���ɟ}>����g���+=\"�8s+ٕ�PVx����?00022r��]&\0@�sm\Z��Z�K�������s�N=;����oϜn�x�%uY��������MQ7;��w\0\0,�;�PM��p��\"]]�����t�\Z�z�I���}p���\r�����\n��8\0\0�εi811Q�K�=��ΥKI�W�_��x��_$��ҮgVFo��?����n�8$\r\0@�rg\Z����5������M������굹��B5��m��45_x�X�Ȧ�������Q_U���\0\0,�k���g��/8q\"i���򽏢gW\'�G}��+������5e�=\0\0��3\r\'\'\'O�+�n{������#�q�\Zg�l[@ʐ�����ѝ�w��si~�������\0\0`�\\��ꃆu�w��_;x�>�{�KCI�R�e|�՜.��~>n\0\02�;�p||�vk�t�Χ��h�^�(���-8\rOmʷ�J�S�����}>������(�!\0\0�P�OÎ={�c�ih�UR\Z��D!\r\0@�ry\Zny�[I���n�I�2/(��\0\0�\\����P�> ����$�J�w���|�4\0\0���4�T�Ǳ��D�V��S�yͿ}���s��ɲ[��5�!\0\0pצa00�ny}v˶��.�����D�>�K����5\0\0��LÉ�	��7R�m�3+�M��_򟶟�bׂ�}T<�R���4���J�Χ�����S��y\r\0\0p��t��RiG��*���g����Ƥ���<��C��c����x�=as�ዟ��<U�ҫ����\Z\0\0��;��O>�{�no�t�\\�\Z��J\Z��f?�����c�I�=�ZE籣Gϝ;����?�\0\0.��4�����\ri�����{��M��$�;�.�q/	ǳ[���Jv����m�OO�:e�\ni\0\02�;�������[�3ُ~�N������.�͢gWo~�I5���ٛz��Kj�q��_���=w��j24\0\0͵i�&C�Х3g�e�7r��;e����_��?�Kɇ��/��|���>�j2i\0\02�;�p:vMy||<��W�ndS�߹�z����P}�YvU�_ ]�>ehN��q5\0\0d4צ�9q822200p�x����G�=�0�.�Mԍ�U��׫K�~�_vn~ʐ)C\0\0��\\����O����B���~�Cue�\'��]Ϭ��Ic�B����w\"�ۻP}�Dv./��\0��<\r����`��������G������g����g�����Y��P�����t��=E�.��n�Kɤ!\0\0�tnN��Tux��s�/߰��Z�/�K_y��\'w=�R�<�_�\"T���/�ZW[�nUC\0\0�ry\ZNϨ��������ϗ�H�+�)�<��W��Ws�=��tr����\\vB\0\0�q\ZN\'�a(\Z�����|���Mg\Z��;�y�$�9���{��4����PMʆ���.\0\0��4������������`�\n�+���}b�ۨ%򔬠�P6�\res�	]\0\0��+i8�É�������@����������>�U�S���B5Y(��N�B\0\0�>J��X�D	���!)�����X�S�����t!\0\0po��b���qՈʈ��PV�ՈB\0\0�z^LC�D199�21�,���:D!\0\0p=�a��Y�>.\0\0\0��� �fNV��\0\0\0\0IEND�B`�',1,'QingJiaLiuCheng.png'),(3,0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<process name=\"QingJiaLiuCheng\" xmlns=\"http://jbpm.org/4.4/jpdl\">\n   <start name=\"start1\" g=\"66,16,48,48\">\n      <transition name=\"to task1\" to=\"ShaStudent\" g=\"-52,-22\"/>\n   </start>\n   <end name=\"end1\" g=\"66,348,48,48\"/>\n   <task name=\"ShaStudent\" g=\"28,96,125,52\" assignee=\"丁傻子\">\n      <transition name=\"to task2\" to=\"ShaFuDaoYuan\" g=\"-52,-22\"/>\n   </task>\n   <task name=\"ShaFuDaoYuan\" g=\"27,180,126,52\" assignee=\"宋傻子\">\n      <transition name=\"to task3\" to=\"ShaYuanZhang\" g=\"-52,-22\"/>\n   </task>\n   <task name=\"ShaYuanZhang\" g=\"16,264,149,52\" assignee=\"王傻子\">\n      <transition name=\"to end1\" to=\"end1\" g=\"-50,-22\"/>\n   </task>\r\n</process>',1,'QingJiaLiuCheng.jpdl.xml');

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

insert  into `jbpm4_task`(`DBID_`,`CLASS_`,`DBVERSION_`,`NAME_`,`DESCR_`,`STATE_`,`SUSPHISTSTATE_`,`ASSIGNEE_`,`FORM_`,`PRIORITY_`,`CREATE_`,`DUEDATE_`,`PROGRESS_`,`SIGNALLING_`,`EXECUTION_ID_`,`ACTIVITY_NAME_`,`HASVARS_`,`SUPERTASK_`,`EXECUTION_`,`PROCINST_`,`SWIMLANE_`,`TASKDEFNAME_`) values (10005,'T',1,'ShaFuDaoYuan',NULL,'open',NULL,'宋傻子',NULL,0,'2019-06-11 15:35:49',NULL,NULL,'','QingJiaLiuCheng.10001','ShaFuDaoYuan','\0',NULL,10001,10001,NULL,'ShaFuDaoYuan'),(20005,'T',1,'ShaFuDaoYuan',NULL,'open',NULL,'宋傻子',NULL,0,'2019-06-11 15:43:09',NULL,NULL,'','QingJiaLiuCheng.20001','ShaFuDaoYuan','\0',NULL,20001,20001,NULL,'ShaFuDaoYuan');

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

insert  into `oa_application`(`id`,`title`,`applyTime`,`status`,`filePath`,`templateId`,`userId`) values (1,'请假单_丁傻子_2019-06-11','2019-06-11 14:58:16','已通过','E:\\WEB\\软件\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/11/7c7236fc-2a96-4d0c-a01e-fdb62f254efd.doc',1,11),(2,'请假单_徐傻子_2019-06-11','2019-06-11 15:10:00','未通过','E:\\WEB\\软件\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/11/eae2cfec-e0c8-4bfe-afcc-df945f1746a2.doc',1,7),(3,'请假单_丁傻子_2019-06-11','2019-06-11 15:35:47','审批中','E:\\WEB\\软件\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/11/dd3ddb4b-9850-4753-ab54-1e454fecae40.doc',1,11),(4,'请假单_丁傻子_2019-06-11','2019-06-11 15:43:08','审批中','E:\\WEB\\软件\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/11/c43322f8-9c47-4bf6-b592-3f1633323c13.doc',1,11),(5,'请假单_丁傻子_2019-06-16','2019-06-16 13:54:11','未通过','E:\\WEB\\软件\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/16/102c021f-4c9b-4b92-b10b-c5327bd91e4c.doc',1,11),(6,'请假单_丁傻子_2019-06-16','2019-06-16 13:54:12','已通过','E:\\WEB\\软件\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/16/91c744b2-681e-47b1-bdf3-556e1c6f23b3.doc',1,11),(7,'请假单_丁傻子_2019-06-16','2019-06-16 16:43:42','已通过','E:\\WEB\\软件\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/16/eeeabd16-4ce5-4b1b-afdb-bc2161aca67a.doc',1,11);

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

insert  into `oa_approveinfo`(`id`,`approveTime`,`approval`,`comment`,`applicationId`,`userId`) values (1,'2019-06-11 16:18:20','','给丁傻子一个假',1,10),(2,'2019-06-11 16:19:49','','园长同一给傻子一个假了',1,9),(3,'2019-06-16 13:58:11','','',6,10),(4,'2019-06-16 16:38:18','\0','',2,10),(5,'2019-06-16 16:38:50','\0','',5,10),(6,'2019-06-16 16:39:50','','',6,9),(7,'2019-06-16 16:45:13','','发一个吧',7,10),(8,'2019-06-16 16:46:08','','通用',7,9);

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

insert  into `oa_department`(`id`,`name`,`description`,`parentId`) values (7,'办公室','总办公室',NULL),(8,'校长办公室',NULL,7),(9,'院长办公室',NULL,7),(10,'主任办公室',NULL,7),(11,'辅导员办公室',NULL,7),(12,'教师办公室',NULL,7),(18,'教务处',NULL,NULL),(19,'总务处',NULL,NULL),(20,'后勤处',NULL,19),(21,'学生处',NULL,NULL),(22,'人事处',NULL,19),(23,'财务处',NULL,19);

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

insert  into `oa_forum`(`id`,`name`,`description`,`position_`,`topicCount`,`articleCount`,`topicId`) values (1,'管理员新建了一个版块','这是管理员第一次新建的一个版块',1,3,8,3),(2,'java web','这是java web课设学习版块',2,1,6,4);

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

insert  into `oa_privilege`(`id`,`name`,`url`,`parentId`) values (1,'系统管理',NULL,NULL),(2,'岗位管理','/role_list',1),(3,'部门管理','/department_list',1),(4,'用户管理','/user_list',1),(5,'岗位增加','/role_add',2),(6,'岗位删除','/role_delete',2),(7,'岗位修改','/role_edit',2),(8,'岗位查看','/role_list',2),(9,'部门增加','/department_add',3),(10,'部门删除','/department_delete',3),(11,'部门修改','/department_edit',3),(12,'部门查看','/department_list',3),(13,'用户增加','/user_add',4),(14,'用户删除','/user_delete',4),(15,'用户修改','/user_edit',4),(16,'用户查找','/user_list',4),(17,'个人办公','/rtr',NULL),(18,'审批流转',NULL,NULL),(19,'网上交流',NULL,NULL),(20,'用户初始化密码','/user_intiPassword',4),(21,'论坛','/forum_list',19),(22,'论坛管理','/forumManage_list',19),(23,'审批流程管理','/processDefinition_list',18),(24,'表单模板管理','/template_list',18),(25,'起草申请','/flow_templateList',18),(26,'待我审批','/flow_myTaskList',18),(27,'我的申请查询','/flow_myApplicationList',18);

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

insert  into `oa_reply`(`id`,`content`,`ipAddress`,`postTime`,`deleted`,`userId`,`topicId`) values (1,'<p>傻子学生回复一下辅导员</p>\r\n',NULL,'2019-06-11 17:24:11',0,NULL,2),(2,'<p>学生又来了</p>\r\n',NULL,'2019-06-11 17:25:11',0,NULL,2),(3,'<p>我是学生1号</p>\r\n',NULL,'2019-06-16 13:55:45',0,NULL,1),(4,'<p>我回复自己&nbsp; 是挺傻的</p>\r\n',NULL,'2019-06-16 14:43:31',0,NULL,3),(5,'<p>你咋不好好学习</p>\r\n',NULL,'2019-06-16 14:44:00',0,NULL,1),(6,'<p>哎 真的好难哦</p>\r\n',NULL,'2019-06-16 16:59:02',0,NULL,4),(7,'<p><span style=\"font-family:times new roman,times,serif\"><strong><img alt=\"wink\" src=\"http://localhost:8080/OAXP/ckeditor/plugins/smiley/images/wink_smile.gif\" style=\"height:20px; width:20px\" title=\"wink\" />辅导员也觉得好难哦</strong></span></p>\r\n',NULL,'2019-06-16 17:00:37',0,NULL,4),(8,'<p>啊啊啊<img alt=\"angel\" src=\"http://localhost:8080/OAXP/ckeditor/plugins/smiley/images/angel_smile.gif\" style=\"height:20px; width:20px\" title=\"angel\" /></p>\r\n',NULL,'2019-06-16 17:01:22',0,NULL,4),(9,'<p>呃呃呃</p>\r\n',NULL,'2019-06-16 17:01:35',0,NULL,4),(10,'<p>ereret</p>\r\n',NULL,'2019-06-16 17:01:58',0,NULL,4);

/*Table structure for table `oa_role` */

DROP TABLE IF EXISTS `oa_role`;

CREATE TABLE `oa_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `oa_role` */

insert  into `oa_role`(`id`,`name`,`description`) values (6,'校长','校长'),(13,'园长','傻子园长'),(14,'辅导员','辅导员'),(15,'教师','教师'),(17,'学生','学生');

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

insert  into `oa_template`(`id`,`name`,`processDefinitionKey`,`filePath`) values (1,'请假单','QingJiaLiuCheng','E:\\WEB\\软件\\tomcat\\apache-tomcat-7.0.52\\webapps\\OAXP\\WEB-INF\\uploadFiles/2019/06/16/5299f269-8602-4cf6-8aad-530e176c05ff.doc');

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

insert  into `oa_topic`(`id`,`title`,`content`,`ipAddress`,`postTime`,`lastUpdateTime`,`type`,`replyCount`,`userId`,`replyId`,`forumId`) values (1,'傻学生主题 ','<p>我是傻学生 我来发新主题</p>\r\n',NULL,'2019-06-11 16:16:49','2019-06-16 14:44:00',0,2,NULL,5,1),(2,'我是辅导员','<p>傻辅导员来发新贴</p>\r\n',NULL,'2019-06-11 16:19:09','2019-06-11 17:25:11',0,2,NULL,2,1),(3,'校长来发帖了','<p>啊哈哈哈哈&nbsp; 我是傻子</p>\r\n',NULL,'2019-06-16 14:42:50','2019-06-16 14:43:31',0,1,NULL,4,1),(4,'学生','<p>java web 课设太难了</p>\r\n',NULL,'2019-06-16 16:58:45','2019-06-16 17:01:58',0,5,NULL,10,2);

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

insert  into `oa_user`(`id`,`loginName`,`name`,`password`,`phone`,`email`,`gender`,`description`,`departmentId`) values (7,'admin','徐傻子','81dc9bdb52d04dc20036dbd8313ed055','123','123@qq.com',0,'傻子管理员',NULL),(8,'于傻子','于傻子','81dc9bdb52d04dc20036dbd8313ed055','1515155','4151516',0,'于傻子  傻校长',8),(9,'王傻子','王傻子','81dc9bdb52d04dc20036dbd8313ed055','1521621','15215202',0,'王大傻子  傻园长',10),(10,'宋傻子','宋傻子','81dc9bdb52d04dc20036dbd8313ed055','151651','15610',0,'宋傻子 辅导员',11),(11,'丁傻子','丁傻子','81dc9bdb52d04dc20036dbd8313ed055','1556132465','51206',1,'丁傻子  傻学生',21);

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
