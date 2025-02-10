CREATE DATABASE IF NOT EXISTS database_one;
CREATE DATABASE IF NOT EXISTS database_one_test;
CREATE DATABASE IF NOT EXISTS database_grafana;

CREATE USER IF NOT EXISTS '{{DATABASE_USER}}'@'%' IDENTIFIED WITH caching_sha2_password BY '{{DATABASE_PASSWORD}}';
GRANT ALL PRIVILEGES ON *.* TO '{{DATABASE_USER}}'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
