drop table if exists money_market_asset;

create table money_market_asset (
  mma_ast_code VARCHAR(50) NOT NULL PRIMARY KEY,
  mma_ccy_code CHAR(3) NOT NULL,
  mma_mmt_code CHAR(2) NOT NULL,
  mma_dyc_code VARCHAR(15) NOT NULL,
  mma_dtr_code CHAR(2) NOT NULL,
  mma_spot_term_days INTEGER,
  mma_spot_term_weeks INTEGER,
  mma_spot_term_months INTEGER,
  mma_spot_term_years INTEGER,
  mma_maturity_term_days INTEGER,
  mma_maturity_term_weeks INTEGER,
  mma_maturity_term_months INTEGER,
  mma_maturity_term_years INTEGER,
  FOREIGN KEY (mma_ast_code) REFERENCES asset(ast_code),
  FOREIGN KEY (mma_ccy_code) REFERENCES currency(ccy_code),
  FOREIGN KEY (mma_mmt_code) REFERENCES money_market_type(mmt_code),
  FOREIGN KEY (mma_dyc_code) REFERENCES day_count_type(dyc_code),
  FOREIGN KEY (mma_dtr_code) REFERENCES date_roll_type(dtr_code)
);

CREATE INDEX xmma_ccy_code ON money_market_asset(mma_ccy_code);
CREATE INDEX xmma_mmt_code ON money_market_asset(mma_mmt_code);

