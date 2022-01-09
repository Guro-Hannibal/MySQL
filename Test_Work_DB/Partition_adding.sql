CREATE DEFINER=`root`@`localhost` PROCEDURE `demo_add`();
DROP TABLE IF EXISTS demo;
CREATE TABLE demo LIKE employees ();
PARTITION BY RANGE(id) (
		INSERT INTO demo VALUES (1, 'Noname',  'Suffering', NOW(), 'F', 5435 , 5345, 34534),
		INSERT INTO demo VALUES (2, 'Anon',  'Existence', NOW(), 'F', 5435 , 54353, 435),
		INSERT INTO demo VALUES (3, 'ThereIsNothingHere',  'GoForwardBeHappy', NOW(), 'F', 5345 , 34534, 34534),
		INSERT INTO demo VALUES (4, 'Empty',  'VeniVidiVici', NOW(), 'F', 1000 , 100, 200),
		INSERT INTO demo VALUES (5, 'PainIsMyBestAndClosestFriend',  'Win', NOW(), 'F', 34534 , 34534, 34534)
        );
SELECT * FROM values PARTITION;