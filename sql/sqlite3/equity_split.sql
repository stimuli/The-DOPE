drop table if exists equity_split;

create table equity_split (
  esp_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  esp_eqy_code VARCHAR(30) NOT NULL,
  esp_announce_date DATE,
  esp_ratio VARCHAR(10) NOT NULL,
  esp_split_date DATE NOT NULL,
  FOREIGN KEY (esp_eqy_code) REFERENCES equity(eqy_code)
);

CREATE INDEX xesp_split_date ON equity_split(esp_split_date);

