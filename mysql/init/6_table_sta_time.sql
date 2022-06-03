USE webmon;

CREATE TABLE radio_ch (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	ch_name VARCHAR(4) UNIQUE NOT NULL
		COMMENT 'Radio channel text to be displayed',
	ch_description TEXT
		COMMENT 'Radio channel description'
) COMMENT 'Radio channel settings';

CREATE TABLE sta_time (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		COMMENT 'counter to identify each record',
	train_id BIGINT UNSIGNED NOT NULL
		COMMENT 'target train record id',
	stop_pos_id BIGINT UNSIGNED NOT NULL
		COMMENT 'stop position id',
	arr_time TIME CHECK (arr_time >= '00:00:00')
		COMMENT 'arrive time (if NULL and set as stop station, the time will not be displayed) the value must be same or more than 0:00:00. And normally, it will be less than 28:00:00',
	dep_time TIME CHECK (dep_time >= '00:00:00')
		COMMENT 'departure time (if NULL and set as stop station, the time will not be displayed) the value must be same or more than 0:00:00. And normally, it will be less than 28:00:00',
	is_pass BIT(1) NOT NULL
		COMMENT 'whether passing this station',
	track_id BIGINT UNSIGNED NOT NULL
		COMMENT 'track id that will run on to next station',
	radio_ch_id BIGINT UNSIGNED NOT NULL
		COMMENT 'radio ch id that will use to next station',
	sta_color CHAR(8) NOT NULL
		COMMENT 'station char display color',
	line_color CHAR(8) NOT NULL
		COMMENT 'line color that will be displayed until next station',

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
) COMMENT 'station arrive/departure time etc.';

CREATE TABLE a_work_sta_relations (
	work_id BIGINT UNSIGNED NOT NULL
		COMMENT 'target work id',
	sta_time_from_id BIGINT UNSIGNED NOT NULL
		COMMENT 'target origin station arrive/departure time record id',
	sta_time_to_id BIGINT UNSIGNED NOT NULL
		COMMENT 'target destination station arrive/departure time record id',
	is_no_work BIT(1) NOT NULL
		COMMENT 'whether the work is phoresis',

	PRIMARY KEY (work_id, sta_time_from_id),

	FOREIGN KEY (sta_time_from_id)
		REFERENCES sta_time(id),
	FOREIGN KEY (sta_time_to_id)
		REFERENCES sta_time(id)
) COMMENT 'relation between work and stoppings';

CREATE TABLE b_work_sta_relations LIKE a_work_sta_relations;
CREATE TABLE c_work_sta_relations LIKE a_work_sta_relations;

ALTER TABLE a_work_sta_relations ADD FOREIGN KEY (work_id)
		REFERENCES a_works(id) ON DELETE CASCADE;
ALTER TABLE b_work_sta_relations ADD FOREIGN KEY (work_id)
		REFERENCES b_works(id) ON DELETE CASCADE;
ALTER TABLE c_work_sta_relations ADD FOREIGN KEY (work_id)
		REFERENCES c_works(id) ON DELETE CASCADE;
