-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 03. Apr 2013 um 14:02
-- Server Version: 5.5.25
-- PHP-Version: 5.3.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `usr_p159946_1`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `s_media_album_settings`
--
DROP TABLE IF EXISTS `s_media_album_settings`;
CREATE TABLE `s_media_album_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `albumID` int(11) NOT NULL,
  `create_thumbnails` int(11) NOT NULL,
  `thumbnail_size` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `albumID` (`albumID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Daten für Tabelle `s_media_album_settings`
--

INSERT INTO `s_media_album_settings` (`id`, `albumID`, `create_thumbnails`, `thumbnail_size`, `icon`) VALUES
(1, -10, 0, '', 'sprite-blue-folder'),
(2, -9, 0, '', 'sprite-blue-folder'),
(3, -8, 0, '', 'sprite-blue-folder'),
(4, -7, 0, '', 'sprite-blue-folder'),
(5, -6, 0, '', 'sprite-blue-folder'),
(6, -5, 0, '', 'sprite-blue-folder'),
(7, -4, 0, '', 'sprite-blue-folder'),
(8, -3, 0, '', 'sprite-blue-folder'),
(9, -2, 0, '', 'sprite-blue-folder'),
(10, -1, 1, '30x30;57x57;105x105;140x140;285x255;720x600;182x300', 'sprite-box'),
(11, -11, 1, '57x57;140x140;285x255;720x600', 'sprite-blue-folder'),
(12, -12, 0, '', 'sprite-blue-folder');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
