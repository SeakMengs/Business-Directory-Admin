/*
 Navicat Premium Data Transfer

 Source Server         : local-postgres-v11
 Source Server Type    : PostgreSQL
 Source Server Version : 110022 (110022)
 Source Host           : localhost:5432
 Source Catalog        : business_directory
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110022 (110022)
 File Encoding         : 65001

 Date: 12/12/2023 15:53:21
*/


-- ----------------------------
-- Sequence structure for admin_user_admin_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."admin_user_admin_id_seq";
CREATE SEQUENCE "public"."admin_user_admin_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for category_category_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."category_category_id_seq";
CREATE SEQUENCE "public"."category_category_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for company_company_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."company_company_id_seq";
CREATE SEQUENCE "public"."company_company_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for company_contact_contact_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."company_contact_contact_id_seq";
CREATE SEQUENCE "public"."company_contact_contact_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for company_gallery_gallery_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."company_gallery_gallery_id_seq";
CREATE SEQUENCE "public"."company_gallery_gallery_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for company_user_company_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."company_user_company_user_id_seq";
CREATE SEQUENCE "public"."company_user_company_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for normal_user_normal_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."normal_user_normal_user_id_seq";
CREATE SEQUENCE "public"."normal_user_normal_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for rate_rate_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rate_rate_id_seq";
CREATE SEQUENCE "public"."rate_rate_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for report_report_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."report_report_id_seq";
CREATE SEQUENCE "public"."report_report_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for saved_company_saved_company_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."saved_company_saved_company_id_seq";
CREATE SEQUENCE "public"."saved_company_saved_company_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for service_service_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."service_service_id_seq";
CREATE SEQUENCE "public"."service_service_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_user";
CREATE TABLE "public"."admin_user" (
  "admin_id" int4 NOT NULL DEFAULT nextval('admin_user_admin_id_seq'::regclass),
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "email" text COLLATE "pg_catalog"."default" NOT NULL,
  "password" text COLLATE "pg_catalog"."default" NOT NULL,
  "role" int2 NOT NULL,
  "profile_url" text COLLATE "pg_catalog"."default",
  "add_category" int2 NOT NULL,
  "ban_access" int2 NOT NULL,
  "access_everything" int2 NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL,
  "api_token" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO "public"."admin_user" VALUES (1, 'SuperAdmin', 'superadmin@gmail.com', '$2y$10$K56U1XEBqglxFYZCDAQXj.aKsCn.UUidAcc4XX5w43wwQJVHuKLRG', 3, 'https://i.imgur.com/OPGfO76.jpg', 1, 1, 1, '2023-06-10 13:33:28', '2023-07-05 19:16:06', NULL);
INSERT INTO "public"."admin_user" VALUES (2, 'admin2', 'admin2@gmail.com', '$2y$10$bUhyjjjBhp2S5NHrFdKZaey3pHIZdKcUNYgvkmHWxKL8kI8B9YERe', 3, NULL, 1, 0, 0, '2023-06-21 19:34:37', '2023-06-21 22:36:51', NULL);
INSERT INTO "public"."admin_user" VALUES (3, 'admin3', 'admin3@gmail.com', '$2y$10$7wUMotznK5zAwHVgxNHSoO4MxotRYf1oQvfL9f0RyyaPu/axAQ.R.', 3, NULL, 1, 0, 0, '2023-06-21 19:36:03', '2023-06-21 23:21:24', NULL);
INSERT INTO "public"."admin_user" VALUES (4, 'admin4', 'admin4@gmail.com', '$2y$10$QBk2ezxTPBdOIwmCRrqwKeoMyCyNUMJUhuaLk58unM3JG/3a0Gkwq', 3, NULL, 1, 0, 0, '2023-06-21 19:36:24', '2023-06-21 19:36:24', NULL);
INSERT INTO "public"."admin_user" VALUES (9, 'admin123', 'admin123@gmail.com', '$2y$10$g4jWj9kNsQbt92M5G282sOpetcpLn/8nVzkGdWs1QWD3jepIk/hIe', 3, NULL, 0, 0, 0, '2023-06-22 00:21:34', '2023-06-22 00:21:34', NULL);
INSERT INTO "public"."admin_user" VALUES (13, 'testadmin', 'testadmin@gmail.com', '$2y$10$6Ag/svsYbGKbPG3fQtOlV.hn/CJhupd53XFta6mWJ/NYCE7EDWdsG', 3, 'https://i.imgur.com/gpadima.jpg', 1, 1, 0, '2023-06-23 22:16:13', '2023-07-02 03:36:04', NULL);
INSERT INTO "public"."admin_user" VALUES (14, 'testadmin2', 'testadmin2@gmail.com', '$2y$10$mQLa/w/RdC08YRNepZIIG.s.nbf1gKikyHBdJ8TEthKqZNNLfLBRu', 3, NULL, 0, 0, 0, '2023-06-23 22:18:12', '2023-06-23 22:18:12', NULL);
INSERT INTO "public"."admin_user" VALUES (15, 'testtt', 'testtt@gmail.com', '$2y$10$IA5Rl/H.65uIzeL5gs1mauFn32/5czJ3jGkuH.CulATwWDvmBlRH6', 3, NULL, 1, 1, 0, '2023-06-23 22:19:59', '2023-06-23 22:31:14', NULL);
INSERT INTO "public"."admin_user" VALUES (21, 'test', 'test@gmail.com', '$2y$10$yumCK1qH7UsF3ShLX5u5BelFaCHQw3DnN5D.79tsqw.nBnQCDtAWe', 3, NULL, 1, 0, 0, '2023-06-23 22:49:17', '2023-07-05 18:45:04', NULL);
INSERT INTO "public"."admin_user" VALUES (22, 'test2', 'test2@gmail.com', '$2y$10$bRSXu3toXGfsI/tpfNRDI.T9bNadZQU9Tmemwdp/yEAykE9nZh5ni', 3, NULL, 1, 1, 0, '2023-06-23 23:12:42', '2023-06-23 23:12:42', NULL);
INSERT INTO "public"."admin_user" VALUES (24, 'superadmin2', 'superadmin2@gmail.com', '$2y$10$.2MKH8W1wnjj97JHnwv/s.6PTeBvBbAKxEfl/1gz9NNzTqzkGA496', 3, NULL, 1, 1, 1, '2023-07-05 19:15:23', '2023-07-05 19:43:39', 'OqazFdimAHJpJdR8YcFljg8jHFL4LEYfMlJWPKouiEDvnNEUlsSQhasVM0al5HBrjVvNs9cZschKOScO');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS "public"."category";
CREATE TABLE "public"."category" (
  "category_id" int4 NOT NULL DEFAULT nextval('category_category_id_seq'::regclass),
  "add_by_admin_id" numeric(20,0) NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "logo_url" text COLLATE "pg_catalog"."default",
  "edit_by_admin_id" numeric(20,0),
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO "public"."category" VALUES (1, 1, 'Banking & Finance', '<i class="fa-solid fa-coins fontawe-icon"></i>', 1, '2023-06-02 21:03:30', '2023-06-26 13:19:57');
INSERT INTO "public"."category" VALUES (2, 1, 'Entertainment', '<i class="fa-solid fa-gamepad fontawe-icon"></i>', 1, '2023-06-02 21:03:30', '2023-06-26 13:20:40');
INSERT INTO "public"."category" VALUES (3, 1, 'Construction', '<i class="fa-solid fa-helmet-safety fontawe-icon"></i>', 1, '2023-06-02 21:03:30', '2023-06-26 13:20:52');
INSERT INTO "public"."category" VALUES (4, 1, 'Education', '<i class="fa-solid fa-school fontawe-icon"></i>', 1, '2023-06-22 10:17:42', '2023-06-26 13:21:11');
INSERT INTO "public"."category" VALUES (5, 1, 'Automotive - Vehicles', '<i class="fa-solid fa-car fontawe-icon"></i>', NULL, '2023-06-18 21:42:30', '2023-06-18 21:42:30');
INSERT INTO "public"."category" VALUES (16, 1, 'Food & Beverages', '<i class="fa-solid fa-bowl-food fontawe-icon"></i>', 1, '2023-06-23 12:01:00', '2023-06-26 13:21:25');
INSERT INTO "public"."category" VALUES (17, 1, 'Health & Medicine', '<i class="fa-solid fa-suitcase-medical fontawe-icon"></i>', NULL, '2023-06-26 13:21:39', '2023-06-26 13:21:39');
INSERT INTO "public"."category" VALUES (18, 1, 'Hotels', '<i class="fa-solid fa-hotel fontawe-icon"></i>', NULL, '2023-06-29 13:49:13', '2023-06-29 13:49:13');
INSERT INTO "public"."category" VALUES (19, 1, 'Security Services', '<i class="fa-solid fa-shield-halved fontawe-icon"></i>', NULL, '2023-06-29 13:49:48', '2023-06-29 13:49:48');
INSERT INTO "public"."category" VALUES (20, 1, 'Business Services', '<i class="fa-solid fa-briefcase fontawe-icon"></i>', NULL, '2023-06-29 14:15:37', '2023-06-29 14:15:37');
INSERT INTO "public"."category" VALUES (21, 1, 'Home & Household', '<i class="fa-solid fa-house fontawe-icon"></i>', 1, '2023-06-29 14:18:23', '2023-06-29 14:19:33');
INSERT INTO "public"."category" VALUES (22, 1, 'Industry, Agricultural & Garment', '<i class="fa-sharp fa-solid fa-tractor fontawe-icon"></i>', NULL, '2023-06-29 14:20:48', '2023-06-29 14:20:48');
INSERT INTO "public"."category" VALUES (23, 1, 'Travel & Tourism', '<i class="fa-solid fa-plane fontawe-icon"></i>', NULL, '2023-06-29 14:22:12', '2023-06-29 14:22:12');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS "public"."company";
CREATE TABLE "public"."company" (
  "company_id" int4 NOT NULL DEFAULT nextval('company_company_id_seq'::regclass),
  "company_user_id" numeric(20,0) NOT NULL,
  "category_id" numeric(20,0) NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "street" text COLLATE "pg_catalog"."default" NOT NULL,
  "city" text COLLATE "pg_catalog"."default" NOT NULL,
  "district" text COLLATE "pg_catalog"."default" NOT NULL,
  "commune" text COLLATE "pg_catalog"."default" NOT NULL,
  "village" text COLLATE "pg_catalog"."default" NOT NULL,
  "logo" text COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default" NOT NULL,
  "website" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_banned" int2 NOT NULL,
  "ban_by_admin_id" numeric(20,0),
  "unban_by_admin_id" int8,
  "ban_reason" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO "public"."company" VALUES (22, 2, 20, 'Grant Thornton (Cambodia) Limited.', 'No.315, Preah Ang Duong (St. 110)', 'Phnom Penh', 'Daun Penh', 'Wat Phnom', 'Corner of Preah Monivong Blvd (93), Canadia Tower', 'https://i.imgur.com/fxjdCIc.png', 'ronald.almera@kh.gt.com', 'https://www.grantthornton.com.kh', 'We are Grant Thornton.
Going beyond business as usual, so you can too.
We invest in listening, building relationships and understanding your concerns to deliver an experience that’s more personal, agile and proactive. We work at the pace that matters. Yours. That''s why we celebrate fresh thinking and diverse perspectives to find better solutions. We don’t predict the future. We help you shape it.

We embrace what makes each market unique.', 0, NULL, 1, NULL, '2023-06-07 22:20:35', '2023-07-05 20:25:02');
INSERT INTO "public"."company" VALUES (23, 2, 20, 'Crowe (KH) Co., Ltd.', 'No.148, Mao Tse Toung Blvd (245), Corner of St. 248', 'Phnom Penh', 'Chamkar Morn', 'Toul Tum Poung II', 'K1 Building, 4th Floor, Office B4', 'https://i.imgur.com/t5hP6nz.png', 'virakphakdei.chea@crowe.com.kh', 'https://www.crowe.com.kh', 'We help inward investors establish themselves in Cambodia by providing corporate secretarial, accounting and consulting services. We are also a one-stop agency providing audit, tax, corporate advisory and business improvement services to growing entrepreneurs and corporate groups in Cambodia.

Supported by a team of professionals who understand the business mindset of innovative Cambodian entrepreneurs, we are committed to provide quality services in a personalised manner.', 0, NULL, 1, NULL, '2023-06-07 22:21:46', '2023-07-05 20:11:49');
INSERT INTO "public"."company" VALUES (24, 2, 20, 'Graphic Roots Co., Ltd.', 'No.15, Oknha Peich (St. 242)', 'Phnom Penh', 'Daun Penh', 'Chak Tomuk', 'Village', 'https://i.imgur.com/Qrue569.png', 'design@graphicroots.net', 'https://www.graphicroots.net', 'Our Mission is to provide high quality, professional and complete creative services in all design & communication fields including:Graphic Design  / Printing  /  Advertising  /  Branding  /  Packaging  /  Promotional Materials Design & Supply  /  Copy-writing  /  Photography  /  Strategic Marketing  /  Multimedia  /  Web Design, Development & Hosting  /  Interiors Design.

Our focus on the future is to supply the business market in the region as well as in the world with our outstanding design solutions that would grow together the firm and our client success.', 0, NULL, 1, NULL, '2023-06-07 22:53:18', '2023-07-05 18:51:23');
INSERT INTO "public"."company" VALUES (25, 4, 3, 'anotherCompany', 'street', 'city', 'district', 'commune', 'village', 'https://i.imgur.com/DOv6eU6.jpg', '2@d.com', 'https://www.tesla500.com', 'test desc', 0, NULL, 13, NULL, '2023-06-08 01:22:39', '2023-06-27 16:34:24');
INSERT INTO "public"."company" VALUES (32, 7, 4, 'amazon', 'street', 'city', 'district', 'commune', 'village', 'https://i.imgur.com/gWFUFPh.png', 'amazon@gmail.com', 'https://www.amazon.com/', 'Amazon description', 0, NULL, NULL, NULL, '2023-06-25 01:16:26', '2023-06-25 01:17:02');
INSERT INTO "public"."company" VALUES (33, 2, 4, 'Vanda Institute', 'No.216-218', 'Phnom Penh', 'Khan Chamkarmorn', 'Sangkat Tumnup Teuk', 'Mao Tse Toung Blvd (245)', 'https://i.imgur.com/0zK4QDz.png', 'vanda@camnet.com.kh', 'https://www.vanda.edu.kh', 'We Educate people', 0, NULL, NULL, NULL, '2023-07-05 23:54:11', '2023-07-05 23:54:11');

-- ----------------------------
-- Table structure for company_contact
-- ----------------------------
DROP TABLE IF EXISTS "public"."company_contact";
CREATE TABLE "public"."company_contact" (
  "contact_id" int4 NOT NULL DEFAULT nextval('company_contact_contact_id_seq'::regclass),
  "company_id" numeric(20,0) NOT NULL,
  "phone_number" numeric(20,0) NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of company_contact
-- ----------------------------
INSERT INTO "public"."company_contact" VALUES (16, 13, 12345678, '2023-06-06 00:05:04', '2023-06-06 00:05:04');
INSERT INTO "public"."company_contact" VALUES (17, 13, 123456789, '2023-06-06 01:53:59', '2023-06-07 13:35:40');
INSERT INTO "public"."company_contact" VALUES (18, 16, 18505080845, '2023-06-07 22:11:18', '2023-06-07 22:11:18');
INSERT INTO "public"."company_contact" VALUES (19, 17, 18505080845, '2023-06-07 22:12:50', '2023-06-07 22:12:50');
INSERT INTO "public"."company_contact" VALUES (25, 22, 23966520, '2023-06-07 22:20:35', '2023-07-05 20:25:02');
INSERT INTO "public"."company_contact" VALUES (26, 22, 23966522, '2023-06-07 22:20:35', '2023-07-05 20:25:02');
INSERT INTO "public"."company_contact" VALUES (27, 23, 23216717, '2023-06-07 22:21:46', '2023-07-05 20:11:50');
INSERT INTO "public"."company_contact" VALUES (28, 24, 23210712, '2023-06-07 22:53:18', '2023-07-05 18:51:23');
INSERT INTO "public"."company_contact" VALUES (29, 25, 123456789, '2023-06-08 01:22:39', '2023-06-10 05:57:13');
INSERT INTO "public"."company_contact" VALUES (30, 23, 16507655, '2023-06-08 21:31:46', '2023-07-05 20:11:50');
INSERT INTO "public"."company_contact" VALUES (31, 25, 123456788, '2023-06-08 21:42:08', '2023-06-10 05:57:13');
INSERT INTO "public"."company_contact" VALUES (39, 32, 18505080845, '2023-06-25 01:16:26', '2023-06-25 01:17:02');
INSERT INTO "public"."company_contact" VALUES (40, 33, 23213562, '2023-07-05 23:54:11', '2023-07-05 23:54:11');

-- ----------------------------
-- Table structure for company_gallery
-- ----------------------------
DROP TABLE IF EXISTS "public"."company_gallery";
CREATE TABLE "public"."company_gallery" (
  "gallery_id" int4 NOT NULL DEFAULT nextval('company_gallery_gallery_id_seq'::regclass),
  "company_id" numeric(20,0) NOT NULL,
  "photo_url" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of company_gallery
-- ----------------------------
INSERT INTO "public"."company_gallery" VALUES (25, 24, 'https://i.imgur.com/NcPXJmO.jpg', '2023-06-10 05:47:15', '2023-06-10 05:47:15');
INSERT INTO "public"."company_gallery" VALUES (26, 25, 'https://i.imgur.com/UFBABOU.png', '2023-06-10 05:56:55', '2023-06-10 05:56:55');
INSERT INTO "public"."company_gallery" VALUES (27, 25, 'https://i.imgur.com/kdnUCfT.jpg', '2023-06-10 05:56:59', '2023-06-10 05:56:59');
INSERT INTO "public"."company_gallery" VALUES (28, 23, 'https://i.imgur.com/nrn0nwv.jpg', '2023-06-10 05:58:14', '2023-06-10 05:58:14');
INSERT INTO "public"."company_gallery" VALUES (31, 22, 'https://i.imgur.com/mB3BXVX.jpg', '2023-06-10 06:05:38', '2023-06-10 06:05:38');
INSERT INTO "public"."company_gallery" VALUES (34, 32, 'https://i.imgur.com/skymDRt.jpg', '2023-06-25 01:17:05', '2023-06-25 01:17:05');
INSERT INTO "public"."company_gallery" VALUES (35, 24, 'https://i.imgur.com/NXpbs1N.jpg', '2023-06-26 07:37:57', '2023-06-26 07:37:57');
INSERT INTO "public"."company_gallery" VALUES (36, 24, 'https://i.imgur.com/n3J4wnm.png', '2023-06-26 07:37:59', '2023-06-26 07:37:59');
INSERT INTO "public"."company_gallery" VALUES (37, 24, 'https://i.imgur.com/Z5ZhMop.jpg', '2023-06-26 07:38:01', '2023-06-26 07:38:01');
INSERT INTO "public"."company_gallery" VALUES (38, 23, 'https://i.imgur.com/gHB1VwE.jpg', '2023-07-05 20:11:51', '2023-07-05 20:11:51');

-- ----------------------------
-- Table structure for company_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."company_user";
CREATE TABLE "public"."company_user" (
  "company_user_id" int4 NOT NULL DEFAULT nextval('company_user_company_user_id_seq'::regclass),
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "email" text COLLATE "pg_catalog"."default" NOT NULL,
  "password" text COLLATE "pg_catalog"."default" NOT NULL,
  "role" int2 NOT NULL,
  "is_banned" int2 NOT NULL,
  "ban_by_admin_id" numeric(20,0),
  "unban_by_admin_id" int8,
  "ban_reason" text COLLATE "pg_catalog"."default",
  "profile_url" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL,
  "api_token" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of company_user
-- ----------------------------
INSERT INTO "public"."company_user" VALUES (2, 'name215', 'name2@gmail.com', '$2y$10$Q871w0g//lElyrzAol9S0.NdTbUfVIbe5IzIRs4F2/7GC52VcdaXW', 2, 0, NULL, 1, NULL, NULL, '2023-06-01 15:32:16', '2023-07-06 01:19:22', NULL);
INSERT INTO "public"."company_user" VALUES (4, 'cname1', 'cname1@gmail.com', '$2y$10$sLZYLSHJb2bex1ThVgGmCu13QhMS6K2nY0WKmKW8mezXf2zpExIcu', 2, 0, NULL, 13, NULL, NULL, '2023-06-03 19:07:56', '2023-06-27 16:34:24', NULL);
INSERT INTO "public"."company_user" VALUES (5, 'cname2', 'cname2@gmail.com', '$2y$10$QzkAOr2g9xJ7JO1WIW1rgu468m3lIf2w8ohrNddg4m4ZmGfwn0mum', 2, 0, NULL, 1, NULL, NULL, '2023-06-18 16:27:03', '2023-06-23 20:17:29', NULL);
INSERT INTO "public"."company_user" VALUES (6, 'DomCom', 'domcom@gmail.com', '$2y$10$Nzdu6a9dj63TFl69MK4CB.8B4CDXhcqLM0huhWN0QSgCUVLNxze3S', 2, 0, NULL, 1, NULL, NULL, '2023-06-18 20:41:40', '2023-06-23 20:17:27', NULL);
INSERT INTO "public"."company_user" VALUES (7, 'cuser1', 'cuser1@gmail.com', '$2y$10$jod0PwavEfCigaO8rc9.NeVY3ohJ21NuvsmCX/5YF2UBz.79rpIoC', 2, 0, NULL, NULL, NULL, NULL, '2023-06-25 01:10:58', '2023-06-25 01:11:59', NULL);
INSERT INTO "public"."company_user" VALUES (8, 'companyu1', 'companyu1@gmail.com', '$2y$10$RMgiMayLGYBhDBZvn6Te8uXB7fnYh0M2BQQQCiMq2hUq1kdoN.soi', 2, 0, NULL, NULL, NULL, NULL, '2023-06-27 23:44:31', '2023-06-27 23:44:46', NULL);
INSERT INTO "public"."company_user" VALUES (9, 'ptest1', 'ptest1@gmail.com', '$2y$10$t2BBOd8qcgqM4pzYb2L9TOOoSlbQ1/NbnMVbPzhNCD2qTo8c/KZk2', 2, 0, NULL, NULL, NULL, NULL, '2023-07-05 23:42:10', '2023-07-06 01:18:16', NULL);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS "public"."feedback";
CREATE TABLE "public"."feedback" (
  "feedback_id" numeric(20,0) NOT NULL,
  "company_id" numeric(20,0) NOT NULL,
  "normal_user_id" numeric(20,0) NOT NULL,
  "feedback" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO "public"."feedback" VALUES (5, 22, 1, 'good company', '2023-06-10 01:30:48', '2023-06-10 01:30:48');
INSERT INTO "public"."feedback" VALUES (6, 22, 3, 'test', '2023-06-10 02:12:52', '2023-06-10 02:12:52');
INSERT INTO "public"."feedback" VALUES (7, 23, 4, 'Very good', '2023-06-18 20:40:10', '2023-06-18 20:40:10');
INSERT INTO "public"."feedback" VALUES (8, 23, 1, 'I like this company', '2023-06-24 04:22:22', '2023-06-24 04:22:22');
INSERT INTO "public"."feedback" VALUES (9, 24, 9, 'good', '2023-06-25 01:09:39', '2023-06-25 01:09:39');
INSERT INTO "public"."feedback" VALUES (10, 33, 1, 'i dont like this company. so bad.', '2023-07-06 01:21:37', '2023-07-06 01:21:37');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int8 NOT NULL,
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO "public"."migrations" VALUES (25, '2023_05_29_004119_create_admin_user_table', 1);
INSERT INTO "public"."migrations" VALUES (26, '2023_05_29_013828_create_company_user_table', 1);
INSERT INTO "public"."migrations" VALUES (27, '2023_05_29_023125_create_normal_user_table', 1);
INSERT INTO "public"."migrations" VALUES (28, '2023_05_29_030552_create_category_table', 1);
INSERT INTO "public"."migrations" VALUES (29, '2023_05_29_044357_create_company_table', 1);
INSERT INTO "public"."migrations" VALUES (30, '2023_05_29_055121_create_report_table', 1);
INSERT INTO "public"."migrations" VALUES (31, '2023_05_29_065631_create_saved_company_table', 1);
INSERT INTO "public"."migrations" VALUES (32, '2023_05_29_070038_create_service_table', 1);
INSERT INTO "public"."migrations" VALUES (33, '2023_05_29_080509_create_gallery_table', 1);
INSERT INTO "public"."migrations" VALUES (34, '2023_05_29_090703_create_feedback_table', 1);
INSERT INTO "public"."migrations" VALUES (35, '2023_05_29_101011_create_rate_table', 1);
INSERT INTO "public"."migrations" VALUES (36, '2023_05_29_111158_create_contact_table', 1);

-- ----------------------------
-- Table structure for normal_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."normal_user";
CREATE TABLE "public"."normal_user" (
  "normal_user_id" int4 NOT NULL DEFAULT nextval('normal_user_normal_user_id_seq'::regclass),
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "email" text COLLATE "pg_catalog"."default" NOT NULL,
  "password" text COLLATE "pg_catalog"."default" NOT NULL,
  "role" int2 NOT NULL,
  "is_banned" int2 NOT NULL,
  "ban_by_admin_id" numeric(20,0),
  "unban_by_admin_id" int8,
  "ban_reason" text COLLATE "pg_catalog"."default",
  "profile_url" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL,
  "api_token" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of normal_user
-- ----------------------------
INSERT INTO "public"."normal_user" VALUES (1, 'name1', 'name1@gmail.com', '$2y$10$MkT1cVDgRhrvEYRVuyxyQ.LQ6/GXs9qwN81tPhZl3aZJc3y.w05vG', 1, 0, NULL, 1, NULL, NULL, '2023-06-01 15:26:34', '2023-07-06 01:22:15', NULL);
INSERT INTO "public"."normal_user" VALUES (2, 'Oudom', 'obol@email.com', '$2y$10$HmyeVBXpZfx1Gm1CPsj15Ost4cCI3EpMKygEVuWJa9BiQtgR1v7jO', 1, 0, NULL, 1, NULL, NULL, '2023-06-02 13:01:59', '2023-06-23 20:42:02', NULL);
INSERT INTO "public"."normal_user" VALUES (3, 'uname1', 'uname1@gmail.com', '$2y$10$3stnHMiNiYsRVkeEm7THMuJpZ6MBH3PQClD/6XBGrFdfuXPpdS/d2', 1, 1, 13, NULL, '1', NULL, '2023-06-03 19:07:27', '2023-06-27 13:42:03', NULL);
INSERT INTO "public"."normal_user" VALUES (4, 'DomUser', 'Domuser@gmail.com', '$2y$10$Z.niGh6zaV31.GzMJw2vXuKezgPwFDurGGoTwRA7IQd7sFPCqukcy', 1, 0, NULL, 1, NULL, NULL, '2023-06-18 16:15:53', '2023-06-23 20:11:56', NULL);
INSERT INTO "public"."normal_user" VALUES (5, 'Domtesttwo', 'domtesttwo@gmail.com', '$2y$10$qnXXOktcSRxjzwRVd8E.6.Rn7D05rzaHjYeEarDYE9GYI0PNPkMR2', 1, 0, NULL, 1, NULL, NULL, '2023-06-18 16:19:47', '2023-07-05 14:09:24', NULL);
INSERT INTO "public"."normal_user" VALUES (6, 'uname2', 'uname2@gmail.com', '$2y$10$./m6y33uyr.iNrO25ZptFOVJC9WP9rDb.6DCW4ENihaSn8vpnRTR.', 1, 0, NULL, NULL, NULL, NULL, '2023-06-18 16:26:38', '2023-06-18 16:26:38', NULL);
INSERT INTO "public"."normal_user" VALUES (7, 'DomUserTwo', 'domusertwo@yahoo.com', '$2y$10$XrD4R5KzYGajXx95xrdNeOJG4IGhZ9fuzJEgXhf2UOKCmYAivdm5y', 1, 0, NULL, 1, NULL, NULL, '2023-06-18 21:11:12', '2023-06-23 20:12:30', NULL);
INSERT INTO "public"."normal_user" VALUES (8, 'flash29', 'flash29@gmail.com', '$2y$10$81JrDXR5WT4./7cvED96R.DZmJf4XKEONktjOxgVRoY.z1guTuIqS', 1, 0, NULL, 1, NULL, NULL, '2023-06-24 02:05:17', '2023-06-23 20:12:30', NULL);
INSERT INTO "public"."normal_user" VALUES (9, 'nuser12', 'nuser1@gmail.com', '$2y$10$jlSIEuunimYUCQwK1YY1z.H5.APnjM2EzArMV78o/l4PP5BEyJmhm', 1, 0, NULL, 13, NULL, NULL, '2023-06-25 01:05:51', '2023-06-26 15:06:39', NULL);
INSERT INTO "public"."normal_user" VALUES (10, 'normalu1', 'normalu1@gmail.com', '$2y$10$lqs1GmMNyDumk5xroS237OPe.WKR/droUCn5cR5ssCDJg.MSGtTBe', 1, 0, NULL, NULL, NULL, NULL, '2023-06-27 23:43:59', '2023-06-27 23:44:12', NULL);
INSERT INTO "public"."normal_user" VALUES (11, 'uuu1', 'uuu1@gmail.com', '$2y$10$cYuQ3S0ArblR0Aqp/SAKHejjXc19SdfiNxugEQEA/.mHDsc3fpYMW', 1, 0, NULL, NULL, NULL, NULL, '2023-06-28 20:12:17', '2023-06-28 20:26:11', NULL);

-- ----------------------------
-- Table structure for rate
-- ----------------------------
DROP TABLE IF EXISTS "public"."rate";
CREATE TABLE "public"."rate" (
  "rate_id" int4 NOT NULL DEFAULT nextval('rate_rate_id_seq'::regclass),
  "company_id" numeric(20,0) NOT NULL,
  "normal_user_id" numeric(20,0) NOT NULL,
  "star_number" int2 NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of rate
-- ----------------------------
INSERT INTO "public"."rate" VALUES (4, 22, 1, 5, '2023-06-09 14:12:39', '2023-07-06 01:20:40');
INSERT INTO "public"."rate" VALUES (5, 22, 2, 5, '2023-06-09 14:12:57', '2023-06-09 14:12:57');
INSERT INTO "public"."rate" VALUES (6, 22, 3, 2, '2023-06-09 14:13:04', '2023-06-10 02:38:03');
INSERT INTO "public"."rate" VALUES (7, 23, 3, 3, '2023-06-10 02:41:47', '2023-06-10 02:41:47');
INSERT INTO "public"."rate" VALUES (8, 23, 1, 2, '2023-06-10 06:07:40', '2023-07-05 22:03:55');
INSERT INTO "public"."rate" VALUES (9, 23, 4, 3, '2023-06-18 20:40:34', '2023-06-18 20:40:34');
INSERT INTO "public"."rate" VALUES (10, 25, 1, 3, '2023-06-24 02:00:36', '2023-06-24 02:00:36');
INSERT INTO "public"."rate" VALUES (11, 24, 9, 5, '2023-06-25 01:10:03', '2023-06-25 01:10:03');
INSERT INTO "public"."rate" VALUES (12, 24, 1, 3, '2023-07-03 00:59:19', '2023-07-06 00:02:15');
INSERT INTO "public"."rate" VALUES (13, 33, 1, 2, '2023-07-06 01:21:51', '2023-07-06 01:21:51');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS "public"."report";
CREATE TABLE "public"."report" (
  "report_id" int4 NOT NULL DEFAULT nextval('report_report_id_seq'::regclass),
  "company_id" numeric(20,0) NOT NULL,
  "report_by_normal_user_id" numeric(20,0) NOT NULL,
  "reason" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO "public"."report" VALUES (1, 23, 1, 'Reason 1', '2023-06-02 21:03:31', '2023-06-16 19:34:34');
INSERT INTO "public"."report" VALUES (2, 23, 3, 'Reason 2', '2023-06-02 21:03:31', '2023-06-16 19:34:38');
INSERT INTO "public"."report" VALUES (3, 24, 1, 'Reason 3', '2023-06-02 21:03:31', '2023-06-16 19:45:42');
INSERT INTO "public"."report" VALUES (4, 22, 1, 'this company scam me', '2023-06-10 01:37:05', '2023-06-16 19:45:38');
INSERT INTO "public"."report" VALUES (5, 22, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Impedit perspiciatis sit neque repellat quasi harum facere exercitationem! Qui temporibus at porro necessitatibus, quam similique numquam, expedita, voluptatem sint molestias officiis.', '2023-06-10 02:13:06', '2023-06-18 19:13:09');
INSERT INTO "public"."report" VALUES (6, 23, 4, 'Very bad', '2023-06-18 20:40:23', '2023-06-18 20:40:23');

-- ----------------------------
-- Table structure for saved_company
-- ----------------------------
DROP TABLE IF EXISTS "public"."saved_company";
CREATE TABLE "public"."saved_company" (
  "saved_company_id" int4 NOT NULL DEFAULT nextval('saved_company_saved_company_id_seq'::regclass),
  "normal_user_id" numeric(20,0) NOT NULL,
  "company_id" numeric(20,0) NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of saved_company
-- ----------------------------
INSERT INTO "public"."saved_company" VALUES (2, 3, 23, '2023-06-02 21:03:31', '2023-06-09 14:37:14');
INSERT INTO "public"."saved_company" VALUES (11, 3, 22, '2023-06-10 02:15:24', '2023-06-22 10:08:28');
INSERT INTO "public"."saved_company" VALUES (14, 1, 24, '2023-06-22 16:10:04', '2023-06-22 16:10:04');
INSERT INTO "public"."saved_company" VALUES (16, 1, 23, '2023-06-24 02:00:14', '2023-06-24 02:00:14');
INSERT INTO "public"."saved_company" VALUES (17, 1, 22, '2023-06-24 02:00:23', '2023-06-24 02:00:23');
INSERT INTO "public"."saved_company" VALUES (18, 1, 25, '2023-06-24 02:00:39', '2023-06-24 02:00:39');
INSERT INTO "public"."saved_company" VALUES (19, 9, 24, '2023-06-25 01:10:12', '2023-06-25 01:10:12');

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS "public"."service";
CREATE TABLE "public"."service" (
  "service_id" int4 NOT NULL DEFAULT nextval('service_service_id_seq'::regclass),
  "company_id" numeric(20,0) NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "photo_url" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO "public"."service" VALUES (1, 1, 'Service 1', 'Photo 1', '2023-06-02 21:03:32', '2023-06-02 21:03:32');
INSERT INTO "public"."service" VALUES (2, 1, 'Service 2', 'Photo 2', '2023-06-02 21:03:32', '2023-06-02 21:03:32');
INSERT INTO "public"."service" VALUES (3, 2, 'Service 3', 'Photo 3', '2023-06-02 21:03:32', '2023-06-02 21:03:32');
INSERT INTO "public"."service" VALUES (5, 13, 'car repair', NULL, '2023-06-06 00:05:04', '2023-06-07 13:47:54');
INSERT INTO "public"."service" VALUES (6, 13, 'online shopping', NULL, '2023-06-06 01:53:59', '2023-06-07 13:47:57');
INSERT INTO "public"."service" VALUES (7, 1, 'service', NULL, '2023-06-07 22:16:04', '2023-06-07 22:16:04');
INSERT INTO "public"."service" VALUES (8, 1, 'service', NULL, '2023-06-07 22:17:41', '2023-06-07 22:17:41');
INSERT INTO "public"."service" VALUES (9, 1, 'service2', NULL, '2023-06-07 22:18:26', '2023-06-07 22:18:26');
INSERT INTO "public"."service" VALUES (10, 1, 'service2', NULL, '2023-06-07 22:18:26', '2023-06-07 22:18:26');
INSERT INTO "public"."service" VALUES (13, 22, 'Business Consultant', NULL, '2023-06-07 22:20:35', '2023-07-05 20:25:02');
INSERT INTO "public"."service" VALUES (14, 23, 'Outsourcing Services', NULL, '2023-06-07 22:21:47', '2023-07-05 20:11:50');
INSERT INTO "public"."service" VALUES (15, 24, 'Graphic Design', NULL, '2023-06-07 22:53:18', '2023-07-05 18:51:23');
INSERT INTO "public"."service" VALUES (16, 25, 'service', NULL, '2023-06-08 01:22:39', '2023-06-10 05:57:13');
INSERT INTO "public"."service" VALUES (17, 25, 'service5', NULL, '2023-06-08 01:22:39', '2023-06-10 05:57:14');
INSERT INTO "public"."service" VALUES (18, 23, 'Business Consultant', NULL, '2023-06-08 21:31:47', '2023-07-05 20:11:50');
INSERT INTO "public"."service" VALUES (20, 22, 'Tax Service', NULL, '2023-06-09 20:59:48', '2023-07-05 20:25:02');
INSERT INTO "public"."service" VALUES (21, 22, 'Audit & Accounting Services', NULL, '2023-06-09 20:59:48', '2023-07-05 20:25:02');
INSERT INTO "public"."service" VALUES (30, 32, 'online shop', NULL, '2023-06-25 01:16:26', '2023-06-25 01:17:02');
INSERT INTO "public"."service" VALUES (31, 32, 'service2', NULL, '2023-06-25 01:16:26', '2023-06-25 01:17:02');
INSERT INTO "public"."service" VALUES (32, 24, 'Web Design', NULL, '2023-07-05 18:50:36', '2023-07-05 18:51:24');
INSERT INTO "public"."service" VALUES (33, 24, 'Advertising', NULL, '2023-07-05 18:50:36', '2023-07-05 18:51:24');
INSERT INTO "public"."service" VALUES (34, 33, 'Educate', NULL, '2023-07-05 23:54:11', '2023-07-05 23:54:11');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."admin_user_admin_id_seq"
OWNED BY "public"."admin_user"."admin_id";
SELECT setval('"public"."admin_user_admin_id_seq"', 100000, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."category_category_id_seq"
OWNED BY "public"."category"."category_id";
SELECT setval('"public"."category_category_id_seq"', 100000, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."company_company_id_seq"
OWNED BY "public"."company"."company_id";
SELECT setval('"public"."company_company_id_seq"', 100000, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."company_contact_contact_id_seq"
OWNED BY "public"."company_contact"."contact_id";
SELECT setval('"public"."company_contact_contact_id_seq"', 100000, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."company_gallery_gallery_id_seq"
OWNED BY "public"."company_gallery"."gallery_id";
SELECT setval('"public"."company_gallery_gallery_id_seq"', 100000, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."company_user_company_user_id_seq"
OWNED BY "public"."company_user"."company_user_id";
SELECT setval('"public"."company_user_company_user_id_seq"', 100000, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."normal_user_normal_user_id_seq"
OWNED BY "public"."normal_user"."normal_user_id";
SELECT setval('"public"."normal_user_normal_user_id_seq"', 100000, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rate_rate_id_seq"
OWNED BY "public"."rate"."rate_id";
SELECT setval('"public"."rate_rate_id_seq"', 100001, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."report_report_id_seq"
OWNED BY "public"."report"."report_id";
SELECT setval('"public"."report_report_id_seq"', 100000, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."saved_company_saved_company_id_seq"
OWNED BY "public"."saved_company"."saved_company_id";
SELECT setval('"public"."saved_company_saved_company_id_seq"', 100000, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."service_service_id_seq"
OWNED BY "public"."service"."service_id";
SELECT setval('"public"."service_service_id_seq"', 100000, false);

-- ----------------------------
-- Primary Key structure for table admin_user
-- ----------------------------
ALTER TABLE "public"."admin_user" ADD CONSTRAINT "admin_user_pkey" PRIMARY KEY ("admin_id");

-- ----------------------------
-- Primary Key structure for table category
-- ----------------------------
ALTER TABLE "public"."category" ADD CONSTRAINT "category_pkey" PRIMARY KEY ("category_id");

-- ----------------------------
-- Primary Key structure for table company
-- ----------------------------
ALTER TABLE "public"."company" ADD CONSTRAINT "company_pkey" PRIMARY KEY ("company_id");

-- ----------------------------
-- Primary Key structure for table company_contact
-- ----------------------------
ALTER TABLE "public"."company_contact" ADD CONSTRAINT "company_contact_pkey" PRIMARY KEY ("contact_id");

-- ----------------------------
-- Primary Key structure for table company_gallery
-- ----------------------------
ALTER TABLE "public"."company_gallery" ADD CONSTRAINT "company_gallery_pkey" PRIMARY KEY ("gallery_id");

-- ----------------------------
-- Primary Key structure for table company_user
-- ----------------------------
ALTER TABLE "public"."company_user" ADD CONSTRAINT "company_user_pkey" PRIMARY KEY ("company_user_id");

-- ----------------------------
-- Primary Key structure for table feedback
-- ----------------------------
ALTER TABLE "public"."feedback" ADD CONSTRAINT "feedback_pkey" PRIMARY KEY ("feedback_id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table normal_user
-- ----------------------------
ALTER TABLE "public"."normal_user" ADD CONSTRAINT "normal_user_pkey" PRIMARY KEY ("normal_user_id");

-- ----------------------------
-- Primary Key structure for table rate
-- ----------------------------
ALTER TABLE "public"."rate" ADD CONSTRAINT "rate_pkey" PRIMARY KEY ("rate_id");

-- ----------------------------
-- Primary Key structure for table report
-- ----------------------------
ALTER TABLE "public"."report" ADD CONSTRAINT "report_pkey" PRIMARY KEY ("report_id");

-- ----------------------------
-- Primary Key structure for table saved_company
-- ----------------------------
ALTER TABLE "public"."saved_company" ADD CONSTRAINT "saved_company_pkey" PRIMARY KEY ("saved_company_id");

-- ----------------------------
-- Primary Key structure for table service
-- ----------------------------
ALTER TABLE "public"."service" ADD CONSTRAINT "service_pkey" PRIMARY KEY ("service_id");
