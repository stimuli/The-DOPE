drop table if exists swap_asset;

create table swap_asset (
  swa_ast_code VARCHAR(50) NOT NULL PRIMARY KEY,
  swa_ccy_code CHAR(3) NOT NULL,
  swa_dyc_code VARCHAR(15) NOT NULL,
  swa_dtr_code CHAR(2) NOT NULL,
  swa_spot_term_days INTEGER,
  swa_spot_term_weeks INTEGER,
  swa_spot_term_months INTEGER,
  swa_spot_term_years INTEGER,
  swa_maturity_term_days INTEGER,
  swa_maturity_term_weeks INTEGER,
  swa_maturity_term_months INTEGER,
  swa_maturity_term_years INTEGER,
  swa_frequency_term_days INTEGER,
  swa_frequency_term_weeks INTEGER,
  swa_frequency_term_months INTEGER,
  swa_frequency_term_years INTEGER,
  FOREIGN KEY (swa_ast_code) REFERENCES asset(ast_code),
  FOREIGN KEY (swa_ccy_code) REFERENCES currency(ccy_code),
  FOREIGN KEY (swa_dyc_code) REFERENCES day_count_type(dyc_code),
  FOREIGN KEY (swa_dtr_code) REFERENCES date_roll_type(dtr_code)
);

CREATE INDEX xswa_ccy_code ON swap_asset(swa_ccy_code);

