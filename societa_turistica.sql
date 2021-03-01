-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 01, 2021 alle 14:58
-- Versione del server: 10.4.17-MariaDB
-- Versione PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `societa_turistica`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `competenze`
--

CREATE TABLE `competenze` (
  `id_guida` int(11) NOT NULL,
  `lingua` varchar(11) NOT NULL,
  `liv_conoscenza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `competenze`
--

INSERT INTO `competenze` (`id_guida`, `lingua`, `liv_conoscenza`) VALUES
(1, 'eng', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `eventi`
--

CREATE TABLE `eventi` (
  `id_visita` int(11) NOT NULL,
  `id_gruppo` int(11) NOT NULL,
  `prezzo` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppi`
--

CREATE TABLE `gruppi` (
  `id_gruppo` int(11) NOT NULL,
  `max_partecipanti` int(11) NOT NULL,
  `min_partecipanti` int(11) NOT NULL,
  `id_guida` int(11) NOT NULL,
  `data_pagamento` varchar(11) NOT NULL,
  `tipo_pagamento` varchar(11) NOT NULL,
  `desc_pagamento` varchar(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `guida`
--

CREATE TABLE `guida` (
  `id_guida` int(11) NOT NULL,
  `nome` varchar(11) NOT NULL,
  `sesso` varchar(11) NOT NULL,
  `data_nascita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `guida`
--

INSERT INTO `guida` (`id_guida`, `nome`, `sesso`, `data_nascita`) VALUES
(1, 'marco', 'm', 16111194);

-- --------------------------------------------------------

--
-- Struttura della tabella `unione`
--

CREATE TABLE `unione` (
  `id_utente` int(11) NOT NULL,
  `id_gruppo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `visita`
--

CREATE TABLE `visita` (
  `id_visita` int(10) NOT NULL,
  `durata _media` int(10) NOT NULL,
  `luogo` varchar(10) NOT NULL,
  `nome_visita` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `visitatori`
--

CREATE TABLE `visitatori` (
  `id_utente` int(11) NOT NULL,
  `nome` varchar(11) NOT NULL,
  `cognome` varchar(11) NOT NULL,
  `nazionalità` varchar(11) NOT NULL,
  `lingua` varchar(11) NOT NULL,
  `e-mail` varchar(11) NOT NULL,
  `telefono` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `competenze`
--
ALTER TABLE `competenze`
  ADD UNIQUE KEY `id_guida` (`id_guida`);

--
-- Indici per le tabelle `eventi`
--
ALTER TABLE `eventi`
  ADD PRIMARY KEY (`id_visita`,`id_gruppo`,`id_evento`),
  ADD KEY `id_gruppo` (`id_gruppo`);

--
-- Indici per le tabelle `gruppi`
--
ALTER TABLE `gruppi`
  ADD PRIMARY KEY (`id_gruppo`,`id_guida`,`id_evento`,`id_utente`),
  ADD KEY `id_guida` (`id_guida`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `guida`
--
ALTER TABLE `guida`
  ADD PRIMARY KEY (`id_guida`);

--
-- Indici per le tabelle `unione`
--
ALTER TABLE `unione`
  ADD PRIMARY KEY (`id_utente`,`id_gruppo`),
  ADD KEY `id_gruppo` (`id_gruppo`);

--
-- Indici per le tabelle `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`id_visita`);

--
-- Indici per le tabelle `visitatori`
--
ALTER TABLE `visitatori`
  ADD PRIMARY KEY (`id_utente`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `competenze`
--
ALTER TABLE `competenze`
  ADD CONSTRAINT `competenze_ibfk_1` FOREIGN KEY (`id_guida`) REFERENCES `guida` (`id_guida`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `eventi`
--
ALTER TABLE `eventi`
  ADD CONSTRAINT `eventi_ibfk_1` FOREIGN KEY (`id_visita`) REFERENCES `visita` (`id_visita`),
  ADD CONSTRAINT `eventi_ibfk_2` FOREIGN KEY (`id_gruppo`) REFERENCES `gruppi` (`id_gruppo`);

--
-- Limiti per la tabella `gruppi`
--
ALTER TABLE `gruppi`
  ADD CONSTRAINT `gruppi_ibfk_1` FOREIGN KEY (`id_guida`) REFERENCES `competenze` (`id_guida`),
  ADD CONSTRAINT `gruppi_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `unione` (`id_utente`);

--
-- Limiti per la tabella `unione`
--
ALTER TABLE `unione`
  ADD CONSTRAINT `unione_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `visitatori` (`id_utente`),
  ADD CONSTRAINT `unione_ibfk_2` FOREIGN KEY (`id_gruppo`) REFERENCES `gruppi` (`id_gruppo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
