-- run as psql -a -f init.sql

CREATE DATABASE apt_building;

\c apt_building;

CREATE TABLE floors (id SERIAL PRIMARY KEY, number INT, private BOOLEAN);

CREATE TABLE people (id SERIAL PRIMARY KEY, name VARCHAR(255), room_number INT, floor_id INT REFERENCES floors(id));

INSERT INTO floors (number, private) VALUES (11, true);

INSERT INTO floors (number, private) VALUES (21, true);

INSERT INTO floors (number, private) VALUES (47, false);

INSERT INTO people (name, room_number, floor_id) VALUES ('Jones', 1149, 1);

INSERT INTO people (name, room_number, floor_id) VALUES ('Sally', 2130, 2);

INSERT INTO people (name, room_number, floor_id) VALUES ('Randy', 2131, 2);

INSERT INTO people (name, room_number, floor_id) VALUES ('Vincent', 4777, 3);

CREATE TABLE amenities (id SERIAL PRIMARY KEY, name VARCHAR(255), price MONEY);

INSERT INTO amenities (name, price) VALUES ('Pool', 12.00);

INSERT INTO amenities (name, price) VALUES ('Gym', 23.00);

INSERT INTO amenities (name, price) VALUES ('Yoga', 10.00);

CREATE TABLE signups (id SERIAL PRIMARY KEY, person_id INT REFERENCES people(id), amenity_id INT REFERENCES amenities(id));

INSERT INTO signups (person_id, amenity_id) VALUES (2, 1);

INSERT INTO signups (person_id, amenity_id) VALUES (2, 2);

INSERT INTO signups (person_id, amenity_id) VALUES (2, 3);

INSERT INTO signups (person_id, amenity_id) VALUES (3, 3);

INSERT INTO signups (person_id, amenity_id) VALUES (4, 3);


