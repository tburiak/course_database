-- 8. Create function that will return average mark for input user.

--source
DROP FUNCTION IF EXISTS get_average_mark_for_student;

CREATE OR REPLACE FUNCTION get_average_mark_for_student(input_student_id int)
	RETURNS NUMERIC
	LANGUAGE plpgsql
AS $$
	DECLARE avg_mark_by_student	NUMERIC(3,2);
	BEGIN
		SELECT AVG(mark)
		INTO avg_mark_by_student
		FROM exam_results er
		WHERE er.student_id = input_student_id;
		RETURN avg_mark_by_student;
	END;
$$;

--test
SELECT get_average_mark_for_student(1112);