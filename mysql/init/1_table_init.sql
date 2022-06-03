SET GLOBAL local_infile = 1;
SET GLOBAL character_set_server = 'utf8mb4';
SET GLOBAL character_set_database = 'utf8mb4';

CREATE DATABASE IF NOT EXISTS webmon DEFAULT CHARACTER SET = utf8mb4;

GRANT ALL ON webmon.* TO 'test'@'%';

USE webmon;

CREATE TABLE users (
	id VARCHAR(128) NOT NULL PRIMARY KEY
		COMMENT 'User ID (uid) created by Firebase Authentication'
) COMMENT 'Records User IDs (uid) created by Firebase Authentication';
