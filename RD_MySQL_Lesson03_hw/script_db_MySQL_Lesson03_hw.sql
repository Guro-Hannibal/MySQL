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
	fortytwo BOOL,
	birthday VARCHAR(255),
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


CREATE TABLE friends (
	user_id INT UNSIGNED NOT NULL,
	profiles_id INT UNSIGNED NOT NULL INVISIBLE,
	friend_id INT UNSIGNED NOT NULL,
	initiator_user_id INT UNSIGNED NOT NULL,
	friendship_status VARCHAR(100),
	friendship_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(user_id, friend_id)
);


CREATE TABLE friendship (
	user_id INT UNSIGNED NOT NULL,
	profiles_id INT UNSIGNED NOT NULL INVISIBLE,
	friend_id INT UNSIGNED NOT NULL,
	ongoingrequest_user_id INT UNSIGNED NOT NULL,
	incomingrequest_user_id INT UNSIGNED NOT NULL,
	friendssuggestion_id INT UNSIGNED NOT NULL,
	PRIMARY KEY (user_id, friend_id)
);


CREATE TABLE dialog (
	dialog_id INT UNSIGNED NOT NULL,
	deleted_id TEXT,
	unread_id TEXT,
	user_id INT UNSIGNED NOT NULL UNIQUE,
	profiles_id INT UNSIGNED NOT NULL UNIQUE INVISIBLE,
	PRIMARY KEY (user_id, dialog_id)
);


CREATE TABLE media (
	id INT UNSIGNED NOT NULL,
	video_user_id VARCHAR(255),
	photo_user_id BLOB,
	music_user_id VARCHAR(255),
	user_id INT UNSIGNED NOT NULL UNIQUE,
	profiles_id INT UNSIGNED NOT NULL UNIQUE INVISIBLE,
	PRIMARY KEY(user_id, id)
);

CREATE TABLE blogPage (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(100),
	readers_amount INT UNSIGNED,
	posts_amount INT UNSIGNED,
	welcome_post TEXT,
	priority_post TEXT
);

CREATE TABLE blogPost (
	body TEXT,
	post_created DATETIME DEFAULT CURRENT_TIMESTAMP,
	post_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
	blogPage_id INT UNSIGNED NOT NULL,
	blogPost_id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
);

CREATE TABLE commun (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(100),
	member_amount INT UNSIGNED,
	welcome_post TEXT,
	priority_post TEXT,
	private BOOL,
	incoming_request INT UNSIGNED NOT NULL
);

CREATE TABLE communMember (
	user_id INT UNSIGNED NOT NULL,
	commun_id INT UNSIGNED NOT NULL,
	joined DATETIME DEFAULT CURRENT_TIMESTAMP,
	member_status INT UNSIGNED NOT NULL,
	member_power BOOL,
	PRIMARY KEY (user_id, commun_id )


CREATE TABLE files (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	saved_files_user_id TEXT,
	downloaded_files_user_id TEXT,
	uploaded_files_user_id TEXT,
	notes_user_id TEXT,
	bookmarks_user_id TEXT,
	user_id INT UNSIGNED NOT NULL UNIQUE,
	profiles_id INT UNSIGNED NOT NULL UNIQUE INVISIBLE,
	PRIMARY KEY(id, user_id)
);



SELECT * FROM files