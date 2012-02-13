drop table if exists asset;

create table asset (
  ast_code VARCHAR(50) NOT NULL PRIMARY KEY,
  ast_aty_code VARCHAR(50) NOT NULL,
  ast_desc VARCHAR(255) NOT NULL,
  ast_data TEXT,
  FOREIGN KEY (ast_aty_code) REFERENCES asset_type(aty_code)
);

CREATE INDEX xast_aty_code ON asset(ast_aty_code);

