drop table if exists termstruct_rate;

create table termstruct_rate (
  trr_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  trr_trm_id INTEGER NOT NULL,
  trr_rat_id INTEGER NOT NULL,
  FOREIGN KEY (trr_trm_id) REFERENCES termstruct(trm_id),
  FOREIGN KEY (trr_rat_id) REFERENCES rate(rat_id)
);

CREATE UNIQUE INDEX xtrr_trm_id_rat_id ON termstruct_rate(trr_trm_id,trr_rat_id);

CREATE INDEX xtrr_trm_id ON termstruct_rate(trr_trm_id);

