drop table if exists trade;

create table trade (
  trd_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  trd_key VARCHAR(50) NOT NULL,
  trd_insert_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  trd_trade_date DATE NOT NULL,
  trd_usr_id VARCHAR(15) NOT NULL,
  trd_tst_code CHAR(1) NOT NULL,
  trd_tty_code VARCHAR(50) NOT NULL,
  trd_bys_code CHAR(1) NOT NULL,
  trd_cpt_key VARCHAR(30) NOT NULL,
  trd_bok_code VARCHAR(10),
  trd_data BLOB NOT NULL,
  FOREIGN KEY (trd_usr_id) REFERENCES user(usr_id),
  FOREIGN KEY (trd_tst_code) REFERENCES trade_status(tst_code),
  FOREIGN KEY (trd_tty_code) REFERENCES trade_type(tty_code),
  FOREIGN KEY (trd_bys_code) REFERENCES buysell_type(bys_code),
  FOREIGN KEY (trd_cpt_key) REFERENCES counterparty(cpt_key),
  FOREIGN KEY (trd_bok_code) REFERENCES book(bok_code)
);

CREATE UNIQUE INDEX xtrd_key_insert_time ON trade(trd_key,trd_insert_time);

CREATE INDEX xtrd_usr_id ON trade(trd_usr_id);
CREATE INDEX xtrd_tty_code ON trade(trd_tty_code);

