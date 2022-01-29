DROP DATABASE IF EXISTS VK;

CREATE DATABASE VK;

USE VK;

-- Таблица справочник городов
CREATE TABLE cities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(130) NOT NULL COMMENT "Название города",
  country_id INT UNSIGNED NOT NULL COMMENT "Ссылка на страну",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Города"; 

-- Выполняем на базе данных VK
-- Таблица справочник стран
CREATE TABLE countries (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(130) NOT NULL UNIQUE COMMENT "Название страны",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили";

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "�?дентификатор строки", 
  first_name VARCHAR(100) NOT NULL COMMENT "�?мя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";  

-- Таблица профилей
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя", 
  gender CHAR(1) NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  city VARCHAR(130) COMMENT "Город проживания",
  country VARCHAR(130) COMMENT "Страна проживания",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили"; 

-- Таблица сообщений
CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "�?дентификатор строки", 
  from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на отправителя сообщения",
  to_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя сообщения",
  body TEXT NOT NULL COMMENT "Текст сообщения",
  is_important BOOLEAN COMMENT "Признак важности",
  is_delivered BOOLEAN COMMENT "Признак доставки",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки"
) COMMENT "Сообщения";

-- Таблица дружбы
CREATE TABLE friendship (
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на инициатора дружеских отношений",
  friend_id INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя приглашения дружить",
  friendship_status_id INT UNSIGNED NOT NULL COMMENT "Ссылка на статус (текущее состояние) отношений",
  confirmed_at DATETIME COMMENT "Время подтверждения приглашения",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",  
  PRIMARY KEY (user_id, friend_id) COMMENT "Составной первичный ключ"
) COMMENT "Таблица дружбы";

-- Таблица статусов дружеских отношений
CREATE TABLE friendship_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "�?дентификатор строки",
  name VARCHAR(240) NOT NULL UNIQUE COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Статусы дружбы";

-- Таблица групп
CREATE TABLE communities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "�?дентификатор сроки",
  name VARCHAR(240) NOT NULL UNIQUE COMMENT "Название группы",
  creator_user_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Группы";

-- Таблица связи пользователей и групп
CREATE TABLE communities_users (
  community_id INT UNSIGNED NOT NULL COMMENT "Ссылка на группу",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (community_id, user_id) COMMENT "Составной первичный ключ"
) COMMENT "Участники групп, связь между пользователями и группами";

-- Таблица медиафайлов
CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "�?дентификатор строки",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя, который загрузил файл",
  filename VARCHAR(255) NOT NULL COMMENT "Путь к файлу",
  size INT NOT NULL COMMENT "Размер файла",
  metadata JSON COMMENT "Метаданные файла",
  media_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип контента",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Медиафайлы";

-- Таблица типов медиафайлов
CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "�?дентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы медиафайлов";

DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  form ENUM('messages', 'users', 'posts', 'media') NOT NULL UNIQUE
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type ENUM('messages', 'users', 'posts', 'media') NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS posts;
CREATE TABLE  posts (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	community_id INT UNSIGNED,
	head VARCHAR(255),
	body TEXT NOT NULL,
	media_id INT UNSIGNED,
	is_public BOOLEAN DEFAULT TRUE,
	is_archived BOOLEAN DEFAULT FALSE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



-- INSERT INTO target_types(form) VALUES 
-- 	('messages'),
-- 	('users'),
-- 	('posts'),
-- 	('media');

INSERT INTO likes
	SELECT
		id,
		FLOOR(1 + (RAND() * 100)),
		FLOOR(1 + (RAND() * 100)),
		(SELECT form FROM target_types ORDER BY RAND() LIMIT 1),
    	CURRENT_TIMESTAMP 
FROM messages;




SELECT count(*) FROM profiles WHERE user_id = (SELECT user_id FROM likes) AND gender = 'F';

SELECT count(*) FROM profiles WHERE user_id = (SELECT user_id FROM likes) AND gender = 'M';

SELECT count(gender) FROM (SELECT * FROM profiles WHERE user_id = (SELECT user_id FROM likes)) AS abc WHERE gender = 'F' OR gender = 'M';





SELECT count(*) FROM likes WHERE user_id = (SELECT user_id FROM users);

SELECT * FROM (SELECT * FROM likes WHERE target_type = 'messages' AND target_id = (SELECT id FROM messages ORDER BY created_at DESC LIMIT 10)) AS msg_likes;



-- SELECT * FROM likes LIMIT 10;

ALTER TABLE profiles ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE messages ADD FOREIGN KEY (from_user_id) REFERENCES users(id);
ALTER TABLE messages ADD FOREIGN KEY (to_user_id) REFERENCES users(id);
ALTER TABLE posts ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE posts ADD FOREIGN KEY (community_id) REFERENCES communities(id);
ALTER TABLE likes ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE cities ADD FOREIGN KEY (country_id) REFERENCES countries(id);
ALTER TABLE media ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE media ADD FOREIGN KEY (media_type_id) REFERENCES media_types(id);
ALTER TABLE communities_users ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE communities_users ADD FOREIGN KEY (community_id) REFERENCES communities(id);
ALTER TABLE friendship ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE friendship ADD FOREIGN KEY (friend_id) REFERENCES users(id);
ALTER TABLE friendship ADD FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id);
ALTER TABLE profiles ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE likes ADD FOREIGN KEY (target_type) REFERENCES target_types(form); -- Not necessory
ALTER TABLE likes ADD FOREIGN KEY (user_id) REFERENCES posts(user_id);
ALTER TABLE posts ADD FOREIGN KEY (community_id) REFERENCES communities_users(community_id);
ALTER TABLE posts ADD FOREIGN KEY (community_id) REFERENCES communities_users(user_id);
ALTER TABLE posts ADD FOREIGN KEY (user_id) REFERENCES friendship (friend_id);
ALTER TABLE messages ADD FOREIGN KEY (from_user_id) REFERENCES friendship (friend_id);
ALTER TABLE messages ADD FOREIGN KEY (to_user_id) REFERENCES friendship (friend_id);
ALTER TABLE posts ADD FOREIGN KEY (user_id) REFERENCES friendship (friend_id);
-- ALTER TABLE likes ADD FOREIGN KEY (user_id) REFERENCES messages(from_user_id);
-- ALTER TABLE likes ADD FOREIGN KEY (user_id) REFERENCES messages(to_user_id);
ALTER TABLE likes ADD FOREIGN KEY (target_id) REFERENCES media(id);
ALTER TABLE likes ADD FOREIGN KEY (user_id) REFERENCES media(user_id);
-- ALTER TABLE likes ADD FOREIGN KEY (target_id) REFERENCES media(id);
ALTER TABLE communities ADD FOREIGN KEY (creator_user_id) REFERENCES users(id);

ALTER TABLE profiles ADD FOREIGN KEY(country) REFERENCES countries(name); -- Можно и по id установить взаимосвязь
-- ALTER TABLE countries ADD FOREIGN KEY (name) REFERENCES countries(id);
-- ALTER TABLE profiles ADD FOREIGN KEY (city) REFERENCES cities(id); "Можно и по id установить взаимосвязь"



-- 
-- 
-- 
-- DESC profiles;
-- DESC cities;
-- 
-- SELECT name FROM countries WHERE city_name = (SELECT city_name FROM cities WHERE city_id = (SELECT city_id FROM profiles WHERE profile_id = 1));