drop table if exists counterparty;

create table counterparty (
  cpt_key VARCHAR(30) NOT NULL PRIMARY KEY,
  cpt_name VARCHAR(255) NOT NULL,
  cpt_is_internal CHAR(1) NOT NULL,
  cpt_cpy_id INTEGER,
  FOREIGN KEY (cpt_cpy_id) REFERENCES company(cpy_id)
);

CREATE UNIQUE INDEX xcpt_name ON counterparty(cpt_name);

CREATE INDEX xcpt_cpy_id ON counterparty(cpt_cpy_id);

