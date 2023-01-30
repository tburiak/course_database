CREATE TABLE "public.students" (
	"student_id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"surname" varchar(50),
	"date_of_birth" DATE NOT NULL,
	"phone_numbers" varchar(50),
	"primary_skill" varchar(50),
	"created_datetime" TIMESTAMP,
	"updated_datetime" TIMESTAMP,
	CONSTRAINT "students_pk" PRIMARY KEY ("student_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.subjects" (
	"subject_id" serial NOT NULL,
	"subject_name" varchar(50) NOT NULL,
	"tutor" char(250) NOT NULL,
	CONSTRAINT "subjects_pk" PRIMARY KEY ("subject_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.exam_results" (
	"exam_results_id" serial NOT NULL,
	"student_id" bigint NOT NULL,
	"subject_id" bigint NOT NULL,
	"mark" int NOT NULL,
	CONSTRAINT "exam_results_pk" PRIMARY KEY ("exam_results_id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "exam_results" ADD CONSTRAINT "exam_results_fk0" FOREIGN KEY ("student_id") REFERENCES "students"("student_id");
ALTER TABLE "exam_results" ADD CONSTRAINT "exam_results_fk1" FOREIGN KEY ("subject_id") REFERENCES "subjects"("subject_id");




