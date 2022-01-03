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
SELECT * FROM users WHERE id=3 AND name='Anon3';
SELECT * FROM users WHERE id=1;
SELECT * FROM users WHERE id=1 AND name='Anon1';
SELECT * FROM users WHERE id=3;
-- mysqldump example > exampledump.sql