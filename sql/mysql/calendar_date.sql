drop table if exists calendar_date;

create table calendar_date (
  cal_id INTEGER NOT NULL,
  cal_dty_id INTEGER NOT NULL,
  cal_date DATE NOT NULL,
  FOREIGN KEY (cal_dty_id) REFERENCES date_type(dty_id)
);

CREATE UNIQUE INDEX xcal_id_date ON calendar_date(cal_id,cal_dty_id,cal_date);

