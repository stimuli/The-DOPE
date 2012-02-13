drop table if exists country;

create table country (
  cnt_code CHAR(2) NOT NULL PRIMARY KEY,
  cnt_name VARCHAR(50) NOT NULL,
  cnt_ccy_code CHAR(3) NOT NULL,
  cnt_srg_code CHAR(3) NOT NULL,
  FOREIGN KEY (cnt_ccy_code) REFERENCES currency(ccy_code),
  FOREIGN KEY (cnt_srg_code) REFERENCES subregion(srg_code)
);

CREATE UNIQUE INDEX xcnt_name ON country(cnt_name);

CREATE INDEX xcnt_ccy_code ON country(cnt_ccy_code);
CREATE INDEX xcnt_srg_code ON country(cnt_srg_code);

