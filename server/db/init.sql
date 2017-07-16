-- run as psql -a -f init.sql

CREATE DATABASE apartments;

\c apartments;

CREATE TABLE floors (id SERIAL PRIMARY KEY, number INT, private BOOLEAN);

CREATE TABLE people (id SERIAL PRIMARY KEY, name VARCHAR(255), room_number INT, floor_number INT REFERENCES floors(number));

INSERT INTO floors (number, private) VALUES (11, true);

INSERT INTO floors (number, private) VALUES (21, true);

INSERT INTO floors (number, private) VALUES (47, false);

INSERT INTO people (name, room_number, floor_number) VALUES ('Jones', 1149, 11);

INSERT INTO people (name, room_number, floor_number) VALUES ('Sally', 2130, 21);

INSERT INTO people (name, room_number, floor_number) VALUES ('Randy', 2131, 21);

INSERT INTO people (name, room_number, floor_number) VALUES ('Vincent', 4777, 47);