/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
                                         `id_product` bigint(20) NOT NULL AUTO_INCREMENT,
                                         `description` varchar(1000) DEFAULT NULL,
                                         `title` varchar(255) DEFAULT NULL,
                                         `id_property` bigint(20) DEFAULT NULL,
                                         PRIMARY KEY (`id_product`),
                                         KEY `FK2wd3k7xksybyjuc946l21at6s` (`id_property`),
                                         CONSTRAINT `FK2wd3k7xksybyjuc946l21at6s` FOREIGN KEY (`id_property`) REFERENCES `property` (`id_property`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.product : ~30 rows (environ)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id_product`, `description`, `title`, `id_property`) VALUES
(1, 'Vivez une experience parisienne hors du commun avec ce prestigieux appartement au coeur de paris.', 'Appartement lumineux face au marché bio de Convention', 1),
(2, 'Situeé face aux jardins des Tuileries, ce loft spacieux se trouve dans un immeuble construit en 1920 très élégant, plein de charme et typique de l\'architecture parisienne, il peut accueillir 8 personnes très confortablement.', 'Loft chic en plein coeur de la rue Saint Honoré', 2),
(3, 'Vivez une experience parisienne hors du commun avec ce prestigieux appartement au coeur de paris.', 'Loft atelier face au jardin des Tuileries', 3),
(4, 'Dans ce loft très spacieux situé à 2 minutes à pieds du marché de Convention et du cinéma rénové de la place, grande luminosité et à l\'abrui de nuisances sonores.', 'Loft totalement rénové place du Trocadéro', 4),
(5, 'Dans cet appartement datant de 1800 où séjourna Pablo Picasso, vous êtes au coeur du quartier Montmartre des artistes et à 2 pas de la célèbre vigne de Montmartre.', 'Appartement en plein coeur de Montmartre face aux vignobles', 5),
(6, 'Dans ce magnifique appartement familial, situé face au Palais Brongniart et a deux pas de toutes commodités, vivez une expérience de voyage hors du commun. Très lumineux et air conditionné récent.', 'Appartement de luxe face au Palais Brongniart', 6),
(7, 'Dans ce magnifique loft remis à neuf cette année, situé face au Centre Pompidou et en plein coeur du quartier branché du Marais. Très lumineux et air conditionné récent. Et voisins musiciens très charmants.', 'Loft très spacieux situé à deux pas du Centre Pompidou. Quartier d\'artistes branchés.', 7),
(8, 'Dans ce magnifique appartement situé à 3 min à pieds de la fameuse Place des Vosges, vivez une expérience inoubliable dans les anciens appartements de la favorite de Louis XIV. Un tableau de maître de son portrait vous accueille dès votre entrée dans les lieux.', 'Appartement chaleureux situé à 3 min à pieds de la Place des Vosges. Très calme.', 8),
(9, 'Dans ce superbe Loft en plein coeur de Saint Germain, allez prendre votre café parmi les célébrités qui habitent le quartier. Vous y croiserez peut être la chanteuse Jane Birkin qui y passe très souvent. Lumineux espace et très calme.', 'Loft moderne face aux Jardins du Luxembourg à Saint Germain des Prés.', 9),
(10, 'Dans ce spacieux appartement situé à deux pas de la Place de la Madeleine, profitez d un apero dans les nombreux bars alentours. Le lieu est très cosy et calme. Idéal pour une soirée en amoureux.', 'Magnifique appartement situé à deux pas de la Place de la Madeleine.', 10),
(11, 'Place de la Concorde, vous bénéficiez d\'une localisation dans un quartier central, entre Jardins des Tuileries, Champs Elysées et Le Louvres. La cheminée centrale donne à son salon un cachet rare dans Paris.', 'Bel appartement idéalement situé proche de la Place de la Concorde. Magnifique quartier parisien', 11),
(12, 'Situé face au Musée du vin et avec une vue imprenable sur la Tour Eiffel, appartement toutes commodités et très bien situé Adeptes du shopping, les boutiques de luxe sont en bas de l immeuble', 'Bel appartement situé dans le 16e face au Musée du Vin. Vue sur Tour Eiffel.', 12),
(13, 'Situé dans un quartier résidentiel très calme, vous pouvez vous rendre à pieds au Bois de Boulogne; Tous commerces à proximité Calme et lumineux.', 'Bel appartement situé dans un quartier très calme résidentiel. Proche Bois de Boulogne.', 13),
(14, 'Pour accéder à l\'immeuble vous devez passer par la rue derrière. Grand appartement situé en plein coeur du quartier festif des Halles, avec tous les bars et commerces autour.', 'Spacieux appartement en plein coeur de Châtelet. Ambiance festive de quartier.', 14),
(15, 'Situé dans un quartier vivant le jour et plus calme le soir, vous pourrez profiter le soir venu de la terrasse sans trop de bruie de voitures. Tout est à neuf et les pièces sont claires naturellement. Déco de Philippe Starck.', 'Ancien appartement plein de charme dans le 6e pour profiter des boutiques de luxe.', 15),
(16, 'Dans ce superbe appartement en plein cœur de Saint Germain, allez prendre votre café parmi les célébrités qui habitent le quartier. Vous y croiserez peut être la chanteuse Jane Birkin qui y passe très souvent. Lumineux espace et très calme.', 'Appartement résolument bobo à Saint-Germain.', 16),
(17, 'Appartement chaleureux situé juste au dessus du MacDonalds de la place de la Bastille.', 'Bel appartement sur la Place de la Bastille', 17),
(18, 'Un lieu pour réaliser tous vos fantasmes, au dessus du Maxim\'s et sa clientelle select.', 'Superbe garçonnière sur la Concorde.', 18),
(19, 'Réveillez la bête qui sommeille en vous dans ce luxueux repaire sauvage près du quartier Arts et Métier.', 'Appartement style "antre barbare" à Arts et Métiers', 19),
(20, 'Quelle vue !', 'Spacieux logement face au Palais Garnier', 20),
(21, 'Dans ce spacieux appartement situé à deux pas du Panthéon, profitez d\'un apéro dans les nombreux bars alentours. Le lieu est très cosy et calme. Idéal pour une soirée en amoureux.', 'Splendide penthouse à côté du Panthéon', 21),
(22, 'Bel appartement idéalement situé sur la très active rue Mouffetard. Magnifique quartier parisien.', 'Appartement design rue Mouffetard', 22),
(23, 'Ancien appartement plein de charme dans la très active rue de la Gaité, pour sauter du théâtre au sexshop.', 'Appartement chic rue de la Gaité.', 23),
(24, 'Situé dans un quartier vivant le jour et plus calme le soir, vous pourrez profiter le soir venu de la terrasse sans trop de bruit de voitures. Tout est à neuf et les pièces sont claires naturellement. Déco de Philippe Starck.', 'Duplex moderne et design rue Montaigne.', 24),
(25, 'Dans ce magnifique loft remis à neuf cette année, situé à deux pas du Parc Monceau. Très lumineux et air conditionné récent. Et voisins musiciens très charmants.', 'Beau loft près du Parc Monceau', 25),
(26, 'Dans ce magnifique appartement situé à 3 min à pieds de la fameuse Eglise de la Trinité, vivez une expérience inoubliable dans les anciens appartements de la favorite de Louis XVI. Un tableau de maître de son portrait vous accueille dès votre entrée dans les lieux.', 'Appartement ancien entièrement rénové rue des Dames.', 26),
(27, 'Situé sur le Champ de Mars  avec pas du tout une vue sur la Tour Eiffel, appartement toutes commodités et très bien situé. Adeptes du shopping, les boutiques de luxe ne sont pas du tout non plus en bas de l\'immeuble.', 'Charmant appartement au pied de la Tour Eiffel.', 27),
(28, 'Dans ce superbe appartement sur les Grands Boulevards, allez prendre votre café parmi les inconnus et touristes qui habitent le quartier. Vous n\'y croiserez assurément pas la chanteuse Jane Birkin qui n\'y passe jamais. Lumineux espace et très calme.', 'Appartement cosy près des Grands Boulevards.', 28),
(29, 'Traversez la rue pour rendre visite au phasmes, ânes du Poitou, et orang-outans à la ménagerie du Jardin des Plantes.', 'Bel appartement lumineux donnant sur le Jardin des Plantes.', 29),
(30, 'Un endroit insolite à partager avec votre meilleur ami à quatre (ou plus) pattes.', 'Petit palais idéalement placé sur la pelouse de la Villette.', 30);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. product_picture
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE IF NOT EXISTS `product_picture` (
                                                 `id_product_picture` bigint(20) NOT NULL AUTO_INCREMENT,
                                                 `picture` varchar(255) DEFAULT NULL,
                                                 `id_product` bigint(20) DEFAULT NULL,
                                                 PRIMARY KEY (`id_product_picture`),
                                                 KEY `FKkpo6tqmys8lg17k5urhtiki82` (`id_product`),
                                                 CONSTRAINT `FKkpo6tqmys8lg17k5urhtiki82` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.product_picture : ~146 rows (environ)
DELETE FROM `product_picture`;
/*!40000 ALTER TABLE `product_picture` DISABLE KEYS */;
INSERT INTO `product_picture` (`id_product_picture`, `picture`, `id_product`) VALUES
(1, 'home1/photo1.png', 1),
(2, 'home1/photo2.png', 1),
(3, 'home1/photo3.png', 1),
(4, 'home1/photo4.png', 1),
(5, 'home1/photo5.png', 1),
(6, 'home2/photo1.png', 2),
(7, 'home2/photo2.png', 2),
(8, 'home2/photo3.png', 2),
(9, 'home2/photo4.png', 2),
(10, 'home2/photo5.png', 2),
(11, 'home3/photo1.png', 3),
(12, 'home3/photo2.png', 3),
(13, 'home3/photo3.png', 3),
(14, 'home3/photo4.png', 3),
(15, 'home3/photo5.png', 3),
(16, 'home4/photo1.png', 4),
(17, 'home4/photo2.png', 4),
(18, 'home4/photo3.png', 4),
(19, 'home4/photo4.png', 4),
(20, 'home4/photo5.png', 4),
(21, 'home5/photo1.png', 5),
(22, 'home5/photo2.png', 5),
(23, 'home5/photo3.png', 5),
(24, 'home5/photo4.png', 5),
(25, 'home5/photo5.png', 5),
(26, 'home6/photo1.jpg', 6),
(27, 'home6/photo2.jpg', 6),
(28, 'home6/photo3.jpg', 6),
(29, 'home6/photo4.jpg', 6),
(30, 'home6/photo5.jpg', 6),
(31, 'home7/photo1.jpg', 7),
(32, 'home7/photo2.jpg', 7),
(33, 'home7/photo3.jpg', 7),
(34, 'home7/photo4.jpg', 7),
(35, 'home7/photo5.jpg', 7),
(36, 'home8/photo1.jpg', 8),
(37, 'home8/photo2.jpg', 8),
(38, 'home8/photo3.jpg', 8),
(39, 'home8/photo4.jpg', 8),
(40, 'home8/photo5.jpg', 8),
(41, 'home9/photo1.jpg', 9),
(42, 'home9/photo2.jpg', 9),
(43, 'home9/photo3.jpg', 9),
(44, 'home9/photo4.jpg', 9),
(45, 'home9/photo5.jpg', 9),
(46, 'home10/photo1.jpg', 10),
(47, 'home10/photo2.jpg', 10),
(48, 'home10/photo3.jpg', 10),
(49, 'home10/photo4.jpg', 10),
(50, 'home10/photo5.jpg', 10),
(51, 'home11/photo1.jpg', 11),
(52, 'home11/photo2.jpg', 11),
(53, 'home11/photo3.jpg', 11),
(54, 'home11/photo4.jpg', 11),
(55, 'home11/photo5.jpg', 11),
(56, 'home12/photo1.jpg', 12),
(57, 'home12/photo2.jpg', 12),
(58, 'home12/photo3.jpg', 12),
(59, 'home12/photo4.jpg', 12),
(60, 'home12/photo5.jpg', 12),
(61, 'home13/photo1.jpg', 13),
(62, 'home13/photo2.jpg', 13),
(63, 'home13/photo3.jpg', 13),
(64, 'home13/photo4.jpg', 13),
(65, 'home13/photo5.jpg', 13),
(66, 'home14/photo1.jpg', 14),
(67, 'home14/photo2.jpg', 14),
(68, 'home14/photo3.jpg', 14),
(69, 'home14/photo4.jpg', 14),
(70, 'home14/photo5.jpg', 14),
(71, 'home15/photo1.jpg', 15),
(72, 'home15/photo2.jpg', 15),
(73, 'home15/photo3.jpg', 15),
(74, 'home15/photo4.jpg', 15),
(75, 'home15/photo5.jpg', 15),
(76, 'home16/photo1.jpg', 16),
(77, 'home16/photo2.jpg', 16),
(78, 'home16/photo3.jpg', 16),
(79, 'home16/photo4.jpg', 16),
(80, 'home16/photo5.jpg', 16),
(81, 'home17/photo1.jpg', 17),
(82, 'home17/photo2.jpg', 17),
(83, 'home17/photo3.jpg', 17),
(84, 'home17/photo4.jpg', 17),
(85, 'home17/photo5.jpg', 17),
(86, 'home18/photo1.jpg', 18),
(87, 'home18/photo2.jpg', 18),
(88, 'home18/photo3.jpg', 18),
(89, 'home18/photo4.jpg', 18),
(90, 'home18/photo5.jpg', 18),
(91, 'home19/photo1.jpg', 19),
(92, 'home19/photo2.jpg', 19),
(93, 'home19/photo3.jpg', 19),
(94, 'home19/photo4.jpg', 19),
(95, 'home19/photo5.jpg', 19),
(96, 'home20/photo1.png', 20),
(97, 'home20/photo2.png', 20),
(98, 'home20/photo3.png', 20),
(99, 'home20/photo4.png', 20),
(100, 'home20/photo5.png', 20),
(101, 'home21/photo1.jpg', 21),
(102, 'home21/photo2.jpg', 21),
(103, 'home21/photo3.jpg', 21),
(104, 'home21/photo4.jpg', 21),
(105, 'home21/photo5.jpg', 21),
(106, 'home22/photo1.jpg', 22),
(107, 'home22/photo2.jpg', 22),
(108, 'home22/photo3.jpg', 22),
(109, 'home22/photo4.jpg', 22),
(110, 'home22/photo5.jpg', 22),
(111, 'home23/photo1.jpg', 23),
(112, 'home23/photo2.jpg', 23),
(113, 'home23/photo3.jpg', 23),
(114, 'home23/photo4.jpg', 23),
(115, 'home23/photo5.jpg', 23),
(116, 'home24/photo1.jpg', 24),
(117, 'home24/photo2.jpg', 24),
(118, 'home24/photo3.jpg', 24),
(119, 'home24/photo4.jpg', 24),
(120, 'home24/photo5.jpg', 24),
(121, 'home25/photo1.jpg', 25),
(122, 'home25/photo2.jpg', 25),
(123, 'home25/photo3.jpg', 25),
(124, 'home25/photo4.jpg', 25),
(125, 'home25/photo5.jpg', 25),
(126, 'home26/photo1.jpg', 26),
(127, 'home26/photo2.jpg', 26),
(128, 'home26/photo3.jpg', 26),
(129, 'home26/photo4.jpg', 26),
(130, 'home26/photo5.jpg', 26),
(131, 'home27/photo1.jpg', 27),
(132, 'home27/photo2.jpg', 27),
(133, 'home27/photo3.jpg', 27),
(134, 'home27/photo4.jpg', 27),
(135, 'home27/photo5.jpg', 27),
(136, 'home28/photo1.jpg', 28),
(137, 'home28/photo2.jpg', 28),
(138, 'home28/photo3.jpg', 28),
(139, 'home28/photo4.jpg', 28),
(140, 'home28/photo5.jpg', 28),
(141, 'home29/photo1.jpg', 29),
(142, 'home29/photo2.jpg', 29),
(143, 'home29/photo3.jpg', 29),
(144, 'home29/photo4.jpg', 29),
(145, 'home29/photo5.jpg', 29),
(146, 'home30/photo1.jpg', 30);
/*!40000 ALTER TABLE `product_picture` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. property
DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
                                          `id_property` bigint(20) NOT NULL AUTO_INCREMENT,
                                          `address` varchar(255) DEFAULT NULL,
                                          `address_complement` varchar(255) DEFAULT NULL,
                                          `daily_rate` double DEFAULT NULL,
                                          `max_guests` int(11) DEFAULT NULL,
                                          `note` varchar(255) DEFAULT NULL,
                                          `pets_authorized` bit(1) DEFAULT NULL,
                                          `property_type` varchar(255) DEFAULT NULL,
                                          `size` int(11) DEFAULT NULL,
                                          `zip_code` varchar(255) DEFAULT NULL,
                                          `product_id_product` bigint(20) DEFAULT NULL,
                                          `id_property_state` bigint(20) DEFAULT NULL,
                                          PRIMARY KEY (`id_property`),
                                          KEY `FKciwc5me4ai0hmka3uiqrx3p34` (`product_id_product`),
                                          KEY `FKrudgy9n2fkvvcu0w1fkljyvgo` (`id_property_state`),
                                          CONSTRAINT `FKciwc5me4ai0hmka3uiqrx3p34` FOREIGN KEY (`product_id_product`) REFERENCES `product` (`id_product`),
                                          CONSTRAINT `FKrudgy9n2fkvvcu0w1fkljyvgo` FOREIGN KEY (`id_property_state`) REFERENCES `property_state` (`id_property_state`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.property : ~30 rows (environ)
DELETE FROM `property`;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` (`id_property`, `address`, `address_complement`, `daily_rate`, `max_guests`, `note`, `pets_authorized`, `property_type`, `size`, `zip_code`, `product_id_product`, `id_property_state`) VALUES
(1, '234 rue de la Convention', '7ème étage 2ème porte', 1130, 7, 'La concierge est très sympathique', b'0', 'APPARTMENT', 120, '75015', NULL, 1),
(2, '213 bis rue Saint Honoré', '5ème étage', 1250, 7, 'L\'ascenseur ne fonctionne plus', b'0', 'LOFT', 110, '75001', NULL, 2),
(3, '64, Terrasse des Feuillants', '8ème étage ascenseur A', 1345, 6, 'Attention au chien du voisin', b'0', 'LOFT', 150, '75001', NULL, 3),
(4, '2, Place du Trocadéro', '1er étage', 1025, 7, 'Les clefs sont sous le tapis', b'0', 'LOFT', 200, '75016', NULL, 4),
(5, '15 rue Saint Vincent', '1er étage à droite', 1325, 7, 'Prix d\'ami pour le vin de Montmartre à la brasserie en bas d\'immeuble', b'0', 'APPARTMENT', 90, '75018', NULL, 5),
(6, '318, rue Vivienne', '12ème étage au fond du couloir', 1175, 5, 'Merci de fermer la porte à double tour sinon elle ne ferme pas complètement.', b'0', 'APPARTMENT', 220, '75002', NULL, 6),
(7, '77, rue Beaubourg', '4ème étage', 1475, 8, 'Le café est fabriqué par notre famille.', b'0', 'LOFT', 250, '75003', NULL, 7),
(8, '3, rue Saint-Gilles', '2ème étage', 1525, 8, 'Vous pouvez peindre la toile vierge et utiliser les outils de peinture si vous le souhaitez.', b'0', 'APPARTMENT', 210, '75003', NULL, 8),
(9, '71, rue Bonaparte', '2ème étage', 1625, 4, 'Un cadeau de bienvenue vous attend dans la grande salle à manger.', b'0', 'LOFT', 240, '75006', NULL, 9),
(10, '43 rue Cambon', '2ème étage', 1535, 6, 'Un double des clefs se trouve dans le pot d entrée du couloir.', b'0', 'APPARTMENT', 210, '75001', NULL, 10),
(11, '7, rue de Mondovi', '3eme étage', 1210, 4, 'Merci de fermer la porte à double tour sinon elle ne ferme pas complètement.', b'0', 'APPARTMENT', 145, '75001', NULL, 11),
(12, '11 rue Raynouard', '3ème étage', 1780, 4, 'Attention à la première marche en entrant dans la salle de bain', b'0', 'APPARTMENT', 115, '75016', NULL, 12),
(13, '13, rue des Halles', '4ème étage', 1540, 4, 'Merci de ne pas nettoyer avec des produits chimiques les plaques chauffantes.', b'0', 'APPARTMENT', 115, '75001', NULL, 13),
(14, '101 Avenue Mozart', '4ème étage au fond de la cour', 1325, 4, 'N\'oubliez pas votre badge. La gardienne est en vacances.', b'0', 'APPARTMENT', 135, '75016', NULL, 14),
(15, '43 Boulevard Raspail', '4ème étage porte gauche', 1175, 3, 'Merci de ne pas faire de bruit dans l\'escalier après 23h.', b'0', 'APPARTMENT', 200, '75006', NULL, 15),
(16, '175, Boulevard Saint-Germain', '5ème étage, porte gauche', 1270, 5, 'Les clefs sont sous le tapis', b'0', 'APPARTMENT', 180, '75006', NULL, 16),
(17, '4, Boulevard Richard Lenoir', '2ème étage, porte 201', 1125, 4, 'Un cadeau de bienvenue vous attend dans la grande salle à manger.', b'0', 'APPARTMENT', 150, '75011', NULL, 17),
(18, '11, Rue Royale', '2ème étage, porte rose', 1320, 2, 'Merci de fermer la porte à double tour sinon elle ne ferme pas complètement.', b'0', 'APPARTMENT', 170, '75008', NULL, 18),
(19, ' 107, rue Beaubourg', 'Porte jaune', 1250, 3, 'Attention à la première marche en entrant dans la salle de bain', b'0', 'APPARTMENT', 130, '75003', NULL, 19),
(20, '6, rue Halévy', '3ème étage droite', 1380, 6, 'Le café est fabriqué par notre famille.', b'0', 'APPARTMENT', 190, '75009', NULL, 20),
(21, '3, rue Soufflot', '5ème étage gauche', 1240, 6, 'Les clefs sont sous le tapis', b'0', 'APPARTMENT', 200, '75005', NULL, 21),
(22, '112, rue Mouffetard', '3ème étage, porte 320', 1450, 4, 'La concierge est très sympathique', b'0', 'APPARTMENT', 160, '75005', NULL, 22),
(23, ' 20, rue de la Gaité', '1er étage gauche', 1120, 3, 'Un double des clefs se trouve dans le pot d entrée du couloir.', b'0', 'APPARTMENT', 120, '75014', NULL, 23),
(24, '52, avenue Montaigne', '1er étage', 1420, 6, 'L\'ascenseur ne fonctionne plus', b'0', 'APPARTMENT', 210, '75008', NULL, 24),
(25, ' 47, rue de Monceau', '5ème étage, porte 501', 1320, 4, 'Merci de ne pas faire de bruit dans l\'escalier après 23h.', b'0', 'APPARTMENT', 150, '75008', NULL, 25),
(26, '18, rue de la Tour des Dames', '4ème étage, face à l’ascenseur', 1260, 5, 'Un cadeau de bienvenue vous attend dans la grande salle à manger.', b'0', 'APPARTMENT', 180, '75009', NULL, 26),
(27, '27, avenue de Suffren', '2ème étage, porte gauche', 950, 4, 'Attention au chien du voisin', b'0', 'APPARTMENT', 160, '75007', NULL, 27),
(28, '9, rue Sainte-Cécile', '5ème étage, porte bleu zébrée de jaune', 1125, 4, 'Vous pouvez peindre la toile vierge et utiliser les outils de peinture si vous le souhaitez.', b'0', 'APPARTMENT', 165, '75009', NULL, 28),
(29, '16, rue Cuvier', '1er étage, 1ère porte à droite', 920, 3, 'Les clefs sont sous le tapis', b'0', 'APPARTMENT', 100, '75005', NULL, 29),
(30, 'La Villette', 'Près des toilettes', 450, 1, 'Non conseillé pour les allergiques aux chats', b'1', 'APPARTMENT', 9, '75019', NULL, 30);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. property_state
DROP TABLE IF EXISTS `property_state`;
CREATE TABLE IF NOT EXISTS `property_state` (
                                                `id_property_state` bigint(20) NOT NULL AUTO_INCREMENT,
                                                `state_date` date DEFAULT NULL,
                                                PRIMARY KEY (`id_property_state`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.property_state : ~30 rows (environ)
DELETE FROM `property_state`;
/*!40000 ALTER TABLE `property_state` DISABLE KEYS */;
INSERT INTO `property_state` (`id_property_state`, `state_date`) VALUES
(1, '2019-10-25'),
(2, '2019-11-25'),
(3, '2019-12-25'),
(4, '2019-08-25'),
(5, '2019-07-11'),
(6, '2019-11-11'),
(7, '2020-09-17'),
(8, '2019-07-10'),
(9, '2019-05-16'),
(10, '2019-07-16'),
(11, '2019-12-18'),
(12, '2019-02-16'),
(13, '2019-11-12'),
(14, '2019-10-16'),
(15, '2019-09-18'),
(16, '2019-09-16'),
(17, '2019-10-25'),
(18, '2019-07-16'),
(19, '2020-09-19'),
(20, '2020-07-14'),
(21, '2020-07-21'),
(22, '2020-04-25'),
(23, '2020-08-20'),
(24, '2020-09-17'),
(25, '2020-06-28'),
(26, '2020-08-18'),
(27, '2020-02-05'),
(28, '2020-08-24'),
(29, '2020-08-20'),
(30, '2020-08-07');
/*!40000 ALTER TABLE `property_state` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. property_state_amenity
DROP TABLE IF EXISTS `property_state_amenity`;
CREATE TABLE IF NOT EXISTS `property_state_amenity` (
                                                        `id_property_state_amenity` bigint(20) NOT NULL AUTO_INCREMENT,
                                                        `quantity` int(11) NOT NULL,
                                                        `id_amenity` bigint(20) DEFAULT NULL,
                                                        `id_property_state` bigint(20) DEFAULT NULL,
                                                        PRIMARY KEY (`id_property_state_amenity`),
                                                        KEY `FK2hfn1w683w0qlrgcw5sd2xkdr` (`id_amenity`),
                                                        KEY `FK39iq1vymlctlc1adjw3i00ltu` (`id_property_state`),
                                                        CONSTRAINT `FK2hfn1w683w0qlrgcw5sd2xkdr` FOREIGN KEY (`id_amenity`) REFERENCES `amenity` (`id_amenity`),
                                                        CONSTRAINT `FK39iq1vymlctlc1adjw3i00ltu` FOREIGN KEY (`id_property_state`) REFERENCES `property_state` (`id_property_state`)
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.property_state_amenity : ~380 rows (environ)
DELETE FROM `property_state_amenity`;
/*!40000 ALTER TABLE `property_state_amenity` DISABLE KEYS */;
INSERT INTO `property_state_amenity` (`id_property_state_amenity`, `quantity`, `id_amenity`, `id_property_state`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 2, 5, 1),
(6, 1, 6, 1),
(7, 1, 9, 1),
(8, 1, 10, 1),
(9, 1, 11, 1),
(10, 2, 13, 1),
(11, 1, 14, 1),
(12, 1, 15, 1),
(13, 1, 16, 1),
(14, 1, 18, 1),
(15, 1, 19, 1),
(16, 1, 20, 1),
(17, 1, 1, 2),
(18, 1, 2, 2),
(19, 1, 3, 2),
(20, 1, 4, 2),
(21, 3, 5, 2),
(22, 1, 6, 2),
(23, 1, 7, 2),
(24, 1, 9, 2),
(25, 1, 10, 2),
(26, 1, 11, 2),
(27, 1, 13, 2),
(28, 1, 14, 2),
(29, 1, 15, 2),
(30, 1, 17, 2),
(31, 1, 19, 2),
(32, 1, 1, 3),
(33, 1, 2, 3),
(34, 1, 3, 3),
(35, 1, 4, 3),
(36, 3, 5, 3),
(37, 1, 6, 3),
(38, 1, 7, 3),
(39, 1, 9, 3),
(40, 1, 10, 3),
(41, 1, 11, 3),
(42, 1, 13, 3),
(43, 1, 14, 3),
(44, 1, 15, 3),
(45, 1, 17, 3),
(46, 1, 19, 3),
(47, 1, 1, 4),
(48, 1, 2, 4),
(49, 1, 3, 4),
(50, 1, 4, 4),
(51, 3, 5, 4),
(52, 1, 6, 4),
(53, 1, 7, 4),
(54, 1, 9, 4),
(55, 1, 10, 4),
(56, 1, 11, 4),
(57, 1, 13, 4),
(58, 1, 14, 4),
(59, 1, 15, 4),
(60, 1, 17, 4),
(61, 1, 19, 4),
(62, 1, 1, 5),
(63, 1, 2, 5),
(64, 1, 3, 5),
(65, 1, 4, 5),
(66, 3, 5, 5),
(67, 1, 6, 5),
(68, 1, 7, 5),
(69, 1, 9, 5),
(70, 1, 10, 5),
(71, 1, 11, 5),
(72, 1, 13, 5),
(73, 1, 14, 5),
(74, 1, 15, 5),
(75, 1, 17, 5),
(76, 1, 19, 5),
(77, 1, 1, 6),
(78, 1, 2, 6),
(79, 1, 3, 6),
(80, 1, 4, 6),
(81, 3, 5, 6),
(82, 1, 6, 6),
(83, 1, 7, 6),
(84, 1, 9, 6),
(85, 1, 10, 6),
(86, 1, 11, 6),
(87, 1, 13, 6),
(88, 1, 14, 6),
(89, 1, 15, 6),
(90, 1, 17, 6),
(91, 1, 19, 6),
(92, 1, 1, 7),
(93, 1, 2, 7),
(94, 1, 3, 7),
(95, 1, 4, 7),
(96, 3, 5, 7),
(97, 1, 6, 7),
(98, 1, 7, 7),
(99, 1, 9, 7),
(100, 1, 10, 7),
(101, 1, 11, 7),
(102, 1, 13, 7),
(103, 1, 14, 7),
(104, 1, 15, 7),
(105, 1, 17, 7),
(106, 1, 19, 7),
(107, 1, 1, 8),
(108, 1, 2, 8),
(109, 1, 3, 8),
(110, 1, 4, 8),
(111, 3, 5, 8),
(112, 1, 6, 8),
(113, 1, 7, 8),
(114, 1, 9, 8),
(115, 1, 10, 8),
(116, 1, 11, 8),
(117, 1, 13, 8),
(118, 1, 14, 8),
(119, 1, 15, 8),
(120, 1, 17, 8),
(121, 1, 19, 8),
(122, 1, 1, 9),
(123, 1, 2, 9),
(124, 1, 3, 9),
(125, 1, 4, 9),
(126, 3, 5, 9),
(127, 1, 6, 9),
(128, 1, 7, 9),
(129, 1, 9, 9),
(130, 1, 10, 9),
(131, 1, 11, 9),
(132, 1, 13, 9),
(133, 1, 14, 9),
(134, 1, 15, 9),
(135, 1, 17, 9),
(136, 1, 19, 9),
(137, 1, 1, 10),
(138, 1, 2, 10),
(139, 1, 3, 10),
(140, 1, 4, 10),
(141, 3, 5, 10),
(142, 1, 6, 10),
(143, 1, 7, 10),
(144, 1, 9, 10),
(145, 1, 10, 10),
(146, 1, 11, 10),
(147, 1, 13, 10),
(148, 1, 14, 10),
(149, 1, 15, 10),
(150, 1, 17, 10),
(151, 1, 19, 10),
(152, 1, 1, 11),
(153, 1, 2, 11),
(154, 1, 3, 11),
(155, 1, 4, 11),
(156, 3, 5, 11),
(157, 1, 6, 11),
(158, 1, 7, 11),
(159, 1, 9, 11),
(160, 1, 10, 11),
(161, 1, 11, 11),
(162, 1, 13, 11),
(163, 1, 14, 11),
(164, 1, 15, 11),
(165, 1, 17, 11),
(166, 1, 19, 11),
(167, 1, 1, 12),
(168, 1, 2, 12),
(169, 1, 3, 12),
(170, 1, 4, 12),
(171, 3, 5, 12),
(172, 1, 6, 12),
(173, 1, 7, 12),
(174, 1, 9, 12),
(175, 1, 10, 12),
(176, 1, 11, 12),
(177, 1, 13, 12),
(178, 1, 14, 12),
(179, 1, 15, 12),
(180, 1, 17, 12),
(181, 1, 19, 12),
(182, 1, 1, 13),
(183, 1, 2, 13),
(184, 1, 3, 13),
(185, 1, 4, 13),
(186, 3, 5, 13),
(187, 1, 6, 13),
(188, 1, 7, 13),
(189, 1, 9, 13),
(190, 1, 10, 13),
(191, 1, 11, 13),
(192, 1, 13, 13),
(193, 1, 14, 13),
(194, 1, 15, 13),
(195, 1, 17, 13),
(196, 1, 19, 13),
(197, 1, 1, 14),
(198, 1, 2, 14),
(199, 1, 3, 14),
(200, 1, 4, 14),
(201, 3, 5, 14),
(202, 1, 6, 14),
(203, 1, 7, 14),
(204, 1, 9, 14),
(205, 1, 10, 14),
(206, 1, 11, 14),
(207, 1, 13, 14),
(208, 1, 14, 14),
(209, 1, 15, 14),
(210, 1, 17, 14),
(211, 1, 19, 14),
(212, 1, 1, 15),
(213, 1, 2, 15),
(214, 1, 3, 15),
(215, 1, 4, 15),
(216, 3, 5, 15),
(217, 1, 6, 15),
(218, 1, 7, 15),
(219, 1, 9, 15),
(220, 1, 10, 15),
(221, 1, 11, 15),
(222, 1, 13, 15),
(223, 1, 14, 15),
(224, 1, 15, 15),
(225, 1, 17, 15),
(226, 1, 19, 15),
(266, 1, 1, 16),
(267, 1, 4, 16),
(268, 1, 5, 16),
(269, 1, 6, 16),
(270, 1, 7, 16),
(271, 1, 8, 16),
(272, 1, 9, 16),
(273, 1, 11, 16),
(274, 1, 12, 16),
(275, 1, 13, 16),
(276, 1, 14, 16),
(277, 1, 15, 16),
(278, 1, 16, 16),
(291, 1, 1, 17),
(292, 1, 2, 17),
(293, 1, 3, 17),
(294, 1, 4, 17),
(295, 1, 5, 17),
(296, 1, 6, 17),
(297, 1, 7, 17),
(298, 1, 8, 17),
(299, 1, 9, 17),
(300, 1, 10, 17),
(301, 1, 16, 17),
(302, 1, 18, 17),
(317, 1, 1, 18),
(318, 1, 2, 18),
(319, 1, 3, 18),
(320, 1, 4, 18),
(321, 1, 5, 18),
(322, 1, 6, 18),
(323, 1, 7, 18),
(324, 1, 8, 18),
(325, 1, 9, 18),
(326, 1, 10, 18),
(327, 1, 12, 18),
(328, 1, 13, 18),
(329, 1, 16, 18),
(330, 1, 20, 18),
(331, 1, 1, 19),
(332, 1, 2, 19),
(333, 1, 5, 19),
(334, 1, 6, 19),
(335, 1, 7, 19),
(336, 1, 8, 19),
(337, 1, 9, 19),
(338, 1, 10, 19),
(339, 1, 12, 19),
(340, 1, 1, 20),
(341, 1, 3, 20),
(342, 1, 4, 20),
(343, 1, 5, 20),
(344, 1, 6, 20),
(345, 1, 7, 20),
(346, 1, 8, 20),
(347, 1, 9, 20),
(348, 1, 10, 20),
(349, 1, 16, 20),
(350, 1, 18, 20),
(351, 1, 12, 30),
(352, 1, 1, 21),
(353, 1, 2, 21),
(354, 1, 3, 21),
(355, 1, 4, 21),
(356, 2, 5, 21),
(357, 1, 6, 21),
(358, 2, 7, 21),
(359, 1, 9, 21),
(360, 1, 14, 21),
(361, 1, 15, 21),
(362, 1, 17, 21),
(363, 1, 1, 22),
(364, 1, 3, 22),
(365, 1, 4, 22),
(366, 3, 5, 22),
(367, 1, 6, 22),
(368, 1, 7, 22),
(369, 1, 8, 22),
(370, 1, 9, 22),
(371, 2, 12, 22),
(372, 2, 13, 22),
(373, 1, 16, 22),
(374, 2, 20, 22),
(375, 1, 1, 23),
(376, 1, 2, 23),
(377, 1, 3, 23),
(378, 1, 4, 23),
(379, 2, 5, 23),
(380, 1, 6, 23),
(381, 1, 7, 23),
(382, 1, 9, 23),
(383, 2, 12, 23),
(396, 1, 1, 24),
(397, 1, 2, 24),
(398, 1, 3, 24),
(399, 1, 4, 24),
(400, 3, 5, 24),
(401, 1, 6, 24),
(402, 2, 7, 24),
(403, 1, 8, 24),
(404, 1, 9, 24),
(405, 1, 10, 24),
(406, 3, 12, 24),
(407, 2, 16, 24),
(408, 1, 1, 25),
(409, 1, 3, 25),
(410, 1, 4, 25),
(411, 2, 5, 25),
(412, 1, 6, 25),
(413, 1, 7, 25),
(414, 1, 13, 25),
(415, 1, 16, 25),
(416, 1, 1, 26),
(417, 1, 2, 26),
(418, 1, 3, 26),
(419, 1, 4, 26),
(420, 2, 5, 26),
(421, 1, 6, 26),
(422, 2, 7, 26),
(423, 1, 8, 26),
(424, 1, 9, 26),
(425, 1, 10, 26),
(426, 1, 11, 26),
(427, 2, 12, 26),
(428, 3, 13, 26),
(429, 1, 14, 26),
(430, 1, 15, 26),
(431, 1, 16, 26),
(432, 1, 18, 26),
(463, 1, 1, 27),
(464, 1, 2, 27),
(465, 1, 3, 27),
(466, 1, 4, 27),
(467, 2, 5, 27),
(468, 1, 6, 27),
(469, 1, 7, 27),
(470, 2, 12, 27),
(471, 2, 13, 27),
(472, 1, 18, 27),
(473, 1, 1, 28),
(474, 1, 2, 28),
(475, 1, 3, 28),
(476, 1, 6, 28),
(477, 1, 7, 28),
(478, 1, 10, 28),
(479, 1, 17, 28),
(480, 1, 1, 29),
(481, 1, 3, 29),
(482, 1, 4, 29),
(483, 1, 5, 29),
(484, 1, 6, 29),
(485, 1, 7, 29),
(486, 1, 10, 29),
(487, 1, 12, 29);
/*!40000 ALTER TABLE `property_state_amenity` ENABLE KEYS */;

-- Listage de la structure de la table msp_product_housing_db. property_state_item
DROP TABLE IF EXISTS `property_state_item`;
CREATE TABLE IF NOT EXISTS `property_state_item` (
                                                     `id_property_state_item` bigint(20) NOT NULL AUTO_INCREMENT,
                                                     `commentary` varchar(255) DEFAULT NULL,
                                                     `picture` varchar(255) DEFAULT NULL,
                                                     `id_property_state` bigint(20) DEFAULT NULL,
                                                     PRIMARY KEY (`id_property_state_item`),
                                                     KEY `FKhvefowjv71c3n3xbv472y2w4o` (`id_property_state`),
                                                     CONSTRAINT `FKhvefowjv71c3n3xbv472y2w4o` FOREIGN KEY (`id_property_state`) REFERENCES `property_state` (`id_property_state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table msp_product_housing_db.property_state_item : ~0 rows (environ)
DELETE FROM `property_state_item`;
/*!40000 ALTER TABLE `property_state_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_state_item` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
