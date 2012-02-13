drop table if exists rate_group_rate_value;

create table rate_group_rate_value (
  rgr_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  rgr_rgp_id INTEGER NOT NULL,
  rgr_rat_id INTEGER NOT NULL,
  rgr_rav_id INTEGER NOT NULL
);

CREATE UNIQUE INDEX xrgr_rgp_id_rat_id ON rate_group_rate_value(rgr_rgp_id,rgr_rat_id);

CREATE INDEX xrgr_rgp_id ON rate_group_rate_value(rgr_rgp_id);

