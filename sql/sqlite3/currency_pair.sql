drop table if exists currency_pair;

create table currency_pair (
  cyp_code CHAR(7) NOT NULL PRIMARY KEY,
  cyp_ccy_code_1 CHAR(3) NOT NULL,
  cyp_ccy_code_2 CHAR(3) NOT NULL,
  cyp_quote_convention CHAR(3) NOT NULL,
  cyp_spot_days INTEGER,
  cyp_decimal_places INTEGER,
  FOREIGN KEY (cyp_ccy_code_1) REFERENCES currency(ccy_code),
  FOREIGN KEY (cyp_ccy_code_2) REFERENCES currency(ccy_code)
);

CREATE UNIQUE INDEX xcyp_ccy_code_1_ccy_code_2 ON currency_pair(cyp_ccy_code_1,cyp_ccy_code_2);

