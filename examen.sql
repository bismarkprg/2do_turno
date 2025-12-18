-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2025 a las 10:22:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `RU` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ap_paterno` varchar(100) NOT NULL,
  `ap_materno` varchar(100) NOT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `universidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`RU`, `nombre`, `ap_paterno`, `ap_materno`, `fecha_nacimiento`, `universidad`) VALUES
(1, 'Pedro', 'Perez', 'Garcia', '2000-01-01', 'Universidad de los Lagos'),
(2, 'Juan', 'Pereira', 'Marin', '2002-03-01', 'Universidad Salesiana');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`RU`);

