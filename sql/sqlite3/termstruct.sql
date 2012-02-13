drop table if exists termstruct;

create table termstruct (
  trm_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  trm_name VARCHAR(255) NOT NULL,
  trm_ast_code VARCHAR(50) NOT NULL,
  trm_trt_code CHAR(2) NOT NULL,
  trm_int_code VARCHAR(5) NOT NULL,
  trm_ext_code_start VARCHAR(5) NOT NULL,
  trm_ext_code_end VARCHAR(5) NOT NULL,
  FOREIGN KEY (trm_trt_code) REFERENCES termstruct_type(trt_code),
  FOREIGN KEY (trm_ast_code) REFERENCES asset(ast_code),
  FOREIGN KEY (trm_int_code) REFERENCES interpolation_type(int_code),
  FOREIGN KEY (trm_ext_code_start) REFERENCES extrapolation_type(ext_code),
  FOREIGN KEY (trm_ext_code_end) REFERENCES extrapolation_type(ext_code)
);

CREATE UNIQUE INDEX xtrm_name_trt_code ON termstruct(trm_name,trm_trt_code);

CREATE INDEX xtrm_trt_code ON termstruct(trm_trt_code);
CREATE INDEX xtrm_ast_code ON termstruct(trm_ast_code);
CREATE INDEX xtrm_ast_code_trt_code ON termstruct(trm_ast_code,trm_trt_code);

