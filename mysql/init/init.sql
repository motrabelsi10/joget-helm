CREATE DATABASE IF NOT EXISTS jwdb;
CREATE DATABASE IF NOT EXISTS tomcat;

CREATE USER IF NOT EXISTS 'tomcat'@'%' IDENTIFIED BY 'tomcat';
GRANT ALL PRIVILEGES ON tomcat.* TO 'tomcat'@'%';
GRANT ALL PRIVILEGES ON jwdb.* TO 'tomcat'@'%';
FLUSH PRIVILEGES;

USE tomcat;
CREATE TABLE tomcat_sessions (
  session_id     varchar(100) not null primary key,
  valid_session  char(1) not null,
  max_inactive   int not null,
  last_access    bigint not null,
  app_name       varchar(255),
  session_data   mediumblob,
  KEY kapp_name(app_name)
);
