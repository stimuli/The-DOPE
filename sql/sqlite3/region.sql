drop table if exists region;

create table region (
  reg_code CHAR(2) NOT NULL PRIMARY KEY,
  reg_name VARCHAR(15) NOT NULL
);

CREATE UNIQUE INDEX xreg_name ON region(reg_name);

