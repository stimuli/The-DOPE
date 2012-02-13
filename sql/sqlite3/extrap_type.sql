drop table if exists extrap_type;

create table extrap_type (
  ext_code VARCHAR(5) NOT NULL PRIMARY KEY,
  ext_desc VARCHAR(255) NOT NULL
);

