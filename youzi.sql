/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : youzi

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-08-29 21:06:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ambassador
-- ----------------------------
DROP TABLE IF EXISTS `ambassador`;
CREATE TABLE `ambassador` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ambassador
-- ----------------------------

-- ----------------------------
-- Table structure for corporation
-- ----------------------------
DROP TABLE IF EXISTS `corporation`;
CREATE TABLE `corporation` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_icon_url` varchar(255) DEFAULT NULL,
  `c_name` varchar(255) DEFAULT NULL,
  `c_introduction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of corporation
-- ----------------------------
INSERT INTO `corporation` VALUES ('1', 'http://127.0.0.1:8088/cor_logo/baidu.png', '百度', '百度（纳斯达克：BIDU），全球最大的中文搜索引擎、最大的中文网站。');
INSERT INTO `corporation` VALUES ('2', 'http://127.0.0.1:8088/cor_logo/yamaxun.jpg', '亚马逊', '在2017年6月7日发布的2017年《财富》美国500强排行榜中，排名第十二。2017年6月，《2017年BrandZ最具价值全球品牌100强》公布，亚马逊名列第4位。');
INSERT INTO `corporation` VALUES ('3', 'http://127.0.0.1:8088/cor_logo/jingdong.jpg', '京东', '世界五百强366位，2017年8月3日，2017年“中国互联网企业100强”榜单发布，京东排名第四位。');
INSERT INTO `corporation` VALUES ('4', 'http://127.0.0.1:8088/cor_logo/wanda.jpg', '万达集团', '2017年位列《财富》世界500强380名。2017年万达集团总资产8826.4亿元，2017年上半年收入1348.5亿元。');
INSERT INTO `corporation` VALUES ('5', 'http://127.0.0.1:8088/cor_logo/biguiyuan.jpg', '碧桂园', '碧桂园集团，即碧桂园控股有限公司（股份代号：2007.HK），总部位于广东佛山顺德，是中国最大的新型城镇化住宅开发商');
INSERT INTO `corporation` VALUES ('6', 'http://127.0.0.1:8088/cor_logo/wanke.jpg', '万科', '万科集团，是目前中国最大的专业住宅开发企业，也是股市里的代表性地产蓝筹股。');
INSERT INTO `corporation` VALUES ('7', 'http://127.0.0.1:8088/cor_logo/zhongliang.jpg', '中粮', '中粮集团，世界500强，第121位（2016年），大型央企，中国领先的农产品、食品领域多元化产品和服务供应商');
INSERT INTO `corporation` VALUES ('8', 'http://127.0.0.1:8088/cor_logo/hongxing.jpg', '红星美凯龙', '红星美凯龙，国内经营面积最大、商场数量最多以及地域覆盖面最广阔的全国性家居装饰及家具商场运营商。');
INSERT INTO `corporation` VALUES ('9', 'http://127.0.0.1:8088/cor_logo/aisenzhe.jpg', '埃森哲', '埃森哲（Accenture）是全球最大的管理咨询、信息技术和业务流程外包的跨国企业。世界500强312位');

