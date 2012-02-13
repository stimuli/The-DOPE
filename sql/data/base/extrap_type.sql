INSERT INTO extrap_type(ext_code,ext_desc) VALUES ('LAZ','Last Zero - Assume a flat zero rate.');
INSERT INTO extrap_type(ext_code,ext_desc) VALUES ('LINZ','Linear Zero - Imply a zero rate in a linear fashion');
INSERT INTO extrap_type(ext_code,ext_desc) VALUES ('LINDF','Linear Discount Factor - Imply a discount factor in a linear fashion');
INSERT INTO extrap_type(ext_code,ext_desc) VALUES ('ZZ','Zero-Zero - Imply a zero rate in a linear fashion, the zero rate at curve start is assumed to be zero (primarily for spread curves). The only time there is a difference between this and LINEAR_ZERO is on curve start.');
