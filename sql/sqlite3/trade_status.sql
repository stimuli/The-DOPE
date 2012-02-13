drop table if exists trade_status;

create table trade_status (
  tst_code CHAR(1) NOT NULL PRIMARY KEY,
  tst_desc VARCHAR(255) NOT NULL
);

