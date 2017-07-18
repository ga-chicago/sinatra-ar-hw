--run this file with psql -a -f migrations.sql

CREATE DATABASE american_food;

\c american_food;

CREATE TABLE burgers (id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	restaurant VARCHAR(255),
	calories INT);

CREATE TABLE ingredients (id SERIAL PRIMARY KEY, 
	name VARCHAR(255));

CREATE TABLE recipes (id SERIAL PRIMARY KEY, 
	burger_id INT references burgers(id), 
	ingredient_id INT references ingredients(id));

CREATE TABLE users (id SERIAL PRIMARY KEY, 
	username VARCHAR(255), password_digest VARCHAR(255));