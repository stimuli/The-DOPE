drop table if exists buysell_type;

create table buysell_type (
  bys_code CHAR(1) NOT NULL PRIMARY KEY,
  bys_desc VARCHAR(255) NOT NULL
);

