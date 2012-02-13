drop table if exists equity_buyback;

create table equity_buyback (
  ebb_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ebb_eqy_code VARCHAR(30) NOT NULL,
  ebb_announce_date DATE,
  ebb_num_shares INTEGER NOT NULL,
  ebb_price_per_share NUMERIC(12,4) NOT NULL,
  ebb_buyback_date DATE NOT NULL,
  FOREIGN KEY (ebb_eqy_code) REFERENCES equity(eqy_code)
);

CREATE INDEX xebb_buyback_date ON equity_buyback(ebb_buyback_date);

