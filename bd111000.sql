-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 27 mars 2025 à 03:32
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd111000`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `IdCat` int(11) NOT NULL,
  `Libelle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`IdCat`, `Libelle`) VALUES
(1, 'Authentification'),
(2, 'Branchement'),
(3, 'Synchronisation'),
(4, 'Autres');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `TelClt` char(8) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Adresse` varchar(50) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`TelClt`, `Nom`, `Prenom`, `Adresse`, `Email`) VALUES
('71222222', 'Hamdi', 'Ahmed', 'Rue el Izdihar Tunis', 'Hamdi.Ahmed@gmail.com'),
('72343343', 'Ben Ali', 'Omar', 'Av de la culture - Rafraf', 'Omar32@yahoo.fr'),
('75131313', 'Sassi', 'Olfa', 'Rue de l\'oasis Djerba', 'Sassi.olfa@gmail.tn'),
('76898989', 'Rabhi', 'Asma', 'Av de la liberté Gafsa', 'Rabhi.Asma@voila.fr');

-- --------------------------------------------------------

--
-- Structure de la table `reclamation`
--

CREATE TABLE `reclamation` (
  `NumRec` int(11) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Etat` char(1) NOT NULL,
  `DateRec` datetime NOT NULL,
  `DateRep` date DEFAULT NULL,
  `TelClt` char(8) DEFAULT NULL,
  `IdCat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reclamation`
--

INSERT INTO `reclamation` (`NumRec`, `Description`, `Etat`, `DateRec`, `DateRep`, `TelClt`, `IdCat`) VALUES
(5, 'dfgfhgfg', 'O', '2025-03-24 15:49:45', '2025-03-23', '71222222', 2),
(6, 'jyjyjyjukuuuk', 'O', '2025-03-24 21:18:06', '2025-03-23', '75131313', 1),
(7, 'ffffffff', 'N', '2025-03-24 22:21:35', NULL, '71222222', 4),
(8, 'ffffffff', 'N', '2025-03-24 22:21:59', NULL, '76898989', 2),
(9, 'sqdqsdsd', 'O', '2025-03-24 22:21:59', NULL, '72343343', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`IdCat`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`TelClt`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Index pour la table `reclamation`
--
ALTER TABLE `reclamation`
  ADD PRIMARY KEY (`NumRec`),
  ADD KEY `TelClt` (`TelClt`),
  ADD KEY `IdCat` (`IdCat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `IdCat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `reclamation`
--
ALTER TABLE `reclamation`
  MODIFY `NumRec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reclamation`
--
ALTER TABLE `reclamation`
  ADD CONSTRAINT `reclamation_ibfk_1` FOREIGN KEY (`TelClt`) REFERENCES `client` (`TelClt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reclamation_ibfk_2` FOREIGN KEY (`IdCat`) REFERENCES `categorie` (`IdCat`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
