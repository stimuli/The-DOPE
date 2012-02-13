drop table if exists day_count_type;

create table day_count_type (
  dyc_code VARCHAR(15) NOT NULL PRIMARY KEY,
  dyc_desc VARCHAR(255) NOT NULL
);

