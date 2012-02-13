drop table if exists asset_type;

create table asset_type (
  aty_code VARCHAR(50) NOT NULL PRIMARY KEY,
  aty_desc VARCHAR(255) NOT NULL,
  aty_prd_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (aty_prd_code) REFERENCES product(prd_code)
);

