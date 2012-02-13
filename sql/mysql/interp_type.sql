drop table if exists interp_type;

create table interp_type (
  int_code VARCHAR(5) NOT NULL PRIMARY KEY,
  int_desc VARCHAR(255) NOT NULL
);

