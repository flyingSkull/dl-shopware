-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 03. Apr 2013 um 14:24
-- Server Version: 5.5.25
-- PHP-Version: 5.3.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `usr_p159946_3`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `s_core_templates`
--

DROP TABLE IF EXISTS `s_core_templates`;
CREATE TABLE `s_core_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esi` tinyint(1) unsigned NOT NULL,
  `style_support` tinyint(1) unsigned NOT NULL,
  `emotion` tinyint(1) unsigned NOT NULL,
  `version` int(11) unsigned NOT NULL,
  `plugin_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basename` (`template`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Daten für Tabelle `s_core_templates`
--

INSERT INTO `s_core_templates` (`id`, `template`, `name`, `description`, `author`, `license`, `esi`, `style_support`, `emotion`, `version`, `plugin_id`) VALUES
(22, 'emotion_dl_2', 'Doppellotte 3.1', NULL, 'Rickbert', 'New BSD', 1, 0, 1, 2, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
