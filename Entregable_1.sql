CREATE DATABASE users_database;

\c users_database

CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(15) NOT NULL,
  "age" int NOT NULL,
  "email" varchar(30) NOT NULL,
  "password" varchar(20) NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(10) NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(50) NOT NULL,
  "description" varchar(100) NOT NULL,
  "teacher" varchar(15) NOT NULL
);

CREATE TABLE "enrollments" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" int NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "pivote_courses_categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "category_id" int NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(25) NOT NULL
);

CREATE TABLE "levels" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(15) NOT NULL
);

CREATE TABLE "course_levels" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course_id" int NOT NULL,
  "level_id" int NOT NULL
);

CREATE TABLE "course_videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course_id" int NOT NULL,
  "url" varchar(15) NOT NULL,
  "level_id" int NOT NULL
);

ALTER TABLE "roles" ADD FOREIGN KEY ("id") REFERENCES "users" ("id");

ALTER TABLE "enrollments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "enrollments" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "pivote_courses_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "pivote_courses_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "course_levels" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "course_levels" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

INSERT INTO users (name, age, email, password) VALUES ('Ian', 25, 'ianperez@email.com', 'abc123'), ('Ana', 35, 'anagomez@email.com', '123abc'), 
('Carlos', 40, 'cgarciavargas@email.com', 'p@ssword'), ('Sofia', 20, 'sgonzalez@email.com', '456def'), ('Miguel', 28, 'msanchez@email.com', 'qwerty'), 
('Maria', 30, 'mrodriguez@email.com', '789xyz'), ('Alicia', 27, 'aliciatorres@email.com', 'alicia123'), ('Gabriel', 35, 'gabriel.ramirez@email.com', 'gabrielr123'), ('Roberto', 50, 'robertog@email.com', 'Rob321'), ('Carla', 28, 'carlaperez@email.com', '789GHI');

INSERT INTO roles (name) VALUES ('Student'), ('Teacher'), ('Admin');

INSERT INTO courses (title, description, teacher) VALUES ('Ethical Hacking Course', 'course description', 'Ana'), ('JavaScript', 'course description', 'Gabriel'), 
('Python Programming Course', 'course description', 'Gabriel'), ('Programming Fundamentals', 'course description', 'Gabriel'), 
('Database Course', 'course description', 'Miguel'), ('MongoDB course', 'course description', 'Miguel'), ('Database Course with MySQL', 'course description', 'Miguel'), 
('Network Security Course', 'course description', 'Gabriel'), ('HTML and CSS', 'course description', 'Ana'), ('CompleteWeb Development Course', 'course description', 'Ana'), 
('React course', 'course description', 'Miguel');

INSERT INTO enrollments (user_id, course_id) VALUES (2, 9), (2, 9), (2, 9), (2, 1), (5, 10), (5, 10), (5, 1), (8, 1), (8, 1), (8, 1), (8, 2), (9, 5), (10, 5), (10, 5), (10, 3);

INSERT INTO categories (name) VALUES ('Web development'), ('Programming'), ('Databases'), ('Informatic security');

INSERT INTO pivote_courses_categories (category_id, course_id) VALUES (3, 5), (3, 6), (3, 7), (1, 9), (1, 10), (1, 11), (4, 1), (4, 8), (2, 2), (2, 3), (2, 4);

INSERT INTO levels (name) VALUES ('Beginner'), ('Intermediate'), ('Advanced');

INSERT INTO course_levels (course_id, level_id) VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (3, 3), (4, 1), (5, 1), (5, 2), (6, 1), (6, 2), (6, 3), (7, 1), 
(7, 2), (8, 1), (8, 2), (9, 2), (10, 1), (10, 2), (10, 3), (11, 3);

INSERT INTO course_videos (course_id, url, level_id) VALUES (1, 'video url', 1), (1, 'video url', 2), (1, 'video url', 3), (2, 'video url', 1), (2, 'video url', 2), 
(3, 'video url', 3), (4, 'video url', 1), (5, 'video url', 1), (5, 'video url', 2), (6, 'video url', 1), (6, 'video url', 2), 
(6, 'video url', 3), (7, 'video url', 1), (7, 'video url', 2), (8, 'video url', 1), (8, 'video url', 2), (9, 'video url', 2), 
(10, 'video url', 1), (10, 'video url', 2), (10, 'video url', 3), (11, 'video url', 3);
