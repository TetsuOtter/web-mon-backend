USE webmon;

CREATE TABLE radio_ch (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ch_name VARCHAR(4) UNIQUE NOT NULL,
	ch_discription TEXT
);

CREATE TABLE sta_time (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	train_id BIGINT UNSIGNED NOT NULL,
	stop_pos_id BIGINT UNSIGNED NOT NULL,
	arr_time TIME CHECK (arr_time >= '00:00:00'),
	dep_time TIME CHECK (dep_time >= '00:00:00'),
	is_pass BIT(1) NOT NULL,
	track_id BIGINT UNSIGNED NOT NULL,
	radio_ch_id BIGINT UNSIGNED NOT NULL,
	sta_color CHAR(8) NOT NULL,
	line_color CHAR(8) NOT NULL,

	UNIQUE (train_id, stop_pos_id),

	FOREIGN KEY (train_id)
		REFERENCES trains(id)
		ON DELETE CASCADE,

	FOREIGN KEY (stop_pos_id)
		REFERENCES station_stop_pos(id),
	FOREIGN KEY (track_id)
		REFERENCES tracks(id),
	FOREIGN KEY (radio_ch_id)
		REFERENCES radio_ch(id)
);

CREATE TABLE a_work_sta_relations (
	work_id BIGINT UNSIGNED NOT NULL,
	sta_time_from_id BIGINT UNSIGNED NOT NULL,
	sta_time_to_id BIGINT UNSIGNED NOT NULL,

	PRIMARY KEY (work_id, sta_time_from_id),

	FOREIGN KEY (sta_time_from_id)
		REFERENCES sta_time(id),
	FOREIGN KEY (sta_time_to_id)
		REFERENCES sta_time(id)
);

CREATE TABLE b_work_sta_relations LIKE a_work_sta_relations;
CREATE TABLE c_work_sta_relations LIKE a_work_sta_relations;

ALTER TABLE a_work_sta_relations ADD FOREIGN KEY (work_id)
		REFERENCES a_works(id) ON DELETE CASCADE;
ALTER TABLE b_work_sta_relations ADD FOREIGN KEY (work_id)
		REFERENCES b_works(id) ON DELETE CASCADE;
ALTER TABLE c_work_sta_relations ADD FOREIGN KEY (work_id)
		REFERENCES c_works(id) ON DELETE CASCADE;
