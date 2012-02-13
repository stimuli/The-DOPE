drop table if exists calendar;

create table calendar (
  cal_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cal_name VARCHAR(100) NOT NULL
);

CREATE UNIQUE INDEX xcal_name ON calendar(cal_name);

