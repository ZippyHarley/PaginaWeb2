-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2024 a las 04:31:30
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
-- Base de datos: `bdsegunda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `mensaje_id` int(11) NOT NULL,
  `nombre_contacto` varchar(80) NOT NULL,
  `email_contacto` varchar(80) NOT NULL,
  `contenido_mensaje` text NOT NULL,
  `fecha_mensaje` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`mensaje_id`, `nombre_contacto`, `email_contacto`, `contenido_mensaje`, `fecha_mensaje`) VALUES
(1231, 'lorem imput', 'jorge@gmail.com', 'lorem imput imput imputt', '2024-11-12 03:25:11'),
(3333, 'dos', 'a@gmail.com', 'lorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputt', '2024-11-12 03:25:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_menu`
--

CREATE TABLE `opciones_menu` (
  `opcion_id` int(11) NOT NULL,
  `titulo` text NOT NULL,
  `link` text NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opciones_menu`
--

INSERT INTO `opciones_menu` (`opcion_id`, `titulo`, `link`, `estado`) VALUES
(332, 'lorem2', 'lorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputt', 0),
(1212, 'mr lorem', 'lorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputtlorem imput imput imputt', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `pregunta_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `detalle` text NOT NULL,
  `fecha_pregunta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`pregunta_id`, `usuario_id`, `detalle`, `fecha_pregunta`) VALUES
(434, 23123, 'no hay mas preguntas?', '2024-11-12 03:27:14'),
(545, 23424, 'hay preguntas?', '2024-11-12 03:27:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes_sociales`
--

CREATE TABLE `redes_sociales` (
  `red_id` int(11) NOT NULL,
  `icono` varchar(80) NOT NULL,
  `url` text NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `redes_sociales`
--

INSERT INTO `redes_sociales` (`red_id`, `icono`, `url`, `estado`) VALUES
(44, 'lorem imput imput imputt', 'lorem imput imput imputt.com', 0),
(9090, 'lorem imput imput imputtlorem imput imput imputt', 'lorem imput imput imputtlorem imput imput imputtlorem imput imput imputt.com', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido_paterno` text NOT NULL,
  `apellido_materno` text NOT NULL,
  `usu_correo` text NOT NULL,
  `contrasena` text NOT NULL,
  `telefono` text NOT NULL,
  `estado_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`  
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `apellido_paterno`, `apellido_materno`, `email`, `contrasena`, `telefono`, `estado_usuario`) VALUES
(3242, 'carlos ', 'enrique', 'palermo', 'hshs@gmail.com', 'fsdjfhsjkdfh', '2134234', 2),
(123123, 'juan', 'leña', 'piero', 'ko@gmail.com', '7686', '23423423', 423);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`mensaje_id`);

--
-- Indices de la tabla `opciones_menu`
--
ALTER TABLE `opciones_menu`
  ADD PRIMARY KEY (`opcion_id`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`pregunta_id`);

--
-- Indices de la tabla `redes_sociales`
--
ALTER TABLE `redes_sociales`
  ADD PRIMARY KEY (`red_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `mensaje_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3334;

--
-- AUTO_INCREMENT de la tabla `opciones_menu`
--
ALTER TABLE `opciones_menu`
  MODIFY `opcion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1213;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `pregunta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=546;

--
-- AUTO_INCREMENT de la tabla `redes_sociales`
--
ALTER TABLE `redes_sociales`
  MODIFY `red_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9091;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123124;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
