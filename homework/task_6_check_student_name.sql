--6.Add validation on DB level that will check username on special characters (reject student name with next characters '@', '#', '$')

--source
ALTER TABLE students
ADD CONSTRAINT name_check
CHECK (
	name NOT LIKE '%@%'
AND name NOT LIKE '%#%'
AND name NOT LIKE '%$%'
);

--test
INSERT INTO students ("name", surname, date_of_birth, phone_numbers, primary_skill, created_datetime)
VALUES('TestName@', 'TestSurname', '1999-11-11', '1238889478', 'TestSkill', '2022-01-17 12:17:28.000');

INSERT INTO students ("name", surname, date_of_birth, phone_numbers, primary_skill, created_datetime)
VALUES('TestName#', 'TestSurname', '1999-11-11', '1238889478', 'TestSkill', '2022-01-17 12:17:28.000');

INSERT INTO students ("name", surname, date_of_birth, phone_numbers, primary_skill, created_datetime)
VALUES('TestName$', 'TestSurname', '1999-11-11', '1238889478', 'TestSkill', '2022-01-17 12:17:28.000');