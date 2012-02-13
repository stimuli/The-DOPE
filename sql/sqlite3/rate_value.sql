drop table if exists rate_value;

create table rate_value (
  rav_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  rav_rat_id INTEGER NOT NULL,
  rav_obs_datetime DATETIME NOT NULL,
  rav_value NUMERIC(20,8) NOT NULL,
  FOREIGN KEY (rav_rat_id) REFERENCES rate(rat_id)
);

