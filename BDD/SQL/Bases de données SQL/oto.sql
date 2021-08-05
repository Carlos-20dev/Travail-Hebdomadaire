-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 08 fév. 2021 à 14:13
-- Version du serveur :  5.7.31-log
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `oto`
--

-- --------------------------------------------------------

--
-- Structure de la table `accessoires`
--

DROP TABLE IF EXISTS `accessoires`;
CREATE TABLE IF NOT EXISTS `accessoires` (
  `acs_id` int(11) NOT NULL AUTO_INCREMENT,
  `acs_vente` varchar(50) NOT NULL,
  `acs_pose` varchar(50) NOT NULL,
  `acs_options` varchar(50) NOT NULL,
  PRIMARY KEY (`acs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commerciaux`
--

DROP TABLE IF EXISTS `commerciaux`;
CREATE TABLE IF NOT EXISTS `commerciaux` (
  `cmr_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmr_particulier` varchar(50) NOT NULL,
  `cmr_professionnel` varchar(50) NOT NULL,
  PRIMARY KEY (`cmr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
CREATE TABLE IF NOT EXISTS `dossier` (
  `dss_id` int(11) NOT NULL AUTO_INCREMENT,
  `dss_reparation` varchar(50) NOT NULL,
  `dss_entretien` varchar(50) NOT NULL,
  PRIMARY KEY (`dss_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `prd_id` int(11) NOT NULL AUTO_INCREMENT,
  `prd_marque` varchar(50) NOT NULL,
  `prd_model` varchar(50) NOT NULL,
  `prd_genre` varchar(50) NOT NULL,
  `prd_etat` varchar(50) NOT NULL,
  PRIMARY KEY (`prd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `vnt_id` int(11) NOT NULL AUTO_INCREMENT,
  `vnt_prd_id` int(11) NOT NULL,
  `vnt_dss_id` int(11) NOT NULL,
  `vnt_acs_id` int(11) NOT NULL,
  `vnt_cmr_id` int(11) NOT NULL,
  PRIMARY KEY (`vnt_id`),
  KEY `vnt_prd_id` (`vnt_prd_id`),
  KEY `vnt_dss_id` (`vnt_dss_id`),
  KEY `vnt_acs_id` (`vnt_acs_id`),
  KEY `vnt_cmr_id` (`vnt_cmr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
