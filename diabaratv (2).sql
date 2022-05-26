-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 26 mai 2022 à 14:53
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `diabaratv`
--

-- --------------------------------------------------------

--
-- Structure de la table `artist`
--

CREATE TABLE `artist` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `create_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_user` int(10) NOT NULL,
  `updated_user` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `artist`
--

INSERT INTO `artist` (`id`, `name`, `location`, `image`, `create_at`, `updated_at`, `status`, `created_user`, `updated_user`) VALUES
(13, 'Gaspi', 'Bamako', '/uploads/Gaspi.jpg', '2022-05-09T16:19:45.087Z', NULL, 1, 1, NULL),
(15, 'Sidiki Diabaté', 'Bamako', '/uploads/sidiki_diabaté.jpg', '2022-05-09T16:22:29.939Z', NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `songplays`
--

CREATE TABLE `songplays` (
  `songplay_id` int(11) NOT NULL,
  `startime` bigint(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `level` varchar(255) NOT NULL,
  `song_id` int(10) NOT NULL,
  `artiste_id` int(10) NOT NULL,
  `session_id` int(10) NOT NULL,
  `location` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `songs`
--

CREATE TABLE `songs` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artiste_id` varchar(10) NOT NULL,
  `year` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `songs`
--

INSERT INTO `songs` (`id`, `title`, `artiste_id`, `year`, `url`, `image`, `duration`) VALUES
(3, 'yirila', 'lil zed', '2022', '/uploads/Lil Zed _Yirila (clip officiel 2022).mp3', '/uploads/lil_zed.jpg', '3'),
(7, 'Yirila', 'lil zed', '2022', '/uploads/Lil Zed _Yirila (clip officiel 2022).mp3', '/uploads/lil_zed.jpg', '3'),
(8, 'Diarabi', 'Malakey', '2022', '/uploads/Malakey - Diarabi (Clip Officiel).mp3', '/uploads/malakey.png', '3:00');

-- --------------------------------------------------------

--
-- Structure de la table `time`
--

CREATE TABLE `time` (
  `start_time` bigint(255) NOT NULL,
  `hour` int(10) NOT NULL,
  `day` int(10) NOT NULL,
  `week` int(10) NOT NULL,
  `month` int(10) NOT NULL,
  `year` int(10) NOT NULL,
  `weekday` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `gender`, `level`, `role`, `image`) VALUES
(1, 'Tandjigora', 'Mohamed', 'mtandjo@gmail.com', 'admin123', '', '', '', ''),
(2, 'Tandjigora', 'Mohamed', 'mtandjo@flyentreprise.com', '$2y$10$7cu6R4Db9KvDBFZ/h9we2Ot6e4DLnjua7GdIxruMJjn1EjjXaXXMK', 'Homme', '', 'admin', '');

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artiste_id` varchar(255) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `videos`
--

INSERT INTO `videos` (`id`, `title`, `artiste_id`, `video_url`, `image`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Woman', 'Omah lay', '/uploads/Omah Lay - Woman (Official Music Video).mp4', '/uploads/Capture d’écran 2022-05-23 223636.png', '2022-05-23T22:52:10.833Z', '2', '', ''),
(2, 'Assietou', 'Agato', '/uploads/AGATO - ASSIETOU (Official Music Video).mp4', '/uploads/agato.png', '2022-05-24T14:15:15.241Z', '2', NULL, NULL),
(3, 'Mama Lah', 'iba one', '/uploads/Iba One - Mama Lah ( Clip Officiel ).mp4', '/uploads/iba one.png', '2022-05-24T14:21:33.098Z', '2', NULL, NULL),
(4, 'Ibafo ne', 'Young po', '/uploads/YOUNG PÔ - IBAFO NER (FEAT DOUM\'S) (Clip Officiel 2021).mp4', '/uploads/young po.png', '2022-05-24T14:29:58.274Z', '2', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`start_time`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
