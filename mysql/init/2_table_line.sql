USE webmon;

CREATE TABLE train_lines (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	line_name VARCHAR(255) NOT NULL
		COMMENT 'line name',
	created_at DATE NOT NULL
		COMMENT 'record created date',
	effected_at DATE NOT NULL
		COMMENT 'data effective date',
	line_description TEXT
		COMMENT 'line description'
) COMMENT 'railroad line data';

CREATE TABLE line_tag_names (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	tag_name VARCHAR(255) NOT NULL
		COMMENT 'tag name to be displayed',
	tag_description TEXT
		COMMENT 'tag description'
) COMMENT 'line tag name and descriptions';

CREATE TABLE line_tag_relations (
	tag_id BIGINT UNSIGNED NOT NULL
		COMMENT 'tag id to set to line data',
	train_line_id BIGINT UNSIGNED NOT NULL
		COMMENT 'line id to set the tag',

	PRIMARY KEY (tag_id, train_line_id),

	FOREIGN KEY (tag_id)
		REFERENCES line_tag_names(id)
		ON DELETE CASCADE,
	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
) COMMENT 'relations between line and tag';

CREATE TABLE offices (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	train_line_id BIGINT UNSIGNED NOT NULL
		COMMENT 'line id that has this office',
	office_name VARCHAR(64) NOT NULL
		COMMENT 'name of this office',
	office_description TEXT
		COMMENT 'office description (address, capacity, etc.)',

  UNIQUE(train_line_id, office_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
) COMMENT 'train/work etc. office informations';

CREATE TABLE tracks (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	train_line_id BIGINT UNSIGNED NOT NULL
		COMMENT 'line id that has this track',
	track_name VARCHAR(64) NOT NULL
		COMMENT 'name of this track',
	track_description TEXT
		COMMENT 'track description',

  UNIQUE(train_line_id, track_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
) COMMENT 'track information (between each stations)';

-- region : PERMISSION TABLES

CREATE TABLE perm_read_line (
	train_line_id BIGINT UNSIGNED NOT NULL
		COMMENT 'target line id',
	user_id VARCHAR(128) NOT NULL
		COMMENT 'uid (if empty string, it means anyone can access)',

	PRIMARY KEY (train_line_id, user_id),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE,

	FOREIGN KEY (user_id)
		REFERENCES users(id)
		ON DELETE CASCADE
) COMMENT 'access allow users list';

CREATE TABLE perm_write_line LIKE perm_read_line;

CREATE TABLE perm_password (
	train_line_id BIGINT UNSIGNED NOT NULL
		COMMENT 'target line id',
	pw_hash VARBINARY(64) NOT NULL
		COMMENT 'password hash (expected hash algorithm: SHA512)',
	expires_at DATE NOT NULL CHECK (expires_at > '2020-01-01')
		COMMENT 'expire date of this record',

	allow_read BIT(1) NOT NULL
		COMMENT 'whether allow to READ with this password',
	allow_write BIT(1) NOT NULL
		COMMENT 'whether allow to WRITE with this password',
	created_by VARCHAR(128) NOT NULL
		COMMENT 'creator of this record (only this user can delete this record)',

	PRIMARY KEY (train_line_id, pw_hash, expires_at),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE,

	FOREIGN KEY (created_by)
		REFERENCES users(id)
) COMMENT 'hashed password list for adding new accessible users';
