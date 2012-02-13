;; For editing the file in Emacs forms mode
(setq forms-file "swap_asset.txt")
(setq forms-number-of-fields 16)
(setq forms-field-sep "\t")
;; Don't allow multi-line fields.
(setq forms-multi-line nil)

(setq forms-format-list
      (list
"\nAsset Type Code: " 1
"\nCcy Code: " 2
"\nDay Count Code: " 3
"\nDate Roll Convention: " 4
"\nSpot Term days: " 5
"\nSpot Term weeks: " 6
"\nSpot Term months: " 7
"\nSpot Term years: " 8
"\nMaturity Term days: " 9
"\nMaturity Term weeks: " 10
"\nMaturity Term months: " 11
"\nMaturity Term years: " 12
"\nFrequency Term days: " 13
"\nFrequency Term weeks: " 14
"\nFrequency Term months: " 15
"\nFrequency Term years: " 16
       "\n"))

