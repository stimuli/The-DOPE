drop table if exists date_roll_type;

create table date_roll_type (
  dtr_code CHAR(2) NOT NULL PRIMARY KEY,
  dtr_desc VARCHAR(255) NOT NULL
);

