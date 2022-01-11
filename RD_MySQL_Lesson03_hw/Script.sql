DROP DATABASE IF EXISTS MOREDATA;
CREATE DATABASE MOREDATA;

USE MOREDATA;

CREATE TABLE user (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	sur_name VARCHAR(100) NOT NULL,
	nick_name VARCHAR(100) DEFAULT NULL,
	registration DATETIME DEFAULT CURRENT_TIMESTAMP,
	maybe_friend_friendship_suggestion_id INT UNSIGNED NOT NULL,
	about_user TEXT,
	sex CHAR,
	political_views VARCHAR(255),
	dringking BOOL,
	smoking BOOL,
	four20 BOOL,
	birthday DATETIME,
	country VARCHAR(255),
	city VARCHAR(100),
	online_now BOOL,
	online_time DATETIME DEFAULT CURRENT_TIMESTAMP,
	email VARCHAR(255)
);

CREATE TABLE profiles (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	sur_name VARCHAR(100) NOT NULL,
	nick_name VARCHAR(100) DEFAULT NULL,
	registration DATETIME DEFAULT CURRENT_TIMESTAMP,
	maybe_friend_friendship_suggestion_id INT UNSIGNED NOT NULL,
	about_user TEXT,
	sex CHAR,
	political_views VARCHAR(255),
	drinking BOOL,
	smoking BOOL,
	fortytwo BOOL,
	birthday DATETIME,
	country VARCHAR(255),
	city VARCHAR(100),
	online_now BOOL,
	online_time DATETIME DEFAULT CURRENT_TIMESTAMP,
	email VARCHAR(255)
);


CREATE TABLE friendship (
	initiator_user_id INT UNSIGNED NOT NULL,
	friend_user_id INT UNSIGNED NOT NULL,
	friendship_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( initiator_user_id, friend_user_id)
);


CREATE TABLE friends (
	user_id INT UNSIGNED NOT NULL,
	friend_user_id INT UNSIGNED NOT NULL,
	friendship_initiation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (user_id, friend_user_id)
);

CREATE TABLE potencial_friend (
	friendship_suggestion_user_id INT UNSIGNED NOT NULL,
	friendship_suggestion_friend_id INT UNSIGNED NOT NULL,
	ongoing_request_initiator_user_id BOOL,
	incoming_request_initiator_user_id BOOL,
	friendship_suggestion_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);


CREATE TABLE messages (
	dialog_user_id JSON,
	deleted_dialog_user_id JSON,
	unread_user_id JSON,
	messagekey_user_id INT UNSIGNED NOT NULL PRIMARY KEY
);

CREATE TABLE media (
	video_user_id VARCHAR(255),
	photo_user_id BLOB,
	music_user_id VARCHAR(255),
	mediakey_user_id INT UNSIGNED NOT NULL PRIMARY KEY
);

CREATE TABLE files (
	saved_files_user_id TEXT,
	downloaded_files_user_id TEXT,
	uploaded_files_user_id TEXT,
	notes_user_id TEXT,
	bookmarks_user_id TEXT,
	fileskey_user_id INT UNSIGNED NOT NULL PRIMARY KEY
);



