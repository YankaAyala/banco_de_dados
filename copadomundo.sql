-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/10/2023 às 04:04
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `copadomundo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `arbitro`
--

CREATE TABLE `arbitro` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `arbitro`
--

INSERT INTO `arbitro` (`ID`, `Nome`) VALUES
(1, 'José'),
(2, 'João'),
(3, 'Lucas'),
(4, 'Henrique');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atletas`
--

CREATE TABLE `atletas` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Idade` int(11) DEFAULT NULL,
  `Pais_ID` int(11) DEFAULT NULL,
  `ID_posicao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atletas`
--

INSERT INTO `atletas` (`ID`, `Nome`, `Idade`, `Pais_ID`, `ID_posicao`) VALUES
(1, 'Kaua', 25, 1, 2),
(2, 'Waldir', 24, 1, 1),
(3, 'Wanderson', 22, 2, 1),
(4, 'Walter', 25, 3, 1),
(5, 'Worloth', 24, 4, 1),
(6, 'Neymar', 18, 1, 0),
(7, 'Nilmar', 20, 1, 0),
(8, 'Neuly', 21, 1, 0),
(9, 'Newmar', 19, 2, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estadio`
--

CREATE TABLE `estadio` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estadio`
--

INSERT INTO `estadio` (`ID`, `Nome`) VALUES
(1, 'Maracanã'),
(2, 'Morumbi'),
(3, 'Arruda'),
(4, 'Mangueirão');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gol`
--

CREATE TABLE `gol` (
  `id` int(11) NOT NULL,
  `ID_Jogo` int(11) DEFAULT NULL,
  `ID_atleta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogo`
--

CREATE TABLE `jogo` (
  `ID` int(11) NOT NULL,
  `Data_CP` date DEFAULT NULL,
  `Estadio_ID` int(11) DEFAULT NULL,
  `Arbitro_ID` int(11) DEFAULT NULL,
  `ID_pais1` int(11) DEFAULT NULL,
  `ID_pais2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `jogo`
--

INSERT INTO `jogo` (`ID`, `Data_CP`, `Estadio_ID`, `Arbitro_ID`, `ID_pais1`, `ID_pais2`) VALUES
(1, '2001-06-17', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pais`
--

CREATE TABLE `pais` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Tecnico_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pais`
--

INSERT INTO `pais` (`ID`, `Nome`, `Tecnico_ID`) VALUES
(1, 'Brasil', 1),
(2, 'França', 2),
(3, 'Bulgaria', 3),
(4, 'Alemanha', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `posiçãojogador`
--

CREATE TABLE `posiçãojogador` (
  `id` int(11) NOT NULL,
  `nome` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `posiçãojogador`
--

INSERT INTO `posiçãojogador` (`id`, `nome`) VALUES
(0, 'Atacante'),
(1, 'Goleiro'),
(2, 'MeioCampo'),
(3, 'Zagueiro'),
(4, 'Volante');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tecnico`
--

CREATE TABLE `tecnico` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tecnico`
--

INSERT INTO `tecnico` (`ID`, `Nome`) VALUES
(1, 'Mario'),
(2, 'Cleber'),
(3, 'Claudio'),
(4, 'Osvaldo');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `arbitro`
--
ALTER TABLE `arbitro`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `atletas`
--
ALTER TABLE `atletas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_atletas` (`ID_posicao`);

--
-- Índices de tabela `estadio`
--
ALTER TABLE `estadio`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `gol`
--
ALTER TABLE `gol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jogo` (`ID_Jogo`),
  ADD KEY `fk_atleta` (`ID_atleta`);

--
-- Índices de tabela `jogo`
--
ALTER TABLE `jogo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_jogo1` (`Estadio_ID`),
  ADD KEY `fk_jogo2` (`Arbitro_ID`),
  ADD KEY `fk_pais1` (`ID_pais1`),
  ADD KEY `fk_pais2` (`ID_pais2`);

--
-- Índices de tabela `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_pais` (`Tecnico_ID`);

--
-- Índices de tabela `posiçãojogador`
--
ALTER TABLE `posiçãojogador`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `arbitro`
--
ALTER TABLE `arbitro`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `atletas`
--
ALTER TABLE `atletas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `estadio`
--
ALTER TABLE `estadio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `jogo`
--
ALTER TABLE `jogo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pais`
--
ALTER TABLE `pais`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atletas`
--
ALTER TABLE `atletas`
  ADD CONSTRAINT `fk_atletas` FOREIGN KEY (`ID_posicao`) REFERENCES `posiçãojogador` (`id`);

--
-- Restrições para tabelas `gol`
--
ALTER TABLE `gol`
  ADD CONSTRAINT `fk_atleta` FOREIGN KEY (`ID_atleta`) REFERENCES `atletas` (`ID`),
  ADD CONSTRAINT `fk_jogo` FOREIGN KEY (`ID_Jogo`) REFERENCES `jogo` (`ID`);

--
-- Restrições para tabelas `jogo`
--
ALTER TABLE `jogo`
  ADD CONSTRAINT `fk_jogo1` FOREIGN KEY (`Estadio_ID`) REFERENCES `estadio` (`ID`),
  ADD CONSTRAINT `fk_jogo2` FOREIGN KEY (`Arbitro_ID`) REFERENCES `arbitro` (`ID`),
  ADD CONSTRAINT `fk_pais1` FOREIGN KEY (`ID_pais1`) REFERENCES `pais` (`ID`),
  ADD CONSTRAINT `fk_pais2` FOREIGN KEY (`ID_pais2`) REFERENCES `pais` (`ID`);

--
-- Restrições para tabelas `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `fk_pais` FOREIGN KEY (`Tecnico_ID`) REFERENCES `tecnico` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
