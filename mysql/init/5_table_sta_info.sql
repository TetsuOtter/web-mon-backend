USE webmon;

CREATE TABLE stations (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	train_line_id BIGINT UNSIGNED NOT NULL,
	station_name VARCHAR(64) NOT NULL,
	name_short VARCHAR(16) NOT NULL,
	sta_location DOUBLE PRECISION NOT NULL,

	UNIQUE(train_line_id, station_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
);

CREATE TABLE station_stop_pos (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	station_id BIGINT UNSIGNED NOT NULL,
	pos_name VARCHAR(64) NOT NULL,
	track_name_short VARCHAR(16) NOT NULL,
	stop_pos_location DOUBLE PRECISION NOT NULL,
	run_in_limit SMALLINT(4),
	run_out_limit SMALLINT(4),

	FOREIGN KEY (station_id)
		REFERENCES stations(id)
		ON DELETE CASCADE
);
