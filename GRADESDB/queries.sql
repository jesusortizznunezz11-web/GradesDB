
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


-- 1º consulta

SELECT * 
FROM subjects
;

-- 2º consulta

SELECT * 
FROM subjects s
WHERE s.acronym = 'IISSI-1'
;
-- 3º consulta

SELECT s.subject_name, s.acronym 
FROM subjects s
;
-- 4º consulta
SELECT s.subject_name, s.acronym, s.subject_type
FROM subjects s
WHERE s.subject_type = 'Formación Básica'
;

-- 5º consulta (join)
SELECT p.first_name, p.last_name, st.access_method
FROM students st
JOIN people p ON st.student_id = p.person_id
WHERE st.access_method = 'Selectividad'
;

-- 6º consulta 
SELECT p.first_name, p.last_name, pr.category
FROM professors pr
JOIN people p ON pr.professor_id = p.person_id
WHERE pr.category = 'Catedrático';


-- creacion vistas
CREATE OR REPLACE VIEW v_students AS
SELECT 
    st.student_id,
    st.access_method,
    p.person_id,
    p.dni,
    p.first_name,
    p.last_name,
    p.age,
    p.email
FROM students st
JOIN people p ON st.student_id = p.person_id;grades



CREATE OR REPLACE VIEW v_students AS
SELECT 
    st.student_id,
    st.access_method,
    p.person_id,
    p.dni,
    p.first_name,
    p.last_name,
    p.age,
    p.email
FROM students st
JOIN people p ON st.student_id = p.person_id;


-- 7º consulta 
SELECT AVG(g.grade_value) AS average_grade
FROM grades g
WHERE g.group_id = 1;


-- 8º consulta
SELECT SUM(s.credits) AS total_credits
FROM subjects s 
WHERE s.degree_id = 3;




