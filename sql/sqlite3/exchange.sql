drop table if exists exchange;

create table exchange (
  xch_code VARCHAR(10) NOT NULL PRIMARY KEY,
  xch_name VARCHAR(255) NOT NULL,
  xch_cnt_code CHAR(2) NOT NULL,
  FOREIGN KEY (xch_cnt_code) REFERENCES country(cnt_code)
);

CREATE UNIQUE INDEX xxch_name ON exchange(xch_name);

CREATE INDEX xxch_cnt_code ON exchange(xch_cnt_code);

