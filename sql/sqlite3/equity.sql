drop table if exists equity;

create table equity (
  eqy_code VARCHAR(30) NOT NULL PRIMARY KEY,
  eqy_cpy_id INTEGER NOT NULL,
  eqy_isin CHAR(12),
  eqy_ric_code VARCHAR(15),
  eqy_xch_code VARCHAR(10) NOT NULL,
  eqy_is_active CHAR(1) NOT NULL,
  FOREIGN KEY (eqy_cpy_id) REFERENCES company(cpy_id),
  FOREIGN KEY (eqy_xch_code) REFERENCES exchange(xch_code)
);

CREATE INDEX xeqy_cpy_id ON equity(eqy_cpy_id);
CREATE INDEX xeqy_xch_code ON equity(eqy_xch_code);

