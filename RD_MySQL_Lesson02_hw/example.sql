DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
 id smallint unsigned not null,
 name VARCHAR(255) DEFAULT 'username',
 registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
) COMMENT =  'Registred Users';
SHOW tables;
DESCRIBE users;
INSERT INTO users (id, name) VALUES (1, 'Anon1');
INSERT INTO users (id, name) VALUES (2, 'Anon2');
INSERT INTO users (id, name) VALUES (3, 'Anon3');
SELECT * FROM users;
-- mysqldump example > exampledump.sql
