USE webmon;

CREATE TABLE stations (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	train_line_id BIGINT UNSIGNED NOT NULL
		COMMENT 'line id that has this station',
	station_name VARCHAR(64) NOT NULL
		COMMENT 'station name (full name)',
	name_short VARCHAR(16) NOT NULL
		COMMENT 'station name (short name: normally, length will be same or less than 4)',
	sta_location DOUBLE PRECISION NOT NULL
		COMMENT 'station center location',

	UNIQUE(train_line_id, station_name),

	FOREIGN KEY (train_line_id)
		REFERENCES train_lines(id)
		ON DELETE CASCADE
) COMMENT 'station information';

CREATE TABLE station_stop_pos (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	station_id BIGINT UNSIGNED NOT NULL
		COMMENT 'station id that has this stop-position',
	pos_name VARCHAR(64) NOT NULL
		COMMENT 'stop position name (full name)',
	track_name_short VARCHAR(16) NOT NULL
		COMMENT 'stop position / track name (short name: normally, length will be same or less than 3)',
	stop_pos_location DOUBLE PRECISION NOT NULL
		COMMENT 'location of stop position',
	run_in_limit SMALLINT(4)
		COMMENT 'run in limit [km/h]',
	run_out_limit SMALLINT(4)
		COMMENT 'run out limit [km/h]',

	FOREIGN KEY (station_id)
		REFERENCES stations(id)
		ON DELETE CASCADE
) COMMENT 'stop position of each station';
