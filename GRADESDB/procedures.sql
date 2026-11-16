USE grades;

DELIMITER //

-- Ejemplo 1 (RF02): borra todas las notas del alumno con el DNI indicado
CREATE OR REPLACE PROCEDURE p_delete_student_grades(
    IN p_student_dni CHAR(9)
)
BEGIN
    DECLARE v_student_id INT;

    -- El DNI está en people; el id del alumno es el de la persona (herencia)
    SELECT student_id INTO v_student_id
    FROM people p
    JOIN students s ON s.student_id = p.person_id
    WHERE p.dni = p_student_dni;

    DELETE FROM grades WHERE student_id = v_student_id;
END //

-- Ejemplo 2: borra todos los datos sin borrar las tablas.
-- Primero las tablas que referencian a otras y después las referenciadas
CREATE OR REPLACE PROCEDURE p_delete_all_data()
BEGIN
    DELETE FROM grades;
    DELETE FROM teaching_loads;
    DELETE FROM students_groups;
    DELETE FROM students_subjects;
    DELETE FROM groups;
    DELETE FROM subjects;
    DELETE FROM students;
    DELETE FROM professors;
    DELETE FROM degrees;
    DELETE FROM people;
END //

-- Ejemplo 3: devuelve en p_average la nota media del alumno (NULL si no tiene notas)
CREATE OR REPLACE PROCEDURE p_student_average(
    IN p_student_id INT,
    OUT p_average DECIMAL(4,2)
)
BEGIN
    SELECT AVG(grade_value) INTO p_average
    FROM grades
    WHERE student_id = p_student_id;
END //

DELIMITER ;