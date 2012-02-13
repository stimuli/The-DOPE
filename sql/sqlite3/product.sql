drop table if exists product;

create table product (
  prd_code VARCHAR(10) NOT NULL PRIMARY KEY,
  prd_name VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX xprd_name ON product(prd_name);

