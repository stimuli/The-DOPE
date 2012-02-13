drop table if exists internal_unit;

create table internal_unit (
  inu_code VARCHAR(4) NOT NULL PRIMARY KEY,
  inu_name VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX xinu_name ON internal_unit(inu_name);

