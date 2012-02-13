drop table if exists trade_asset;

create table trade_asset (
  tra_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  tra_trd_key VARCHAR(50) NOT NULL,
  tra_ast_code VARCHAR(50) NOT NULL,
  tra_cpt_key VARCHAR(30) NOT NULL,
  tra_inu_code VARCHAR(4) NOT NULL,
  tra_bys_code CHAR(1) NOT NULL,
  tra_amount NUMERIC(14,4) NOT NULL,
  tra_unt_code VARCHAR(2),
  tra_opt_code CHAR(2),
  tra_price NUMERIC(14,8),
  tra_settlement_date DATE,
  tra_expiry_date DATE,
  tra_maturity_date DATE,
  FOREIGN KEY (tra_trd_key) REFERENCES trade(trd_key),
  FOREIGN KEY (tra_ast_code) REFERENCES asset(ast_code),
  FOREIGN KEY (tra_bys_code) REFERENCES buysell_type(bys_code),
  FOREIGN KEY (tra_unt_code) REFERENCES unit(unt_code),
  FOREIGN KEY (tra_opt_code) REFERENCES option_type(opt_code),
  FOREIGN KEY (tra_cpt_key) REFERENCES counterparty(cpt_key),
  FOREIGN KEY (tra_inu_code) REFERENCES internal_unit(inu_code)
);

CREATE INDEX xtra_trd_key ON trade_asset(tra_trd_key);
CREATE INDEX xtra_ast_code ON trade_asset(tra_ast_code);
CREATE INDEX xtra_cpt_key ON trade_asset(tra_cpt_key);
CREATE INDEX xtra_inu_code ON trade_asset(tra_inu_code);

