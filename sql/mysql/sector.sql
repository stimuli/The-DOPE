drop table if exists sector;

create table sector (
  sct_code VARCHAR(5) NOT NULL PRIMARY KEY,
  sct_name VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX xsct_name ON sector(sct_name);

