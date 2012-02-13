drop table if exists book_group;

create table book_group (
  bgp_code VARCHAR(10) NOT NULL PRIMARY KEY,
  bgp_name VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX xbgp_name ON book_group(bgp_name);

