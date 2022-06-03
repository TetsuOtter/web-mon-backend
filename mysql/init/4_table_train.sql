USE webmon;

CREATE TABLE a_works (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	office_id BIGINT UNSIGNED NOT NULL
		COMMENT 'target office id',
	work_name VARCHAR(64) NOT NULL
		COMMENT 'work name',
	car_type_id BIGINT UNSIGNED NOT NULL
		COMMENT 'car type id that can use to this work',

	UNIQUE(office_id, work_name),

	FOREIGN KEY (office_id)
		REFERENCES offices(id)
		ON DELETE CASCADE,
	FOREIGN KEY (car_type_id)
		REFERENCES car_types(id)
		ON DELETE CASCADE
) COMMENT 'A work (car works)';

CREATE TABLE b_works (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	office_id BIGINT UNSIGNED NOT NULL
		COMMENT 'target office id',
	work_name VARCHAR(64) NOT NULL
		COMMENT 'work name',

	UNIQUE(office_id, work_name),

	FOREIGN KEY (office_id)
		REFERENCES offices(id)
		ON DELETE CASCADE
) COMMENT 'B work (driver works)';

CREATE TABLE c_works LIKE b_works;
ALTER TABLE c_works COMMENT 'C work (conductor works)';
ALTER TABLE c_works ADD FOREIGN KEY (office_id)
		REFERENCES offices(id) ON DELETE CASCADE;


CREATE TABLE trains (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	train_line_id BIGINT UNSIGNED NOT NULL
		COMMENT 'target line id',
	train_number VARCHAR(64) NOT NULL
		COMMENT 'train number (e.g. 9091G)',

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
) COMMENT 'train data';

CREATE TABLE train_opt_types (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	disp_name VARCHAR(64) NOT NULL UNIQUE
		COMMENT 'option name',
	opt_description TEXT
		COMMENT 'option description'
) COMMENT 'option types for train data';

CREATE TABLE train_opts (
	train_id BIGINT UNSIGNED NOT NULL
		COMMENT 'target train id',
	act_location DOUBLE PRECISION NOT NULL
		COMMENT 'location that will be effected this option',
	opt_type BIGINT UNSIGNED NOT NULL
		COMMENT 'option type id',
	opt_value VARCHAR(255) NOT NULL
		COMMENT 'option setting value',

	PRIMARY KEY (train_id, act_location, opt_type),

	FOREIGN KEY (train_id)
		REFERENCES trains(id)
		ON DELETE CASCADE,
	FOREIGN KEY (opt_type)
		REFERENCES train_opt_types(id)
		ON DELETE CASCADE
) COMMENT 'options for train data';
