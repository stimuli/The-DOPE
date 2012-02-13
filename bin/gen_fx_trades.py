#!/usr/bin/python
import sys
import os
import random
import sqlite3
import Trade
import CcyPair

def freespace(p):
    """
    Returns the number of free bytes on the drive that ``p`` is on
    """
    s = os.statvfs(p)
    return s.f_bsize * s.f_bavail

exchangeRates = {
    "GBP/USD" : 1.6359,
    "AUD/USD" : 0.7844,
    "EUR/USD" : 1.4035,
    "USD/CAD" : 0.8613,
    "USD/CHF" : 0.9278,
    "USD/JPY" : 93.0300
}
    
if len(sys.argv) != 4:
    print("Usage: %s <dbfile> <counterparty.txt> <currency_pair.txt>" % sys.argv[0])
    exit(0)

dbfile = sys.argv[1]
cpty_filename = sys.argv[2]
ccypair_filename = sys.argv[3]

def read_counterparties(filename, counterparties):
    file = open(filename, 'r')
    for line in file:
        fields = line.split("\t")
        if len(fields) > 1:
            counterparties.append(fields[0])
    file.close()

counterparties = []
ccyPairMgr = CcyPair.CcyPairMgr()

read_counterparties(cpty_filename, counterparties)
ccyPairMgr.readFromFile(ccypair_filename)

conn = sqlite3.connect(dbfile)
c = conn.cursor()

dealnum = 1
while freespace(dbfile) > 0:

    if dealnum % 10000 == 0:
        print("At deal %d" % dealnum)

    trade = Trade.Trade()
    cpty = random.choice(counterparties)
    ccypair = ccyPairMgr.getRandomCcyPair()

    trade.tradeId = "fx.fwd.%12.12d" % dealnum
    dealnum += 1
    trade.counterparty = cpty
    trade.tradeDate = '2009-07-01'

    fxSingleLeg = Trade.FxSingleLeg()
    fxSingleLeg.valueDate = '2010-07-01'
    fxSingleLeg.exchangeRate = Trade.ExchangeRate()
    fxSingleLeg.exchangeRate.ccy1 = ccypair.ccy1
    fxSingleLeg.exchangeRate.ccy2 = ccypair.ccy2
    fxSingleLeg.exchangeRate.quoteBasis = ccypair.quoteBasis
    fxSingleLeg.exchangeRate.rate = str(exchangeRates[ccypair.code])

    exch1 = Trade.ExchangedCurrency()
    exch1.payer = cpty
    exch1.receiver = 'FX'
    exch1.ccy = ccypair.ccy1
    exch1.amount = 1000000.0

    exch2 = Trade.ExchangedCurrency()
    exch2.payer = 'FX'
    exch2.receiver = cpty
    exch2.ccy = ccypair.ccy2
    exch2.amount = exch1.amount * exchangeRates[ccypair.code]

    fxSingleLeg.exchangedCurrencies.append(exch1)
    fxSingleLeg.exchangedCurrencies.append(exch2)

    trade.assets.append(fxSingleLeg)

    trd_key = trade.tradeId
    trd_usr_id = 1
    trd_trade_date = trade.tradeDate
    trd_tst_code = 'L'
    trd_tty_code = 'FX/FWD'
    trd_bys_code = 'B'
    trd_cpt_key = trade.counterparty
    trd_bok_code = 'FX01'
    trd_data = trade.toXml()

    c.execute("insert into trade(trd_key, trd_trade_date, trd_usr_id, trd_tst_code, trd_tty_code, trd_bys_code, trd_cpt_key, trd_bok_code, trd_data) values (?, ?, ?, ?, ?, ?, ?, ?, ?)", (trd_key, trd_trade_date, trd_usr_id, trd_tst_code, trd_tty_code, trd_bys_code, trd_cpt_key, trd_bok_code, trd_data))
    conn.commit()


conn.close()
