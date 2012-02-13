drop table if exists company;

create table company (
  cpy_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cpy_name VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX xcpy_name ON company(cpy_name);

