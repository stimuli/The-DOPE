drop table if exists currency;

create table currency (
  ccy_code CHAR(3) NOT NULL PRIMARY KEY,
  ccy_name VARCHAR(30) NOT NULL
);

CREATE UNIQUE INDEX xccy_name ON currency(ccy_name);

