--run this with psql -a -f buildings.sql

CREATE DATABASE school;

\c school

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(255), password_digest VARCHAR(255));

CREATE TABLE teachers (id SERIAL PRIMARY KEY, name VARCHAR(255), subject VARCHAR(255), image_url VARCHAR(255));

CREATE TABLE students (id SERIAL PRIMARY KEY, name VARCHAR(255), grade VARCHAR(255), student_num VARCHAR(255));

CREATE TABLE tutelage (id SERIAL PRIMARY KEY, teacher_id INT references teachers(id), student_id INT references students(id));
