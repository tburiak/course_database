--5. Add trigger that will update column updated_datetime to current date in case of updating any of student.

--source
CREATE OR REPLACE FUNCTION students_stamp() RETURNS trigger AS $students_stamp$
	BEGIN 
		NEW.updated_datetime = now();
		RETURN NEW;
	END;
$students_stamp$ LANGUAGE plpgsql;


CREATE TRIGGER students_stamp BEFORE INSERT OR UPDATE ON students
	FOR EACH ROW  EXECUTE FUNCTION students_stamp()
	
--test
INSERT INTO students ("name", surname, date_of_birth, phone_numbers, primary_skill, created_datetime)
	VALUES('TestName', 'TestSurname', '1999-11-11', '1238889478', 'TestSkill', '2022-01-17 12:17:28.000');
	
SELECT *
FROM students s
WHERE s."name" = 'TestName'