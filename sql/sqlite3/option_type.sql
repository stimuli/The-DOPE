drop table if exists option_type;

create table option_type (
  opt_code CHAR(2) NOT NULL PRIMARY KEY,
  opt_desc VARCHAR(255) NOT NULL
);

