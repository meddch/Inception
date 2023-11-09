CREATE DATABASE my_database;
CREATE USER 'mechane'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON my_database.* TO 'mechane'@'%';
FLUSH PRIVILEGES;
