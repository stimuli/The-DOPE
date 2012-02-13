drop table if exists rate;

create table rate (
  rat_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  rat_name VARCHAR(200) NOT NULL,
  rat_ast_code VARCHAR(50) NOT NULL,
  rat_rtt_code CHAR(2) NOT NULL,
  rat_term_days INTEGER,
  rat_term_weeks INTEGER,
  rat_term_months INTEGER,
  rat_term_years INTEGER,
  rat_term_date DATE,
  rat_term_hour INTEGER,
  FOREIGN KEY (rat_ast_code) REFERENCES asset(ast_code),
  FOREIGN KEY (rat_rtt_code) REFERENCES rate_type(rtt_code)
);

CREATE UNIQUE INDEX xrat_name ON rate(rat_name);

CREATE INDEX xrat_ast_code ON rate(rat_ast_code);
CREATE INDEX xrat_rtt_code ON rate(rat_rtt_code);
CREATE INDEX xrat_ast_rtt_codes ON rate(rat_ast_code,rat_rtt_code);

