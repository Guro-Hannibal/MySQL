-- Lesson 5 homework

-- exercise 1-2

DROP TABLE IF EXISTS homework;

CREATE TABLE homework (
	id INT UNSIGNED AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
	created_at VARCHAR(20),
	updated_at VARCHAR(20),
	abc DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO homework(id, created_at, updated_at) VALUES (1, '2017-10-20 08:10:39', '2017-10-20 08:10:39');

SELECT created_at, updated_at, abc FROM homework;

ALTER TABLE homework MODIFY created_at DATETIME;
ALTER TABLE homework MODIFY updated_at DATETIME;

SELECT created_at, updated_at FROM homework;


DROP TABLE IF EXISTS homework;

CREATE TABLE homework (
	abc INT
);



