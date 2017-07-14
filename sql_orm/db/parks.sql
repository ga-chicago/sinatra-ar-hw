--run this file with psql -a -f parks.sql

CREATE DATABASE chicago4;
\c chicago4;

CREATE TABLE types(id SERIAL PRIMARY KEY, name VARCHAR(255));
CREATE TABLE parks(id SERIAL PRIMARY KEY, name VARCHAR(255), location VARCHAR(255), sqft INT, type_id INT references types(id));

