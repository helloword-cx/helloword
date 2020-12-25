/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : jsfriend

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-09-18 21:38:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fw`
-- ----------------------------
DROP TABLE IF EXISTS `fw`;
CREATE TABLE `fw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `other_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g40v6yvmd6ex4wto7j6qp1ebh` (`other_id`),
  CONSTRAINT `FK_g40v6yvmd6ex4wto7j6qp1ebh` FOREIGN KEY (`other_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw
-- ----------------------------
INSERT INTO `fw` VALUES ('5', '4', '1');
INSERT INTO `fw` VALUES ('6', '3', '1');
INSERT INTO `fw` VALUES ('7', '3', '1');
INSERT INTO `fw` VALUES ('8', '3', '1');
INSERT INTO `fw` VALUES ('9', '3', '5');
INSERT INTO `fw` VALUES ('10', '3', '5');
INSERT INTO `fw` VALUES ('11', '3', '5');
INSERT INTO `fw` VALUES ('12', '5', '3');
INSERT INTO `fw` VALUES ('13', '3', '1');
INSERT INTO `fw` VALUES ('14', '1', '6');

-- ----------------------------
-- Table structure for `t_advice`
-- ----------------------------
DROP TABLE IF EXISTS `t_advice`;
CREATE TABLE `t_advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `isXS` int(11) DEFAULT NULL,
  `senduser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sl3xsldfhj6u23qnfem2xx9i5` (`senduser_id`),
  CONSTRAINT `FK_sl3xsldfhj6u23qnfem2xx9i5` FOREIGN KEY (`senduser_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_advice
-- ----------------------------
INSERT INTO `t_advice` VALUES ('1', '这都是啥啊', '2017-03-06 21:26:08', '1', '1');
INSERT INTO `t_advice` VALUES ('2', '愁死我了', '2017-03-06 21:26:13', '1', '1');
INSERT INTO `t_advice` VALUES ('3', '社区外来人员公告', '2017-03-06 21:27:02', '1', '1');
INSERT INTO `t_advice` VALUES ('4', '外来人员注册要注意。。。', '2017-03-06 21:27:39', '1', '1');
INSERT INTO `t_advice` VALUES ('5', '我感觉不好', '2017-03-06 23:37:52', '1', '5');
INSERT INTO `t_advice` VALUES ('6', '发表意见', '2019-09-18 21:32:12', '1', '6');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `comuser_id` int(11) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  `sayMood_id` int(11) DEFAULT NULL,
  `sayuser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ewiban3bx8u7u6o5k7dhqxlwn` (`comuser_id`),
  KEY `FK_53uroixicwfdfqdyhmsgbgddl` (`father_id`),
  KEY `FK_73okwccwkkv4lps4ddmswks5l` (`sayMood_id`),
  KEY `FK_8ftxfgrrd86hv523r2njo10ek` (`sayuser_id`),
  CONSTRAINT `FK_53uroixicwfdfqdyhmsgbgddl` FOREIGN KEY (`father_id`) REFERENCES `t_comment` (`id`),
  CONSTRAINT `FK_73okwccwkkv4lps4ddmswks5l` FOREIGN KEY (`sayMood_id`) REFERENCES `t_saymood` (`id`),
  CONSTRAINT `FK_8ftxfgrrd86hv523r2njo10ek` FOREIGN KEY (`sayuser_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_ewiban3bx8u7u6o5k7dhqxlwn` FOREIGN KEY (`comuser_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '真好看', '2017-03-06 21:39:15', '1', null, '1', '1');
INSERT INTO `t_comment` VALUES ('2', '好看啥', '2017-03-06 21:39:53', '1', '1', '1', '1');
INSERT INTO `t_comment` VALUES ('3', '就是好看', '2017-03-06 21:40:03', '1', '2', '1', '1');
INSERT INTO `t_comment` VALUES ('4', '自己恢复自己', '2017-03-06 21:51:02', '1', null, '13', '1');
INSERT INTO `t_comment` VALUES ('5', '我来了', '2017-03-06 21:51:09', '1', '4', '13', '1');
INSERT INTO `t_comment` VALUES ('6', '真好看', '2017-03-06 21:56:52', '3', null, '3', '1');
INSERT INTO `t_comment` VALUES ('7', '你做完做什么了啊', '2017-03-06 21:57:02', '3', null, '10', '1');
INSERT INTO `t_comment` VALUES ('8', '写代码了', '2017-03-06 21:57:16', '1', '7', '10', '3');
INSERT INTO `t_comment` VALUES ('9', '你的这个好漂亮', '2017-03-06 23:35:54', '3', null, '17', '5');
INSERT INTO `t_comment` VALUES ('10', '一般一般了', '2017-03-06 23:36:09', '5', '9', '17', '3');
INSERT INTO `t_comment` VALUES ('11', '真心不错', '2017-03-06 23:36:22', '3', '10', '17', '5');
INSERT INTO `t_comment` VALUES ('12', '好吧好吧再见了', '2017-03-06 23:36:34', '5', '11', '17', '3');
INSERT INTO `t_comment` VALUES ('13', '帮你点了个赞', '2019-09-18 21:34:34', '6', null, '1', '1');

-- ----------------------------
-- Table structure for `t_friend`
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beizhu` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `groups` int(11) NOT NULL,
  `isDelete` int(11) NOT NULL,
  `frienduser_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_39rrj2x2j68j8o826a9aym0sl` (`frienduser_id`),
  KEY `FK_4ynqy6bjqbgdqmuwpnw7fkfgc` (`user_id`),
  CONSTRAINT `FK_39rrj2x2j68j8o826a9aym0sl` FOREIGN KEY (`frienduser_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_4ynqy6bjqbgdqmuwpnw7fkfgc` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_friend
-- ----------------------------
INSERT INTO `t_friend` VALUES ('1', null, '2017-03-06 21:52:10', '2', '2', '1', '3');
INSERT INTO `t_friend` VALUES ('2', null, '2017-03-06 23:07:22', '1', '1', '4', '1');
INSERT INTO `t_friend` VALUES ('3', null, '2017-03-06 23:09:29', '1', '2', '4', '1');
INSERT INTO `t_friend` VALUES ('4', null, '2017-03-06 23:32:13', '2', '2', '3', '5');
INSERT INTO `t_friend` VALUES ('5', null, '2017-03-06 23:32:21', '1', '2', '4', '5');
INSERT INTO `t_friend` VALUES ('6', null, '2017-03-06 23:32:34', '2', '2', '1', '5');
INSERT INTO `t_friend` VALUES ('7', null, '2019-09-18 21:32:29', '2', '2', '1', '6');

-- ----------------------------
-- Table structure for `t_grade`
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `endMax` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `startMin` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('1', null, '500', '普通会员', '0', '1');
INSERT INTO `t_grade` VALUES ('2', null, '1200', '黄金会员', '501', '2');
INSERT INTO `t_grade` VALUES ('3', null, '1800', '白金会员', '1201', '3');
INSERT INTO `t_grade` VALUES ('4', null, '20000', '钻石会员', '1801', '4');

-- ----------------------------
-- Table structure for `t_integralt`
-- ----------------------------
DROP TABLE IF EXISTS `t_integralt`;
CREATE TABLE `t_integralt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1bvv46oluddyii9yo0fm5atfk` (`user_id`),
  CONSTRAINT `FK_1bvv46oluddyii9yo0fm5atfk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_integralt
-- ----------------------------

-- ----------------------------
-- Table structure for `t_js`
-- ----------------------------
DROP TABLE IF EXISTS `t_js`;
CREATE TABLE `t_js` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fenshu` int(11) NOT NULL,
  `miaoshu` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_js
-- ----------------------------
INSERT INTO `t_js` VALUES ('1', '2', '登陆注册', '1');
INSERT INTO `t_js` VALUES ('2', '2', '会员登陆', '2');
INSERT INTO `t_js` VALUES ('3', '3', '发说说', '3');
INSERT INTO `t_js` VALUES ('4', '4', '上传照片', '4');
INSERT INTO `t_js` VALUES ('5', '5', '好友评论', '5');
INSERT INTO `t_js` VALUES ('6', '4', '添加好友', '6');
INSERT INTO `t_js` VALUES ('7', '5', '留言板', '7');

-- ----------------------------
-- Table structure for `t_manage`
-- ----------------------------
DROP TABLE IF EXISTS `t_manage`;
CREATE TABLE `t_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manage
-- ----------------------------
INSERT INTO `t_manage` VALUES ('1', 'admin', '111111');

-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `isRead` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `senduser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rnl5w9cfl4ukj7t9a26qgpqm` (`senduser_id`),
  CONSTRAINT `FK_rnl5w9cfl4ukj7t9a26qgpqm` FOREIGN KEY (`senduser_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', '                                    sss', '2017-03-06 21:17:13', '0', '1', '1');
INSERT INTO `t_message` VALUES ('2', '', '2017-03-06 21:52:07', '0', '1', '3');
INSERT INTO `t_message` VALUES ('3', '22', '2017-03-06 21:53:23', '0', '1', '3');
INSERT INTO `t_message` VALUES ('4', '222', '2017-03-06 21:53:37', '0', '1', '1');
INSERT INTO `t_message` VALUES ('5', '好吗', '2017-03-06 21:55:24', '0', '1', '1');
INSERT INTO `t_message` VALUES ('6', '你好吗', '2017-03-06 21:55:49', '0', '1', '3');
INSERT INTO `t_message` VALUES ('7', '不好', '2017-03-06 21:55:55', '0', '1', '1');
INSERT INTO `t_message` VALUES ('8', '干啥的', '2017-03-06 21:56:04', '0', '1', '3');
INSERT INTO `t_message` VALUES ('9', '有人吗', '2017-03-06 23:37:11', '0', '1', '5');
INSERT INTO `t_message` VALUES ('10', '有的我在', '2017-03-06 23:37:21', '0', '1', '3');
INSERT INTO `t_message` VALUES ('11', '我不找你。你不是美女', '2017-03-06 23:37:29', '0', '1', '5');
INSERT INTO `t_message` VALUES ('12', '好吧。我走了。再见', '2017-03-06 23:37:38', '0', '1', '3');
INSERT INTO `t_message` VALUES ('13', '。。。', '2017-03-06 23:37:42', '0', '1', '3');
INSERT INTO `t_message` VALUES ('14', '有人在吗', '2019-09-18 21:32:48', '0', '1', '6');
INSERT INTO `t_message` VALUES ('15', '有的', '2019-09-18 21:33:40', '0', '1', '1');

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `createTime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '<p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">【环球时报-环球网报道 记者 姚丽娟】沙特国王萨勒曼即将于三月底访问马尔代夫，伴随着他访问的临近，马尔代夫及其邻国印度盛传沙特将购买一座马尔代夫环礁。沙特为什么要在马尔代夫购买环礁？总部设在英国的“Climate Home”网站5日报道称，马尔代夫前总统纳希德透露，沙特斥资百亿美元购礁是为了保护向中国输油的航线。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">报道引述纳希德的话说，沙特想在马尔代夫建一个基地，确保东亚输油线路的安全，那里是他们的新市场，沙特将进行一些战略建设和基础设施建设。报道称，沙特至中国的海运线路要穿过印度洋，并经过820公里长的马尔代夫环礁链。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">纳希德，2008年起担任马尔代夫总统，2012年初马尔代夫爆发大规模反政府游行，纳希德被迫在同年2月辞职，目前流亡伦敦。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">上周，印度媒体爆出沙特将购买马尔代夫北尼兰杜环礁的消息，引起马尔代夫和印度舆论争议。马尔代夫共有26个环礁，北尼兰杜位于马尔代夫首都马累以南120公里，由19个岛屿组成，有4000人口。马尔代夫反对派以“不符合国家利益为由”反对该计划。印度媒体则担忧，“沙特购得一整个环礁或向马输出瓦哈比教派教义，将给印度带来安全隐患”。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">对于一些担忧声，马尔代夫总统亚明回应说，马不会把一整座环礁卖给沙特，但两国在商讨一个价值约100亿美元的“大型项目”，协商完成后会予以披露。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">“Climate Home”网站记者实地采访时发现，对于沙特“购岛”的传闻，马国内也有许多支持声。有北尼兰杜居民表示，沙特投资也许是个好事，“中国-马尔代夫友谊大桥就是很好的例证。我们看到了这个项目，非常好，据此我猜想沙特的投资计划也会是积极的，能增加环礁的竞争力，与首都减小差距”。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">报道称，2003年后，沙特对美石油出口显著下降，中国市场增长的需求成为沙特的新机遇。但在中国市场，沙特面临来自俄罗斯的竞争。去年，沙特公布的“2030愿景”经济改革计划提出，将加强与东亚的经济联系。学者认为，印度洋供应链对这一计划的落实至关重要。<a bosszone=\"backqqcom\" href=\"http://www.qq.com/?pref=article\" target=\"_blank\" title=\"点击进入腾讯首页\" id=\"backqqcom\" style=\"text-decoration: none; outline: 0px; color: rgb(81, 112, 166); border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(83, 109, 166); white-space: nowrap;\"><img src=\"http://www.qq.com/favicon.ico\" width=\"16\" height=\"16\" style=\"border: 0px; vertical-align: middle; max-width: 640px;\"/><span style=\"padding-left: 5px; font-size: 14px;\">返回腾讯网首页&gt;&gt;</span></a></p><p><br/></p>', '2017-03-06 21:28:42', '大手笔！沙特为中国砸百亿美元马尔代夫购礁');
INSERT INTO `t_news` VALUES ('2', '<p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">“韩国誓言采取法律措施应对中国报复”，韩联社5日以此为题报道称，韩国产业通商资源部长官周亨焕当天发表声明，称针对中国对韩企的“歧视行为”，韩方的应对将加强。韩外长则说，如果中国此举违反世贸组织(WTO)相关规定，将向中方提出异议。与此同时，一些韩媒在鼓吹“警惕中国借此分裂韩国社会”“只要韩国自己坚持住，中国就会退让”。虽然这些政客和媒体说得轻松，但涉事企业并不好过。据报道，乐天集团5日向韩政府诉苦，要求其积极向中方说明。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">周亨焕<img src=\"../ueditor/1488807012667005137.jpeg\" title=\"1488807012667005137.jpeg\" alt=\"142484393.jpeg\"/>是在访问美国期间发表上述声明的。声明称，“韩国政府正在密切关注中国当局采取的报复措施，并处理韩国企业遭到的歧视和损害”，韩方将针对违反WTO政策以及韩中自由贸易协议的行为，根据国际法采取行动。周亨焕说，最近正尽可能加大经贸应对力度。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">据韩联社报道，韩国产业部7日将举行工作会议，讨论如何处理化妆品、食品、电子产品等各行业在中国反制措施之下所受的影响，并启动韩中经贸检查小组，开始逐日检查对华出口情况以及与中国做生意的韩国出口商的处境变化，以便尽快对不公平行为做出回应。韩国产业通商资源部5日称，周亨焕3日通过中国驻韩大使馆向中国政府转达，希望中国<span class=\"infoMblog\" style=\"position: relative; z-index: 9;\"><a class=\"a-tips-Article-QQ\" href=\"http://t.qq.com/weibomofcom#pref=qqcom.keyword\" rel=\"weibomofcom\" reltitle=\"商务部\" target=\"_blank\" style=\"outline: none; color: rgb(0, 0, 0); text-decoration: none; border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(83, 109, 166);\">商务部</a></span>能向驻华韩企提供有诚意的关注和保护。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">在周亨焕发表声明的同一天，韩国外长尹炳世在访谈节目中也就此事发声。据韩国钮西斯通讯社5日报道，尹炳世称，韩国政府将尽最大可能在年内将“萨德”部署完毕。他批评中国此前表示坚持世界自由贸易，现在因为“萨德”而制裁韩国企业“表里不一”，称如果中国相关举措违反WTO规定，将向中方提出异议。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">辽宁社会科学院研究员吕超5日在接受《环球时报》记者采访时说，韩国执意部署“萨德”导致中国民众不满，才会形成当前的局面，把责任推给中国是颠倒是非。此前有传言说，有中国人蓄意破坏韩国品牌汽车。江苏省启东市公安局4日证实，此人系吸毒产生幻觉后实施犯罪，与抵制行动无关。吕超说，韩国说要对情况进行调查，但如果是带有偏见的调查，那么可能对眼下两国在贸易方面的障碍起到推波助澜的作用。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">在韩国，“萨德”问题已经成为个别韩国政客作秀的工具。继4日在中国驻韩国大使馆前举行反对中国反制的“一人示威”后，韩国执政党自由韩国党国会议员元裕哲5日再到首尔火车站的乐天超市和明洞示威，要求中国立即停止相关措施。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">一些韩国媒体也显得气急败坏。韩国《国民日报》5日发表题为“制裁‘萨德’的中国没有资格称作大国”的社论，称韩国现在必须减少经贸方面对中国的依赖，并警惕中国“借此分裂韩国社会”。韩联社5日的报道则列举中国在韩市场消费占有率较高的产品，如电视机、洗衣机、啤酒、泡菜、鱿鱼等，并发出疑问：“我们还要继续购买这些中国货吗？”韩国《中央日报》5日的社论称，虽然中国对韩国采取各种制裁措施，但如同当年钓鱼岛风波中国对日制裁一样，只要韩国自己坚持住，中国就会退让。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">不过，这些韩媒的愿望可能会落空。韩国SBS电视台5日报道称，中国的反制措施越来越强烈，从4日到5日，辽宁省丹东市和东港市、江苏省常州市和浙江省杭州市的4家乐天玛特接连关门，均是因为违反中国相关消防规定。这是乐天决定向“萨德”供地后首次有实际店面被勒令停业整顿。乐天集团5日向政府诉苦，要求政府积极发挥作用，通过外交渠道向中方说明乐天作为民间企业无法阻挡国家安保请求。该报道说，目前中国国内反“萨德”情绪正风起云涌，这场风波到底会闹多大现在谁也无法预测。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">韩联社5日报道称，从本月3日起，韩国驻华使馆、总领事馆等驻华外交机构直接受理中国公民签证申请。此举旨在应对中方的禁韩游措施。据了解，此前签证申请必须通过旅行社。该报道说，中国国家旅游局已口头下达15日起全面停售韩国游产品的指示。这种说法尚未得到证实。《环球时报》记者5日在携程网搜索韩国游，显示无相关产品。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">《韩民族新闻》5日发表社论称，之所以闹成这样就是因为韩政府的无能和不负责任。此前中方已数次强调将采取断然措施维护本国利益，但国务总理黄教安等人却似乎散布毫无依据的“中国不会轻易经济制裁”论调。事态发展到了这个地步，还有的保守媒体毫无责任地宣称“即使倒闭几个企业，为了国家安保，也是无奈之举”。韩国《每日经济》说，本周末支持和反对弹劾朴槿惠的韩国民众都举行了大规模游行示威，“萨德”问题仍是极端对立的一个焦点。参加反对朴槿惠示威的很多民众手拿要求“撤回部署‘萨德’决定”的标语。44岁的首尔市民姜基福说，“萨德”以安保为借口，实际上却成为东北亚和平的威胁和制造战争危机的工具，正是怀着这样的想法他才来参加示威。</p><p><br/></p>', '2017-03-06 21:30:15', '韩国誓言应对“中国报复” 声称要抵制中国货');
INSERT INTO `t_news` VALUES ('3', '<p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">【环球时报赴日本特派记者 邢晓婧】美国总统特朗普推出的政策及其政策倾向，搅动了从地区到全球的经济、政治和安全局势。贸易战会不会打响？中美在南海会爆发冲突吗？……一个个问题成为观察家们追踪分析的热门话题。《环球时报》记者日前走进数家日本智库，专访三名日本学者，听他们畅谈对这些话题的看法。三名学者分别是：佳能全球战略研究所研究总监濑口清之，清华大学野村综研中国研究中心理事、副主任松野丰，原日本外务省国际情报局局长、东亚共同体研究所理事兼所长孙崎享。佳能全球战略研究所成立于2009年4月，所属研究员几乎都有过政府机关<a g=\"desktop\" target=\"_blank\" key=\"12\" href=\"http://time.qq.com/baike/deskclean/20170207.htm?pgv_ref=guanjianews_tips&from=guanjianzi\" class=\"nameStar gj-nameStar gj-keyword\" style=\"text-decoration: none; outline: 0px; color: rgb(81, 112, 166); border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(83, 109, 166);\">工作</a>经验，与决策层保持良好互动;有着50多年历史的野村综研是日本最早的民间智库，老牌咨询机构;成立于2013年的东亚共同体研究所，以“打造东亚共同体”为目标，理事长为日本前首相鸠山由纪夫。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\"><strong>“中美意识到贸易战会两败俱伤”</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">“特朗普刚宣布退出(TPP)时，大家都觉得‘别开玩笑了’”</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：如何评价日本首相安倍晋三2月的访美之行？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">濑口清之：这是白宫易主后日美首脑首次会谈，双方重视加强友好关系，大家对此的共同感觉比较乐观。但尚不清楚美国接下来会有什么政策，会带来什么结果，所以现在还不好评价。日本还是期待美国保持自由贸易和自由投资，中国应该也不希望美国改变其对世界政治、经济以及安全保障方面的基本态度。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">松野丰：安倍访美之前有很多担心的事情，正如日媒报道的那样，美国要求日本(进一步)负担美军军费、指责日本操纵日元贬值等。但这次会面，美国几乎没有提让日本头痛的问题，从这个角度看，日本松了口气。接下来可能还会见几次面，特朗普及其身边的人也会陆续有所动作，以后怎样还要再观察。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：特朗普政权退出跨太平洋伙伴关系协定(TPP)会产生什么影响，特别是对日本？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">濑口清之：可以肯定，TPP是推动全球自由贸易的重要项目，美国离开带来的负面影响很大。我们也曾预测美国退出TPP会影响安倍政府的政绩，日本还没有放弃TPP，还想说服美国回来，因此今后特朗普政权出台的政策仍是关注焦点。(记者插话：美国回归TPP的可能性不大吧？)——不大。但日本呼吁美国回归的姿态很重要。我认为TPP对中国来说也是一个好平台，最乐观的情况下，大约5年后，中国有望加入TPP。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">松野丰：没有美国参与，TPP本身就不能成立。日本曾花费一两年时间就TPP具体内容与美国进行交涉，特朗普刚宣布退出时，大家都觉得“别开玩笑了”。日本一直缠着美国推TPP，好不容易有了眉目，美国说走就走，日本人觉得所有努力都白费了。不光日本，澳大利亚、新西兰等国应该都有所不满。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\"><strong>“唯有中美可以相互破坏，但两国都意识到了这一点”</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：特朗普上台后出现贸易保护主义回潮迹象，根本原因是什么？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">濑口清之：这是美国国内资本主义带来的矛盾。资本主义推动经济发展的同时，带来收入不平等问题，美欧都没能解决好这个问题。此外，美国的优势体现在金融、IT及军事等方面，制造业在衰退，贸易逆差很大，这是美国的结构性问题。特朗普为保持贸易平衡而追求美元贬值，但升值才是强国前提，比如人民币升值就是中国经济发展顺利的表现。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">短期看，这对美国经济好像有点好处，但长期来讲，美国在全球经济中的地位会越来越低。如果中国保持追求自由贸易体制，对提升国际地位很有帮助。中国的发展程度还没达到先进国家水平，应该一边向它们学习，一边保护、培养比较落后的产业。我预测大概10年内，即2025年之前中国肯定能成为先进国家，但未来10年中国需要更放开贸易、投资、金融方面的体制政策。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：如何看待美国新总统对日本企业比如<a class=\"a-tips-Article-QQ\" target=\"_blank\" title=\"丰田\" href=\"http://data.auto.qq.com/car_brand/149/\" style=\"text-decoration: none; outline: 0px; color: rgb(0, 0, 0); border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(83, 109, 166);\">丰田</a>投资墨西哥的批判？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">松野丰：日本有与美国交涉的经验，大概知道美国的想法，因此对于美方的批判没有特别担心。比如上世纪70至90年代，日美在汽车行业就曾有过摩擦。当时美国说日本是贸易保护主义，不让日本出口汽车，日本说，我们是资本主义自由贸易国，不能禁止车企出口。然而，日本的汽车工业界和大型汽车制造商都自主减少出口量。这当然是和日本政府商讨之后的结果。丰田是世界顶尖的汽车公司，就算美国要求其在美国建厂，也完全有能力做到。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：有声音认为特朗普的做法是逆全球化，您的判断是？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">濑口清之：可以这样说，但这是特朗普的想法，不能代表所有美国人。特朗普在大选期间说的所有政策如果真推动的话，美国经济肯定乱七八糟。中国应该加强和亚洲、非洲、南美以及中东国家的合作，共同推进自由贸易，美国政府看到自由贸易的成果后，会认识到自由贸易的重要性，4年后美国国民会自动选出新总统。所以中国不用过分关注美国的政策，即便有些副作用可能影响到中国。欧洲、日本对美国依赖度很大，中国具有独立性和唯一性，应该充分利用这个优势。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：贸易战会爆发吗？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">濑口清之：谁都不能否定这种可能性，万一爆发肯定两败俱伤。当今全球经济，唯有中美可以相互破坏，但两国都意识到了这点，应该不会走这条路。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">松野丰：日美之间不会，中美之间有可能。日美之间几乎没有关税，就算爆发贸易战也没什么大不了的。两国是对等关系，在很多地方可以交涉。我比较担心中国，中国是发展中国家，国有企业改革、金融自由化等课题都在进行中，美国是发达国家，万一有什么举动，中国无法说“等等”“再给我些时间”，这有可能引发贸易战争。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\"><strong>“中国更像全球性商人，日本则是岛国性工人”</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：在提振制造业方面，中国提出了“中国制造2025”，日本有何经验可以分享？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">濑口清之：日本人喜欢“工匠精神”，不追求高收入和商业利益，这是知足思维。中日两国的国情、国民性、自然环境和地缘政治等方面都不同，中国更像全球性商人，日本则是岛国性工人，工人有工匠精神，商人有商业精神，应该互相学习。日本的工匠精神很好，但缺乏商业精神，很多日本人不知道怎么销售自己。这是日本独特的问题，也是日本不能完全解决的问题，大多数日本人没有这种商人型DNA。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">松野丰：在推进“中国制造2025”的过程中，过于追求理想化恐怕不行。中国有很多气派的工厂，但在具体细节上有很多不好的地方。中国的技术革新很快，比如机器人、人工智能以及IT等技术不比日本差，但中国不能一开始就依靠这些先进技术，而是应先提高工厂生产力，再实现自动化。这样一来，依托中国IT产业的发展，日本曾花费30年时间做的事情，中国可能10年就做完了。中国若能通过与美日合作导入更多技术，“中国制造2025”有望更快实现。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：如何看中国“一带一路”为全球化做出的贡献？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">濑口清之：日本曾从古代丝绸之路中获益，奈良的正仓院是最好的证明。在这个全球化的时代，我认为日本和韩国都应该积极参与中国提倡的“一带一路”构想，日本应该尽早加入亚投行。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">松野丰：“一带一路”的想法是对的，但实施起来还面临很多课题。西亚、东欧等沿线国家发展情况不好，需要中国引领。亚投行、丝路基金等机构可以出资帮助进行基础设施建设，这个层面可以做到。但中国本身也是发展中国家，仅凭一己之力很难做到，最好可以与其他国家合作。中国擅长提出构想，但不擅长拟定具体目标。接下来中国不宜操之过急，首先要确保国内经济发展，再逐渐往外扩展比较好。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\"><strong>孙崎享：破中日僵局须安倍败选</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：从外交和安全角度，您如何评价安倍首相2月的访美之行？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">孙崎享：这次安倍访美只能说是向强者谄媚，是目前为止日本首相中向美国表达从属姿态最明显的一次。我曾说过，日美首脑会谈没谈具体问题的话就没意义，这次显然如此。这次什么问题都没能得到解决，意味着接下来会出现越来越多的问题，美国有可能向日本“狮子大开口”，提出其他强硬要求。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：当下的日美关系与奥巴马时期相比是否发生了明显变化？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">孙崎享：美国对日本的要求越来越多，态度越来越强硬了。美国渲染“中国威胁论”，让日本以此为借口增加军费，这都是出于其战略考虑。而日本一方面臆想来自中国的威胁，一方面幻想万一出事美国能够出手相助，所以积极响应美国的战略要求。另外，日本也有论调担心来自朝鲜的威胁。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：中美在南海会发生军事冲突吗？最坏的情况是什么？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">孙崎享：不会，也没有最坏的情况。美国无法在南海采取军事行动，理由很简单——战争中最重要的是掌控“制空权”。天上由谁控制？美军飞机只能利用冲绳的基地，中国只要炸掉那里的飞机跑道，战争就结束了。美国和日本“撂狠话”也只是说说而已。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：日美中之间形成什么样的关系才对各方特别是东亚最有利？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">孙崎享：中国可以什么都不用做，也不必过分理睬。俄罗斯和美国不会打，中国和美国也打不起来。美国故意制造紧张局势，其实是在盘算着能在别处利用这种紧张。中国不要掉进美国布置的陷阱里，无需在无聊的地方浪费精力，但不断表明大国肚量很重要。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：日本的海外活动尤其是反中行为,好像紧盯中国进行，是这样吗？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">孙崎享：日本进行反中活动非常有可能，我知道日本政界有出资支持反中研究的情况。这样做非常不好，花钱也没有效果。比如日本驻英国大使馆与英国智库的合作能改变谁的想法吗？什么都不会改变，只会给日本在国际社会上带来负面影响，没有意义。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">环球时报：今年是中日邦交正常化45周年，怎样才能打破中日关系的僵局？</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">孙崎享：现在这种局面是安倍故意制造的，短期内不要理安倍的做法，要从长期着眼。因为长远看来，日中关系好转对双方都有好处，建议思考某种非政治主导的方式。遗憾的是，安倍政权时期，恐怕没有机会打破这种局面。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">那么，如何能打败奇怪的安倍政权？唯有让他败选，这一点可以借助日本农民。比如中国制定配额，每年从日本进口一定数量的农产品，日本农民切身感到从与中国保持良好关系中获益后，自然会认为安倍鼓吹的“中国威胁论”不靠谱。在日本，农民团体很有分量，有望在选举中起到一定作用</p><p><br/></p>', '2017-03-06 21:30:56', '日本学者：中日关系想打破僵局唯有让安倍下台');
INSERT INTO `t_news` VALUES ('4', '<p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">【环球网报道 记者 赵衍龙】新加坡联合早报网3月5日报道称，马来西亚首相纳吉布强调，他将不惜一切代价捍卫国家形象与主权，甚至不惜为此与朝鲜断交。分析指出，这显示马朝断交的可能性与日俱增。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">　　报道援引《星洲日报》消息称，纳吉晚在官邸召集全体国阵国会议员进行国会复会前的例行会议时，谈到金正男在吉隆坡第二国际机场遭暗杀而掀起的风波。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">　　消息说，纳吉指朝鲜驻马大使姜哲对马来西亚的强烈指控，已经严重诋毁马来西亚。纳吉表示，将坚决捍卫国家主权。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">　　另据报道，马朝关系紧张之际，参加2019年亚洲杯足球资格赛的马来西亚足球队，却将在平壤对垒朝鲜足球队。马来西亚足球总会已经要求亚洲足球联盟(AFC)更换场地。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">　　马来西亚足总秘书长哈米丁说，他们是担心球员安全才要求更换场地。主办单位预计将在明天较迟时分宣布其决定。</p><p><br/></p>', '2017-03-06 21:31:24', '马来西亚总理：用一切代价捍卫主权 不惜与朝鲜断交');
INSERT INTO `t_news` VALUES ('5', '<p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">中新网3月6日电 综合外媒报道，当地时间6日下午，韩国特别检察组在位于首尔江南区的特检组办公室召开发布会，特别检察官朴英洙公布了“亲信门”的调查结果。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">朴英洙表示，特检组共进行了46次搜索调查，由于时间有限以及调查对象不配合，2月28日调查结束时，只进行了一半。</p><p style=\"text-align: center;\"><img src=\"../ueditor/1488807161791049401.jpeg\" title=\"1488807161791049401.jpeg\" alt=\"641.jpeg\"/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">韩国特检组认定，总统朴槿惠与“亲信门”核心涉案人崔顺实合谋从三星集团收受贿赂430亿韩元(约合人民币2.56亿元)。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">特检组表示，2015年朴槿惠大力支持三星物产与第一毛织合并，三星以此为代价，向崔顺实及其掌控的Mir和K体育财团提供巨额资金。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">朴英洙称，朴槿惠和崔顺实用匿名手机，进行过573次通话。此外，确定朴槿惠涉嫌制作“文化界黑名单”。</p><p style=\"text-align: center;\"><img src=\"../ueditor/1488807199212067219.jpeg\" title=\"1488807199212067219.jpeg\" alt=\"641.jpeg\"/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">同时，特检组发布的报告指出，崔顺实曾多次为朴槿惠安排“注射阿姨”(对上门注射针剂的女性的通俗叫法)等非正式诊疗，青瓦台医疗系统实则处于“崩溃”状态。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">“亲信门”曝光后，韩国于去年12月21日正式成立特检组，由20名检察官组成，获国会授权进行为期70天的调查。随后，特检组认定韩国总统朴槿惠为涉腐嫌疑人，以收受贿赂的嫌疑对朴槿惠立案。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; line-height: 28px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">2月28日调查期满之际，韩国特检组共起诉了30名嫌疑人，包括总统闺蜜崔顺实和三星副会长李在镕。除此之外，还包括三星集团多名高层、多名前青瓦台要员等。</p><p><br/></p>', '2017-03-06 21:33:37', '朴槿惠涉制文化界黑名单 与崔顺实秘密通话573次');
INSERT INTO `t_news` VALUES ('7', '<p><img src=\"../ueditor/1488814211031042204.jpg\" title=\"1488814211031042204.jpg\" alt=\"1fc89a5af8314a3d9e1ee92b4a59c20d.jpg\"/></p>', '2017-03-06 23:30:20', '当地时间6日');

-- ----------------------------
-- Table structure for `t_saymood`
-- ----------------------------
DROP TABLE IF EXISTS `t_saymood`;
CREATE TABLE `t_saymood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `dzs` int(11) NOT NULL,
  `isDelete` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_798nkxgfnduhckuy43b0mfqku` (`user_id`),
  CONSTRAINT `FK_798nkxgfnduhckuy43b0mfqku` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_saymood
-- ----------------------------
INSERT INTO `t_saymood` VALUES ('1', '\\upload\\b5948920027111e7237f5ee3b64cc0e94-120Z1141H3.jpg', '2017-03-06 21:35:05', '2', '2', '2', '1');
INSERT INTO `t_saymood` VALUES ('2', '\\upload\\b8f148b0027111e7237f5ee3b64cc0e919_222949_2 - 副本.jpg', '2017-03-06 21:35:11', '0', '1', '2', '1');
INSERT INTO `t_saymood` VALUES ('3', '\\upload\\f422a280027111e7237f5ee3b64cc0e91fc89a5af8314a3d9e1ee92b4a59c20d.jpg', '2017-03-06 21:36:50', '0', '2', '2', '1');
INSERT INTO `t_saymood` VALUES ('4', '\\upload\\f76bda10027111e7237f5ee3b64cc0e983b58PICzq4_1024.jpg', '2017-03-06 21:36:56', '0', '2', '2', '1');
INSERT INTO `t_saymood` VALUES ('5', '\\upload\\faf500d0027111e7237f5ee3b64cc0e92258520_081353022_2.jpg', '2017-03-06 21:37:02', '0', '2', '2', '1');
INSERT INTO `t_saymood` VALUES ('6', '\\upload\\ffab35e0027111e7237f5ee3b64cc0e94052385_133415025341_2.jpg', '2017-03-06 21:37:10', '0', '2', '2', '1');
INSERT INTO `t_saymood` VALUES ('7', '\\upload\\03af5900027211e7237f5ee3b64cc0e9557452_104142883185_2.jpg', '2017-03-06 21:37:16', '0', '2', '2', '1');
INSERT INTO `t_saymood` VALUES ('8', '\\upload\\062932a0027211e7237f5ee3b64cc0e92311816_121140021_2.jpg', '2017-03-06 21:37:21', '1', '2', '2', '1');
INSERT INTO `t_saymood` VALUES ('9', '\\upload\\42a8de60027211e7237f5ee3b64cc0e910803163_003954509167_2.jpg', '2017-03-06 21:39:02', '1', '2', '2', '1');
INSERT INTO `t_saymood` VALUES ('10', '哎呀今晚太累了。小伙伴有人陪吗', '2017-03-06 21:40:46', '0', '2', '1', '1');
INSERT INTO `t_saymood` VALUES ('11', 'qq', '2017-03-06 21:41:06', '0', '1', '1', '1');
INSERT INTO `t_saymood` VALUES ('12', 'sss', '2017-03-06 21:41:30', '0', '1', '1', '1');
INSERT INTO `t_saymood` VALUES ('13', '愁死我了\r\n', '2017-03-06 21:50:54', '0', '1', '1', '1');
INSERT INTO `t_saymood` VALUES ('14', '\\upload\\ba757050027411e74d29c6d655b182ea19_222949_2 - 副本.jpg', '2017-03-06 21:56:42', '0', '2', '2', '3');
INSERT INTO `t_saymood` VALUES ('15', '\\upload\\2fb256b0027711e73b0625c7552a321d3f0ce283cc1b48ebaa3edbedbc1897ea.jpg', '2017-03-06 22:14:18', '0', '2', '2', '1');
INSERT INTO `t_saymood` VALUES ('16', '\\upload\\4b743440027711e73b0625c7552a321d48.jpg', '2017-03-06 22:15:04', '0', '2', '2', '1');
INSERT INTO `t_saymood` VALUES ('17', '\\upload\\ff527440028111e7cac9547146802b2d1fc89a5af8314a3d9e1ee92b4a59c20d.jpg', '2017-03-06 23:31:41', '1', '2', '2', '5');
INSERT INTO `t_saymood` VALUES ('18', '\\upload\\02448b20028211e7cac9547146802b2d3f0ce283cc1b48ebaa3edbedbc1897ea.jpg', '2017-03-06 23:31:46', '0', '2', '2', '5');
INSERT INTO `t_saymood` VALUES ('19', '\\upload\\04b3dd70028211e7cac9547146802b2d16pic_409509_b.jpg', '2017-03-06 23:31:50', '0', '1', '2', '5');
INSERT INTO `t_saymood` VALUES ('20', '\\upload\\077a7780028211e7cac9547146802b2d27J58PICxnz_1024.jpg', '2017-03-06 23:31:55', '0', '2', '2', '5');
INSERT INTO `t_saymood` VALUES ('21', '\\upload\\0a0f5330028211e7cac9547146802b2d5441d3ceN8183487d.jpg', '2017-03-06 23:31:59', '1', '2', '2', '5');
INSERT INTO `t_saymood` VALUES ('22', '\\upload\\0cc831a0028211e7cac9547146802b2d4072932_174046028000_2.jpg', '2017-03-06 23:32:04', '0', '2', '2', '5');
INSERT INTO `t_saymood` VALUES ('23', '\\upload\\a19927b0da1811e97f448d499dab1843avatar.jpg', '2019-09-18 21:31:33', '0', '2', '2', '6');
INSERT INTO `t_saymood` VALUES ('24', '发布一个动态', '2019-09-18 21:31:51', '0', '2', '1', '6');
INSERT INTO `t_saymood` VALUES ('25', '发布一个动态', '2019-09-18 21:31:51', '0', '2', '1', '6');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `dqTime` datetime DEFAULT NULL,
  `interest` varchar(255) DEFAULT NULL,
  `isDelete` int(11) NOT NULL,
  `isLh` int(11) NOT NULL,
  `jifen` int(11) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `sex` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `tx` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'ssss', '26', '2017-03-06 21:00:37', '2019-11-18 20:53:10', 'aaa', '2', '0', '706', '111111', '1', 'user1', '\\upload\\924dde70027711e773a5299378179e093f0ce283cc1b48ebaa3edbedbc1897ea.jpg');
INSERT INTO `t_user` VALUES ('3', '11', '11', '2017-03-06 21:51:46', '2017-04-06 21:52:04', '11', '2', '0', '71', '111111', '1', 'user2', '\\upload\\02548620028111e7cac9547146802b2d4-120Z1141H3.jpg');
INSERT INTO `t_user` VALUES ('4', '1', '1', '2017-03-06 23:07:05', null, '1', '2', '0', '2', '111111', '2', 'user3', null);
INSERT INTO `t_user` VALUES ('5', '11', '1', '2017-03-06 23:30:55', '2017-10-06 23:36:53', '11', '2', '0', '236', '111111', '1', 'liu', '\\upload\\bd77f990028211e7872a817fbdca8d0f1fc89a5af8314a3d9e1ee92b4a59c20d.jpg');
INSERT INTO `t_user` VALUES ('6', '深圳', '18', '2019-09-18 21:29:48', '2019-10-18 21:30:23', '跑步', '2', '0', '50', '123456', '1', 'user8', null);
