#!/usr/bin/python
import sys
import os
import glob
import sqlite3
from xml.dom.minidom import parse
import Trade

if len(sys.argv) != 3:
    print("Usage: %s <dbfile> <trade_dir>" % sys.argv[0])
    exit(0)

dbfile = sys.argv[1]
trade_dir = sys.argv[2]

conn = sqlite3.connect(dbfile)
c = conn.cursor()

for filename in glob.glob(os.path.join(trade_dir, "*.xml")):

    dom = parse(filename)
    trNode = dom.getElementsByTagName('trade')[0]

    t = Trade.Trade()
    t.fromXmlNode(trNode)

    trd_key = t.tradeId
    trd_usr_id = 1
    trd_trade_date = t.tradeDate
    trd_tst_code = 'L'
    trd_tty_code = 'FX/FWD'
    trd_bys_code = 'B'
    trd_cpt_key = t.counterparty
    trd_bok_code = 'FX01'
    trd_data = t.toXml()

    c.execute("insert into trade(trd_key, trd_trade_date, trd_usr_id, trd_tst_code, trd_tty_code, trd_bys_code, trd_cpt_key, trd_bok_code, trd_data) values (?, ?, ?, ?, ?, ?, ?, ?, ?)", (trd_key, trd_trade_date, trd_usr_id, trd_tst_code, trd_tty_code, trd_bys_code, trd_cpt_key, trd_bok_code, trd_data))
    conn.commit()
