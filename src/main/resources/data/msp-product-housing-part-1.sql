-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.4.13-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour msp_product_housing_db
DROP DATABASE IF EXISTS `msp_product_housing_db`;
CREATE DATABASE IF NOT EXISTS `msp_product_housing_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `msp_product_housing_db`;

-- Listage de la structure de la table msp_product_housing_db. amenity
DROP TABLE IF EXISTS `amenity`;
CREATE TABLE IF NOT EXISTS `amenity` (
                                         `id_amenity` bigint(20) NOT NULL AUTO_INCREMENT,
                                         `icon` varchar(255) DEFAULT NULL,
                                         `name` varchar(255) DEFAULT NULL,
                                         PRIMARY KEY (`id_amenity`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.amenity : ~21 rows (environ)
DELETE FROM `amenity`;
/*!40000 ALTER TABLE `amenity` DISABLE KEYS */;
INSERT INTO `amenity` (`id_amenity`, `icon`, `name`) VALUES
(1, 'heat', 'Chauffage'),
(2, 'airConditionning', 'Climatisation'),
(3, 'hotWater', 'Eau chaude'),
(4, 'elevator', 'Ascenceur'),
(5, 'television', 'Télévision'),
(6, 'wifi', 'Wi-Fi'),
(7, 'fridge', 'Réfrigérateur'),
(8, 'oven', 'Four'),
(9, 'microwave', 'Four à micro-ondes'),
(10, 'stove', 'Cuisinière'),
(11, 'dishwasher', 'Lave-vaisselle'),
(12, 'coffeeMaker', 'Cafetière'),
(13, 'hairdryer', 'Sèche-cheveux'),
(14, 'washingMahine', 'Lave-linge'),
(15, 'tumbleDryer', 'Sèche-linge'),
(16, 'balcony', 'Balcon'),
(17, 'patio', 'Terrace'),
(18, 'parkingSpace', 'Place de parking'),
(19, 'swimmingPool', 'Piscine'),
(20, 'jacuzzi', 'Jacuzzi'),
(21, 'sauna', 'Sauna');
/*!40000 ALTER TABLE `amenity` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. bathroom
DROP TABLE IF EXISTS `bathroom`;
CREATE TABLE IF NOT EXISTS `bathroom` (
                                          `id_bathroom` bigint(20) NOT NULL AUTO_INCREMENT,
                                          `id_property` bigint(20) DEFAULT NULL,
                                          PRIMARY KEY (`id_bathroom`),
                                          KEY `FKf6ek4yftn2vlmn84xfj23qedm` (`id_property`),
                                          CONSTRAINT `FKf6ek4yftn2vlmn84xfj23qedm` FOREIGN KEY (`id_property`) REFERENCES `property` (`id_property`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.bathroom : ~63 rows (environ)
DELETE FROM `bathroom`;
/*!40000 ALTER TABLE `bathroom` DISABLE KEYS */;
INSERT INTO `bathroom` (`id_bathroom`, `id_property`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(11, 6),
(12, 6),
(13, 7),
(14, 7),
(15, 8),
(16, 8),
(17, 9),
(18, 9),
(19, 10),
(20, 10),
(21, 11),
(22, 11),
(23, 12),
(24, 12),
(25, 13),
(26, 13),
(27, 14),
(28, 14),
(29, 15),
(30, 15),
(40, 16),
(41, 16),
(42, 16),
(45, 17),
(46, 17),
(50, 18),
(51, 18),
(52, 18),
(53, 19),
(54, 19),
(55, 20),
(56, 20),
(57, 20),
(58, 21),
(59, 21),
(60, 22),
(61, 22),
(62, 23),
(66, 24),
(67, 24),
(68, 24),
(69, 25),
(70, 26),
(71, 26),
(72, 26),
(73, 26),
(83, 27),
(84, 27),
(85, 27),
(86, 28),
(87, 28),
(88, 29),
(89, 29);
/*!40000 ALTER TABLE `bathroom` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. bathroom_item
DROP TABLE IF EXISTS `bathroom_item`;
CREATE TABLE IF NOT EXISTS `bathroom_item` (
                                               `id_bathroom_item` bigint(20) NOT NULL AUTO_INCREMENT,
                                               `icon` varchar(255) DEFAULT NULL,
                                               `name` varchar(255) DEFAULT NULL,
                                               PRIMARY KEY (`id_bathroom_item`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.bathroom_item : ~3 rows (environ)
DELETE FROM `bathroom_item`;
/*!40000 ALTER TABLE `bathroom_item` DISABLE KEYS */;
INSERT INTO `bathroom_item` (`id_bathroom_item`, `icon`, `name`) VALUES
(1, 'toilet.png', 'Toilettes'),
(2, 'shower.png', 'Douche'),
(3, 'bathtub.png', 'Baignoire');
/*!40000 ALTER TABLE `bathroom_item` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. bathroom_item_bathroom
DROP TABLE IF EXISTS `bathroom_item_bathroom`;
CREATE TABLE IF NOT EXISTS `bathroom_item_bathroom` (
                                                        `id_bathroom_item_bathroom` bigint(20) NOT NULL AUTO_INCREMENT,
                                                        `id_bathroom` bigint(20) DEFAULT NULL,
                                                        `id_bathroom_item` bigint(20) DEFAULT NULL,
                                                        PRIMARY KEY (`id_bathroom_item_bathroom`),
                                                        KEY `FK61si64he5nfovqt2v4foon1xe` (`id_bathroom`),
                                                        KEY `FK7njdde1p8wp1k8nsev9auj5wg` (`id_bathroom_item`),
                                                        CONSTRAINT `FK61si64he5nfovqt2v4foon1xe` FOREIGN KEY (`id_bathroom`) REFERENCES `bathroom` (`id_bathroom`),
                                                        CONSTRAINT `FK7njdde1p8wp1k8nsev9auj5wg` FOREIGN KEY (`id_bathroom_item`) REFERENCES `bathroom_item` (`id_bathroom_item`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.bathroom_item_bathroom : ~85 rows (environ)
DELETE FROM `bathroom_item_bathroom`;
/*!40000 ALTER TABLE `bathroom_item_bathroom` DISABLE KEYS */;
INSERT INTO `bathroom_item_bathroom` (`id_bathroom_item_bathroom`, `id_bathroom`, `id_bathroom_item`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 1),
(4, 3, 1),
(5, 3, 2),
(6, 4, 1),
(7, 5, 2),
(8, 6, 1),
(9, 7, 3),
(10, 8, 1),
(11, 9, 2),
(12, 10, 1),
(13, 11, 3),
(14, 12, 1),
(15, 13, 2),
(16, 14, 1),
(17, 15, 3),
(18, 16, 1),
(19, 17, 2),
(20, 18, 1),
(21, 19, 3),
(22, 20, 1),
(23, 21, 2),
(24, 22, 1),
(25, 23, 3),
(26, 24, 1),
(27, 25, 2),
(28, 26, 1),
(29, 27, 3),
(30, 28, 1),
(31, 29, 2),
(32, 30, 1),
(45, 40, 3),
(46, 40, 2),
(47, 41, 1),
(48, 42, 1),
(53, 45, 2),
(54, 45, 3),
(55, 45, 1),
(56, 46, 1),
(61, 50, 2),
(62, 50, 1),
(63, 51, 3),
(64, 52, 1),
(65, 53, 2),
(66, 53, 3),
(67, 54, 1),
(68, 55, 1),
(69, 56, 2),
(70, 56, 1),
(71, 57, 3),
(72, 58, 2),
(73, 58, 3),
(74, 58, 1),
(75, 59, 1),
(76, 60, 3),
(77, 60, 3),
(78, 61, 2),
(79, 61, 1),
(80, 62, 2),
(81, 62, 3),
(82, 62, 1),
(88, 66, 2),
(89, 66, 3),
(90, 67, 2),
(91, 67, 1),
(92, 68, 1),
(93, 69, 2),
(94, 69, 3),
(95, 69, 1),
(96, 70, 2),
(97, 70, 3),
(98, 71, 2),
(99, 72, 1),
(100, 73, 1),
(113, 83, 2),
(114, 83, 3),
(115, 84, 1),
(116, 85, 1),
(117, 86, 1),
(118, 87, 3),
(119, 88, 3),
(120, 88, 2),
(121, 88, 3),
(122, 89, 1);
/*!40000 ALTER TABLE `bathroom_item_bathroom` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. bedroom
DROP TABLE IF EXISTS `bedroom`;
CREATE TABLE IF NOT EXISTS `bedroom` (
                                         `id_bedroom` bigint(20) NOT NULL AUTO_INCREMENT,
                                         `id_property` bigint(20) DEFAULT NULL,
                                         PRIMARY KEY (`id_bedroom`),
                                         KEY `FKjyo5s8u65jpeu1aw8ao27gct2` (`id_property`),
                                         CONSTRAINT `FKjyo5s8u65jpeu1aw8ao27gct2` FOREIGN KEY (`id_property`) REFERENCES `property` (`id_property`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.bedroom : ~65 rows (environ)
DELETE FROM `bedroom`;
/*!40000 ALTER TABLE `bedroom` DISABLE KEYS */;
INSERT INTO `bedroom` (`id_bedroom`, `id_property`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(11, 6),
(12, 6),
(13, 7),
(14, 7),
(15, 7),
(16, 8),
(17, 8),
(18, 9),
(19, 9),
(20, 9),
(21, 10),
(22, 10),
(23, 11),
(24, 11),
(25, 12),
(26, 12),
(27, 13),
(28, 13),
(29, 14),
(30, 14),
(31, 15),
(32, 15),
(33, 15),
(40, 16),
(41, 16),
(44, 17),
(45, 17),
(47, 18),
(48, 19),
(49, 19),
(50, 20),
(51, 20),
(52, 20),
(54, 21),
(55, 21),
(56, 21),
(57, 22),
(58, 22),
(59, 23),
(60, 23),
(64, 24),
(65, 24),
(66, 24),
(67, 25),
(68, 25),
(69, 26),
(70, 26),
(71, 26),
(78, 27),
(79, 27),
(80, 28),
(81, 28),
(82, 29),
(83, 29),
(53, 30);
/*!40000 ALTER TABLE `bedroom` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. bedroom_bed_type
DROP TABLE IF EXISTS `bedroom_bed_type`;
CREATE TABLE IF NOT EXISTS `bedroom_bed_type` (
                                                  `id_bedroom_bed_type` bigint(20) NOT NULL AUTO_INCREMENT,
                                                  `id_bed_type` bigint(20) DEFAULT NULL,
                                                  `id_bedroom` bigint(20) DEFAULT NULL,
                                                  PRIMARY KEY (`id_bedroom_bed_type`),
                                                  KEY `FKnhb6t95vd0qr6idsekgeoq7di` (`id_bed_type`),
                                                  KEY `FKr914qyj04vnw2n5siiybq5tqo` (`id_bedroom`),
                                                  CONSTRAINT `FKnhb6t95vd0qr6idsekgeoq7di` FOREIGN KEY (`id_bed_type`) REFERENCES `bed_type` (`id_bed_type`),
                                                  CONSTRAINT `FKr914qyj04vnw2n5siiybq5tqo` FOREIGN KEY (`id_bedroom`) REFERENCES `bedroom` (`id_bedroom`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.bedroom_bed_type : ~80 rows (environ)
DELETE FROM `bedroom_bed_type`;
/*!40000 ALTER TABLE `bedroom_bed_type` DISABLE KEYS */;
INSERT INTO `bedroom_bed_type` (`id_bedroom_bed_type`, `id_bed_type`, `id_bedroom`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 2),
(4, 1, 3),
(5, 1, 3),
(6, 2, 4),
(7, 1, 4),
(8, 1, 5),
(9, 1, 6),
(10, 1, 7),
(11, 1, 8),
(12, 1, 9),
(13, 1, 10),
(14, 1, 11),
(15, 1, 12),
(16, 1, 13),
(17, 1, 14),
(18, 1, 15),
(19, 1, 16),
(20, 1, 17),
(21, 1, 18),
(22, 1, 19),
(23, 1, 20),
(24, 1, 21),
(25, 1, 22),
(26, 1, 23),
(27, 1, 24),
(28, 1, 25),
(29, 1, 26),
(30, 1, 27),
(31, 1, 28),
(32, 1, 29),
(33, 1, 30),
(34, 1, 31),
(35, 1, 32),
(36, 1, 33),
(49, 2, 40),
(50, 1, 41),
(51, 1, 41),
(52, 1, 41),
(56, 2, 44),
(57, 1, 45),
(58, 1, 45),
(60, 2, 47),
(61, 2, 48),
(62, 1, 49),
(63, 2, 50),
(64, 1, 51),
(65, 1, 51),
(66, 1, 52),
(67, 1, 52),
(68, 1, 53),
(69, 2, 54),
(70, 1, 55),
(71, 1, 55),
(72, 2, 56),
(73, 2, 57),
(74, 1, 58),
(75, 1, 58),
(76, 2, 59),
(77, 1, 60),
(83, 2, 64),
(84, 1, 65),
(85, 1, 65),
(86, 1, 66),
(87, 1, 66),
(88, 2, 67),
(89, 1, 68),
(90, 1, 68),
(91, 2, 69),
(92, 1, 70),
(93, 1, 70),
(94, 1, 71),
(104, 2, 78),
(105, 1, 79),
(106, 1, 79),
(107, 2, 80),
(108, 2, 81),
(109, 2, 82),
(110, 1, 83);
/*!40000 ALTER TABLE `bedroom_bed_type` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. bed_type
DROP TABLE IF EXISTS `bed_type`;
CREATE TABLE IF NOT EXISTS `bed_type` (
                                          `id_bed_type` bigint(20) NOT NULL AUTO_INCREMENT,
                                          `icon` varchar(255) DEFAULT NULL,
                                          `name` varchar(255) DEFAULT NULL,
                                          PRIMARY KEY (`id_bed_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.bed_type : ~2 rows (environ)
DELETE FROM `bed_type`;
/*!40000 ALTER TABLE `bed_type` DISABLE KEYS */;
INSERT INTO `bed_type` (`id_bed_type`, `icon`, `name`) VALUES
(1, 'singleBed.png', 'Simple'),
(2, 'doubleBed.png', 'Double');
/*!40000 ALTER TABLE `bed_type` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. evaluation
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
                                            `id_evaluation` bigint(20) NOT NULL AUTO_INCREMENT,
                                            `commentary` varchar(255) DEFAULT NULL,
                                            `communication` int(11) DEFAULT NULL,
                                            `evaluation_date` datetime(6) DEFAULT NULL,
                                            `location` int(11) DEFAULT NULL,
                                            `residence` int(11) DEFAULT NULL,
                                            `user_name` varchar(255) DEFAULT NULL,
                                            `value_for_money` int(11) DEFAULT NULL,
                                            `id_product` bigint(20) DEFAULT NULL,
                                            PRIMARY KEY (`id_evaluation`),
                                            KEY `FKi6m8t2bm50o3kfw32a9mvpvgq` (`id_product`),
                                            CONSTRAINT `FKi6m8t2bm50o3kfw32a9mvpvgq` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
