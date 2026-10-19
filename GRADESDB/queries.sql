
-- Autor: [Jesús Ortiz Núñez]
-- Fecha: Octubre 2026
-- Descripción: Consultas SQL de ejemplo para GradesDB
USE grades;




SELECT *, COUNT(*)
FROM people p
GROUP BY p.age
;


SELECT *
FROM 
		(SELECT *, COUNT(*)
		FROM people p
		GROUP BY p.age
		) p JOIN students st ON p.person_id = st.student_id
		
;

WITH p AS(
		SELECT *, COUNT(*)
		FROM people p
		GROUP BY p.age
		)
SELECT *
FROM P
;
