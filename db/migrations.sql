-- psql -a -f migrations.sql

CREATE DATABASE libraries;

\c libraries;

CREATE TABLE libraries (id SERIAL PRIMARY KEY,
name VARCHAR(255), address VARCHAR(255),
image_url VARCHAR(255)
);

CREATE TABLE books (id SERIAL PRIMARY KEY,
title VARCHAR(255), genre VARCHAR(255), pages INT);

CREATE TABLE book_availability (id SERIAL PRIMARY KEY,
library_id INT references libraries(id),
book_id INT references books(id));

CREATE TABLE users (id SERIAL PRIMARY KEY,
username VARCHAR(255),
password_digest VARCHAR(255),
token BIGINT
);