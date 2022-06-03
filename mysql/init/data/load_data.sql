USE webmon;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/users.csv' INTO TABLE users FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/train_lines.csv' INTO TABLE train_lines FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/line_tag_names.csv' INTO TABLE line_tag_names FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/line_tag_relations.csv' INTO TABLE line_tag_relations FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/offices.csv' INTO TABLE offices FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/tracks.csv' INTO TABLE tracks FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/perm_read_line.csv' INTO TABLE perm_read_line FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/perm_write_line.csv' INTO TABLE perm_write_line FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/perm_password.csv' INTO TABLE perm_password FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/car_types.csv' INTO TABLE car_types FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/a_works.csv' INTO TABLE a_works FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/b_works.csv' INTO TABLE b_works FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/c_works.csv' INTO TABLE c_works FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/trains.csv' INTO TABLE trains FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/train_opt_types.csv' INTO TABLE train_opt_types FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/train_opts.csv' INTO TABLE train_opts FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/stations.csv' INTO TABLE stations FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/station_stop_pos.csv' INTO TABLE station_stop_pos FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/radio_ch.csv' INTO TABLE radio_ch FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/sta_time.csv' INTO TABLE sta_time FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/a_work_sta_relations.csv' INTO TABLE a_work_sta_relations FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/b_work_sta_relations.csv' INTO TABLE b_work_sta_relations FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data/c_work_sta_relations.csv' INTO TABLE c_work_sta_relations FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
