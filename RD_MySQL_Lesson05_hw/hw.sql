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


-- exercise 3

INSERT INTO homework VALUES (1),(1),(2),(4),(0),(5),(3),(6),(7),(8),(9);


SELECT abc FROM homework ORDER BY abc = 0, abc;




-- exercise 4

-- SELECT * FROM users WHERE birthmonth = 'august';

-- SELECT * FROM users WHERE birthmonth = 'may';


-- exercise 5



-- SELECT * FROM homework WHERE abc IN (5,1,9) ORDER BY prkey IN (prkey,5,1,9);



-- exercise 1

SELECT (SUM(abc))/(SELECT count(abc) FROM homework) FROM homework AS Answer;

-- exercise 2

-- SELECT SUM(abc) FROM homework WHERE day = 'monday', day = 'tuesday', day = 'wednesday', day = 'thursday', day = 'friday', day = 'saturday', day = 'sunday' AS cm, ct, cw, cth, cf, cst, cs;

-- exercise 3

SELECT EXP(SUM(LOG(abc))) FROM homework;


