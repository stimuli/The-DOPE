drop table if exists rate_group;

create table rate_group (
  rgp_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  rgp_name VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX xrgp_name ON rate_group(rgp_name);

