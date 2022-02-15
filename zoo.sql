-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 15 Février 2022 à 08:46
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `zoo`
--

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

CREATE TABLE IF NOT EXISTS `animaux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_race` int(2) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `sexe` varchar(20) DEFAULT NULL,
  `pseudo` varchar(20) CHARACTER SET utf8 NOT NULL,
  `commentaire` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `nom_race` (`ref_race`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `animaux`
--

INSERT INTO `animaux` (`id`, `ref_race`, `date_naissance`, `sexe`, `pseudo`, `commentaire`) VALUES
(1, 1, '1992-02-14', 'F', 'Crocro', 'Très gourmand'),
(2, 2, '2010-09-14', 'M', 'Scar', 'A déjà attaqué son dresseur'),
(3, 3, '1997-07-23', 'M', 'Kerchak', 'Aime pas partager son butin'),
(5, 9, '2003-05-24', 'F', 'Lisa', 'Trop rousse');

-- --------------------------------------------------------

--
-- Structure de la table `enclos`
--

CREATE TABLE IF NOT EXISTS `enclos` (
  `id` varchar(3) NOT NULL,
  `nom_enclos` varchar(25) CHARACTER SET utf8 NOT NULL,
  `animaux_max` int(2) NOT NULL,
  `taille` int(11) DEFAULT NULL,
  `presence_eau` tinyint(1) NOT NULL,
  `responsable` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nom_enclos` (`nom_enclos`),
  KEY `reponsable` (`responsable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `enclos`
--

INSERT INTO `enclos` (`id`, `nom_enclos`, `animaux_max`, `taille`, `presence_eau`, `responsable`) VALUES
('L01', 'Lion', 5, NULL, 0, 3);

-- --------------------------------------------------------

--
-- Structure de la table `especes`
--

CREATE TABLE IF NOT EXISTS `especes` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nom_race` varchar(25) CHARACTER SET utf8 NOT NULL,
  `type_nourriture` varchar(25) NOT NULL,
  `duree_vie` int(3) NOT NULL,
  `animal_aquatique` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nom_race` (`nom_race`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `especes`
--

INSERT INTO `especes` (`id`, `nom_race`, `type_nourriture`, `duree_vie`, `animal_aquatique`) VALUES
(1, 'Crocodile', 'carnivore', 60, 'oui'),
(2, 'Lion', 'carnivore', 17, 'non'),
(3, 'Gorille', 'omnivore', 35, 'non'),
(9, 'Panda roux', 'herbivore', 9, 'non');

-- --------------------------------------------------------

--
-- Structure de la table `loc_animaux`
--

CREATE TABLE IF NOT EXISTS `loc_animaux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_animal` int(11) NOT NULL,
  `ref_enclo` varchar(20) DEFAULT NULL,
  `date_arrive` date DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_animal` (`ref_animal`),
  KEY `ref_enclo` (`ref_enclo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `loc_animaux`
--


-- --------------------------------------------------------

--
-- Structure de la table `personnels`
--

CREATE TABLE IF NOT EXISTS `personnels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) CHARACTER SET utf8 NOT NULL,
  `prenom` varchar(20) CHARACTER SET utf8 NOT NULL,
  `date_naissance` date NOT NULL,
  `sexe` varchar(1) NOT NULL,
  `fonction` varchar(20) CHARACTER SET utf8 NOT NULL,
  `salaire` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `personnels`
--

INSERT INTO `personnels` (`id`, `nom`, `prenom`, `date_naissance`, `sexe`, `fonction`, `salaire`) VALUES
(1, 'FRETET', 'Romain', '2002-08-28', 'H', 'Directeur', '25000.24'),
(2, 'COGNARD', 'Lisa', '2003-05-24', 'F', 'Directrice', '25000.24'),
(3, 'CHERGUI', 'Anis', '1980-03-07', 'H', 'employé', '03000.00'),
(4, 'GILLOT', 'AgnÃ¨s', '1983-07-25', 'F', 'Soigneuse', '01500.00'),
(5, 'DUBOIS', 'Simone', '1989-12-09', 'F', 'Soigneuse', '06000.99'),
(6, 'CARIOU', 'Flavie', '2003-06-26', 'F', 'Gardienne', '07000.00');

-- --------------------------------------------------------

--
-- Structure de la table `soigneurs`
--

CREATE TABLE IF NOT EXISTS `soigneurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_personnel` int(2) NOT NULL,
  `ref_race` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `race` (`ref_race`),
  KEY `personne` (`ref_personnel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `soigneurs`
--

INSERT INTO `soigneurs` (`id`, `ref_personnel`, `ref_race`) VALUES
(1, 4, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD CONSTRAINT `animaux_ibfk_1` FOREIGN KEY (`ref_race`) REFERENCES `especes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enclos`
--
ALTER TABLE `enclos`
  ADD CONSTRAINT `enclos_ibfk_2` FOREIGN KEY (`nom_enclos`) REFERENCES `especes` (`nom_race`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enclos_ibfk_3` FOREIGN KEY (`responsable`) REFERENCES `personnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `loc_animaux`
--
ALTER TABLE `loc_animaux`
  ADD CONSTRAINT `loc_animaux_ibfk_1` FOREIGN KEY (`ref_enclo`) REFERENCES `enclos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loc_animaux_ibfk_2` FOREIGN KEY (`ref_animal`) REFERENCES `animaux` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `soigneurs`
--
ALTER TABLE `soigneurs`
  ADD CONSTRAINT `soigneurs_ibfk_1` FOREIGN KEY (`ref_personnel`) REFERENCES `personnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `soigneurs_ibfk_2` FOREIGN KEY (`ref_race`) REFERENCES `especes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
