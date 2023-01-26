SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$DB_ROOT' WITH GRANT OPTION;
DELETE FROM mysql.user WHERE user != 'root' AND user != 'mariadb.sys' OR (user = 'root' AND host != 'localhost');
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%';
FLUSH PRIVILEGES;
