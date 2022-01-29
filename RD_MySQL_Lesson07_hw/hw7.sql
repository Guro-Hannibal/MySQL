
SELECT COUNT(l.user_id) AS total_likes, p.gender, p.user_id 
FROM likes l 
JOIN profiles p 
ON l.user_id = p.user_id AND gender = 'F' OR gender = 'M'




