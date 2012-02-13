drop table if exists trade_type;

create table trade_type (
  tty_code VARCHAR(50) NOT NULL PRIMARY KEY,
  tty_desc VARCHAR(255) NOT NULL,
  tty_prd_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (tty_prd_code) REFERENCES product(prd_code)
);

CREATE INDEX xtty_prd_code ON trade_type(tty_prd_code);

