USE webmon;

CREATE TABLE car_types (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	train_line_id BIGINT UNSIGNED NOT NULL
		COMMENT 'line id that has this car type',
	car_type_name VARCHAR(64) NOT NULL
		COMMENT 'car type name',
	car_length INT NOT NULL
		COMMENT 'car length',

	UNIQUE(train_line_id, car_type_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
) COMMENT 'car types (e.g. Series 0 with 16 car length)';
