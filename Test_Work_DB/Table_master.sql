DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	id SERIAL,
    name varchar(255) DEFAULT 'Anonymous',
    surname varchar(255) DEFAULT 'Surname',
    bith_date  datetime DEFAULT NULL,
    sex char,
    salary int UNSIGNED NOT NULL,
    branch_id int UNSIGNED NOT NULL,
    super_id int UNSIGNED NOT NULL,
    PRIMARY KEY(id)
);

CALL `new_schema_01`.`table_copy`();
INSERT INTO employees SELECT * FROM demo PARTITIONS;
SELECT * FROM employees;
SELECT COUNT(*)  FROM employees;