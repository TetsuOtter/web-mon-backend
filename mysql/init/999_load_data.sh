#!/bin/sh
mysql -utest -ptest --local-infile=1 < /docker-entrypoint-initdb.d/data/load_data.sql
