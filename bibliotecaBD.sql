-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2021 a las 16:26:15
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL,
  `Nombres` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Apellidos` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `fecha_muerte` date DEFAULT NULL,
  `Nacionalidad` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`idAutor`, `Nombres`, `Apellidos`, `fecha_nac`, `fecha_muerte`, `Nacionalidad`) VALUES
(1, 'J. K. ', 'Rowling', '1965-07-31', NULL, 'Británica'),
(2, 'Agatha', 'Christie', '1890-09-15', '1976-01-12', 'Británica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_educativo`
--

CREATE TABLE `centro_educativo` (
  `idCentroEducativo` int(11) NOT NULL,
  `Nombre` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `idNivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `centro_educativo`
--

INSERT INTO `centro_educativo` (`idCentroEducativo`, `Nombre`, `Direccion`, `idNivel`) VALUES
(1, 'Colegio Liceo Santa Marina', 'Quetzaltenango', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `idEditorial` int(11) NOT NULL,
  `editorial` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`idEditorial`, `editorial`) VALUES
(1, 'Editorial Piedrasanta'),
(2, 'Salamandra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `idEstudiante` int(11) NOT NULL,
  `Nombres` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Apellidos` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Carnet` varchar(25) COLLATE utf8mb4_spanish_ci NOT NULL,
  `idCentroEducativo` int(11) NOT NULL,
  `Fecha_Nac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`idEstudiante`, `Nombres`, `Apellidos`, `Carnet`, `idCentroEducativo`, `Fecha_Nac`) VALUES
(1, 'Ángel Gabriel', 'Sánchez Rodríguez', '202005010', 1, '2004-01-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `idGenero` int(11) NOT NULL,
  `genero` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`idGenero`, `genero`) VALUES
(1, 'Fantasía'),
(2, 'Historia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `idLibro` int(11) NOT NULL,
  `Nombre` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `idEditorial` int(11) NOT NULL,
  `idAutor` int(11) NOT NULL,
  `Edicion` int(11) DEFAULT NULL,
  `idGenero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`idLibro`, `Nombre`, `idEditorial`, `idAutor`, `Edicion`, `idGenero`) VALUES
(1, 'Harry Potter y La Piedra Filosofal', 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `idNivel` int(11) NOT NULL,
  `Nivel` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`idNivel`, `Nivel`) VALUES
(1, 'Preprimaria'),
(2, 'Primaria'),
(3, 'Básico'),
(4, 'Diversificado'),
(5, 'Superior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `idPrestamo` int(11) NOT NULL,
  `idLibro` int(11) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `fecha_dev` date DEFAULT NULL,
  `estado` varchar(25) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`idPrestamo`, `idLibro`, `idEstudiante`, `Fecha`, `fecha_dev`, `estado`) VALUES
(1, 1, 1, '2021-07-08', NULL, 'En Préstamo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idAutor`);

--
-- Indices de la tabla `centro_educativo`
--
ALTER TABLE `centro_educativo`
  ADD PRIMARY KEY (`idCentroEducativo`),
  ADD KEY `idNivel` (`idNivel`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`idEditorial`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`idEstudiante`),
  ADD KEY `idCentroEducativo` (`idCentroEducativo`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idGenero`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`idLibro`),
  ADD KEY `fkEditorial` (`idEditorial`),
  ADD KEY `fkAutor` (`idAutor`),
  ADD KEY `fkGenero` (`idGenero`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`idNivel`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `fkLibro` (`idLibro`),
  ADD KEY `fkEstudiante` (`idEstudiante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `centro_educativo`
--
ALTER TABLE `centro_educativo`
  MODIFY `idCentroEducativo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `idEditorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `idEstudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `idLibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `nivel`
--
ALTER TABLE `nivel`
  MODIFY `idNivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `idPrestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `centro_educativo`
--
ALTER TABLE `centro_educativo`
  ADD CONSTRAINT `centro_educativo_ibfk_1` FOREIGN KEY (`idNivel`) REFERENCES `nivel` (`idNivel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`idCentroEducativo`) REFERENCES `centro_educativo` (`idCentroEducativo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`idEditorial`) REFERENCES `editorial` (`idEditorial`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`idGenero`) REFERENCES `genero` (`idGenero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`idLibro`) REFERENCES `libro` (`idLibro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`idEstudiante`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
