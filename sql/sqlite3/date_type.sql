drop table if exists date_type;

create table date_type (
  dty_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  dty_is_holiday CHAR(1) NOT NULL,
  dty_desc VARCHAR(200) NOT NULL
);

