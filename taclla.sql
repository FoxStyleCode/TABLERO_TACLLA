-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-05-2021 a las 20:28:34
-- Versión del servidor: 5.7.24
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taclla`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_aliado` (IN `id_ent` INT, IN `est_codi` VARCHAR(50), IN `codig` VARCHAR(50), IN `punto_contact` VARCHAR(50), IN `piloto` VARCHAR(50), IN `profesional` VARCHAR(50), IN `pais` VARCHAR(50), IN `estado` VARCHAR(50), IN `municipio` VARCHAR(50), IN `coordenadas` VARCHAR(255), IN `dir_pos` VARCHAR(50), IN `nombres` VARCHAR(50), IN `apellidos` VARCHAR(50), IN `telefono` VARCHAR(50), IN `email` VARCHAR(50), IN `empresa` VARCHAR(50))  BEGIN

UPDATE aliados SET estado_codigo = est_codi, codigo = codig, punto_contacto = punto_contact, piloto = piloto, profesional = profesional, pais = pais, estado = estado, municipio = municipio, coordenadas_mapa = coordenadas, dir_postal = dir_pos, nombres = nombres, apellidos = apellidos, telefono = telefono, email = email, empresa_o_comercio = empresa WHERE id = id_ent;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_estado_proyecto` (IN `id_proyecto` INT)  BEGIN


update proyectos set estado=0

where proyectos.id = id_proyecto;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_link` (IN `link` VARCHAR(1000), IN `id_proyecto` INT, IN `id_tarea` INT)  BEGIN


update detalle_de_proyectos set enlace=link

where detalle_de_proyectos.proyecto_id = id_proyecto and 

detalle_de_proyectos.tarea_id=id_tarea;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_proyecto` (IN `ent_id` INT, IN `proyec` VARCHAR(50), IN `fecha` DATE, IN `cli` VARCHAR(50), IN `proyecto` VARCHAR(50), IN `predio` VARCHAR(50), IN `municipio` VARCHAR(50))  BEGIN

UPDATE proyectos SET pryct = proyec, fecha = fecha, cliente = cli, proyecto = proyecto, predio = predio,
municipio = municipio

where id = ent_id;

 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `asignar_tarea` (IN `usu` INT, IN `id_proyecto` INT, IN `id_tarea` INT)  BEGIN


update detalle_de_proyectos set user_id=usu

where detalle_de_proyectos.proyecto_id = id_proyecto and 

detalle_de_proyectos.tarea_id=id_tarea;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_pelotas` (IN `id_proyecto` INT)  BEGIN

UPDATE detalle_de_proyectos 
 
    SET pelota = 0 
    
    WHERE detalle_de_proyectos.proyecto_id = id_proyecto; 
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_proyecto` (IN `parametro` INT)  BEGIN

select * from proyectos where id = parametro;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cambiar_estado` (IN `estado_par` INT, IN `id_proyecto` INT, IN `id_tarea` INT)  BEGIN


update detalle_de_proyectos set estado_id=estado_par

where detalle_de_proyectos.proyecto_id = id_proyecto and 

detalle_de_proyectos.tarea_id=id_tarea;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cambio_de_jugador` (IN `estado_par` INT, IN `id_proyecto` INT, IN `id_tarea` INT, IN `maxi` INT)  BEGIN

IF estado_par = 2 THEN update detalle_de_proyectos set estado_id=estado_par, pelota = 1

where detalle_de_proyectos.proyecto_id = id_proyecto and 

detalle_de_proyectos.tarea_id=id_tarea;

ELSE IF estado_par = 3 and id_tarea = maxi  THEN 

update detalle_de_proyectos set estado_id=estado_par, pelota = 1

where detalle_de_proyectos.proyecto_id = id_proyecto and 

detalle_de_proyectos.tarea_id=id_tarea;

ELSE  update detalle_de_proyectos set estado_id=estado_par, pelota = 1 

where detalle_de_proyectos.proyecto_id = id_proyecto and 

detalle_de_proyectos.tarea_id=id_tarea;

END IF;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_aliado` (IN `id_ent` INT)  BEGIN

