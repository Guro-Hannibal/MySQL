
SELECT COUNT(l.user_id) AS total_likes, p.gender, p.user_id 
FROM likes l 
JOIN profiles p 
ON l.user_id = p.user_id AND gender = 'F' OR gender = 'M'




SELECT count(*) FROM likes WHERE user_id = (SELECT user_id FROM users);

SELECT COUNT(l.user_id) AS given_likes, COUNT(l.target_id) AS getted_likes, u.id 
FROM likes l 
JOIN users u 
ON u.id = l.user_id OR u.id = l.target_id






SELECT m.id , m.created_at, COUNT(l.target_id) AS total_likes
FROM messages m
JOIN likes l 
ON l.target_type =  'messages' ORDER BY m.created_at DESC LIMIT 10;