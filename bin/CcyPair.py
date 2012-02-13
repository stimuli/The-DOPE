#!/usr/bin/python
import random

class CcyPair:
    def __init__(self, code, ccy1, ccy2, quote_conv):
        self.code = code
        self.ccy1 = ccy1
        self.ccy2 = ccy2
        self.quoteBasis = quote_conv

class CcyPairMgr:
    def __init__(self):
        self.ccyPairs = {}

    def readFromFile(self, filename):
        file = open(filename, 'r')
        for line in file:
            fields = line.split("\t")
            if len(fields) > 4:
                ccyPair = CcyPair(fields[0], fields[1], fields[2], fields[3])
                self.ccyPairs[fields[0]] = ccyPair
        file.close()

    def getRandomCcyPair(self):
        return self.ccyPairs[random.choice(self.ccyPairs.keys())]

