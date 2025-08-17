-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2025 a las 16:10:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_vacantes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicaciones`
--

CREATE TABLE `aplicaciones` (
  `id_aplicacion` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `id_vacante` int(11) NOT NULL,
  `mensaje` text DEFAULT NULL,
  `fecha_aplicacion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('Pendiente','Revisada','Entrevista','Rechazada','Aceptada') NOT NULL DEFAULT 'Pendiente',
  `cv_enviado` varchar(255) DEFAULT NULL,
  `estado_visto` enum('Pendiente','Revisada','Entrevista','Rechazada','Aceptada') DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aplicaciones`
--

INSERT INTO `aplicaciones` (`id_aplicacion`, `id_postulante`, `id_vacante`, `mensaje`, `fecha_aplicacion`, `estado`, `cv_enviado`, `estado_visto`) VALUES
(1, 2, 10, NULL, '2025-08-16 11:05:33', 'Pendiente', NULL, 'Pendiente'),
(2, 2, 12, NULL, '2025-08-16 13:14:45', 'Aceptada', NULL, 'Aceptada'),
(3, 2, 11, NULL, '2025-08-16 13:44:45', 'Rechazada', NULL, 'Rechazada'),
(4, 2, 11, NULL, '2025-08-16 14:17:52', 'Aceptada', NULL, 'Aceptada'),
(5, 2, 14, '', '2025-08-16 19:28:21', 'Aceptada', NULL, 'Aceptada'),
(7, 1, 15, 'Hola, estoy interesado.', '2025-08-17 06:58:26', 'Pendiente', NULL, 'Pendiente'),
(8, 1, 16, 'Hola, estoy interesado.', '2025-08-17 06:58:26', 'Pendiente', NULL, 'Pendiente'),
(9, 1, 20, 'Hola, estoy interesado.', '2025-08-17 06:58:40', 'Pendiente', NULL, 'Pendiente'),
(10, 1, 19, 'Hola, estoy interesado.', '2025-08-17 06:58:40', 'Pendiente', NULL, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `id_usuario`, `nombre`, `rfc`, `telefono`, `direccion`, `descripcion`) VALUES
(1, 2, 'Empresa Uno', NULL, NULL, NULL, NULL),
(2, 5, 'prueba2', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulantes`
--

