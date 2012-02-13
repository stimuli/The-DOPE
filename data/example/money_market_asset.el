;; For editing the file in Emacs forms mode
(setq forms-file "money_market_asset.txt")
(setq forms-number-of-fields 13)
(setq forms-field-sep "\t")
;; Don't allow multi-line fields.
(setq forms-multi-line nil)

(setq forms-format-list
      (list
"\nAsset Type Code: " 1
"\nCcy Code: " 2
"\nMoney Market Code: " 3
"\nDay Count Code: " 4
"\nDate Roll Convention: " 5
"\nSpot Term days: " 6
"\nSpot Term weeks: " 7
"\nSpot Term months: " 8
"\nSpot Term years: " 9
"\nMaturity Term days: " 10
"\nMaturity Term weeks: " 11
"\nMaturity Term months: " 12
"\nMaturity Term years: " 13
       "\n"))

