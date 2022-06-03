CREATE DATABASE IF NOT EXISTS webmon;

GRANT ALL ON webmon.* TO 'test'@'%';

SET GLOBAL local_infile = 1;

USE webmon;

CREATE TABLE users (
	id VARCHAR(128) NOT NULL PRIMARY KEY
);
