--run this file with psql -a -f parks.sql

CREATE DATABASE chicago4;
\c chicago4;

CREATE TABLE types(id SERIAL PRIMARY KEY, name VARCHAR(255));
CREATE TABLE parks(id SERIAL PRIMARY KEY, name VARCHAR(255), location VARCHAR(255), sqft INT);
CREATE TABLE member(id SERIAL PRIMARY KEY, name VARCHAR(255), types_id INT references types(id), parks_id INT references parks(id));
CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(255), password_digest VARCHAR(255), token BIGINT);

