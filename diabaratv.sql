-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
-- Hôte : 127.0.0.1
-- Généré le : mar. 24 sep. 2024 à 18:22
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- 
-- Structure de la table `genres`
--

CREATE TABLE `genres` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genres_created_by_id_fk` (`created_by_id`),
  KEY `genres_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `fk_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_updated_by` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Insertion des données dans la table `genres`
--

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `color`, `icon`)
VALUES
(1, 'Rap Mandingue', NOW(), NOW(), NOW(), 1, 1, '#8B4513', 'RiDrumFill'),
(2, 'Rap', NOW(), NOW(), NOW(), 1, 1, '#FF5733', 'FaMicrophoneAlt'),
(3, 'Mandingue', NOW(), NOW(), NOW(), 1, 1, '#DAA520', 'GiMusicalNotes'),
(4, 'Pop', NOW(), NOW(), NOW(), 1, 1, '#FF69B4', 'FaMicrophoneAlt'),
(5, 'Pop Mandingue', NOW(), NOW(), NOW(), 1, 1, '#DAA520', 'GiGuitarHead'),
(6, 'Afrobeat', NOW(), NOW(), NOW(), 1, 1, '#FF4500', 'RiMusicFill'),
(7, 'Highlife', NOW(), NOW(), NOW(), 1, 1, '#FFD700', 'RiGuitarFill'),
(8, 'Makossa', NOW(), NOW(), NOW(), 1, 1, '#FF6347', 'GiDrumKit'),
(9, 'Soukous', NOW(), NOW(), NOW(), 1, 1, '#FF69B4', 'GiSaxophone'),
(10, 'Mbalax', NOW(), NOW(), NOW(), 1, 1, '#FF1493', 'FaMicrophoneAlt'),
(11, 'Gqom', NOW(), NOW(), NOW(), 1, 1, '#8B0000', 'RiHeadphoneFill'),
(12, 'Kwaito', NOW(), NOW(), NOW(), 1, 1, '#00FF00', 'RiMusic2Fill'),
(13, 'Zouk', NOW(), NOW(), NOW(), 1, 1, '#FF00FF', 'FaHeart'),
(14, 'Bikutsi', NOW(), NOW(), NOW(), 1, 1, '#7B68EE', 'GiGuitar'),
(15, 'Ndombolo', NOW(), NOW(), NOW(), 1, 1, '#FFA500', 'RiDancingFill'),
(16, 'Jùjú', NOW(), NOW(), NOW(), 1, 1, '#800080', 'GiDrum'),
(17, 'Sega', NOW(), NOW(), NOW(), 1, 1, '#ADD8E6', 'GiTambourine'),
(18, 'Tsapiky', NOW(), NOW(), NOW(), 1, 1, '#90EE90', 'FaGuitar'),
(19, 'Benga', NOW(), NOW(), NOW(), 1, 1, '#FF4500', 'GiMicrophone'),
(20, 'Mbube', NOW(), NOW(), NOW(), 1, 1, '#FFD700', 'GiMusicSpell'),
(21, 'Kizomba', NOW(), NOW(), NOW(), 1, 1, '#FF6347', 'GiGuitarElectric'),
(22, 'Funaná', NOW(), NOW(), NOW(), 1, 1, '#FF69B4', 'RiDrumFill'),
(23, 'Chimurenga', NOW(), NOW(), NOW(), 1, 1, '#FF1493', 'GiGuitarPick'),
(24, 'Taarab', NOW(), NOW(), NOW(), 1, 1, '#8B0000', 'FaMusic'),
(25, 'Kwela', NOW(), NOW(), NOW(), 1, 1, '#00FF00', 'GiDrum');

-- 
-- Ajout des contraintes d'indexation
--

ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genres_created_by_id_fk` (`created_by_id`),
  ADD KEY `genres_updated_by_id_fk` (`updated_by_id`);

-- 
-- Ajout des contraintes de clés étrangères
--

ALTER TABLE `genres`
  ADD CONSTRAINT `fk_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_updated_by` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

COMMIT;