-- ----------------------------
-- Table structure for dicstatus
-- ----------------------------
DROP TABLE IF EXISTS `dicstatus`;
CREATE TABLE `dicstatus` (
  `status` int(11) NOT NULL,
  `adj` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dicstatus
-- ----------------------------
INSERT INTO `dicstatus` VALUES ('0', '未处理');
INSERT INTO `dicstatus` VALUES ('1', '通过筛选');
INSERT INTO `dicstatus` VALUES ('2', '录用');
INSERT INTO `dicstatus` VALUES ('3', '淘汰');

-- ----------------------------
-- Table structure for employment
-- ----------------------------
DROP TABLE IF EXISTS `employment`;
CREATE TABLE `employment` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_u_id` int(11) DEFAULT NULL,
  `fk_j_id` int(11) DEFAULT NULL,
  `u_resume_url` varchar(255) DEFAULT NULL,
  `status` int(11) unsigned zerofill DEFAULT '00000000000',
  `e_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `ex_hr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  KEY `fk_u_id` (`fk_u_id`),
  KEY `fk_j_id` (`fk_j_id`),
  CONSTRAINT `employment_ibfk_1` FOREIGN KEY (`fk_u_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `employment_ibfk_2` FOREIGN KEY (`fk_j_id`) REFERENCES `job` (`j_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employment
-- ----------------------------
INSERT INTO `employment` VALUES ('1', '1', '1', 'resume/20180714\\0b30c96c7321639cac71ef426c9f9cd8.pdf', '00000000002', '2018-07-14 12:12:35', '2018-07-19 14:14:27', '1');
INSERT INTO `employment` VALUES ('2', '1', '2', 'resume/20180714\\871164ba81a9b2d38d8037a22baf836e.pdf', '00000000000', '2018-07-14 21:59:58', '2018-07-14 21:59:58', null);
INSERT INTO `employment` VALUES ('3', '1', '4', 'resume/20180717\\0f2e1f895cb1c29b28f0e3305939de8e.pdf', '00000000000', '2018-07-17 15:38:43', '2018-07-17 15:38:43', null);

-- ----------------------------
-- Table structure for hr
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
CREATE TABLE `hr` (
  `h_name` varchar(255) DEFAULT NULL,
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_token` varchar(255) DEFAULT NULL,
  `h_email` varchar(255) DEFAULT NULL,
  `h_phone` varchar(255) DEFAULT NULL,
  `h_passwd` varchar(255) NOT NULL,
  `fk_c_id` int(11) DEFAULT NULL,
  `h_img_url` varchar(255) DEFAULT NULL,
  `h_introduction` varchar(255) DEFAULT NULL,
  `h_level` varchar(255) DEFAULT NULL,
  `course_attend_num` int(11) DEFAULT '0',
  PRIMARY KEY (`h_id`),
  KEY `fk_c_id` (`fk_c_id`),
  CONSTRAINT `hr_ibfk_1` FOREIGN KEY (`fk_c_id`) REFERENCES `corporation` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr
-- ----------------------------
INSERT INTO `hr` VALUES ('盛宝荣', '1', '31177b004b2f9707bb580984c8ca6f8c', 'sbr@qq.com', '17545148302', 'e10adc3949ba59abbe56e057f20f883e', '1', 'http://127.0.0.1:8088/head/lb.jpg', '盛宝荣，东北大学硕士，柚子直聘联合创始人兼全国校园事业部总经理，沈阳柚子人力资源有限公司总经理', '高级hr', '0');
INSERT INTO `hr` VALUES ('刘俊', '2', null, 'lj@youzil.com', '3456782', 'e10adc3949ba59abbe56e057f20f883e', '2', 'http://127.0.0.1:8088/head/timg.jpg', '刘俊，柚子直聘联合创始人兼华南区域总经理，广西大学生创业营销联盟荣誉主席 广西大学生创业就业研究会会长助理 柳州高校创业联盟创始人 ', '高级hr', '0');
INSERT INTO `hr` VALUES ('马亚娟', '3', null, 'myj@youzi.com', '2345606', 'e10adc3949ba59abbe56e057f20f883e', '3', 'http://127.0.0.1:8088/head/lyr.jpg', '马亚娟，华中科技大学博士，柚子直聘联合创始人兼华中区域负责人， 武汉柚子人力资源有限公司总经理', '高级hr', '0');
INSERT INTO `hr` VALUES ('刘朋', '4', null, 'lp@youzi.com', '2356853', 'e10adc3949ba59abbe56e057f20f883e', '4', 'http://127.0.0.1:8088/head/mj.jpg', '刘朋，现东北大学本科，柚子直聘联合创始人兼东北区域总经理', '高级hr', '0');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `j_id` int(11) NOT NULL AUTO_INCREMENT,
  `j_name` varchar(255) DEFAULT NULL,
  `fk_c_id` int(11) DEFAULT NULL,
  `j_arrange` varchar(255) DEFAULT NULL,
  `j_min_salary` int(10) DEFAULT NULL,
  `j_max_salary` int(10) DEFAULT NULL,
  `j_description` varchar(255) DEFAULT NULL,
  `j_location` varchar(255) DEFAULT NULL,
  `j_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`j_id`),
  KEY `fk_c_id` (`fk_c_id`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`fk_c_id`) REFERENCES `corporation` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '新媒体内容运营实习生', '1', '4天/周', '100', '150', null, '上海', '2');
INSERT INTO `job` VALUES ('2', '互联网BD实习生', '2', '3天/周', '100', '150', null, '上海', '2');
INSERT INTO `job` VALUES ('3', '客户执行实习生AE Intern', '3', '5天/周', '120', '160', null, '北京', '2');
INSERT INTO `job` VALUES ('4', 'IB业务Intern', '4', '4天/周', '130', '170', null, '上海', '2');
INSERT INTO `job` VALUES ('5', 'Android开发实习生', '5', '5天/周', '150', '200', null, '杭州', '1');
INSERT INTO `job` VALUES ('6', 'php开发工程师', '6', '全职', '130', '160', null, '广州', '1');
INSERT INTO `job` VALUES ('7', '客户执行实习生AE Intern', '7', '3天/周', '100', '160', null, '广州', '2');
INSERT INTO `job` VALUES ('8', 'Web前端开发', '8', '全职', '150', '260', null, '杭州', '1');
INSERT INTO `job` VALUES ('9', '服务器开发工程师', '1', '全职', '160', '270', null, '北京', '1');
INSERT INTO `job` VALUES ('10', '客户信息核对(暑期实习)', '3', '3天/周', '120', '160', null, '北京', '11');

-- ----------------------------
-- Table structure for jobtype1
-- ----------------------------
DROP TABLE IF EXISTS `jobtype1`;
CREATE TABLE `jobtype1` (
  `t1_id` int(11) NOT NULL AUTO_INCREMENT,
  `t1_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t1_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobtype1
-- ----------------------------
INSERT INTO `jobtype1` VALUES ('1', 'IT互联网');
INSERT INTO `jobtype1` VALUES ('2', '市场商务');
INSERT INTO `jobtype1` VALUES ('3', '电子电气');
INSERT INTO `jobtype1` VALUES ('4', '其他类型');
INSERT INTO `jobtype1` VALUES ('5', '人事行政');
INSERT INTO `jobtype1` VALUES ('6', '外语外贸');
INSERT INTO `jobtype1` VALUES ('7', '财经法务');
INSERT INTO `jobtype1` VALUES ('8', '教育咨询');
INSERT INTO `jobtype1` VALUES ('9', '媒体设计');

-- ----------------------------
-- Table structure for jobtype2
-- ----------------------------
DROP TABLE IF EXISTS `jobtype2`;
CREATE TABLE `jobtype2` (
  `t2_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_t1_id` int(11) DEFAULT NULL,
  `t2_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t2_id`),
  KEY `fk_t1_id` (`fk_t1_id`),
  CONSTRAINT `jobtype2_ibfk_1` FOREIGN KEY (`fk_t1_id`) REFERENCES `jobtype1` (`t1_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobtype2
-- ----------------------------
INSERT INTO `jobtype2` VALUES ('1', '1', '软件');
INSERT INTO `jobtype2` VALUES ('2', '1', '运营');
INSERT INTO `jobtype2` VALUES ('3', '1', '硬件');
INSERT INTO `jobtype2` VALUES ('4', '2', '商务');
INSERT INTO `jobtype2` VALUES ('5', '2', '销售');
INSERT INTO `jobtype2` VALUES ('6', '2', '公关');
INSERT INTO `jobtype2` VALUES ('7', '3', '电子');
INSERT INTO `jobtype2` VALUES ('8', '3', '电气');
INSERT INTO `jobtype2` VALUES ('9', '4', '体育快消');
INSERT INTO `jobtype2` VALUES ('10', '4', '机械制造');
INSERT INTO `jobtype2` VALUES ('11', '5', '人力资源');
INSERT INTO `jobtype2` VALUES ('12', '5', '猎头');
INSERT INTO `jobtype2` VALUES ('13', '5', '行政');
INSERT INTO `jobtype2` VALUES ('14', '6', '外语');
INSERT INTO `jobtype2` VALUES ('15', '6', '外贸');
INSERT INTO `jobtype2` VALUES ('16', '7', '金融');
INSERT INTO `jobtype2` VALUES ('17', '7', '投资');
INSERT INTO `jobtype2` VALUES ('18', '7', '法务');
INSERT INTO `jobtype2` VALUES ('19', '8', '教育');
INSERT INTO `jobtype2` VALUES ('20', '8', '咨询');
INSERT INTO `jobtype2` VALUES ('21', '8', '广告');
INSERT INTO `jobtype2` VALUES ('22', '8', '编辑');
INSERT INTO `jobtype2` VALUES ('23', '8', '设计');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_name` varchar(255) DEFAULT NULL,
  `u_email` varchar(255) NOT NULL,
  `u_passwd` varchar(255) NOT NULL,
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_phone` varchar(20) DEFAULT NULL,
  `u_token` varchar(255) DEFAULT NULL,
  `u_img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('lhb', 'lhb@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '18443145302', 'c3629727d75aff9fe73a813a0716da36', null);

-- ----------------------------
-- View structure for cor_hr
-- ----------------------------
DROP VIEW IF EXISTS `cor_hr`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cor_hr` AS select `corporation`.`c_id` AS `c_id`,`hr`.`h_name` AS `h_name`,`hr`.`h_token` AS `h_token`,`hr`.`h_email` AS `h_email`,`hr`.`h_phone` AS `h_phone`,`hr`.`h_img_url` AS `h_img_url`,`hr`.`h_level` AS `h_level`,`hr`.`h_introduction` AS `h_introduction`,`hr`.`h_id` AS `h_id`,`corporation`.`c_name` AS `c_name`,`hr`.`h_passwd` AS `h_passwd` from (`corporation` join `hr` on((`hr`.`fk_c_id` = `corporation`.`c_id`))) ;

-- ----------------------------
-- View structure for cor_job
-- ----------------------------
DROP VIEW IF EXISTS `cor_job`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cor_job` AS select `corporation`.`c_id` AS `c_id`,`corporation`.`c_icon_url` AS `c_icon_url`,`corporation`.`c_name` AS `c_name`,`job`.`j_name` AS `j_name`,`job`.`j_id` AS `j_id`,`job`.`j_description` AS `j_description`,`job`.`j_arrange` AS `j_arrange`,`job`.`j_min_salary` AS `j_min_salary`,`job`.`j_max_salary` AS `j_max_salary`,`job`.`j_location` AS `j_location` from (`job` join `corporation` on((`job`.`fk_c_id` = `corporation`.`c_id`))) ;

-- ----------------------------
-- View structure for exam_candidate
-- ----------------------------
DROP VIEW IF EXISTS `exam_candidate`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_candidate` AS select `hr`.`h_name` AS `ex_hr_name`,`user`.`u_name` AS `u_name`,`job`.`j_name` AS `j_name`,`job`.`j_location` AS `j_location`,`job`.`j_description` AS `j_description`,`job`.`j_max_salary` AS `j_max_salary`,`job`.`j_min_salary` AS `j_min_salary`,`job`.`j_arrange` AS `j_arrange`,`employment`.`e_id` AS `e_id`,`employment`.`u_resume_url` AS `u_resume_url`,`employment`.`status` AS `status`,`corporation`.`c_id` AS `c_id`,`hr`.`h_token` AS `h_token`,`user`.`u_email` AS `u_email`,`employment`.`e_time` AS `e_time`,`user`.`u_img_url` AS `u_img_url`,`employment`.`ex_hr_id` AS `ex_hr_id`,`dicstatus`.`adj` AS `adj` from (((((`hr` join `corporation` on((`hr`.`fk_c_id` = `corporation`.`c_id`))) join `job` on((`job`.`fk_c_id` = `corporation`.`c_id`))) join `employment` on((`employment`.`fk_j_id` = `job`.`j_id`))) join `user` on((`employment`.`fk_u_id` = `user`.`u_id`))) join `dicstatus` on((`dicstatus`.`status` = `employment`.`status`))) ;
