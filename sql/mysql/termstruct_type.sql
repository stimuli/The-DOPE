drop table if exists termstruct_type;

create table termstruct_type (
  trt_code CHAR(2) NOT NULL PRIMARY KEY,
  trt_desc VARCHAR(255) NOT NULL
);

