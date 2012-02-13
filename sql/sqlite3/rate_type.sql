drop table if exists rate_type;

create table rate_type (
  rtt_code CHAR(2) NOT NULL PRIMARY KEY,
  rtt_name VARCHAR(50) NOT NULL
);

CREATE UNIQUE INDEX xrtt_name ON rate_type(rtt_name);

