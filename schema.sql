--CREATE DATABASE compare_cares;

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS aged_cares CASCADE;
DROP TABLE IF EXISTS services CASCADE;
DROP TABLE IF EXISTS aged_care_services CASCADE;


ALTER SEQUENCE IF EXISTS users_id_seq RESTART WITH 1;
ALTER SEQUENCE IF EXISTS aged_cares_id_seq RESTART WITH 1;
ALTER SEQUENCE IF EXISTS services_id_seq RESTART WITH 1;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  email VARCHAR(200),
  password_digest VARCHAR(200)
);

CREATE TABLE aged_cares(
  id SERIAL PRIMARY KEY,
  name VARCHAR(200),
  location VARCHAR(200),
  cost FLOAT(2),
  rating INTEGER,
  user_id INTEGER
);

CREATE TABLE services(
  id SERIAL PRIMARY KEY,
  name TEXT
);

INSERT INTO services(name) VALUES ('food');
INSERT INTO services(name) VALUES ('room');
INSERT INTO services(name) VALUES ('physio_therapy');
INSERT INTO services(name) VALUES ('gym');
INSERT INTO services(name) VALUES ('housekeeping');
INSERT INTO services(name) VALUES ('movie_theatre');
INSERT INTO services(name) VALUES ('swimming_pool');
INSERT INTO services(name) VALUES ('outings');
INSERT INTO services(name) VALUES ('bowling');
INSERT INTO services(name) VALUES ('library_internet');


-- bridging table for agedcare and services due to many to many relationship
CREATE TABLE aged_care_services(
  aged_care_id INTEGER,
  service_id INTEGER
);

-- adding constraints to the database
ALTER TABLE aged_care_services
ADD CONSTRAINT aged_care_services_aged_care_id_fkey
FOREIGN KEY (aged_care_id) REFERENCES aged_cares(id);

ALTER TABLE aged_care_services
ADD CONSTRAINT aged_care_services_service_id_fkey
FOREIGN KEY (service_id) REFERENCES services(id);

ALTER TABLE aged_cares
ADD CONSTRAINT aged_care_user_id_fkey
FOREIGN KEY (user_id) REFERENCES users(id);

