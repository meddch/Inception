CREATE DATABASE if not exists my_database;
CREATE USER 'EVBLOOD'@'%';
GRANT ALL PRIVILEGES ON my_database.* to 'EVBLOOD'@'%' IDENTIFIED BY '123';
alter user 'root'@'localhost' identified by '123';
FLUSH PRIVILEGES;