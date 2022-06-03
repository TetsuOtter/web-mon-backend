USE webmon;

CREATE TABLE a_works (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	train_line_id BIGINT UNSIGNED NOT NULL,
	work_name VARCHAR(64) NOT NULL,
	car_type_id BIGINT UNSIGNED NOT NULL,

	UNIQUE(train_line_id, work_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE,
	FOREIGN KEY (car_type_id)
		REFERENCES car_types(id)
		ON DELETE CASCADE
);

CREATE TABLE b_works (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	train_line_id BIGINT UNSIGNED NOT NULL,
	work_name VARCHAR(64) NOT NULL,
	is_no_work BIT(1) NOT NULL,

	UNIQUE(train_line_id, work_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
);

CREATE TABLE c_works LIKE b_works;

CREATE TABLE trains (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	train_line_id BIGINT UNSIGNED NOT NULL,
	train_number VARCHAR(64) NOT NULL,
	a_work_id BIGINT	UNSIGNED NOT NULL,
	b_work_id BIGINT	UNSIGNED NOT NULL,
	c_work_id BIGINT	UNSIGNED NOT NULL,

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE,
	FOREIGN KEY (a_work_id)
		REFERENCES a_works(id)
		ON DELETE CASCADE,
	FOREIGN KEY (b_work_id)
		REFERENCES b_works(id)
		ON DELETE CASCADE,
	FOREIGN KEY (c_work_id)
		REFERENCES c_works(id)
		ON DELETE CASCADE
);

CREATE TABLE train_opt_types (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	disp_name VARCHAR(64) NOT NULL UNIQUE,
	opt_description TEXT
);

CREATE TABLE train_opts (
	train_id BIGINT UNSIGNED NOT NULL,
	act_location DOUBLE PRECISION NOT NULL,
	opt_type BIGINT UNSIGNED NOT NULL,
	opt_value VARCHAR(255) NOT NULL,

	PRIMARY KEY (train_id, act_location, opt_type),

	FOREIGN KEY (train_id)
		REFERENCES trains(id)
		ON DELETE CASCADE,
	FOREIGN KEY (opt_type)
		REFERENCES train_opt_types(id)
		ON DELETE CASCADE
);
