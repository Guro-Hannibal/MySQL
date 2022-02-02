
-- Дополнения к дз 6 урока

-- лишние ключи удалил

SELECT 
	users.id,
	(SELECT COUNT(*) FROM likes WHERE users.id = likes.user_id) AS total_likes,
	(SELECT COUNT(*) FROM messages WHERE users.id = messages.from_user_id) AS total_messages,
	(SELECT COUNT(*) FROM media WHERE users.id = media.user_id) AS total_media,
	(SELECT COUNT(*) FROM posts WHERE users.id = posts.user_id) AS total_posts
FROM users;


-- запрос ниже, лучше
--SELECT 
--	profiles.gender,
--	(SELECT COUNT(likes.id) FROM likes WHERE profiles.gender = 'p') AS F,
--	(SELECT COUNT(likes.id) FROM likes WHERE profiles.gender = 'a') AS M
--FROM profiles
--WHERE profiles.gender = 'p' OR profiles.gender = 'a';

SELECT 
	(SELECT gender FROM profiles WHERE profiles.user_id = likes.user_id) AS gender,
	COUNT(*) AS total
FROM likes
GROUP BY gender
ORDER BY total DESC
LIMIT 25;

--дополнения к 8 уроку

SELECT 
	profiles.gender,
	COUNT(l.id) AS total
	FROM profiles
	JOIN likes l 
	ON profiles.user_id = l.user_id
	GROUP BY gender
	ORDER BY total DESC;


-- результат отличается от предыдущего, надо видимо как-то сравнение по другому написать
SELECT 
	users.id,
	COUNT(mes.from_user_id) AS total_messages,
	COUNT(l.user_id) AS total_likes,
	COUNT(p.user_id) AS total_posts, 
	COUNT(m.user_id) AS total_media
	FROM users
	LEFT JOIN messages mes
	ON mes.from_user_id = users.id 
	LEFT JOIN likes l
	ON l.user_id = users.id
	LEFT JOIN posts p
	ON p.user_id = users.id
	LEFT JOIN media m
	ON users.id = m.user_id
	GROUP BY users.id;
	


SELECT
	m.created_at,
	m.id,
	COUNT(l.id) AS total_likes
	FROM messages m
	JOIN likes l
ON l.target_id = m.id
GROUP BY m.id
ORDER BY m.created_at DESC LIMIT 10;
	


-- hw 7

-- примерно индентичная выборка к упражениям 1-2



SELECT 
	u.id,
	m.id AS media_id,
	m.filename
	FROM users u
	LEFT JOIN media m
	ON m.user_id = u.id
	GROUP BY u.id;




SELECT
  p.id,
  p.name,
  p.price,
  c.name AS catalog
  FROM products AS p
  LEFT JOIN catalogs AS c
  ON p.catalog_id = c.id;


SELECT 
	flights.id,
	department.name,
	destination.name
	FROM flights f
	JOIN cities AS department
	ON f.from = department.label
	JOIN cities AS destination 
	ON f.to = destination.label;