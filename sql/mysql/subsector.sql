drop table if exists subsector;

create table subsector (
  ssc_code VARCHAR(10) NOT NULL PRIMARY KEY,
  ssc_name VARCHAR(255) NOT NULL,
  ssc_sct_code VARCHAR(5) NOT NULL,
  FOREIGN KEY (ssc_sct_code) REFERENCES sector(sct_code)
);

CREATE UNIQUE INDEX xssc_name ON subsector(ssc_name);

CREATE INDEX xssc_sct_code ON subsector(ssc_sct_code);

