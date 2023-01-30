--7. Create snapshot that will contain next data: student name, student surname, subject name, mark (snapshot means that in case of changing some data in source table – your snapshot should not change)

--source
CREATE MATERIALIZED VIEW students_mview AS
SELECT s.name, s.surname, sub.subject_name, er.mark
FROM students s 
INNER JOIN exam_results er 
	ON s.student_id = er.student_id
INNER JOIN subjects sub 
	ON er.subject_id = sub.subject_id
WITH DATA;
s

DROP MATERIALIZED VIEW students_mview;

--test
INSERT INTO students ("name", surname, date_of_birth, phone_numbers, primary_skill, created_datetime)
VALUES('TestNameMView3', 'TestSurname', '1999-11-11', '1238889478', 'TestSkill', '2022-01-17 12:17:28.000');

INSERT INTO exam_results ("student_id", "subject_id", "mark")
SELECT s.student_id, 1, 12 FROM students s WHERE s."name" = 'TestNameMView3'; 

SELECT *
FROM students s
WHERE s.name = 'TestNameMView3';

SELECT * 
FROM students_mview sv
WHERE sv.name = 'TestNameMView3';

REFRESH MATERIALIZED VIEW students_mview;

SELECT * 
FROM students_mview sv
WHERE sv.name = 'TestNameMView3';

