drop table if exists company_industry;

create table company_industry (
  cin_cpy_id INTEGER NOT NULL,
  cin_ind_id INTEGER NOT NULL,
  FOREIGN KEY (cin_cpy_id) REFERENCES company(cpy_id),
  FOREIGN KEY (cin_ind_id) REFERENCES industry(ind_id)
);

CREATE UNIQUE INDEX xcin_cpy_id_ind_id ON company_industry(cin_cpy_id,cin_ind_id);

CREATE INDEX xcin_cpy_id ON company_industry(cin_cpy_id);
CREATE INDEX xcin_ind_id ON company_industry(cin_ind_id);

