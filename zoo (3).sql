-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 10 Février 2022 à 08:25
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
  `id` int(11) NOT NULL,
  `nom_race` varchar(20) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `sexe` varchar(20) DEFAULT NULL,
  `pseudo` varchar(20) CHARACTER SET utf8 NOT NULL,
  `commentaire` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `nom_race` (`nom_race`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `animaux`
--

INSERT INTO `animaux` (`id`, `nom_race`, `date_naissance`, `sexe`, `pseudo`, `commentaire`) VALUES
(1, '01', '1992-02-14', 'F', 'Crocro', 'Très gourmand'),
(2, '02', '2010-09-14', 'M', 'Scar', 'A déjà attaqué son dresseur'),
(3, '03', '1997-07-23', 'M', 'Kerchak', 'Aime pas partager son butin');

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
  `reponsable` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nom_enclos` (`nom_enclos`),
  KEY `reponsable` (`reponsable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `enclos`
--

INSERT INTO `enclos` (`id`, `nom_enclos`, `animaux_max`, `taille`, `presence_eau`, `reponsable`) VALUES
('L01', 'Lion', 5, NULL, 0, 3);

-- --------------------------------------------------------

--
-- Structure de la table `especes`
--

CREATE TABLE IF NOT EXISTS `especes` (
  `id` varchar(21) NOT NULL,
  `nom_race` varchar(25) CHARACTER SET utf8 NOT NULL,
  `type_nourriture` varchar(25) NOT NULL,
  `duree_vie` int(3) NOT NULL,
  `animal_aquatique` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nom_race` (`nom_race`),
  KEY `nom_race_2` (`nom_race`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `especes`
--

INSERT INTO `especes` (`id`, `nom_race`, `type_nourriture`, `duree_vie`, `animal_aquatique`) VALUES
('01', 'Crocodile', 'carnivore', 60, 'oui'),
('02', 'Lion', 'carnivore', 17, 'non'),
('03', 'Gorille', 'omnivore', 35, 'non');

-- --------------------------------------------------------

--
-- Structure de la table `loc_animaux`
--

CREATE TABLE IF NOT EXISTS `loc_animaux` (
  `id` int(11) NOT NULL,
  `ref_animal` int(11) NOT NULL,
  `ref_enclo` varchar(20) DEFAULT NULL,
  `date_arrive` date DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_animal` (`ref_animal`),
  KEY `ref_enclo` (`ref_enclo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `loc_animaux`
--


-- --------------------------------------------------------

--
-- Structure de la table `personnels`
--

CREATE TABLE IF NOT EXISTS `personnels` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) CHARACTER SET utf8 NOT NULL,
  `prenom` varchar(20) CHARACTER SET utf8 NOT NULL,
  `date_naissance` date NOT NULL,
  `sexe` varchar(1) NOT NULL,
  `fonction` varchar(20) CHARACTER SET utf8 NOT NULL,
  `salaire` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `personnels`
--

INSERT INTO `personnels` (`id`, `nom`, `prenom`, `date_naissance`, `sexe`, `fonction`, `salaire`) VALUES
(1, 'FRETET', 'Romain', '2002-08-28', 'H', 'Directeur', '25000.24'),
(2, 'COGNARD', 'Lisa', '2003-05-24', 'F', 'Directrice', '25000.24'),
(3, 'CHERGUI', 'Anis', '1980-03-07', 'H', 'employé', '03000.00'),
(4, 'GILLOT', 'Agnès', '1983-07-25', 'F', 'Soigeuse', '01500.00');

-- --------------------------------------------------------

--
-- Structure de la table `soigneurs`
--

CREATE TABLE IF NOT EXISTS `soigneurs` (
  `id` int(11) NOT NULL,
  `personne` int(11) NOT NULL,
  `race` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `race` (`race`),
  KEY `personne` (`personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `soigneurs`
--

INSERT INTO `soigneurs` (`id`, `personne`, `race`) VALUES
(1, 4, '01');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD CONSTRAINT `animaux_ibfk_1` FOREIGN KEY (`nom_race`) REFERENCES `especes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enclos`
--
ALTER TABLE `enclos`
  ADD CONSTRAINT `enclos_ibfk_1` FOREIGN KEY (`reponsable`) REFERENCES `personnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enclos_ibfk_2` FOREIGN KEY (`nom_enclos`) REFERENCES `especes` (`nom_race`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `loc_animaux`
--
ALTER TABLE `loc_animaux`
  ADD CONSTRAINT `loc_animaux_ibfk_3` FOREIGN KEY (`ref_animal`) REFERENCES `animaux` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loc_animaux_ibfk_4` FOREIGN KEY (`ref_enclo`) REFERENCES `enclos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `soigneurs`
--
ALTER TABLE `soigneurs`
  ADD CONSTRAINT `soigneurs_ibfk_2` FOREIGN KEY (`personne`) REFERENCES `personnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `soigneurs_ibfk_3` FOREIGN KEY (`race`) REFERENCES `especes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
