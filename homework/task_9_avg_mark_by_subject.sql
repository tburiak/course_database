-- 9. Create function that will return avarage mark for input subject name.

--source
DROP FUNCTION IF EXISTS get_average_mark_for_subject;

CREATE OR REPLACE FUNCTION get_average_mark_for_subject(input_subject_name text)
	RETURNS NUMERIC
	LANGUAGE plpgsql
AS $$
	DECLARE avg_mark_by_subject	NUMERIC(3,2);
	BEGIN
		SELECT AVG(er.mark)
		INTO avg_mark_by_subject
		FROM subjects s 
		LEFT JOIN exam_results er 
			ON s.subject_id = er.subject_id
		WHERE s.subject_name = input_subject_name;
		RETURN avg_mark_by_subject;
	END;
$$;

--test
SELECT get_average_mark_for_subject('01GQANCW63QH77X37CSS25705R');
