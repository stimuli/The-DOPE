drop table if exists dividend;

create table dividend (
  dvd_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  dvd_eqy_code VARCHAR(30) NOT NULL,
  dvd_announce_date DATE,
  dvd_exdividend_date DATE,
  dvd_record_date DATE,
  dvd_payment_date DATE,
  dvd_amount NUMERIC(12,4),
  FOREIGN KEY (dvd_eqy_code) REFERENCES equity(eqy_code)
);

CREATE INDEX xdvd_eqy_code ON dividend(dvd_eqy_code);
CREATE INDEX xdvd_payment_date ON dividend(dvd_payment_date);
CREATE INDEX xdvd_announce_date ON dividend(dvd_announce_date);

