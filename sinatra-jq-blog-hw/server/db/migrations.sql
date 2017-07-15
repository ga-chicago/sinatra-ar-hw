--run this with psql -a -f buildings.sql

CREATE DATABASE blog;

\c blog

CREATE TABLE posts (id SERIAL PRIMARY KEY, title VARCHAR(255), topic VARCHAR(255), preview VARCHAR(255), minutes_to_read INT);

CREATE TABLE comments (id SERIAL PRIMARY KEY, subject VARCHAR(255), topic VARCHAR(255), author VARCHAR(255),  INT, post INT));
