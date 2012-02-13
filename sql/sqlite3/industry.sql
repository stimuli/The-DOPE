drop table if exists industry;

create table industry (
  ind_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  ind_name VARCHAR(255) NOT NULL,
  ind_ssc_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (ind_ssc_code) REFERENCES subsector(ssc_code)
);

CREATE UNIQUE INDEX xind_name ON industry(ind_name);

CREATE INDEX xind_ssc_code ON industry(ind_ssc_code);

