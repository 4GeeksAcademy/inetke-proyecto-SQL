SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1: ¿Cuáles son las primeras 10 observaciones registradas?;
--SELECT * FROM observations
--LIMIT 10;

-- MISSION 2: Qué identificadores de región (`region_id`) aparecen en los datos?;
--SELECT DISTINCT region_id FROM observations;

-- MISSION 3: ¿Cuántas especies distintas (`species_id`) se han observado?;
-- Combina COUNT con DISTINCT para no contar duplicados;
--SELECT COUNT(DISTINCT species_id) 
--FROM observations;
 
-- MISSION 4: ¿Cuántas observaciones hay para la región con `region_id = 2`?;
-- Aplica una condición con WHERE;
--SELECT region_id FROM observations
--WHERE region_id = 2;

-- MISSION 5: ¿Cuántas observaciones se registraron el día `1998-08-08`?;
--Filtra por fecha exacta usando igualdad;
--SELECT COUNT(observation_date) FROM observations
--WHERE observation_date = '1998-08-08';


-- MISSION 6: ¿Cuál es el `region_id` con más observaciones?;  
--Agrupa por región y cuenta cuántas veces aparece cada una;
--SELECT COUNT(region_id), region_id FROM observations
--GROUP BY region_id
--ORDER BY COUNT(region_id) DESC
--LIMIT 1;

-- MISSION 7: ¿Cuáles son los 5 species_id más frecuentes?;
--Agrupa, ordena por cantidad descendente y limita el resultado;
SELECT COUNT(species_id), species_id FROM observations
GROUP BY species_id
ORDER BY COUNT(species_id) DESC
LIMIT 5;

-- MISSION 8: ¿Qué especies (`species_id`) tienen menos de 5 registros?;  
-- Agrupa por especie y usa HAVING para aplicar una condición;
SELECT COUNT(species_id), species_id FROM observations
GROUP BY species_id
HAVING COUNT(species_id) > 5;

-- MISSION 9: ¿Qué observadores (`observer`) registraron más observaciones?;  
-- Agrupa por el nombre del observador y cuenta los registros;
SELECT COUNT(observer), observer FROM observations
GROUP BY observer;

-- MISSION 10: Muestra el nombre de la región (`regions.name`) para cada observación; 
-- Relaciona `observations` con `regions` usando `region_id`;
SELECT regions.name FROM observations 
INNER JOIN regions ON observations.region_id = regions.id;

-- MISSION 11: Muestra el nombre científico de cada especie registrada (`species.scientific_name`); 
-- Relaciona `observations` con `species` usando `species_id`;
SELECT species.scientific_name FROM observations 
INNER JOIN species ON observations.species_id = species.id;

-- MISSION 12: ¿Cuál es la especie más observada por cada región?; 
-- Agrupa por región y especie, y ordena por cantidad;
SELECT regions.name AS region, species.scientific_name, COUNT(*) AS total 
FROM observations
INNER JOIN species ON observations.species_id = species.id
INNER JOIN regions ON observations.region_id = regions.id
GROUP BY region, species.scientific_name
ORDER BY region, total DESC
LIMIT 2;

-- MISSION 13: Inserta una nueva observación ficticia en la tabla `observations`; 
-- Asegúrate de incluir todos los campos requeridos por el esquema.;
