drop table if exists calendar_relation;

create table calendar_relation (
  cre_cal_id_parent INTEGER NOT NULL,
  cre_cal_id_child INTEGER NOT NULL,
  FOREIGN KEY (cre_cal_id_parent) REFERENCES calendar(cal_id),
  FOREIGN KEY (cre_cal_id_child) REFERENCES calendar(cal_id)
);

CREATE UNIQUE INDEX xcre_parent_child ON calendar_relation(cre_cal_id_parent,cre_cal_id_child);

CREATE INDEX xcre_cal_id_parent ON calendar_relation(cre_cal_id_parent);
CREATE INDEX xcre_cal_id_child ON calendar_relation(cre_cal_id_child);

