USE webmon;

CREATE TABLE car_types (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	train_line_id BIGINT UNSIGNED NOT NULL,
	car_type_name VARCHAR(64) NOT NULL,
	car_length INT NOT NULL,

	UNIQUE(train_line_id, car_type_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
);

CREATE TABLE cars (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	train_line_id BIGINT UNSIGNED NOT NULL,
	car_type_id BIGINT UNSIGNED NOT NULL,
	car_name VARCHAR(64) NOT NULL,

	UNIQUE(train_line_id, car_type_id, car_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE,
	FOREIGN KEY (car_type_id)
		REFERENCES car_types(id)
		ON DELETE CASCADE
);
