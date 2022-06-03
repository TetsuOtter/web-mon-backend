USE webmon;

CREATE TABLE train_lines (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	line_name VARCHAR(255) NOT NULL,
	created_at DATE NOT NULL,
	effected_at DATE NOT NULL,
	line_description TEXT
);

CREATE TABLE line_tag_names (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tag_name VARCHAR(255) NOT NULL,
	tag_description TEXT
);

CREATE TABLE line_tag_relations (
	tag_id BIGINT UNSIGNED NOT NULL,
	train_line_id BIGINT UNSIGNED NOT NULL,

	PRIMARY KEY (tag_id, train_line_id),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
);

CREATE TABLE offices (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	train_line_id BIGINT UNSIGNED NOT NULL,
	office_name VARCHAR(64) NOT NULL,
	office_description TEXT,

  UNIQUE(train_line_id, office_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
);

CREATE TABLE tracks (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	train_line_id BIGINT UNSIGNED NOT NULL,
	track_name VARCHAR(64) NOT NULL,
	track_description TEXT,

  UNIQUE(train_line_id, track_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
);

-- region : PERMISSION TABLES

CREATE TABLE perm_read_line (
	train_line_id BIGINT UNSIGNED NOT NULL,
	user_id VARCHAR(128) NOT NULL,

	PRIMARY KEY (train_line_id, user_id),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE,

	FOREIGN KEY (user_id)
		REFERENCES users(id)
		ON DELETE CASCADE
);

CREATE TABLE perm_write_line (
	train_line_id BIGINT UNSIGNED NOT NULL,
	user_id VARCHAR(128) NOT NULL,

	PRIMARY KEY (train_line_id, user_id),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE,

	FOREIGN KEY (user_id)
		REFERENCES perm_read_line(user_id)
		ON DELETE CASCADE
);

CREATE TABLE perm_password (
	train_line_id BIGINT UNSIGNED NOT NULL,
	pw_hash VARBINARY(64) NOT NULL,
	expires_at DATE NOT NULL CHECK (expires_at > '2020-01-01'),

	allow_read BIT(1) NOT NULL,
	allow_write BIT(1) NOT NULL,
	created_by VARCHAR(128) NOT NULL,

	PRIMARY KEY (train_line_id, pw_hash, expires_at),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE,

	FOREIGN KEY (created_by)
		REFERENCES users(id)
);
