DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
 id SERIAL,
 name VARCHAR(255) DEFAULT 'Anonymous',
 registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
) COMMENT =  'Registred Users';
SHOW tables;
DESCRIBE users;
INSERT INTO users (name) VALUES ('Anon1');
INSERT INTO users (name) VALUES ('Anon2');
INSERT INTO users (name) VALUES ('Anon3');
SELECT * FROM users;
-- mysqldump example > exampledump.sql

