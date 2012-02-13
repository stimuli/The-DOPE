drop table if exists money_market_type;

create table money_market_type (
  mmt_code CHAR(2) NOT NULL PRIMARY KEY,
  mmt_desc VARCHAR(255) NOT NULL
);

