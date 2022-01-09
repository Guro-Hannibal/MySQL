DROP TABLE IF EXISTS demo;
CREATE TABLE demo LIKE employees;
INSERT INTO demo VALUES
		(1, 'Noname',  'Suffering', NOW(), 'F', 5435 , 5345, 34534),
		(2, 'Anon',  'Existence', NOW(), 'F', 5435 , 54353, 435),
		(3, 'ThereIsNothingHere',  'GoForwardBeHappy', NOW(), 'F', 5345 , 34534, 34534),
		(4, 'Empty',  'VeniVidiVici', NOW(), 'F', 1000 , 100, 200),
		(5, 'PainIsMyBestAndClosestFriend',  'Win', NOW(), 'F', 34534 , 34534, 34534);