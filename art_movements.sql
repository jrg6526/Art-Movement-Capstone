-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2026 at 09:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `art_movements`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `first_name`, `last_name`) VALUES
(1, 'Andre', 'Masson'),
(2, 'Dorothea', 'Tanning'),
(3, 'Jean', 'Arp'),
(4, 'Leonora', 'Carrington'),
(5, 'Max', 'Ernst'),
(6, 'Meret', 'Oppenheim'),
(7, 'Rene', 'Magritte'),
(8, 'Salvador', 'Dali'),
(9, 'Franz', 'Marc'),
(10, 'George', 'Braque'),
(11, 'Pablo', 'Picasso'),
(12, 'Paul', 'Klee'),
(13, 'Robert', 'Delauney'),
(14, 'Roger', 'de la Fresnaye'),
(15, 'Alfred', 'Sisley'),
(16, 'Camille', 'Pissarro'),
(17, 'Claude', 'Monet'),
(18, 'Edgar', 'Degas'),
(19, 'Frederic', 'Bazille'),
(20, 'Mary', 'Cassatt'),
(21, 'Pierre-Auguste', 'Renoir');

-- --------------------------------------------------------

--
-- Table structure for table `artwork`
--

CREATE TABLE `artwork` (
  `artwork_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `image` varchar(128) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `movement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artwork`
--

INSERT INTO `artwork` (`artwork_id`, `title`, `image`, `artist_id`, `movement_id`) VALUES
(1, 'Birthday', 'Surrealism/birthday.png', 2, 1),
(2, 'Celebes', 'Surrealism/celebes.jpg', 5, 1),
(3, 'And Then We Saw the Daughter of the Minotaur', 'Surrealism/daughter_of_the_minotaur.jpg', 4, 1),
(4, 'Hotel des Automates', 'Surrealism/hotel_des_automates.jpg', 1, 1),
(5, 'Object', 'Surrealism/object.jpg', 6, 1),
(6, 'Persistence of Memory', 'Surrealism/persistence_of_memory.png', 8, 1),
(7, 'Therapist', 'Surrealism/therapist.jpg', 7, 1),
(8, 'Torso with Buds', 'Surrealism/torso_with_buds.jpg', 3, 1),
(9, 'Castle and Sun', 'Cubism/castle_and_sun.png', 12, 2),
(10, 'Conquest of the Air', 'Cubism/conquest_of_the_air.jpg', 14, 2),
(11, 'Eiffel Tower', 'Cubism/eiffel_tower.jpg', 13, 2),
(12, 'Foxes', 'Cubism/foxes.jpg', 9, 2),
(13, 'Large Nude', 'Cubism/large_nude.jpg', 10, 2),
(14, 'Still Life with Lemons and Pipe', 'Cubism/lemons_and_pipe.png', 10, 2),
(15, 'Les Demoiselles d\'Avignon', 'Cubism/les_demoiselles_davignon.jpg', 11, 2),
(16, 'Weeping Woman', 'Cubism/weeping_woman.jpg', 11, 2),
(17, 'Boulevard Montmartre', 'Impressionism/boulevard_montmartre.jpg', 16, 3),
(18, 'Breakfast in Bed', 'Impressionism/breakfast_in_bed.png', 20, 3),
(19, 'Family Reunion', 'Impressionism/family_reunion.jpg', 19, 3),
(20, 'Impression - Sunrise', 'Impressionism/impression-sunrise.jpg', 17, 3),
(21, 'Mysteries of Water Lilies', 'Impressionism/mysteries_of_water_lilies.jpg', 17, 3),
(22, 'Spring in Moret-sur-Loing', 'Impressionism/spring_in_moret-sur-loing.jpg', 15, 3),
(23, 'The Star', 'Impressionism/star.jpg', 18, 3),
(24, 'Woman with a Parasol in a Garden', 'Impressionism/woman_with_a_parasol.jpg', 21, 3);

-- --------------------------------------------------------

--
-- Table structure for table `movement`
--

CREATE TABLE `movement` (
  `movement_id` int(11) NOT NULL,
  `move_name` varchar(32) NOT NULL,
  `essay` varchar(128) NOT NULL,
  `start_year` int(11) NOT NULL,
  `end_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movement`
--

INSERT INTO `movement` (`movement_id`, `move_name`, `essay`, `start_year`, `end_year`) VALUES
(1, 'Surrealism', 'Surrealism/surrealism_essay.txt', 1924, NULL),
(2, 'Cubism', 'Cubism/cubism_essay.txt', 1907, NULL),
(3, 'Impressionism', 'Impressionism/impressionism_essay.txt', 1860, 1886);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `artwork`
--
ALTER TABLE `artwork`
  ADD PRIMARY KEY (`artwork_id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `movement_id` (`movement_id`);

--
-- Indexes for table `movement`
--
ALTER TABLE `movement`
  ADD PRIMARY KEY (`movement_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artwork`
--
ALTER TABLE `artwork`
  ADD CONSTRAINT `artwork_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `artwork_ibfk_2` FOREIGN KEY (`movement_id`) REFERENCES `movement` (`movement_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
