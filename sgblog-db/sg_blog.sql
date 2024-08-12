/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : sg_blog

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 12/08/2024 17:32:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sg_article
-- ----------------------------
DROP TABLE IF EXISTS `sg_article`;
CREATE TABLE `sg_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `summary` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章摘要',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '所属分类id',
  `thumbnail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `is_top` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否置顶（0否，1是）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '状态（0已发布，1草稿）',
  `view_count` bigint(20) NULL DEFAULT 0 COMMENT '访问量',
  `is_comment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否允许评论 1是，0否',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sg_article
-- ----------------------------
INSERT INTO `sg_article` VALUES (1, '走进科普SpringBoot', '# SpringBoot你怎么看\n\n由chatGPT生成以下内容，仅做测试\n![请联系编写者](https://n.sinaimg.cn/blog/700/w1000h500/20220325/c84d-a6a4ed629d39ec51d911d70498ccbdbd.jpg)\n\n\nSpringBoot是一个用于快速构建基于Spring框架的应用程序的开发框架。它简化了Spring应用程序的配置和部署过程，让开发者能够更加专注于业务逻辑的实现。特点如下\n\n\n## 简化配置\n\nSpringBoot提供了自动配置的特性，通过约定大于配置的原则，减少了开发者在配置文件中进行大量繁琐的配置。开发者只需要关注自己的业务逻辑，而不用花费过多时间在配置上。\n\n> 内嵌服务器\n\nSpringBoot默认集成了多种内嵌服务器，如Tomcat、Jetty等，开发者无需手动部署应用程序到外部服务器，只需简单地打包成可执行的JAR文件，即可运行应用程序。\n\n> 自动装配\n\nSpringBoot可以根据项目的依赖自动装配相应的组件和配置，大大减少了手动配置的工作量。开发者只需在项目的依赖管理文件中添加相应的依赖，SpringBoot就会自动根据依赖进行配置。\n\n> 简化开发\n\nSpringBoot提供了丰富的开发工具和插件，能够帮助开发者更高效地进行开发。例如，SpringBootDevTools可以实现热部署，修改代码后无需重启应用程序即可生效。\n\n> 使用示例\n\n下面是一个简单的SpringBoot应用程序示例：\n~~~~java\nimport org.springframework.boot.SpringApplication;\nimport org.springframework.boot.autoconfigure.SpringBootApplication;\nimport org.springframework.web.bind.annotation.GetMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\n@SpringBootApplication@RestControllerpublic class MyApplication {\n      \n    public static void main(String[] args) {\n        SpringApplication.run(MyApplication.class, args);\n    }\n\n    @GetMapping(\"/\")\n    public String hello() {\n        return \"Hello, World!\";\n    }\n}\n~~~~', '测试文章', 1, 'https://n.sinaimg.cn/blog/700/w1000h500/20220325/c84d-a6a4ed629d39ec51d911d70498ccbdbd.jpg', '0', '0', 3, '0', 1, '2023-08-11 07:14:55', 1, '2023-08-11 07:14:55', 0);
INSERT INTO `sg_article` VALUES (2, 'MySQL知识', '# mysql介绍\n\n由chatGPT生成以下内容，仅做测试\n\n![请联系编写者](https://n.sinaimg.cn/blog/700/w1000h500/20220325/c84d-a6a4ed629d39ec51d911d70498ccbdbd.jpg)\n\n在当今数据驱动的世界中，学习和掌握数据库管理系统是非常重要的。MySQL作为最流行的开源关系型数据库管理系统之一，为许多应用程序和网站提供了可靠的数据存储和管理。下面是学习MySQL的一些日常步骤和要点，帮助你快速入门和提升技能。\n\n> 1. 安装和配置MySQL\n\n首先，你需要下载并安装MySQL数据库。根据你的操作系统，选择适合的MySQL版本，并按照安装向导进行安装。安装完成后，确保正确配置MySQL以确保正常运行。\n\n> 2. 学习SQL语言\n\nSQL是结构化查询语言，用于与数据库进行交互。学习SQL语言是学习MySQL的关键。了解基本的SQL语法，包括创建表、插入数据、查询数据、更新数据和删除数据等操作。通过练习和实践，逐渐掌握SQL语言的使用。\n\n> 3. 数据库设计和规范化\n\n学习MySQL还需要了解数据库设计和规范化的概念。掌握数据库设计原则和规范化技术，以确保数据库结构的合理性和数据的完整性。了解主键、外键、索引等概念，并学会在数据库中应用它们。\n\n> 4. 数据库管理和维护\n\n学习MySQL还包括数据库管理和维护的技能。了解如何备份和恢复数据库，如何优化查询性能，如何监控和管理数据库服务器等。学习并掌握MySQL提供的管理工具和命令，以便有效地管理和维护数据库。\n\n> 5. 学习高级特性和扩展\n\n除了基本的SQL语言和数据库管理技能，学习MySQL的过程中还可以深入了解一些高级特性和扩展。例如，学习存储过程、触发器和视图等高级功能，以及如何使用MySQL与编程语言进行集成。\n\n> 6. 参考文档和资源\n\n学习MySQL的过程中，及时查阅官方文档和其他相关资源是非常重要的。MySQL官方文档提供了详细的说明和示例，可以帮助你理解和掌握MySQL的各种功能和用法。此外，还可以参考在线教程、书籍和社区论坛等资源，与其他MySQL学习者交流和分享经验。\n\n学习MySQL需要时间和实践，但随着不断的学习和实践，你将逐渐掌握MySQL的技能，并能够灵活运用它来处理各种数据管理任务。希望以上步骤和要点能帮助你在学习MySQL的道路上取得成功！', '测试文章', 2, 'https://n.sinaimg.cn/blog/700/w1000h500/20220325/c84d-a6a4ed629d39ec51d911d70498ccbdbd.jpg', '1', '0', 174, '0', 1, '2023-08-11 07:32:41', 1, '2023-08-11 07:32:41', 0);
INSERT INTO `sg_article` VALUES (3, '科普知识', '# 科普知识\n\n由chatGPT生成以下内容，仅做测试\n\n![请联系编写者](https://n.sinaimg.cn/blog/700/w1000h500/20220325/c84d-a6a4ed629d39ec51d911d70498ccbdbd.jpg)\n\n> 养成和训练人体记忆力的重要性\n\n人体的记忆力是我们日常生活中非常重要的一项能力。它不仅有助于我们记住重要的信息和经历，还能够帮助我们提高学习效率和解决问题的能力。然而，很多人可能发现自己的记忆力并不是很好，经常会忘记一些重要的事情。\n\n> 良好的生活习惯\n\n良好的生活习惯对于记忆力的提升非常重要。保持充足的睡眠和合理的饮食可以帮助大脑更好地运转，提高记忆力。此外，定期进行体育锻炼也能够促进血液循环，增加大脑的供氧量，有助于记忆力的提升。\n\n> 记忆训练\n\n我们可以通过一些特定的记忆训练来提高记忆力。例如，使用记忆宫殿法可以帮助我们记住一系列的事物。这种方法将要记忆的事物与一个已知的地点或者房间联系起来，通过想象在这个地点或者房间中进行一次虚拟的旅行，将事物与地点进行关联，可以帮助我们更好地记住它们。\n\n> 阅读和学习\n\n阅读可以帮助我们锻炼大脑的思维能力和逻辑思维能力，而学习新知识可以激发大脑的学习能力，提高记忆力。\n\n> 记忆技巧\n\n我们还可以通过一些记忆技巧来提高记忆力。例如，使用关键词、图像和联想等方法可以帮助我们更好地记忆信息。另外，将要记忆的信息进行分类整理，可以帮助我们更好地记忆和回忆。\n\n养成和训练人体记忆力是一个需要长期坚持和努力的过程。通过良好的生活习惯、记忆训练、阅读学习和记忆技巧的综合应用，我们可以提高自己的记忆力，更好地应对日常生活和工作中的各种挑战', '测试文章', 5, 'https://n.sinaimg.cn/blog/700/w1000h500/20220325/c84d-a6a4ed629d39ec51d911d70498ccbdbd.jpg', '1', '0', 5, '0', 1, '2023-08-11 08:28:06', 1, '2023-08-11 08:28:06', 0);

-- ----------------------------
-- Table structure for sg_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `sg_article_tag`;
CREATE TABLE `sg_article_tag`  (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `tag_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '标签id',
  PRIMARY KEY (`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sg_article_tag
-- ----------------------------
INSERT INTO `sg_article_tag` VALUES (1, 3);
INSERT INTO `sg_article_tag` VALUES (2, 3);
INSERT INTO `sg_article_tag` VALUES (3, 3);

-- ----------------------------
-- Table structure for sg_category
-- ----------------------------
DROP TABLE IF EXISTS `sg_category`;
CREATE TABLE `sg_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名',
  `pid` bigint(20) NULL DEFAULT -1 COMMENT '父分类id，如果没有父分类为-1',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态0:正常,1禁用',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sg_category
-- ----------------------------
INSERT INTO `sg_category` VALUES (1, 'SpringBoot', -1, '我是描述', '0', 1, '2023-08-11 06:45:55', 1, '2023-08-11 06:46:42', 0);
INSERT INTO `sg_category` VALUES (2, 'MySQL', -1, '我是描述', '0', 1, '2023-08-11 06:46:36', 1, '2023-08-11 06:46:36', 0);
INSERT INTO `sg_category` VALUES (3, 'Web', -1, '我是描述', '0', 1, '2023-08-11 06:46:54', 1, '2023-08-11 06:46:54', 0);
INSERT INTO `sg_category` VALUES (4, 'MyBatis', -1, '我是描述', '0', 1, '2023-08-11 06:47:17', 1, '2023-08-11 06:47:17', 0);
INSERT INTO `sg_category` VALUES (5, '分类001', -1, '我是描述', '0', 1, '2023-08-11 06:48:04', 1, '2023-08-11 06:48:04', 0);
INSERT INTO `sg_category` VALUES (6, '分类002', -1, '我是描述', '0', 1, '2023-08-11 06:48:18', 1, '2023-08-11 06:48:18', 0);
INSERT INTO `sg_category` VALUES (7, '分类003', -1, '我是描述', '0', 1, '2023-08-11 06:48:31', 1, '2023-08-11 06:48:31', 0);
INSERT INTO `sg_category` VALUES (8, '分类004', -1, '我是描述', '0', 1, '2023-08-11 06:48:49', 1, '2023-08-11 06:48:49', 0);

-- ----------------------------
-- Table structure for sg_comment
-- ----------------------------
DROP TABLE IF EXISTS `sg_comment`;
CREATE TABLE `sg_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '评论类型（0代表文章评论，1代表友链评论）',
  `article_id` bigint(20) NULL DEFAULT NULL COMMENT '文章id',
  `root_id` bigint(20) NULL DEFAULT -1 COMMENT '根评论id',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `to_comment_user_id` bigint(20) NULL DEFAULT -1 COMMENT '所回复的目标评论的userid',
  `to_comment_id` bigint(20) NULL DEFAULT -1 COMMENT '回复目标评论id',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sg_comment
-- ----------------------------
INSERT INTO `sg_comment` VALUES (1, '0', 2, -1, '测试时间', -1, -1, 2, '2023-10-26 08:45:13', 2, '2023-10-26 08:45:13', 0);
INSERT INTO `sg_comment` VALUES (2, '0', 2, 1, '测试时间', 2, 1, 2, '2023-10-26 16:46:35', 2, '2023-10-26 16:46:35', 0);
INSERT INTO `sg_comment` VALUES (3, '0', 3, -1, '第二次测试时间', -1, -1, 2, '2023-10-26 16:46:53', 2, '2023-10-26 16:46:53', 0);
INSERT INTO `sg_comment` VALUES (4, '0', 2, -1, '1', -1, -1, 2, '2023-11-27 14:29:00', 2, '2023-11-27 14:29:00', 0);
INSERT INTO `sg_comment` VALUES (5, '0', 2, 4, '1', 2, 4, 2, '2023-11-27 14:29:07', 2, '2023-11-27 14:29:07', 0);

-- ----------------------------
-- Table structure for sg_link
-- ----------------------------
DROP TABLE IF EXISTS `sg_link`;
CREATE TABLE `sg_link`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '2' COMMENT '审核状态 (0代表审核通过，1代表审核未通过，2代表未审核)',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友链' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sg_link
-- ----------------------------
INSERT INTO `sg_link` VALUES (1, '百度', 'https://img0.baidu.com/it/u=4029604882,246120315&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=285', '我是描述', 'https://baidu.com', '0', 1, '2023-08-11 06:50:11', 1, '2023-08-11 06:51:37', 0);
INSERT INTO `sg_link` VALUES (2, 'bilibili', 'https://img2.baidu.com/it/u=3444794441,3761663944&fm=253&fmt=auto&app=120&f=JPEG?w=669&h=604', '我是描述', 'https://www.bilibili.com', '0', 1, '2023-08-11 06:53:46', 1, '2023-08-11 06:59:50', 0);
INSERT INTO `sg_link` VALUES (3, 'GitHub', 'https://img1.baidu.com/it/u=2626381969,3909549426&fm=253&fmt=auto&app=138&f=JPEG?w=588&h=401', '我是描述', 'https://github.com', '0', 1, '2023-08-11 07:01:54', 1, '2023-08-11 07:01:54', 0);
INSERT INTO `sg_link` VALUES (4, '阿里云', 'https://img1.baidu.com/it/u=1459264756,3043818066&fm=253&fmt=auto&app=120&f=PNG?w=649&h=500', '我是描述', 'https://www.aliyun.com', '0', 1, '2023-08-11 07:04:01', 1, '2023-08-11 07:04:01', 0);

-- ----------------------------
-- Table structure for sg_tag
-- ----------------------------
DROP TABLE IF EXISTS `sg_tag`;
CREATE TABLE `sg_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sg_tag
-- ----------------------------
INSERT INTO `sg_tag` VALUES (1, '日志', 1, '2023-08-11 07:05:51', 1, '2023-08-11 07:05:51', 0, '我是描述');
INSERT INTO `sg_tag` VALUES (2, '开发', 1, '2023-08-11 07:06:08', 1, '2023-08-11 07:06:08', 0, '我是描述');
INSERT INTO `sg_tag` VALUES (3, '日常', 1, '2023-08-11 07:07:54', 1, '2023-08-11 07:07:54', 0, '我是描述');
INSERT INTO `sg_tag` VALUES (4, '管理', 1, '2023-08-11 07:08:04', 1, '2023-08-11 07:08:04', 0, '我是描述');
INSERT INTO `sg_tag` VALUES (5, '办公', 1, '2023-08-11 07:08:18', 1, '2023-08-11 07:08:18', 0, '我是描述');
INSERT INTO `sg_tag` VALUES (6, '笔记', 1, '2023-08-11 07:08:26', 1, '2023-08-11 07:08:26', 0, '我是描述');
INSERT INTO `sg_tag` VALUES (7, '学校', 1, '2023-08-11 07:09:06', 1, '2023-08-11 07:09:06', 0, '我是描述');
INSERT INTO `sg_tag` VALUES (8, '美食', 1, '2023-08-11 07:09:20', 1, '2023-08-11 07:09:20', 0, '我是描述');
INSERT INTO `sg_tag` VALUES (9, '学习', 1, '2023-08-11 07:10:09', 1, '2023-08-11 07:10:09', 0, '我是描述');
INSERT INTO `sg_tag` VALUES (10, '风景', 1, '2023-08-11 07:10:32', 1, '2023-08-11 07:10:32', 0, '我是描述');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2030 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '0', '', 'system', 0, '2021-11-12 10:46:19', 0, NULL, '系统管理目录', '0');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', '0', 'system:user:list', 'user', 0, '2021-11-12 10:46:19', 1, '2023-08-10 06:17:35', '用户管理菜单', '0');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', 0, '2021-11-12 10:46:19', 0, NULL, '角色管理菜单', '0');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', 0, '2021-11-12 10:46:19', 0, NULL, '菜单管理菜单', '0');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:user:query', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:user:add', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:user:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:user:remove', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:user:export', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:user:import', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:user:resetPwd', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', '0', 'system:role:query', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', '0', 'system:role:add', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', '0', 'system:role:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', '0', 'system:role:remove', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', '0', 'system:role:export', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', '0', 'system:menu:query', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', '0', 'system:menu:add', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', '0', 'system:menu:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', '0', 'system:menu:remove', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (2017, '内容管理', 0, 4, 'content', NULL, 1, 'M', '0', '0', NULL, 'table', NULL, '2022-01-08 02:44:38', 1, '2022-07-31 12:34:23', '', '0');
INSERT INTO `sys_menu` VALUES (2018, '分类管理', 2017, 1, 'category', 'content/category/index', 1, 'C', '0', '0', 'content:category:list', 'example', NULL, '2022-01-08 02:51:45', NULL, '2022-01-08 02:51:45', '', '0');
INSERT INTO `sys_menu` VALUES (2019, '文章管理', 2017, 0, 'article', 'content/article/index', 1, 'C', '0', '0', 'content:article:list', 'build', NULL, '2022-01-08 02:53:10', NULL, '2022-01-08 02:53:10', '', '0');
INSERT INTO `sys_menu` VALUES (2021, '标签管理', 2017, 6, 'tag', 'content/tag/index', 1, 'C', '0', '0', 'content:tag:index', 'button', NULL, '2022-01-08 02:55:37', NULL, '2022-01-08 02:55:50', '', '0');
INSERT INTO `sys_menu` VALUES (2022, '友链管理', 2017, 4, 'link', 'content/link/index', 1, 'C', '0', '0', 'content:link:list', '404', NULL, '2022-01-08 02:56:50', NULL, '2022-01-08 02:56:50', '', '0');
INSERT INTO `sys_menu` VALUES (2023, '写博文', 0, 0, 'write', 'content/article/write/index', 1, 'C', '0', '0', 'content:article:writer', 'build', NULL, '2022-01-08 03:39:58', 1, '2022-07-31 22:07:05', '', '0');
INSERT INTO `sys_menu` VALUES (2024, '友链新增', 2022, 0, '', NULL, 1, 'F', '0', '0', 'content:link:add', '#', NULL, '2022-01-16 07:59:17', NULL, '2022-01-16 07:59:17', '', '0');
INSERT INTO `sys_menu` VALUES (2025, '友链修改', 2022, 1, '', NULL, 1, 'F', '0', '0', 'content:link:edit', '#', NULL, '2022-01-16 07:59:44', NULL, '2022-01-16 07:59:44', '', '0');
INSERT INTO `sys_menu` VALUES (2026, '友链删除', 2022, 1, '', NULL, 1, 'F', '0', '0', 'content:link:remove', '#', NULL, '2022-01-16 08:00:05', NULL, '2022-01-16 08:00:05', '', '0');
INSERT INTO `sys_menu` VALUES (2027, '友链查询', 2022, 2, '', NULL, 1, 'F', '0', '0', 'content:link:query', '#', NULL, '2022-01-16 08:04:09', NULL, '2022-01-16 08:04:09', '', '0');
INSERT INTO `sys_menu` VALUES (2028, '导出分类', 2018, 1, '', NULL, 1, 'F', '0', '0', 'content:category:export', '#', NULL, '2022-01-21 07:06:59', NULL, '2022-01-21 07:06:59', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '0', '0', 0, '2023-07-12 07:46:19', 0, NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '0', '0', 0, '2023-08-10 19:46:19', NULL, '2023-08-10 07:01:35', '普通角色');
INSERT INTO `sys_role` VALUES (3, '开发者', 'system:build:test', 3, '0', '0', 1, '2023-08-10 08:12:03', 1, '2023-08-10 09:05:47', '开发者');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (0, 0);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NULL' COMMENT '用户名',
  `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NULL' COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NULL' COMMENT '密码',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户类型：0代表普通用户，1代表管理员',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phonenumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户性别（0男，1女，2未知）',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人的用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '默认管理员', '$2a$10$P9jutEAtmQs0cCS3MdYjPOghRc3wm4K19LDW0n3Ntpn1YM5UnxT0a', '1', '0', 'admin@admin.com', '18888888888', '0', 'https://img1.baidu.com/it/u=1333417867,4012964063&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', NULL, '2023-07-21 13:07:35', 1, '2023-07-22 13:08:04', 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