DELETE FROM aliados WHERE id = id_ent;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_d_p_a_p` (IN `param_id` INT)  BEGIN

delete from detalle_de_proyectos where proyecto_id = param_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_plantilla` (IN `id_param` INT)  DELETE FROM plantillas WHERE id = id_param$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_p_a_p` (IN `param_id` INT)  BEGIN

delete from proyectos where id = param_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `esta` ()  BEGIN

select distinct p.id, t.nombre, p.pryct, p.fecha, p.cliente, p.proyecto, p.predio, p.municipio, dt.estado_id, p.id, u.name, es.nombre_estado 

from  proyectos as p,tipo_de_proyectos as t, detalle_de_proyectos as dt, users as u, estados as es 

where t.id = p.tipo_de_proyecto_id

and p.id= dt.proyecto_id and pelota=1 and p.estado=1 and dt.user_id=u.id and dt.estado_id=es.id;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_aliados` (IN `est_codi` VARCHAR(255), IN `codig` VARCHAR(255), IN `punto_contact` VARCHAR(255), IN `piloto` VARCHAR(50), IN `profesional` VARCHAR(50), IN `pais` VARCHAR(50), IN `estado` VARCHAR(50), IN `municipio` VARCHAR(50), IN `coordenadas` VARCHAR(255), IN `dir_pos` VARCHAR(50), IN `nombres` VARCHAR(50), IN `apellidos` VARCHAR(50), IN `telefono` VARCHAR(50), IN `email` VARCHAR(50), IN `empresa` VARCHAR(50))  INSERT INTO aliados (estado_codigo, codigo, punto_contacto, piloto, profesional, pais, estado, municipio, coordenadas_mapa, dir_postal, nombres, apellidos, telefono, email, empresa_o_comercio) VALUES (est_codi, codig, punto_contact, piloto, profesional, pais, estado, municipio, coordenadas,dir_pos, nombres, apellidos, telefono, email, empresa)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_log` (IN `usuario` VARCHAR(50), IN `modificacion` VARCHAR(255))  INSERT INTO logs (fecha,hora,usuario,modificacion) 
VALUES (NOW(),NOW(),usuario,modificacion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_plantilla` (IN `entrada1` VARCHAR(10000), IN `entrada2` VARCHAR(10000), IN `entrada3` VARCHAR(10000))  INSERT INTO plantillas (dir,nombre_plantilla,link) 
VALUES (entrada1,entrada2,entrada3)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_tabla_configuracion` (IN `parametro1` BIGINT, IN `parametro2` BIGINT, IN `parametro3` BIGINT, IN `parametro4` BIGINT, IN `parametro5` INT)  INSERT INTO detalle_de_proyectos (proyecto_id,tarea_id,estado_id,user_id,pelota)
VALUES (parametro1,parametro2,parametro3,parametro4,parametro5)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_tarea` (IN `nombre_t` VARCHAR(50), IN `tipo_id` INT)  INSERT INTO tareas (nombre_tarea,tipo_de_proyecto_id) 
VALUES (nombre_t,tipo_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_tarea_area` (IN `nam` VARCHAR(255), IN `ar_id` INT)  INSERT INTO tareas (nombre_tarea, area_id) 
VALUES (nam, ar_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_tipo` (IN `name_t` VARCHAR(50))  INSERT INTO tipo_de_proyectos (nombre) 
VALUES (name_t)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insetar_proyecto` (IN `pryct` VARCHAR(50), IN `fecha` DATE, IN `cliente` VARCHAR(50), IN `proyecto` VARCHAR(50), IN `predio` VARCHAR(50), IN `municipio` VARCHAR(50), IN `tipo_de_proyect_id` BIGINT)  INSERT INTO proyectos (pryct,fecha,cliente,proyecto,predio,municipio,tipo_de_proyecto_id,estado,created_at,updated_at) 
VALUES (pryct,fecha,cliente,proyecto,predio,municipio,tipo_de_proyect_id,1,now(),now())$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_proyectos` ()  BEGIN

select p.id, p.player, p.pryct, p.fecha, p.cliente, p.proyecto, p.predio, p.municipio, t.nombre from proyectos as p

join tipo_de_proyectos as t where t.id = p.tipo_de_proyecto_id AND estado=1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_proyectos_cerrados` ()  BEGIN

select p.id, p.player, p.pryct, p.fecha, p.cliente, p.proyecto, p.predio, p.municipio, t.nombre from proyectos as p

join tipo_de_proyectos as t where t.id = p.tipo_de_proyecto_id AND estado=0;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `max_id_tarea` (IN `id_proyecto` INT)  BEGIN


select max(dt.tarea_id) as maximo from detalle_de_proyectos as dt 

where dt.proyecto_id = id_proyecto;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `notificacion` ()  BEGIN
select count(*) from detalle_de_proyectos as de,


proyectos as pro,
tareas as ta,
estados as es,
users as us

join areas as ar on us.area_id=ar.id
 


where de.proyecto_id=pro.id
AND us.area_id=ar.id
AND de.tarea_id=ta.id
AND de.estado_id= es.id
AND de.user_id=us.id

AND de.user_id=24



AND de.estado_id!=3

ORDER BY ta.id

;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `notificar_usuario` (IN `proyecto_parametro` INT, IN `estado_parametro` INT)  BEGIN

SELECT max(dt.tarea_id) as id_maxima from  detalle_de_proyectos AS dt

JOIN tareas AS t ON dt.tarea_id= t.id

JOIN proyectos AS p ON dt.proyecto_id= p.id

join estados as es on dt.estado_id=es.id

join users as u on dt.user_id = u.id


WHERE p.id = proyecto_parametro and dt.estado_id=estado_parametro;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `notificar_usuario2` (IN `proyecto_id` INT, IN `tarea_id` INT)  BEGIN

SELECT  p.proyecto, t.nombre_tarea, dt.proyecto_id, dt.tarea_id, es.nombre_estado,dt.user_id, u.name from  detalle_de_proyectos AS dt

JOIN tareas AS t ON dt.tarea_id= t.id

JOIN proyectos AS p ON dt.proyecto_id= p.id

join estados as es on dt.estado_id=es.id

join users as u on dt.user_id = u.id


WHERE p.id = proyecto_id  and dt.tarea_id=tarea_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_ultimo_registro` ()  BEGIN

SELECT * FROM proyectos;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prueba` ()  BEGIN


select de.id, p.nombre_proyecto, ta.tarea_id as tarea, es.nombre_estado, u.name as usuario from  detalle_de_proyectos as de

   
 inner join tipo_de_proyecto_tareas as ta on de.tipo_de_proyecto_tarea_id=ta.id
  
 inner join proyectos as p on de.proyecto_id=p.id
 
 inner join users as u on de.user_id=u.id
 
 inner join estados as es on de.estado_id=es.id

 
 where u.id=23; 


 
 

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prueba_4` (IN `para` INT)  BEGIN

IF para=2 THEN  select p.id, p.player, p.pryct, p.fecha, p.cliente, p.proyecto, p.predio, p.municipio, t.nombre , u.name, dt.estado_id

from  proyectos as p,tipo_de_proyectos as t, detalle_de_proyectos as dt, users as u 

where t.id = p.tipo_de_proyecto_id

and p.id= dt.proyecto_id and dt.estado_id=2 and dt.user_id=u.id;

    ELSEIF para=1 THEN select p.id, p.player, p.pryct, p.fecha, p.cliente, p.proyecto, p.predio, p.municipio, t.nombre , u.name, dt.estado_id

from  proyectos as p,tipo_de_proyectos as t, detalle_de_proyectos as dt, users as u 

where t.id = p.tipo_de_proyecto_id

and p.id= dt.proyecto_id and dt.estado_id=1 and dt.user_id=u.id and u.name!='default';

    ELSE IF  para=3 THEN  select p.id, p.player, p.pryct, p.fecha, p.cliente, p.proyecto, p.predio, p.municipio, t.nombre , u.name, dt.estado_id

from  proyectos as p,tipo_de_proyectos as t, detalle_de_proyectos as dt, users as u 

where t.id = p.tipo_de_proyecto_id

and p.id= dt.proyecto_id and dt.estado_id=3 and dt.user_id=u.id;
    
END IF; END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tareas_por_proyecto` (IN `proyecto_id` INT, IN `user_id` INT)  BEGIN
select pro.id as "proyecto_id", ta.id, pro.proyecto, ta.nombre_tarea,ar.nombre_area, de.enlace, es.nombre_estado, es.id as estado_id, us.id as usuario_id, us.name from detalle_de_proyectos as de,


proyectos as pro,
estados as es,
users as us,
tareas as ta

join areas as ar on ta.area_id=ar.id
 


where de.proyecto_id=pro.id
AND de.user_id=us.id
AND de.tarea_id=ta.id
AND de.estado_id= es.id


AND de.proyecto_id=proyecto_id
AND de.user_id=user_id

ORDER BY ta.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tareas_por_proyecto2` (IN `Parametro_id` INT)  BEGIN
select pro.id as "proyecto_id", ta.id, pro.proyecto, ta.nombre_tarea, ar.nombre_area, es.nombre_estado, es.id as estadoid, us.name from detalle_de_proyectos as de,


proyectos as pro,
estados as es,
users as us,
tareas as ta,
areas as ar



where de.proyecto_id=pro.id
AND us.area_id=ar.id
AND de.tarea_id=ta.id
AND de.estado_id= es.id
AND de.user_id=us.id



AND de.proyecto_id=parametro_id

ORDER BY ta.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tareas_por_proyecto3` (IN `parametro` INT)  BEGIN


select pro.id as "proyecto_id", ta.id, pro.proyecto, ta.nombre_tarea, ar.nombre_area, es.nombre_estado, de.enlace, es.id as estado_id, us.id as usuario_id, us.name from detalle_de_proyectos as de,

proyectos as pro,
estados as es,
users as us,
tareas as ta


join areas as ar on ta.area_id=ar.id
join tipo_de_proyectos as ti on ta.tipo_de_proyecto_id=ti.id


where de.proyecto_id=pro.id
AND de.estado_id=es.id
AND de.tarea_id=ta.id
AND de.user_id=us.id
AND de.proyecto_id=parametro

ORDER BY ta.id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tare_a` (IN `parametro_id` INT)  BEGIN

select t.nombre_tarea, a.nombre_area, ti.nombre from tareas as t

join areas as a on t.area_id=a.id
join tipo_de_proyectos as ti on t.tipo_de_proyecto_id=ti.id


where ti.id=parametro_id;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tipos_de_proyectos` ()  BEGIN

select * from tipo_de_proyectos;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_seleccionado` (IN `param` INT)  BEGIN

select t.id, t.nombre from proyectos as p, tipo_de_proyectos as t

where p.tipo_de_proyecto_id = t.id and p.id = param;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `todos_los_enlaces` (IN `proyecto_id` INT)  BEGIN

select de.enlace from detalle_de_proyectos as de

where de.proyecto_id = proyecto_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_aliados` ()  SELECT * FROM aliados$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_areas` ()  BEGIN
select * from areas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_estados_codigo` ()  SELECT * FROM estados_codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_nombre_enlace` (IN `proyecto_id` INT)  BEGIN

select dt.enlace, t.nombre_tarea from detalle_de_proyectos as dt, tareas as t 


where  dt.tarea_id=t.id and  

 dt.proyecto_id = proyecto_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_nombre_tareas` ()  BEGIN

select DISTINCT t.nombre_tarea, t.area_id from tareas as t;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_otros_estados` ()  SELECT * FROM otros_estados$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_plantillas` ()  BEGIN

select * from plantillas;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_tareas` (IN `tipo_id` INT)  BEGIN

select t.id, t.nombre_tarea, t.area_id from tareas as t where t.tipo_de_proyecto_id = tipo_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_tipo` ()  BEGIN

select * from tipo_de_proyectos;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aliados`
--

CREATE TABLE `aliados` (
  `id` int(255) NOT NULL,
  `estado_codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `punto_contacto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `piloto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `profesional` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pais` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `municipio` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `coordenadas_mapa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `dir_postal` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `empresa_o_comercio` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `aliados`
--

INSERT INTO `aliados` (`id`, `estado_codigo`, `codigo`, `punto_contacto`, `piloto`, `profesional`, `pais`, `estado`, `municipio`, `coordenadas_mapa`, `dir_postal`, `nombres`, `apellidos`, `telefono`, `email`, `empresa_o_comercio`) VALUES
(2, 'Asignado', 'H2Y2', 'Si', 'Si', 'Si', 'Cólombia', 'Córdoba', 'Chinú', '8923342 - 4324324', 'calle 20b#2b15', 'ALEJANDRO', 'ALVAREZ', '3235454637', 'alejandro@gmail.com', 'ninguno'),
(3, 'Asignado', 'L8K9', 'Si', 'Si', 'Si', 'Colombia', 'Sucre', 'Galeras', '8923342 - 4324324', 'calle 21 #5', 'Alexander', 'Andrade Mora', '3245768943', 'alex@gmail.com', 'ferrodiario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id`, `nombre_area`, `created_at`, `updated_at`) VALUES
(1, 'comercial', '2020-10-19 03:51:33', '2020-10-19 03:51:34'),
(2, 'administrativa', '2020-10-19 03:51:40', '2020-10-19 03:51:41'),
(3, 'operaciones', '2020-10-19 03:52:04', '2020-10-19 03:52:05'),
(4, 'I+D', '2020-11-10 03:32:10', '2020-11-10 03:32:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_de_proyectos`
--

CREATE TABLE `detalle_de_proyectos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proyecto_id` bigint(20) UNSIGNED NOT NULL,
  `tarea_id` bigint(20) UNSIGNED NOT NULL,
  `estado_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pelota` int(11) DEFAULT NULL,
  `enlace` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_de_proyectos`
--

INSERT INTO `detalle_de_proyectos` (`id`, `proyecto_id`, `tarea_id`, `estado_id`, `user_id`, `pelota`, `enlace`, `created_at`, `updated_at`) VALUES
(299, 60, 65, 3, 26, 0, 'https://www.dropbox.com/home/5_SistemaTP2021/PlantillasParaDescargar/1_PlantillasAreaComercial?preview=MODELO2+++20123101_Cotizacion_Cliente_Proyecto.xlsx', NULL, NULL),
(300, 60, 66, 1, 21, 0, 'https://www.dropbox.com/home/5_SistemaTP2021/PlantillasParaDescargar/1_PlantillasAreaComercial?preview=MODELO2+++20123101_Cotizacion_Cliente_Proyecto.xlsx', NULL, NULL),
(301, 60, 67, 1, 28, 0, NULL, NULL, NULL),
(302, 60, 68, 1, 21, 0, 'https://www.dropbox.com/home/5_SistemaTP2021/PlantillasParaDescargar/1_PlantillasAreaComercial?preview=MODELO2+++20123101_Cotizacion_Cliente_Proyecto.xlsx', NULL, NULL),
(303, 60, 69, 1, 21, 0, NULL, NULL, NULL),
(304, 60, 70, 3, 21, 1, NULL, NULL, NULL),
(305, 60, 71, 1, 30, 0, 'https://www.ubmgozen.lucusvirtual.es:2083/cpsess7447055136/3rdparty/phpMyAdmin/tbl_structure.php?db=rpidppkk_taclla&table=users', NULL, NULL),
(306, 60, 72, 1, 30, 0, NULL, NULL, NULL),
(307, 60, 73, 1, 21, 0, NULL, NULL, NULL),
(308, 60, 74, 1, 30, 0, NULL, NULL, NULL),
(309, 60, 75, 1, 21, 0, NULL, NULL, NULL),
(310, 60, 76, 1, 21, 0, NULL, NULL, NULL),
(311, 60, 77, 1, 21, 0, NULL, NULL, NULL),
(312, 60, 78, 1, 21, 0, NULL, NULL, NULL),
(313, 60, 79, 1, 30, 0, 'https://www.dropbox.com/home/5_SistemaTP2021/PlantillasParaDescargar/1_PlantillasAreaComercial?preview=MODELO2+++20123101_Cotizacion_Cliente_Proyecto.xlsx', NULL, NULL),
(314, 60, 80, 1, 21, 0, NULL, NULL, NULL),
(315, 60, 81, 1, 30, 0, NULL, NULL, NULL),
(421, 67, 1, 3, 26, 0, 'https://www.dropbox.com/home/5_SistemaTP2021/PlantillasParaDescargar/1_PlantillasAreaComercial?preview=MODELO2+++20123101_Cotizacion_Cliente_Proyecto.xlsx', NULL, NULL),
(422, 67, 2, 3, 28, 0, 'link', NULL, NULL),
(423, 67, 3, 3, 28, 0, NULL, NULL, NULL),
(424, 67, 4, 3, 31, 0, NULL, NULL, NULL),
(425, 67, 5, 3, 30, 0, 'https://www.ubmgozen.lucusvirtual.es:2083/cpsess7447055136/3rdparty/phpMyAdmin/tbl_structure.php?db=rpidppkk_taclla&table=users', NULL, NULL),
(426, 67, 6, 3, 30, 0, NULL, NULL, NULL),
(427, 67, 7, 3, 31, 1, 'https://www.dropbox.com/home/5_SistemaTP2021/PlantillasParaDescargar/1_PlantillasAreaComercial?preview=MODELO2+++20123101_Cotizacion_Cliente_Proyecto.xlsx', NULL, NULL),
(428, 67, 8, 1, 30, 0, NULL, NULL, NULL),
(429, 67, 9, 1, 30, 0, NULL, NULL, NULL),
(430, 67, 10, 1, 30, 0, NULL, NULL, NULL),
(431, 67, 11, 1, 30, 0, NULL, NULL, NULL),
(432, 67, 12, 1, 30, 0, NULL, NULL, NULL),
(433, 67, 13, 1, 30, 0, NULL, NULL, NULL),
(434, 67, 14, 1, 30, 0, NULL, NULL, NULL),
(435, 67, 15, 1, 30, 0, NULL, NULL, NULL),
(436, 67, 16, 1, 30, 0, NULL, NULL, NULL),
(437, 67, 17, 1, 30, 0, NULL, NULL, NULL),
(438, 67, 18, 1, 28, 0, NULL, NULL, NULL),
(439, 67, 19, 1, 28, 0, NULL, NULL, NULL),
(440, 67, 20, 1, 26, 0, NULL, NULL, NULL),
(441, 68, 1, 2, 38, 1, NULL, NULL, NULL),
(442, 68, 2, 1, 38, 0, NULL, NULL, NULL),
(443, 68, 3, 1, 28, 0, NULL, NULL, NULL),
(444, 68, 4, 1, 30, 0, NULL, NULL, NULL),
(445, 68, 5, 1, 30, 0, NULL, NULL, NULL),
(446, 68, 6, 1, 30, 0, NULL, NULL, NULL),
(447, 68, 7, 1, 30, 0, NULL, NULL, NULL),
(448, 68, 8, 1, 30, 0, NULL, NULL, NULL),
(449, 68, 9, 1, 30, 0, NULL, NULL, NULL),
(450, 68, 10, 1, 30, 0, NULL, NULL, NULL),
(451, 68, 11, 1, 30, 0, NULL, NULL, NULL),
(452, 68, 12, 1, 30, 0, NULL, NULL, NULL),
(453, 68, 13, 1, 30, 0, NULL, NULL, NULL),
(454, 68, 14, 1, 30, 0, NULL, NULL, NULL),
(455, 68, 15, 1, 30, 0, NULL, NULL, NULL),
(456, 68, 16, 1, 30, 0, NULL, NULL, NULL),
(457, 68, 17, 1, 30, 0, NULL, NULL, NULL),
(458, 68, 18, 1, 28, 0, NULL, NULL, NULL),
(459, 68, 19, 1, 28, 0, NULL, NULL, NULL),
(460, 68, 20, 1, 26, 0, NULL, NULL, NULL),
(461, 69, 1, 3, 26, 0, 'https://www.dropbox.com/s/7e494xzpjm6m8k2/21012001F_COT064_PY163_JuanDiaz_Topografia.pdf?dl=0', NULL, NULL),
(462, 69, 2, 3, 28, 0, NULL, NULL, NULL),
(463, 69, 3, 3, 28, 0, NULL, NULL, NULL),
(464, 69, 4, 3, 21, 0, NULL, NULL, NULL),
(465, 69, 5, 1, 31, 0, NULL, NULL, NULL),
(466, 69, 6, 3, 21, 0, NULL, NULL, NULL),
(467, 69, 7, 3, 33, 0, NULL, NULL, NULL),
(468, 69, 8, 1, 33, 0, NULL, NULL, NULL),
(469, 69, 9, 1, 33, 0, NULL, NULL, NULL),
(470, 69, 10, 3, 33, 1, 'https://www.dropbox.com/sh/h3hdwaa1jipdqfq/AAAcKP_cI9fTTg8mPushxlBda?dl=0', NULL, NULL),
(471, 69, 11, 1, 33, 0, NULL, NULL, NULL),
(472, 69, 12, 3, 34, 0, 'https://drive.google.com/drive/folders/1Vo2K-Y6_7m_2ZvMpyiWCwqXFQEOqzr_q', NULL, NULL),
(473, 69, 13, 3, 34, 0, 'https://drive.google.com/drive/folders/1Vo2K-Y6_7m_2ZvMpyiWCwqXFQEOqzr_q', NULL, NULL),
(474, 69, 14, 3, 21, 0, NULL, NULL, NULL),
(475, 69, 15, 3, 21, 0, NULL, NULL, NULL),
(476, 69, 16, 1, 21, 0, NULL, NULL, NULL),
(477, 69, 17, 3, 21, 0, NULL, NULL, NULL),
(478, 69, 18, 3, 28, 0, NULL, NULL, NULL),
(479, 69, 19, 1, 28, 0, NULL, NULL, NULL),
(480, 69, 20, 1, 26, 0, NULL, NULL, NULL),
(481, 70, 1, 3, 26, 0, 'https://www.dropbox.com/s/902xc8l7y6xm85l/21021901F_COT090_PY170_MateoValencia_Toografia_V2.pdf?dl=0', NULL, NULL),
(482, 70, 2, 3, 28, 0, NULL, NULL, NULL),
(483, 70, 3, 3, 28, 0, 'https://www.dropbox.com/scl/fi/8fzk9q05qvj8svehx6twx/OI170_21021901F_OrdenInterna_MateoValencia_Toografia_V2.xlsx?dl=0&rlkey=82r2lzo6scfdv3peyer1on7lv', NULL, NULL),
(484, 70, 4, 3, 21, 0, 'https://www.dropbox.com/scl/fi/p67lh9qjgruj6vgrrxot8/PO170_21021901F_PlanOperativoV1.2_Levantamiento-topografico-Mateo-Valencia-1.xlsx?dl=0&rlkey=gs4hjjitzs5lqqr75z15ydd4q', NULL, NULL),
(485, 70, 5, 3, 31, 0, 'https://www.dropbox.com/scl/fi/p67lh9qjgruj6vgrrxot8/PO170_21021901F_PlanOperativoV1.2_Levantamiento-topografico-Mateo-Valencia-1.xlsx?dl=0&rlkey=gs4hjjitzs5lqqr75z15ydd4q', NULL, NULL),
(486, 70, 6, 3, 33, 0, 'https://www.dropbox.com/s/jcbw0ur0h8jy14d/210301_CG_PY170_MateoValencia_Panguatian_ViajePalmira.xlsx?dl=0', NULL, NULL),
(487, 70, 7, 3, 33, 0, NULL, NULL, NULL),
(488, 70, 8, 1, 33, 0, NULL, NULL, NULL),
(489, 70, 9, 1, 33, 0, NULL, NULL, NULL),
(490, 70, 10, 2, 31, 0, NULL, NULL, NULL),
(491, 70, 11, 3, 33, 1, NULL, NULL, NULL),
(492, 70, 12, 1, 34, 0, NULL, NULL, NULL),
(493, 70, 13, 1, 34, 0, NULL, NULL, NULL),
(494, 70, 14, 1, 30, 0, NULL, NULL, NULL),
(495, 70, 15, 1, 30, 0, NULL, NULL, NULL),
(496, 70, 16, 1, 31, 0, NULL, NULL, NULL),
(497, 70, 17, 1, 31, 0, NULL, NULL, NULL),
(498, 70, 18, 1, 28, 0, NULL, NULL, NULL),
(499, 70, 19, 1, 28, 0, NULL, NULL, NULL),
(500, 70, 20, 1, 26, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre_estado`, `created_at`, `updated_at`) VALUES
(1, 'programado', '2020-11-13 00:53:01', '2020-11-13 00:53:01'),
(2, 'proceso', '2020-11-13 00:53:00', '2020-11-13 00:53:02'),
(3, 'finalizado', '2020-10-19 22:55:23', '2020-11-13 00:52:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_codigo`
--

CREATE TABLE `estados_codigo` (
  `id` int(255) NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estados_codigo`
--

INSERT INTO `estados_codigo` (`id`, `estado`) VALUES
(1, 'Asignado'),
(2, 'Impreso'),
(3, 'Generado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modificacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `fecha`, `hora`, `usuario`, `modificacion`, `created_at`, `updated_at`) VALUES
(489, '2021-02-23', '21:29:07', 'Ariel', 'Creó un nuevo proyecto llamadoTopografía Juan Diaz', NULL, NULL),
(490, '2021-02-23', '21:29:18', 'Ariel', 'Cerró el proyecto linderos2', NULL, NULL),
(491, '2021-02-23', '21:29:22', 'Ariel', 'Cerró el proyecto Topografía Juan Diaz', NULL, NULL),
(492, '2021-02-23', '21:29:26', 'Ariel', 'Cerró el proyecto bananera2', NULL, NULL),
(493, '2021-02-23', '21:31:28', 'Ariel', 'Actualizó al usuario Frank Peña', NULL, NULL),
(494, '2021-02-23', '21:32:21', 'Frank Peña', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(495, '2021-02-23', '21:34:32', 'Ariel', 'Actualizó al usuario Omaira Ordoñes', NULL, NULL),
(496, '2021-02-23', '21:36:32', 'Omaira Ordoñes', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(497, '2021-02-23', '21:37:15', 'Ariel', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(498, '2021-02-23', '21:42:19', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(499, '2021-02-23', '21:42:36', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(500, '2021-02-23', '21:42:44', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(501, '2021-02-23', '21:42:53', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(502, '2021-02-23', '21:43:01', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(503, '2021-02-23', '21:43:31', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(504, '2021-02-23', '21:44:13', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(505, '2021-02-23', '21:44:21', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(506, '2021-02-23', '21:44:30', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(507, '2021-02-23', '21:44:39', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(508, '2021-02-23', '21:44:45', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(509, '2021-02-23', '21:45:00', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(510, '2021-02-23', '21:45:05', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(511, '2021-02-23', '21:45:11', 'Gerardo González', 'Asignó una nueva tarea', NULL, NULL),
(512, '2021-02-23', '21:45:44', 'Ariel', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(513, '2021-02-23', '22:47:33', 'Ariel', 'Eliminó un usuario llamado Ricardo Amariles', NULL, NULL),
(514, '2021-02-23', '22:48:03', 'Ariel', 'Actualizó al usuario Camilo Gallego', NULL, NULL),
(515, '2021-02-26', '14:42:23', 'Ariel', 'Actualizó al usuario Omaira Ordoñez', NULL, NULL),
(516, '2021-02-26', '14:45:43', 'Ariel', 'Creó un nuevo proyecto llamadoJenifer Panguatian', NULL, NULL),
(517, '2021-02-26', '14:47:57', 'Ariel', 'Actualizó un estado a finalizado Jenifer Panguatian', NULL, NULL),
(518, '2021-02-26', '14:51:42', 'Omaira Ordoñez', 'Actualizó un estado a finalizado Jenifer Panguatian', NULL, NULL),
(519, '2021-02-26', '14:52:30', 'Omaira Ordoñez', 'Actualizó un estado a finalizado Jenifer Panguatian', NULL, NULL),
(520, '2021-02-26', '14:59:12', 'Omaira Ordoñez', 'Actualizó un estado a en proceso Jenifer Panguatian', NULL, NULL),
(521, '2021-02-26', '15:18:53', 'Ariel', 'Actualizó al usuario Gerardo González', NULL, NULL),
(522, '2021-02-26', '15:22:33', 'Ariel', 'Actualizó al usuario Gerardo González', NULL, NULL),
(523, '2021-02-26', '15:30:53', 'Omaira Ordoñez', 'Actualizó un estado a finalizado Jenifer Panguatian', NULL, NULL),
(524, '2021-02-26', '15:36:19', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(525, '2021-02-26', '15:36:44', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(526, '2021-02-26', '15:37:11', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(527, '2021-02-26', '15:37:21', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(528, '2021-02-26', '15:37:32', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(529, '2021-02-26', '15:37:39', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(530, '2021-02-26', '15:38:05', 'Ariel', 'Actualizó un estado a en proceso Jenifer Panguatian', NULL, NULL),
(531, '2021-02-26', '15:38:11', 'Ariel', 'Actualizó un estado a en proceso Jenifer Panguatian', NULL, NULL),
(532, '2021-02-26', '15:38:30', 'Ariel', 'Actualizó un estado a programado en el proyecto Jenifer Panguatian', NULL, NULL),
(533, '2021-02-26', '15:38:38', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(534, '2021-02-26', '15:38:49', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(535, '2021-02-26', '15:38:58', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(536, '2021-02-26', '15:39:10', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(537, '2021-02-26', '15:39:21', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(538, '2021-02-26', '15:42:39', 'Ariel', 'Actualizó un estado a finalizado Jenifer Panguatian', NULL, NULL),
(539, '2021-02-26', '15:47:49', 'Ariel', 'Actualizó un estado a finalizado Jenifer Panguatian', NULL, NULL),
(540, '2021-02-26', '15:51:42', 'Ariel', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(541, '2021-02-26', '15:52:34', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(542, '2021-02-26', '15:53:49', 'Ariel', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(543, '2021-02-26', '15:54:46', 'Ariel', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(544, '2021-02-26', '15:54:58', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(545, '2021-02-26', '15:55:04', 'Ariel', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(546, '2021-02-26', '15:55:32', 'Ariel', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(547, '2021-02-26', '15:55:50', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(548, '2021-02-26', '15:55:58', 'Ariel', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(549, '2021-02-26', '15:58:46', 'Ariel', 'Añadido nuevo tipo de proyecto llamado: Fotogrametria - Solo Drone - Solo GIS', NULL, NULL),
(550, '2021-02-26', '16:01:00', 'Ariel', 'Actualizó al usuario Ariel', NULL, NULL),
(551, '2021-02-26', '17:05:03', 'Omaira Ordoñez', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(552, '2021-03-01', '18:10:56', 'Manuel', 'Añadió un nuevo usuario llamado admin', NULL, NULL),
(553, '2021-03-01', '18:11:28', 'Manuel', 'Creó un nuevo role llamado admin', NULL, NULL),
(554, '2021-03-01', '18:11:42', 'Manuel', 'Actualizó el role llamado ADM', NULL, NULL),
(555, '2021-03-01', '18:12:02', 'Manuel', 'Actualizó al usuario admin', NULL, NULL),
(556, '2021-03-01', '19:34:00', 'admin', 'Actualizó al usuario Ariel', NULL, NULL),
(557, '2021-03-01', '19:37:28', 'Víctor González', 'Actualizó un estado a finalizado Jenifer Panguatian', NULL, NULL),
(558, '2021-03-01', '19:47:35', 'Víctor González', 'Actualizó un estado a finalizado Jenifer Panguatian', NULL, NULL),
(559, '2021-03-01', '19:49:17', 'Víctor González', 'Actualizó un estado a finalizado Jenifer Panguatian', NULL, NULL),
(560, '2021-03-01', '19:56:02', 'Víctor González', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(561, '2021-03-01', '19:59:25', 'Víctor González', 'Actualizó un estado a finalizado Topografía Juan Diaz', NULL, NULL),
(562, '2021-03-01', '20:04:15', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(563, '2021-03-01', '20:28:30', 'Ariel', 'Asignó una nueva tarea', NULL, NULL),
(564, '2021-03-02', '14:13:15', 'admin', 'Añadió un nuevo usuario llamado Johanna Rocio Cárdenas Meneses', NULL, NULL),
(565, '2021-03-02', '14:15:23', 'admin', 'Actualizó el role llamado OPR.OPE', NULL, NULL),
(566, '2021-05-08', '17:27:52', 'Ariel', 'Añadió una nueva plantilla llamada ESTEBAN ENRIQUE BETIN ALVAREZ', NULL, NULL),
(567, '2021-05-08', '17:28:07', 'Ariel', 'Quitó una plantilla llamada ESTEBAN ENRIQUE BETIN ALVAREZ', NULL, NULL),
(568, '2021-05-08', '17:34:07', 'Ariel', 'Actualizó al usuario Frank Peña', NULL, NULL),
(569, '2021-05-08', '17:41:07', 'Ariel', 'Actualizó el role llamado COM.LDR', NULL, NULL),
(570, '2021-05-20', '11:53:10', 'Ariel', 'Añadió una nueva plantilla llamada MARIA BETÍN', NULL, NULL),
(571, '2021-05-20', '11:54:20', 'Ariel', 'Quitó una plantilla llamada MARIA BETÍN', NULL, NULL),
(572, '2021-05-20', '12:01:00', 'Ariel', 'Actualizó el role llamado COM.LDR', NULL, NULL),
(573, '2021-05-20', '12:01:12', 'Ariel', 'Actualizó el role llamado COM.LDR', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2014_10_12_000000_create_users_table', 1),
(17, '2014_10_12_100000_create_password_resets_table', 1),
(18, '2019_08_19_000000_create_failed_jobs_table', 1),
(19, '2020_10_05_193630_create_type_of_projects_table', 1),
(20, '2020_10_06_000623_create_permission_tables', 1),
(34, '2014_09_15_000000_create_areas_table', 2),
(35, '2020_10_15_032813_create_estados_table', 2),
(36, '2020_10_15_033020_create_tareas_table', 2),
(37, '2020_10_15_033043_create_tipo_de_proyectos_table', 2),
(38, '2020_10_15_033110_create_proyectos_table', 2),
(39, '2020_10_15_033141_create_tipo_de_proyecto_tareas_table', 2),
(40, '2020_10_15_033220_create_detalle_de_proyectos_table', 2),
(46, '2014_09_18_174719_create_areas_table', 3),
(47, '2020_10_18_174533_create_estados_table', 3),
(48, '2020_10_18_174747_create_plantillas_table', 3),
(49, '2020_10_18_175011_create_logs_table', 3),
(50, '2020_10_18_175103_create_tipo_de_proyectos_table', 3),
(51, '2020_10_18_175140_create_proyectos_table', 3),
(52, '2020_10_18_175159_create_tareas_table', 3),
(53, '2020_10_18_175231_create_detalle_de_proyectos_table', 3),
(54, '2020_10_27_044513_create_logs_table', 4),
(55, '2020_10_29_021130_create_notifications_table', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(37, 'App\\User', 21),
(39, 'App\\User', 24),
(40, 'App\\User', 26),
(43, 'App\\User', 28),
(45, 'App\\User', 29),
(47, 'App\\User', 30),
(37, 'App\\User', 31),
(47, 'App\\User', 33),
(49, 'App\\User', 34),
(37, 'App\\User', 37),
(51, 'App\\User', 38),
(54, 'App\\User', 40),
(47, 'App\\User', 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('01a8ce0d-cdf4-4c2c-b834-35e31d653f92', 'App\\Notifications\\notificarUsuarios', 'App\\User', 30, '{\"usuario\":\"Gerardo Gonz\\u00e1lez Dice: \",\"detalle\":\"Es tu turno! proyecto : bananera\",\"detalle2\":\"Tarea : plan operativo\",\"time\":\"hace 1 segundo\"}', '2020-11-25 00:23:43', '2020-11-25 00:21:11', '2020-11-25 00:23:43'),
('10bbb9ef-b0ff-475c-84a1-7a9d3fee5230', 'App\\Notifications\\notificarUsuarios', 'App\\User', 30, '{\"usuario\":\"Ariel Dice: \",\"detalle\":\"Es tu turno! proyecto : linderos2\",\"detalle2\":\"Tarea : fecha de campo\",\"time\":\"hace 1 segundo\"}', '2020-11-25 18:54:30', '2020-11-25 18:50:16', '2020-11-25 18:54:30'),
('166f70b6-579f-4a21-93bc-3c1f670c9c7e', 'App\\Notifications\\notificarUsuarios', 'App\\User', 33, '{\"usuario\":\"Ariel Dice: \",\"detalle\":\"Es tu turno! proyecto : Topograf\\u00eda Juan Diaz\",\"detalle2\":\"Tarea : trabajos de campo\",\"time\":\"hace 1 segundo\"}', '2021-03-01 19:52:15', '2021-02-26 15:51:42', '2021-03-01 19:52:15'),
('1ad70ce1-2c21-423f-857a-9fe97ba959cb', 'App\\Notifications\\notificarUsuarios', 'App\\User', 33, '{\"usuario\":\"Ariel Dice: \",\"detalle\":\"Es tu turno! proyecto : Jenifer Panguatian\",\"detalle2\":\"Tarea : control de gastos\",\"time\":\"hace 1 segundo\"}', '2021-03-01 19:52:15', '2021-02-26 15:47:49', '2021-03-01 19:52:15'),
('22f9d9c2-7c5b-483a-99b8-fe013739ca4a', 'App\\Notifications\\notificarUsuarios', 'App\\User', 31, '{\"usuario\":\"Camilo Gallego Dice: \",\"detalle\":\"Es tu turno! proyecto : bananera\",\"detalle2\":\"Tarea : trabajos de campo\",\"time\":\"hace 1 segundo\"}', '2020-11-25 00:25:02', '2020-11-25 00:22:38', '2020-11-25 00:25:02'),
('4dc7c196-6856-49e1-9a60-55578ecf05ea', 'App\\Notifications\\notificarUsuarios', 'App\\User', 30, '{\"usuario\":\"Gerardo Gonz\\u00e1lez Dice: \",\"detalle\":\"Es tu turno! proyecto : bananera\",\"detalle2\":\"Tarea : informe de campo\",\"time\":\"hace 1 segundo\"}', '2020-11-25 00:23:42', '2020-11-25 00:23:12', '2020-11-25 00:23:42'),
('5861dcb9-05fc-4164-ab1e-203c578bf214', 'App\\Notifications\\notificarUsuarios', 'App\\User', 34, '{\"usuario\":\"V\\u00edctor Gonz\\u00e1lez Dice: \",\"detalle\":\"Es tu turno! proyecto : Jenifer Panguatian\",\"detalle2\":\"Tarea : fotogrametria\",\"time\":\"hace 1 segundo\"}', NULL, '2021-03-01 19:49:17', '2021-03-01 19:49:17'),
('64998f7e-697d-4901-a50f-9d209a74a4d2', 'App\\Notifications\\notificarUsuarios', 'App\\User', 31, '{\"usuario\":\"Ariel Dice: \",\"detalle\":\"Es tu turno! proyecto : Jenifer Panguatian\",\"detalle2\":\"Tarea : plan operativo\",\"time\":\"hace 1 segundo\"}', NULL, '2021-02-26 15:42:39', '2021-02-26 15:42:39'),
('c11414c9-224c-440c-a753-74c55add3d72', 'App\\Notifications\\notificarUsuarios', 'App\\User', 31, '{\"usuario\":\"Omaira Ordo\\u00f1ez Dice: \",\"detalle\":\"Es tu turno! proyecto : Jenifer Panguatian\",\"detalle2\":\"Tarea : asignacion lider\",\"time\":\"hace 1 segundo\"}', NULL, '2021-02-26 14:52:30', '2021-02-26 14:52:30'),
('c20126d8-c6a8-4b17-b2b8-a4c9b8a94109', 'App\\Notifications\\notificarUsuarios', 'App\\User', 30, '{\"usuario\":\"Ariel Dice: \",\"detalle\":\"Es tu turno! proyecto : linderos2\",\"detalle2\":\"Tarea : fecha de campo\",\"time\":\"hace 1 segundo\"}', '2020-11-24 09:57:16', '2020-11-24 09:48:27', '2020-11-24 09:57:16'),
('c954e6bf-b172-4913-99e2-7e6a815e633a', 'App\\Notifications\\notificarUsuarios', 'App\\User', 21, '{\"usuario\":\"Camilo Gallego Dice: \",\"detalle\":\"Es tu turno! proyecto : linderos2\",\"detalle2\":\"Tarea : informe de campo\",\"time\":\"hace 1 segundo\"}', '2020-11-24 10:02:41', '2020-11-24 09:49:26', '2020-11-24 10:02:41'),
('cec862a0-0c71-45a0-a927-f83ce73509c8', 'App\\Notifications\\notificarUsuarios', 'App\\User', 28, '{\"usuario\":\"Ariel Dice: \",\"detalle\":\"Es tu turno! proyecto : Topograf\\u00eda Juan Diaz\",\"detalle2\":\"Tarea : fac\",\"time\":\"hace 1 segundo\"}', '2021-02-26 18:47:39', '2021-02-26 15:55:58', '2021-02-26 18:47:39'),
('d6a8c120-4ec0-4a9e-b0f1-98046e9cb0de', 'App\\Notifications\\notificarUsuarios', 'App\\User', 30, '{\"usuario\":\"Ariel Dice: \",\"detalle\":\"Es tu turno! proyecto : Topograf\\u00eda Juan Diaz\",\"detalle2\":\"Tarea : gis\",\"time\":\"hace 1 segundo\"}', NULL, '2021-02-26 15:54:46', '2021-02-26 15:54:46'),
('ea96dcd0-fc93-459e-9213-c7b3beb1301d', 'App\\Notifications\\notificarUsuarios', 'App\\User', 28, '{\"usuario\":\"Ariel Dice: \",\"detalle\":\"Es tu turno! proyecto : Jenifer Panguatian\",\"detalle2\":\"Tarea : anticipo\",\"time\":\"hace 1 segundo\"}', '2021-02-26 14:51:03', '2021-02-26 14:47:57', '2021-02-26 14:51:03'),
('efb5018e-ccd8-45d0-be0e-f58e1fe48d8c', 'App\\Notifications\\notificarUsuarios', 'App\\User', 31, '{\"usuario\":\"Omaira Ordo\\u00f1ez Dice: \",\"detalle\":\"Es tu turno! proyecto : Jenifer Panguatian\",\"detalle2\":\"Tarea : asignacion lider\",\"time\":\"hace 1 segundo\"}', NULL, '2021-02-26 15:30:53', '2021-02-26 15:30:53'),
('f3ff21c9-ccb8-4574-9e2e-15191126c30d', 'App\\Notifications\\notificarUsuarios', 'App\\User', 31, '{\"usuario\":\"Ariel Dice: \",\"detalle\":\"Es tu turno! proyecto : Topograf\\u00eda Juan Diaz\",\"detalle2\":\"Tarea : asignacion lider\",\"time\":\"hace 1 segundo\"}', '2021-02-23 21:39:08', '2021-02-23 21:37:15', '2021-02-23 21:39:08'),
('f533d1ad-78d9-45af-a0ee-39920d025240', 'App\\Notifications\\notificarUsuarios', 'App\\User', 28, '{\"usuario\":\"Frank Pe\\u00f1a Dice: \",\"detalle\":\"Es tu turno! proyecto : Topograf\\u00eda Juan Diaz\",\"detalle2\":\"Tarea : anticipo\",\"time\":\"hace 1 segundo\"}', '2021-02-23 21:36:12', '2021-02-23 21:32:21', '2021-02-23 21:36:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `otros_estados`
--

CREATE TABLE `otros_estados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `otros_estados`
--

INSERT INTO `otros_estados` (`id`, `nombre`) VALUES
(1, 'Si'),
(2, 'No');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(9, 'create permission', 'web', '2020-10-06 06:23:02', '2020-10-06 06:23:02'),
(10, 'read permissions', 'web', '2020-10-06 06:23:02', '2020-10-06 06:23:02'),
(11, 'update permission', 'web', '2020-10-06 06:23:02', '2020-10-06 06:23:02'),
(12, 'delete permission', 'web', '2020-10-06 06:23:02', '2020-10-06 06:23:02'),
(13, 'crear-usuario', 'web', '2020-10-07 21:29:09', '2020-10-07 21:29:09'),
(14, 'leer-usuarios', 'web', '2020-10-07 21:29:33', '2020-10-07 21:29:33'),
(15, 'actualizar-usuario', 'web', '2020-10-07 21:29:48', '2020-10-07 21:29:48'),
(16, 'eliminar-usuario', 'web', '2020-10-07 21:30:00', '2020-10-07 21:30:00'),
(17, 'crear-role', 'web', '2020-10-08 04:03:37', '2020-10-08 04:03:37'),
(18, 'leer-roles', 'web', '2020-10-08 04:03:50', '2020-10-08 04:03:50'),
(19, 'actualizar-role', 'web', '2020-10-08 04:04:03', '2020-10-08 04:04:03'),
(20, 'eliminar-role', 'web', '2020-10-08 04:04:10', '2020-10-08 04:04:10'),
(21, 'crear-proyecto', 'web', '2020-10-10 21:59:39', '2020-10-10 21:59:39'),
(22, 'editar-proyecto', 'web', '2020-10-10 22:01:02', '2020-10-10 22:01:02'),
(23, 'eliminar-proyecto', 'web', '2020-10-10 22:01:44', '2020-10-10 22:01:44'),
(24, 'ver-proyecto', 'web', '2020-10-10 22:01:51', '2020-10-10 22:01:51'),
(25, 'crear-tareas', 'web', '2020-10-11 02:20:08', '2020-10-11 02:20:08'),
(26, 'eliminar-tareas', 'web', '2020-10-11 02:20:36', '2020-10-11 02:20:36'),
(27, 'actualizar-tareas', 'web', '2020-10-11 02:20:45', '2020-10-11 02:20:45'),
(28, 'ver-tareas', 'web', '2020-10-11 02:20:53', '2020-10-11 02:20:53'),
(29, 'ver-log', 'web', '2020-10-11 02:36:22', '2020-10-11 02:36:22'),
(30, 'bajar-formatos', 'web', '2020-10-11 02:37:00', '2020-10-11 02:37:00'),
(31, 'actualizar-estado', 'web', '2020-10-22 23:27:53', '2020-10-22 23:27:53'),
(32, 'crear-tipo-proyecto', 'web', '2020-11-18 03:51:21', '2020-11-18 03:51:21'),
(33, 'agregar-aliado', 'web', NULL, NULL),
(34, 'ver-aliado', 'web', NULL, NULL),
(35, 'editar-aliado', 'web', NULL, NULL),
(36, 'eliminar-aliado', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantillas`
--

CREATE TABLE `plantillas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_plantilla` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `plantillas`
--

INSERT INTO `plantillas` (`id`, `dir`, `nombre_plantilla`, `link`, `created_at`, `updated_at`) VALUES
(3, 'cotizacion.png', 'Plantilla de cotización', 'https://www.dropbox.com/home/5_SistemaTP2021/PlantillasParaDescargar/1_PlantillasAreaComercial?preview=MODELO2+++20123101_Cotizacion_Cliente_Proyecto.xlsx', NULL, NULL),
(5, 'presentacion.png', 'presentacion VV', 'https://www.dropbox.com/home/5_SistemaTP2021/PlantillasParaDescargar/1_PlantillasAreaComercial?preview=200903_Presentaci%C3%B3n_VV.pptx', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `player` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pryct` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `cliente` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proyecto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `predio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_de_proyecto_id` bigint(20) UNSIGNED NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `player`, `pryct`, `fecha`, `cliente`, `proyecto`, `predio`, `municipio`, `tipo_de_proyecto_id`, `estado`, `created_at`, `updated_at`) VALUES
(60, 'Santiago', '600', '2020-10-27', 'José', 'linderos2', 'carbonero', 'chinú', 4, 0, '2020-11-09 15:05:39', '2020-11-09 15:05:39'),
(67, NULL, '277', '2020-11-18', 'José Gonzales', 'bananera2', 'sincelejo', 'coloso', 1, 0, '2020-11-19 01:26:40', '2020-11-19 01:26:40'),
(68, NULL, '123', '2021-02-22', 'prueba', 'fotos', 'xyz', 'Norte de Santander', 1, 0, '2021-02-22 21:05:59', '2021-02-22 21:05:59'),
(69, NULL, 'PY163', '2021-02-01', 'JuanCarlosDias', 'Topografía Juan Diaz', 'El Rubí - El Arenillo', 'Manizales', 1, 1, '2021-02-23 21:29:07', '2021-02-23 21:29:07'),
(70, NULL, 'PY170', '2021-02-24', 'Mateo Valencia', 'Jenifer Panguatian', 'Nombre de la finca', 'Palmira', 1, 1, '2021-02-26 14:45:42', '2021-02-26 14:45:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(37, 'SPR.TMG', 'web', '2020-10-10 22:04:48', '2020-10-10 22:04:48'),
(39, 'editor', 'web', '2020-10-11 02:38:26', '2020-10-11 02:38:26'),
(40, 'COM.LDR', 'web', '2020-11-17 06:16:26', '2020-11-17 06:16:26'),
(41, 'COM.MUL', 'web', '2020-11-17 06:17:03', '2020-11-17 06:17:03'),
(42, 'COM.GER', 'web', '2020-11-17 06:17:28', '2020-11-17 06:17:28'),
(43, 'ADM.LDR', 'web', '2020-11-17 06:17:48', '2020-11-17 06:17:48'),
(44, 'ADM.DOC', 'web', '2020-11-17 06:18:16', '2020-11-17 06:18:16'),
(45, 'ADM.GER', 'web', '2020-11-17 06:18:39', '2020-11-17 06:18:39'),
(46, 'OPR.LDR', 'web', '2020-11-17 06:19:02', '2020-11-17 06:19:02'),
(47, 'OPR.OPE', 'web', '2020-11-17 06:19:27', '2020-11-17 06:19:27'),
(48, 'OPR.GER', 'web', '2020-11-17 06:19:50', '2020-11-17 06:19:50'),
(49, 'I+D.LDR', 'web', '2020-11-17 06:21:28', '2020-11-17 06:21:28'),
(50, 'I+D.DRR', 'web', '2020-11-17 06:21:51', '2020-11-17 06:21:51'),
(51, 'I+D.INV', 'web', '2020-11-17 06:22:38', '2020-11-17 06:22:38'),
(52, 'I+D.GER', 'web', '2020-11-17 06:23:06', '2020-11-17 06:23:06'),
(53, 'SPR.SPR', 'web', '2020-11-17 06:23:37', '2020-11-17 06:23:37'),
(54, 'ADM', 'web', '2021-03-01 18:11:28', '2021-03-01 18:11:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(9, 37),
(10, 37),
(11, 37),
(12, 37),
(13, 37),
(14, 37),
(15, 37),
(16, 37),
(17, 37),
(18, 37),
(19, 37),
(20, 37),
(21, 37),
(22, 37),
(23, 37),
(24, 37),
(25, 37),
(26, 37),
(27, 37),
(28, 37),
(29, 37),
(30, 37),
(31, 37),
(32, 37),
(14, 39),
(18, 39),
(21, 39),
(22, 39),
(23, 39),
(24, 39),
(26, 39),
(28, 39),
(29, 39),
(31, 39),
(21, 40),
(22, 40),
(23, 40),
(24, 40),
(25, 40),
(26, 40),
(27, 40),
(28, 40),
(29, 40),
(30, 40),
(31, 40),
(33, 40),
(34, 40),
(35, 40),
(36, 40),
(21, 41),
(22, 41),
(23, 41),
(24, 41),
(25, 41),
(26, 41),
(27, 41),
(28, 41),
(29, 41),
(30, 41),
(31, 41),
(21, 42),
(22, 42),
(23, 42),
(24, 42),
(25, 42),
(26, 42),
(27, 42),
(28, 42),
(29, 42),
(30, 42),
(31, 42),
(21, 43),
(22, 43),
(23, 43),
(24, 43),
(25, 43),
(26, 43),
(27, 43),
(28, 43),
(29, 43),
(30, 43),
(31, 43),
(32, 43),
(21, 44),
(22, 44),
(23, 44),
(24, 44),
(25, 44),
(26, 44),
(27, 44),
(28, 44),
(29, 44),
(30, 44),
(31, 44),
(32, 44),
(21, 45),
(22, 45),
(23, 45),
(24, 45),
(25, 45),
(26, 45),
(27, 45),
(28, 45),
(29, 45),
(30, 45),
(31, 45),
(32, 45),
(21, 46),
(22, 46),
(23, 46),
(24, 46),
(25, 46),
(26, 46),
(27, 46),
(28, 46),
(29, 46),
(30, 46),
(31, 46),
(22, 47),
(24, 47),
(27, 47),
(28, 47),
(29, 47),
(30, 47),
(31, 47),
(21, 48),
(22, 48),
(23, 48),
(24, 48),
(25, 48),
(26, 48),
(27, 48),
(28, 48),
(29, 48),
(30, 48),
(31, 48),
(21, 49),
(22, 49),
(23, 49),
(24, 49),
(25, 49),
(26, 49),
(27, 49),
(28, 49),
(29, 49),
(30, 49),
(31, 49),
(21, 50),
(22, 50),
(23, 50),
(24, 50),
(25, 50),
(26, 50),
(27, 50),
(28, 50),
(29, 50),
(30, 50),
(31, 50),
(21, 51),
(22, 51),
(23, 51),
(24, 51),
(25, 51),
(26, 51),
(27, 51),
(28, 51),
(29, 51),
(30, 51),
(31, 51),
(21, 52),
(22, 52),
(23, 52),
(24, 52),
(25, 52),
(26, 52),
(27, 52),
(28, 52),
(29, 52),
(30, 52),
(31, 52),
(21, 53),
(22, 53),
(23, 53),
(24, 53),
(25, 53),
(26, 53),
(27, 53),
(28, 53),
(29, 53),
(30, 53),
(31, 53),
(9, 54),
(10, 54),
(11, 54),
(12, 54),
(13, 54),
(14, 54),
(15, 54),
(16, 54),
(17, 54),
(18, 54),
(19, 54),
(20, 54),
(21, 54),
(22, 54),
(23, 54),
(24, 54),
(25, 54),
(26, 54),
(27, 54),
(28, 54),
(29, 54),
(30, 54),
(31, 54),
(32, 54);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_tarea` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_de_proyecto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `nombre_tarea`, `tipo_de_proyecto_id`, `area_id`, `created_at`, `updated_at`) VALUES
(1, 'apertura', 1, 1, NULL, NULL),
(2, 'anticipo', 1, 2, NULL, NULL),
(3, 'oi', 1, 2, NULL, NULL),
(4, 'asignacion lider', 1, 3, NULL, NULL),
(5, 'plan operativo', 1, 3, NULL, NULL),
(6, 'control de gastos', 1, 3, NULL, NULL),
(7, 'trabajos de campo', 1, 3, NULL, NULL),
(8, 'informe de campo', 1, 3, NULL, NULL),
(9, 'backUp datos de campo', 1, 3, NULL, NULL),
(10, 'amarre geodesico', 1, 3, NULL, NULL),
(11, 'transferencia de archivos', 1, 3, NULL, NULL),
(12, 'fotogrametria', 1, 3, NULL, NULL),
(13, 'transf raster', 1, 3, NULL, NULL),
(14, 'gis', 1, 3, NULL, NULL),
(15, 'autocad', 1, 3, NULL, NULL),
(16, 'backUp', 1, 3, NULL, NULL),
(17, 'entrega', 1, 3, NULL, NULL),
(18, 'fac', 1, 2, NULL, NULL),
(19, 'pago', 1, 2, NULL, NULL),
(20, 'cierre', 1, 1, NULL, NULL),
(65, 'apertura', 4, 1, NULL, NULL),
(66, 'anticipo', 4, 2, NULL, NULL),
(67, 'oi', 4, 2, NULL, NULL),
(68, 'asignacion lider', 4, 3, NULL, NULL),
(69, 'plan operativo', 4, 3, NULL, NULL),
(70, 'control de gastos', 4, 3, NULL, NULL),
(71, 'fecha de campo', 4, 3, NULL, NULL),
(72, 'trabajos de campo', 4, 3, NULL, NULL),
(73, 'informe de campo', 4, 3, NULL, NULL),
(74, 'backUp', 4, 3, NULL, NULL),
(75, 'transferencia de archivos', 4, 3, NULL, NULL),
(76, 'montaje', 4, 3, NULL, NULL),
(77, 'upload', 4, 3, NULL, NULL),
(78, 'entrega', 4, 3, NULL, NULL),
(79, 'fac', 4, 2, NULL, NULL),
(80, 'pago', 4, 2, NULL, NULL),
(81, 'cierre', 4, 1, NULL, NULL),
(82, 'prueba1', NULL, 1, NULL, NULL),
(83, 'prueba2', NULL, 4, NULL, NULL),
(84, 'apertura', 5, 1, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(85, 'anticipo', 5, 2, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(86, 'oi', 5, 2, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(87, 'plan operativo', 5, 3, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(88, 'trabajos de campo', 5, 3, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(89, 'informe de campo', 5, 3, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(90, 'control de gastos', 5, 3, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(91, 'transferencia de archivos', 5, 3, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(92, 'backUp datos de campo', 5, 3, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(93, 'fotogrametria', 5, 3, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(94, 'gis', 5, 3, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(95, 'backUp', 5, 3, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(96, 'fac', 5, 2, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(97, 'pago', 5, 2, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(98, 'entrega', 5, 3, '2021-02-26 15:58:46', '2021-02-26 15:58:46'),
(99, 'cierre', 5, 1, '2021-02-26 15:58:46', '2021-02-26 15:58:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_proyectos`
--

CREATE TABLE `tipo_de_proyectos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_de_proyectos`
--

INSERT INTO `tipo_de_proyectos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'fotogrametria', '2020-10-19 15:36:08', '2020-10-19 15:36:09'),
(4, 'Tour Virtual', '2020-11-09 16:33:13', '2020-11-09 16:33:14'),
(5, 'Fotogrametria - Solo Drone - Solo GIS', '2021-02-26 15:58:46', '2021-02-26 15:58:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `estado`, `created_at`, `updated_at`, `area_id`) VALUES
(21, 'Ariel', 'ariel@taclla.com', NULL, '$2y$10$FpdE2l39bysN2VdIAv59AusU4w.pQfcPn9XSGvrzFuOiBWRK.U/nC', 'AfaGGJFFLvN0OZwlIvSTK77kTZZ8JzucvwFFwjP3ETeukm8ANIr9R4Kz2W5m', 1, '2020-10-10 22:15:27', '2020-10-11 03:49:56', 1),
(24, 'ESTEBAN BETÍN', 'estebanbetinalvarez@gmail.com', NULL, '$2y$10$3xjEEIe0jnlu2gmifuooiusOIWlpqgI2OGmOY9SFi6UPN4K/OSBpm', NULL, 1, '2020-10-21 10:24:43', '2020-10-29 11:55:50', 3),
(26, 'Frank Peña', 'comercial@taclla.com', NULL, '$2y$10$c/CO5jRXciebyEOgoV8DTO50MtseulCuqj5yfYT6SeRlvX.oMYRfe', 'CtDCUjixXrg01qp2Ye71l8rMYKasESBqCUlkDif7Y2o6UcvjUifi8hMcgDDU', 1, '2020-11-17 06:24:31', '2021-05-09 03:34:07', 1),
(28, 'Omaira Ordoñez', 'hola@taclla.com', NULL, '$2y$10$I1YRHrO7KPXysyOOYkGDzeKvQ1iO10xs/teFYO7O9Iv1fPBKUAXBi', 'yexLohdnAKyPXi3YBFq7ZQZO1Yekq2LhJPYP6Dq8a14f6NMemMjvpYCdXcQX', 1, '2020-11-17 06:28:58', '2021-02-26 14:42:23', 2),
(29, 'Rubén López', 'rlopez@taclla.com', NULL, '$2y$10$wXIZl3X4QOjQ1hST2GvPJuKoTbfh4gFMe4csSaJvtA9tvEjzIosi6', NULL, 1, '2020-11-17 06:29:49', '2020-11-17 06:29:49', 2),
(30, 'Camilo Gallego', 'camilo@taclla.com', NULL, '$2y$10$Zl0XImmygc2snWOd1NR5ceiecQsI20RBG.gCV08OgULIXiHhNuwYq', NULL, 1, '2020-11-17 06:30:42', '2021-02-23 22:48:03', 3),
(31, 'Gerardo González', 'gerardo.taclla@gmail.com', NULL, '$2y$10$6cwuJalf4VtaG7fR9kXXpOcYYf5g.hBQLrEGdcMs7IWpgoz3pCPwO', NULL, 1, '2020-11-17 06:33:21', '2021-02-26 15:18:53', 3),
(33, 'Víctor González', 'victor@taclla.com', NULL, '$2y$10$/ccgDsgRi550xdjyT84KoeIE1kNKhvDKOcPFB6FF71BuCBugxqzka', NULL, 1, '2020-11-17 06:35:04', '2021-02-23 21:16:42', 3),
(34, 'Ernesto Cuartas', 'ernesto@taclla.com', NULL, '$2y$10$8XOkGoPBasBm8YjcbpBWSet/c/RNls0.aK5snXGp1rlg.qctzXe.m', NULL, 1, '2020-11-17 06:35:47', '2020-11-17 06:35:47', 4),
(37, 'Manuel', 'manuel@taclla.com', NULL, '$2y$10$z1pa3NwBh.mTZG2/eSfFeO5V87e6JbVGbfej8RaA28NgTT4BMOlQS', NULL, 1, '2020-11-17 06:44:49', '2020-11-17 06:44:49', 4),
(38, 'Edgar', 'edgar@taclla.com', NULL, '$2y$10$Bg/TMn1kbljOGQYNwFRURek36H3RClk97MpuFzKs3R9voeMj12uvG', NULL, 1, '2021-02-22 20:37:51', '2021-02-22 20:37:51', 4),
(40, 'admin', 'admin@taclla.com', NULL, '$2y$10$E0vr9j9P8mzSfNIOQc07muoG7DTEZigMNhH6iWBsvhDb5cRmA7mvO', NULL, 1, '2021-03-01 18:10:56', '2021-03-01 18:12:02', 4),
(41, 'Johanna Rocio Cárdenas Meneses', 'jrcardenasmeneses@gmail.com', NULL, '$2y$10$.ztNaYNxbKhBbipjaIYlWekCWz9ZFGamLauLZaju77DBKs7JzYPpa', '0wH8Viw3rW0g5UJkHh6KyFqofUzg6YUXNOKggx3BbPX5WFfmyG8UmGSrDqMv', 1, '2021-03-02 14:13:15', '2021-03-02 14:13:15', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aliados`
--
ALTER TABLE `aliados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_de_proyectos`
--
ALTER TABLE `detalle_de_proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_de_proyectos_proyecto_id_foreign` (`proyecto_id`),
  ADD KEY `detalle_de_proyectos_tarea_id_foreign` (`tarea_id`),
  ADD KEY `detalle_de_proyectos_estado_id_foreign` (`estado_id`),
  ADD KEY `detalle_de_proyectos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados_codigo`
--
ALTER TABLE `estados_codigo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indices de la tabla `otros_estados`
--
ALTER TABLE `otros_estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plantillas`
--
ALTER TABLE `plantillas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proyectos_tipo_de_proyecto_id_foreign` (`tipo_de_proyecto_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tareas_tipo_de_proyecto_id_foreign` (`tipo_de_proyecto_id`),
  ADD KEY `FK_tareas_areas` (`area_id`);

--
-- Indices de la tabla `tipo_de_proyectos`
--
ALTER TABLE `tipo_de_proyectos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `FK_users_areas` (`area_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aliados`
--
ALTER TABLE `aliados`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_de_proyectos`
--
ALTER TABLE `detalle_de_proyectos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estados_codigo`
--
ALTER TABLE `estados_codigo`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `otros_estados`
--
ALTER TABLE `otros_estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `plantillas`
--
ALTER TABLE `plantillas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `tipo_de_proyectos`
--
ALTER TABLE `tipo_de_proyectos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_de_proyectos`
--
ALTER TABLE `detalle_de_proyectos`
  ADD CONSTRAINT `detalle_de_proyectos_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`),
  ADD CONSTRAINT `detalle_de_proyectos_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`),
  ADD CONSTRAINT `detalle_de_proyectos_tarea_id_foreign` FOREIGN KEY (`tarea_id`) REFERENCES `tareas` (`id`),
  ADD CONSTRAINT `detalle_de_proyectos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_tipo_de_proyecto_id_foreign` FOREIGN KEY (`tipo_de_proyecto_id`) REFERENCES `tipo_de_proyectos` (`id`);

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `FK_tareas_areas` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `tareas_tipo_de_proyecto_id_foreign` FOREIGN KEY (`tipo_de_proyecto_id`) REFERENCES `tipo_de_proyectos` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_users_areas` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
