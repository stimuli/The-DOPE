drop table if exists book;

create table book (
  bok_code VARCHAR(10) NOT NULL PRIMARY KEY,
  bok_name VARCHAR(255) NOT NULL,
  bok_bgp_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (bok_bgp_code) REFERENCES book_group(bgp_code)
);

CREATE UNIQUE INDEX xbok_name ON book(bok_name);

CREATE INDEX xbok_bgp_code ON book(bok_bgp_code);

