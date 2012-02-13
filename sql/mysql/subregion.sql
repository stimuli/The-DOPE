drop table if exists subregion;

create table subregion (
  srg_code CHAR(3) NOT NULL PRIMARY KEY,
  srg_name VARCHAR(30) NOT NULL,
  srg_reg_code CHAR(2) NOT NULL,
  FOREIGN KEY (srg_reg_code) REFERENCES region(reg_code)
);

CREATE INDEX xsrg_name ON subregion(srg_name);
CREATE INDEX xsrg_reg_code ON subregion(srg_reg_code);

