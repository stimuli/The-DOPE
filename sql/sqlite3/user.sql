drop table if exists user;

create table user (
  usr_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  usr_login VARCHAR(50) NOT NULL,
  usr_name VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX xusr_login ON user(usr_login);

CREATE INDEX xusr_name ON user(usr_name);