CREATE TABLE `postulantes` (
  `id_postulante` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `nivel_estudios` enum('Secundaria','Preparatoria','Licenciatura','Maestría','Doctorado') DEFAULT NULL,
  `experiencia` text DEFAULT NULL,
  `cv_url` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` enum('Masculino','Femenino','Otro','Prefiero no decir') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `postulantes`
--

INSERT INTO `postulantes` (`id_postulante`, `id_usuario`, `nombre`, `telefono`, `direccion`, `nivel_estudios`, `experiencia`, `cv_url`, `fecha_nacimiento`, `genero`) VALUES
(1, 3, 'Postulante Uno', '1234567890', 'Calle Falsa 123', 'Licenciatura', '2 años en desarrollo', 'cv_postulante_uno.pdf', '1998-05-10', ''),
(2, 4, 'prueba1', '8342759563', 'dcfghjkkjhbvc', 'Preparatoria', 'Ninguna', 'ertgyhjkmnbvcdfgh.pdf', '2005-07-19', 'Femenino'),
(3, 6, 'pepe', '1234567890', 'bn', 'Secundaria', 'gdfnx', 'bnednx', '2005-07-19', 'Masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tipo_usuario` enum('postulante','empresa','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `password`, `tipo_usuario`) VALUES
(1, 'juan', '1234', 'postulante'),
(2, 'empresa', '1234', 'empresa'),
(3, 'admin', '1234', 'admin'),
(4, 'prueba1', '1', 'postulante'),
(5, 'prueba2', '2', 'empresa'),
(6, 'pepe', '2', 'postulante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacantes`
--

CREATE TABLE `vacantes` (
  `id_vacante` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `requisitos` text DEFAULT NULL,
  `salario_min` decimal(10,2) DEFAULT NULL,
  `salario_max` decimal(10,2) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `modalidad` enum('Presencial','Remoto','Híbrido') NOT NULL,
  `tipo_contrato` enum('Tiempo completo','Medio tiempo','Freelance','Por proyecto') NOT NULL,
  `fecha_publicacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` enum('Activa','Cerrada','Pausada') NOT NULL DEFAULT 'Activa',
  `area` varchar(50) DEFAULT NULL,
  `experiencia_requerida` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacantes`
--

INSERT INTO `vacantes` (`id_vacante`, `id_empresa`, `titulo`, `descripcion`, `requisitos`, `salario_min`, `salario_max`, `ubicacion`, `modalidad`, `tipo_contrato`, `fecha_publicacion`, `fecha_cierre`, `estado`, `area`, `experiencia_requerida`) VALUES
(10, 1, 'werth', 'dfgh', 'wdefrgth', 1.00, 2.00, 'dfghj', 'Presencial', 'Tiempo completo', '2025-08-16 10:50:57', NULL, 'Activa', NULL, NULL),
(11, 2, 'vbnhmnsckijwmnd', 'fhbnw danxcsa', 'sdhbnf chjdsnx', 1.00, 2.00, 'lrwkdjsnmxkzc', 'Presencial', 'Tiempo completo', '2025-08-16 11:06:03', NULL, 'Activa', NULL, NULL),
(12, 2, 'pruebaaaaaaaaa', 'hjnmd zkjmx,cn skmd', 'kjmendc jkm', 1000.00, 200000.00, 'hjnsedkjxzcm', 'Remoto', 'Freelance', '2025-08-16 13:14:05', NULL, 'Activa', NULL, NULL),
(13, 1, 'jkfnmvck n', 'kdmncxv kmc', 'jkmfs,dvcxklc,jm s', 0.00, 90.00, 'nfmdcvx', 'Presencial', 'Tiempo completo', '2025-08-16 19:18:14', NULL, 'Activa', NULL, NULL),
(14, 2, 'preubaaaaaaaaaaaa', 'jdmsncx ', 'jkmsdnzx ', 1.00, 2.00, 'jnsmcxkm', 'Presencial', 'Freelance', '2025-08-16 19:28:06', NULL, 'Activa', NULL, NULL),
(15, 2, 'Vacante-1916', 'Descripción auto', 'Requisitos auto', 18220.00, 27929.00, 'Remoto', 'Remoto', 'Tiempo completo', '2025-08-17 06:58:26', NULL, 'Activa', NULL, NULL),
(16, 1, 'Vacante-1972', 'Descripción auto', 'Requisitos auto', 19745.00, 34002.00, 'Remoto', 'Remoto', 'Tiempo completo', '2025-08-17 06:58:26', NULL, 'Activa', NULL, NULL),
(17, 2, 'Vacante-7064', 'Descripción auto', 'Requisitos auto', 19675.00, 34646.00, 'Remoto', 'Remoto', 'Tiempo completo', '2025-08-17 06:58:33', NULL, 'Activa', NULL, NULL),
(18, 1, 'Vacante-6967', 'Descripción auto', 'Requisitos auto', 17002.00, 24213.00, 'Remoto', 'Remoto', 'Tiempo completo', '2025-08-17 06:58:33', NULL, 'Activa', NULL, NULL),
(19, 2, 'Vacante-5181', 'Descripción auto', 'Requisitos auto', 14624.00, 27288.00, 'Remoto', 'Remoto', 'Tiempo completo', '2025-08-17 06:58:40', NULL, 'Activa', NULL, NULL),
(20, 1, 'Vacante-2313', 'Descripción auto', 'Requisitos auto', 14894.00, 20094.00, 'Remoto', 'Remoto', 'Tiempo completo', '2025-08-17 06:58:40', NULL, 'Activa', NULL, NULL),
(21, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:32:41', NULL, 'Activa', NULL, NULL),
(22, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:32:41', NULL, 'Activa', NULL, NULL),
(23, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:32:46', NULL, 'Activa', NULL, NULL),
(24, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:32:46', NULL, 'Activa', NULL, NULL),
(25, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:32:51', NULL, 'Activa', NULL, NULL),
(26, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:32:51', NULL, 'Activa', NULL, NULL),
(27, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:32:56', NULL, 'Activa', NULL, NULL),
(28, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:32:56', NULL, 'Activa', NULL, NULL),
(29, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:01', NULL, 'Activa', NULL, NULL),
(30, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:01', NULL, 'Activa', NULL, NULL),
(31, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:06', NULL, 'Activa', NULL, NULL),
(32, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:06', NULL, 'Activa', NULL, NULL),
(33, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:11', NULL, 'Activa', NULL, NULL),
(34, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:11', NULL, 'Activa', NULL, NULL),
(35, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:16', NULL, 'Activa', NULL, NULL),
(36, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:16', NULL, 'Activa', NULL, NULL),
(37, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:21', NULL, 'Activa', NULL, NULL),
(38, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:21', NULL, 'Activa', NULL, NULL),
(39, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:27', NULL, 'Activa', NULL, NULL),
(40, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:27', NULL, 'Activa', NULL, NULL),
(41, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:52', NULL, 'Activa', NULL, NULL),
(42, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:52', NULL, 'Activa', NULL, NULL),
(43, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:58', NULL, 'Activa', NULL, NULL),
(44, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:33:58', NULL, 'Activa', NULL, NULL),
(45, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:34:03', NULL, 'Activa', NULL, NULL),
(46, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:34:03', NULL, 'Activa', NULL, NULL),
(47, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:34:08', NULL, 'Activa', NULL, NULL),
(48, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:34:08', NULL, 'Activa', NULL, NULL),
(49, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:36:52', NULL, 'Activa', NULL, NULL),
(50, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:36:53', NULL, 'Activa', NULL, NULL),
(51, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:36:58', NULL, 'Activa', NULL, NULL),
(52, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:03', NULL, 'Activa', NULL, NULL),
(53, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:08', NULL, 'Activa', NULL, NULL),
(54, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:13', NULL, 'Activa', NULL, NULL),
(55, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:18', NULL, 'Activa', NULL, NULL),
(56, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:23', NULL, 'Activa', NULL, NULL),
(57, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:28', NULL, 'Activa', NULL, NULL),
(58, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:33', NULL, 'Activa', NULL, NULL),
(59, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:38', NULL, 'Activa', NULL, NULL),
(60, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:43', NULL, 'Activa', NULL, NULL),
(61, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:48', NULL, 'Activa', NULL, NULL),
(62, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:53', NULL, 'Activa', NULL, NULL),
(63, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:37:58', NULL, 'Activa', NULL, NULL),
(64, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:04', NULL, 'Activa', NULL, NULL),
(65, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:09', NULL, 'Activa', NULL, NULL),
(66, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:14', NULL, 'Activa', NULL, NULL),
(67, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:19', NULL, 'Activa', NULL, NULL),
(68, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:24', NULL, 'Activa', NULL, NULL),
(69, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:29', NULL, 'Activa', NULL, NULL),
(70, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:34', NULL, 'Activa', NULL, NULL),
(71, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:39', NULL, 'Activa', NULL, NULL),
(72, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:44', NULL, 'Activa', NULL, NULL),
(73, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:49', NULL, 'Activa', NULL, NULL),
(74, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:54', NULL, 'Activa', NULL, NULL),
(75, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:38:59', NULL, 'Activa', NULL, NULL),
(76, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:04', NULL, 'Activa', NULL, NULL),
(77, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:09', NULL, 'Activa', NULL, NULL),
(78, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:14', NULL, 'Activa', NULL, NULL),
(79, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:19', NULL, 'Activa', NULL, NULL),
(80, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:24', NULL, 'Activa', NULL, NULL),
(81, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:29', NULL, 'Activa', NULL, NULL),
(82, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:34', NULL, 'Activa', NULL, NULL),
(83, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:39', NULL, 'Activa', NULL, NULL),
(84, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:44', NULL, 'Activa', NULL, NULL),
(85, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:49', NULL, 'Activa', NULL, NULL),
(86, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:54', NULL, 'Activa', NULL, NULL),
(87, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:39:59', NULL, 'Activa', NULL, NULL),
(88, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:04', NULL, 'Activa', NULL, NULL),
(89, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:09', NULL, 'Activa', NULL, NULL),
(90, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:14', NULL, 'Activa', NULL, NULL),
(91, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:19', NULL, 'Activa', NULL, NULL),
(92, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:24', NULL, 'Activa', NULL, NULL),
(93, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:29', NULL, 'Activa', NULL, NULL),
(94, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:34', NULL, 'Activa', NULL, NULL),
(95, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:39', NULL, 'Activa', NULL, NULL),
(96, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:44', NULL, 'Activa', NULL, NULL),
(97, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:49', NULL, 'Activa', NULL, NULL),
(98, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:54', NULL, 'Activa', NULL, NULL),
(99, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:40:59', NULL, 'Activa', NULL, NULL),
(100, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:04', NULL, 'Activa', NULL, NULL),
(101, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:15', NULL, 'Activa', NULL, NULL),
(102, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:15', NULL, 'Activa', NULL, NULL),
(103, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:21', NULL, 'Activa', NULL, NULL),
(104, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:21', NULL, 'Activa', NULL, NULL),
(105, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:26', NULL, 'Activa', NULL, NULL),
(106, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:26', NULL, 'Activa', NULL, NULL),
(107, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:31', NULL, 'Activa', NULL, NULL),
(108, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:31', NULL, 'Activa', NULL, NULL),
(109, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:36', NULL, 'Activa', NULL, NULL),
(110, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:36', NULL, 'Activa', NULL, NULL),
(111, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:41', NULL, 'Activa', NULL, NULL),
(112, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:41', NULL, 'Activa', NULL, NULL),
(113, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:46', NULL, 'Activa', NULL, NULL),
(114, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:46', NULL, 'Activa', NULL, NULL),
(115, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:51', NULL, 'Activa', NULL, NULL),
(116, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:51', NULL, 'Activa', NULL, NULL),
(117, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:56', NULL, 'Activa', NULL, NULL),
(118, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:41:56', NULL, 'Activa', NULL, NULL),
(119, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:01', NULL, 'Activa', NULL, NULL),
(120, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:01', NULL, 'Activa', NULL, NULL),
(121, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:06', NULL, 'Activa', NULL, NULL),
(122, 2, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-2', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:06', NULL, 'Activa', NULL, NULL),
(123, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:11', NULL, 'Activa', NULL, NULL),
(124, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:16', NULL, 'Activa', NULL, NULL),
(125, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:21', NULL, 'Activa', NULL, NULL),
(126, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:26', NULL, 'Activa', NULL, NULL),
(127, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:31', NULL, 'Activa', NULL, NULL),
(128, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:36', NULL, 'Activa', NULL, NULL),
(129, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:41', NULL, 'Activa', NULL, NULL),
(130, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:46', NULL, 'Activa', NULL, NULL),
(131, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:51', NULL, 'Activa', NULL, NULL),
(132, 1, 'Vacante de prueba', 'Descripción generada por EmpresaWorker-1', NULL, NULL, NULL, NULL, 'Presencial', 'Tiempo completo', '2025-08-17 07:42:56', NULL, 'Activa', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplicaciones`
--
ALTER TABLE `aplicaciones`
  ADD PRIMARY KEY (`id_aplicacion`),
  ADD KEY `id_postulante` (`id_postulante`),
  ADD KEY `id_vacante` (`id_vacante`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`),
  ADD UNIQUE KEY `rfc` (`rfc`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `postulantes`
--
ALTER TABLE `postulantes`
  ADD PRIMARY KEY (`id_postulante`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD PRIMARY KEY (`id_vacante`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicaciones`
--
ALTER TABLE `aplicaciones`
  MODIFY `id_aplicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `postulantes`
--
ALTER TABLE `postulantes`
  MODIFY `id_postulante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  MODIFY `id_vacante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplicaciones`
--
ALTER TABLE `aplicaciones`
  ADD CONSTRAINT `aplicaciones_ibfk_1` FOREIGN KEY (`id_postulante`) REFERENCES `postulantes` (`id_postulante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicaciones_ibfk_2` FOREIGN KEY (`id_vacante`) REFERENCES `vacantes` (`id_vacante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `postulantes`
--
ALTER TABLE `postulantes`
  ADD CONSTRAINT `postulantes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD CONSTRAINT `vacantes_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
