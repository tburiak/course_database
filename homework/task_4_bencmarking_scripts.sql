--DROP INDEXes
DROP INDEX name_idx;

DROP INDEX surname_idx;

DROP INDEX phONe_numbers_idx;

DROP INDEX student_id_idx;

-- B-Tree INDEX
CREATE INDEX name_idx ON
students (name);

CREATE INDEX surname_idx ON
students (surname);

CREATE INDEX phONe_numbers_idx ON
students (phONe_numbers);

CREATE INDEX student_id_idx ON
exam_results (student_id);

-- HASH INDEX
CREATE INDEX name_idx ON
students
USING hash (name);

CREATE INDEX surname_idx ON
students
USING hash (surname);

CREATE INDEX phONe_numbers_idx ON
students
USING hash (phONe_numbers);

CREATE INDEX student_id_idx ON
exam_results
USING hash (student_id);

-- install pg_tgrm
CREATE extensiON pg_trgm;

CREATE extensiON btree_gin;

CREATE extensiON btree_gist;

SELECT
*
FROM
pg_extensiON;

-- GIN INDEX
CREATE INDEX name_idx ON
students
USING gin(name);

CREATE INDEX surname_idx ON
students
USING gin (surname);

CREATE INDEX phONe_numbers_idx ON
students
USING gin (phONe_numbers);

CREATE INDEX student_id_idx ON
exam_results
USING gin (student_id);

-- GIST INDEX
CREATE INDEX name_idx ON
students
USING gist (name);

CREATE INDEX surname_idx ON
students
USING gist (surname);

CREATE INDEX phONe_numbers_idx ON
students
USING gist (phONe_numbers);

CREATE INDEX student_id_idx ON
exam_results
USING gist (student_id);

-- INDEX size
SELECT
pg_size_pretty (pg_INDEXes_size('students'));

SELECT
pg_size_pretty (pg_INDEXes_size('subjects'));

SELECT
pg_size_pretty (pg_INDEXes_size('exam_results'));

--a. Find user by name (exact match)

EXPLAIN ANALYSE
SELECT
*
FROM
students s
WHERE
s."name" = 'Denise'

--b. Find user by surname (partial match)

EXPLAIN ANALYSE
SELECT
*
FROM
students s
WHERE
s.surname LIKE 'Den%'

--c. Find user by phONe number (partial match)

EXPLAIN ANALYSE
SELECT
*
FROM
students s
WHERE
s.phONe_numbers LIKE '381%'

--d. Find user with marks by user surname (partial match)

EXPLAIN ANALYSE
SELECT
*
FROM
students s
INNER JOIN exam_results er ON
s.student_id = er.student_id
WHERE
s."name" LIKE 'Madel%'