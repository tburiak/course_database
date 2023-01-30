-- 10. Create function that will return student at "red zone" (red zone means at least 2 marks <=3)

--source
DROP FUNCTION IF EXISTS get_red_zone_students;

CREATE OR REPLACE FUNCTION get_red_zone_students() RETURNS SETOF students AS 
$BODY$
DECLARE
    student_row students%rowType;
BEGIN
    FOR student_row IN
    ( SELECT *
    FROM students s
    INNER JOIN (
        SELECT e.student_id, count(mark) "red_zone"
		FROM exam_results e
		WHERE mark <= 3 
		GROUP BY e.student_id
		) rzs
	ON s.student_id = rzs.student_id
	WHERE rzs.red_zone >= 2)
    LOOP
	   
	    RETURN NEXT student_row;
    END LOOP;
END;
$BODY$
LANGUAGE plpgsql;

--test
SELECT get_red_zone_students();