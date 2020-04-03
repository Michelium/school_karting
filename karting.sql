-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2020 at 02:52 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `karting`
--

-- --------------------------------------------------------

--
-- Table structure for table `activiteiten`
--

CREATE TABLE `activiteiten` (
  `id` int(11) NOT NULL,
  `soort_id` int(11) DEFAULT NULL,
  `datum` date NOT NULL,
  `tijd` time NOT NULL,
  `maxDeelnemers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activiteiten`
--

INSERT INTO `activiteiten` (`id`, `soort_id`, `datum`, `tijd`, `maxDeelnemers`) VALUES
(9, 1, '2018-03-01', '09:00:00', 0),
(10, 2, '2018-03-01', '11:00:00', 0),
(11, 3, '2018-03-01', '15:00:00', 0),
(12, 4, '2018-03-02', '10:00:00', 0),
(13, 1, '2020-03-11', '09:18:00', 0),
(14, 3, '2020-03-11', '08:30:00', 0),
(15, 1, '2020-04-26', '09:00:00', 0),
(16, 4, '2020-04-26', '10:00:00', 0),
(17, 2, '2020-04-26', '11:00:00', 0),
(18, 1, '2020-05-03', '09:00:00', 0),
(19, 4, '2020-05-03', '10:00:00', 0),
(20, 2, '2020-05-03', '11:00:00', 0),
(21, 1, '2020-06-06', '09:00:00', 0),
(22, 1, '2020-06-06', '10:00:00', 0),
(23, 4, '2020-06-06', '11:00:00', 0),
(24, 4, '2020-06-13', '11:30:00', 0),
(25, 1, '2020-06-13', '12:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE `app_users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `voorletters` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `tussenvoegsel` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `achternaam` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `adres` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `woonplaats` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `telefoon` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`id`, `username`, `password`, `email`, `roles`, `voorletters`, `tussenvoegsel`, `achternaam`, `adres`, `postcode`, `woonplaats`, `telefoon`) VALUES
(1, 'max', '$2y$13$DdPGoIbFovmPiWfg5OHyc.qYrNCAwKyOzJ9RU7V7DlpsTpC1gHmVK', 'max@wxs.nl', '[\"ROLE_ADMIN\"]', 'M.', NULL, 'Verstappen', 'Eijk 7', '1234HJ', 'Maaseik', '0682342343'),
(5, 'guus', '$2y$13$LBpQns643Tmfj0QrE0Kadu5vX27SWqhAaUf85m5JC3ng1WBRr8.eS', 'guus@duckstad.nl', '[\"ROLE_USER\"]', 'G.', NULL, 'Geluk', 'Guuslaan 1', '1234AS', 'Duckstad', '0612345678'),
(6, 'donald', '$2y$13$oDeyygHX.xlg7jp/e4eLcutMP5gduQPX1EtvAdbsZF3p//Cmn6yEW', 'donald@duckstad.nl', '[\"ROLE_USER\"]', 'D.', NULL, 'Duck', 'Donald Ducklaan 2', '1234AS', 'Duckstad', '0687654321'),
(7, 'katrien', '$2y$13$V.2gLuNAhA63pouMHu7iSu/a3yVCn95UX8FJApY62ExMLib/rntMu', 'katrien@duckstad.nl', '[\"ROLE_USER\"]', 'K.', NULL, 'Duck', 'Donald Ducklaan 3', '1234AS', 'Duckstad', '0687654567'),
(10, 'michel', '$2y$13$WpRpM/kC2E6XM0TfRJHgzudoIgunqtFUaaVt/0pKN.O8gnZWFoQAm', 'm@m.nl', '[\"ROLE_ADMIN\"]', 'Michel', 'm', 'Hamelink', 'm', 'm', 'm', '123'),
(11, 'michel2', '$2y$13$HUll4u66/RZCGci52bf50uTE3HZeFPCHi4RjCRKl7mNWcZuIreSmu', 'm@asdf234.nl', '[\"ROLE_USER\"]', 'm', 'm', 'mm', 'm', 'm', 'm', '1289');

-- --------------------------------------------------------

--
-- Table structure for table `deelnames`
--

CREATE TABLE `deelnames` (
  `user_id` int(11) NOT NULL,
  `activiteit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `deelnames`
--

INSERT INTO `deelnames` (`user_id`, `activiteit_id`) VALUES
(6, 12),
(7, 10),
(7, 12);

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200311082049', '2020-03-17 20:40:18'),
('20200311103857', '2020-03-17 20:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `soortactiviteiten`
--

CREATE TABLE `soortactiviteiten` (
  `id` int(11) NOT NULL,
  `naam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min_leeftijd` int(11) NOT NULL,
  `tijdsduur` int(11) NOT NULL,
  `prijs` decimal(6,2) NOT NULL,
  `beschrijving` longtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `soortactiviteiten`
--

INSERT INTO `soortactiviteiten` (`id`, `naam`, `min_leeftijd`, `tijdsduur`, `prijs`, `beschrijving`) VALUES
(1, 'Vrije training', 12, 15, '15.00', NULL),
(2, 'Grand Prix', 12, 60, '50.00', NULL),
(3, 'Endurance race', 16, 90, '65.00', NULL),
(4, 'Kinder race', 8, 10, '18.00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activiteiten`
--
ALTER TABLE `activiteiten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1C50895F3DEE50DF` (`soort_id`);

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C2502824F85E0677` (`username`);

--
-- Indexes for table `deelnames`
--
ALTER TABLE `deelnames`
  ADD PRIMARY KEY (`user_id`,`activiteit_id`),
  ADD KEY `IDX_ED2478E7A76ED395` (`user_id`),
  ADD KEY `IDX_ED2478E75A8A0A1` (`activiteit_id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `soortactiviteiten`
--
ALTER TABLE `soortactiviteiten`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activiteiten`
--
ALTER TABLE `activiteiten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `soortactiviteiten`
--
ALTER TABLE `soortactiviteiten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activiteiten`
--
ALTER TABLE `activiteiten`
  ADD CONSTRAINT `FK_1C50895F3DEE50DF` FOREIGN KEY (`soort_id`) REFERENCES `soortactiviteiten` (`id`);

--
-- Constraints for table `deelnames`
--
ALTER TABLE `deelnames`
  ADD CONSTRAINT `FK_ED2478E75A8A0A1` FOREIGN KEY (`activiteit_id`) REFERENCES `activiteiten` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ED2478E7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
