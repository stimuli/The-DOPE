#!/usr/bin/python
import sys
from xml.dom.minidom import parse

tradeIdScheme = 'http://stimuli.org/spec/trade-id-scheme'

def getText(nodelist):
    rc = ""
    for node in nodelist:
        if node.nodeType == node.TEXT_NODE:
            rc = rc + node.data
    return rc

class Asset:
    def __init__(self, nodeName):
        self.nodeName = nodeName

    def fromXmlNode(self, node):
        raise RuntimeException("fromXmlNode() should be overridden!")

    def clone(self):
        raise RuntimeException("clone() should be overridden!")

class ExchangedCurrency:
    def __init__(self):
        self.payer = None
        self.receiver = None
        self.ccy = None
        self.amount = None

    def fromXmlNode(self, node):
        self.payer = getText(node.getElementsByTagName('payerPartyReference')[0].attributes['href'].childNodes)
        self.receiver = getText(node.getElementsByTagName('receiverPartyReference')[0].attributes['href'].childNodes)

        self.ccy = getText(node.getElementsByTagName('currency')[0].childNodes)
        self.amount = getText(node.getElementsByTagName('amount')[0].childNodes)

    def toXml(self, tagName):
        xml = "<%s>\n" % tagName
        xml += " <payerPartyReference href=\"%s\" />\n" % self.payer
        xml += " <receiverPartyReference href=\"%s\" />\n" % self.receiver
        xml += " <paymentAmount>\n"
        xml += "   <currency>%s</currency>\n" % self.ccy
        xml += "   <amount>%s</amount>\n" % self.amount
        xml += " </paymentAmount>\n"
        xml += "</%s>\n" % tagName
        return xml

class ExchangeRate:
    def __init__(self):
        self.ccy1 = None
        self.ccy2 = None
        self.quoteBasis = None
        self.rate = None

    def fromXmlNode(self, node):
        self.ccy1 = getText(node.getElementsByTagName('currency1')[0].childNodes)
        self.ccy2 = getText(node.getElementsByTagName('currency2')[0].childNodes)
        quoteBasis = getText(node.getElementsByTagName('quoteBasis')[0].childNodes)
        if quoteBasis == 'Currency2PerCurrency1':
            self.quoteBasis = '2/1'
        else:
            self.quoteBasis = '1/2'
        self.rate = getText(node.getElementsByTagName('rate')[0].childNodes)

    def toXml(self):
        xml = "<exchangeRate>\n"
        xml += " <quotedCurrencyPair>\n"
        xml += "    <currency1>%s</currency1>\n" % self.ccy1
        xml += "    <currency2>%s</currency2>\n" % self.ccy2

        quoteBasis = 'Currency2PerCurrency1'
        if self.quoteBasis == '1/2':
            quoteBasis = 'Currency1PerCurrency2'
        xml += "    <quoteBasis>%s</quoteBasis>\n" % quoteBasis
        xml += "  </quotedCurrencyPair>\n"
        xml += "  <rate>%s</rate>\n" % self.rate
        xml += "</exchangeRate>\n"
        return xml


class FxSingleLeg:
    def __init__(self):
        self.exchangedCurrencies = []
        self.exchangeRate = None
        self.valueDate = None

    def fromXmlNode(self, node):
        exchCcy1 = node.getElementsByTagName('exchangedCurrency1')[0]
        if len(self.exchangedCurrencies) < 1:
            self.exchangedCurrencies.append(ExchangedCurrency())
        self.exchangedCurrencies[0].fromXmlNode(exchCcy1)

        exchCcy2 = node.getElementsByTagName('exchangedCurrency2')[0]
        if len(self.exchangedCurrencies) < 2:
            self.exchangedCurrencies.append(ExchangedCurrency())
        self.exchangedCurrencies[1].fromXmlNode(exchCcy2)
        
        xrate = node.getElementsByTagName('exchangeRate')[0]
        self.exchangeRate = ExchangeRate()
        self.exchangeRate.fromXmlNode(xrate)

        self.valueDate = getText(node.getElementsByTagName('valueDate')[0].childNodes)

    def clone(self):
        return FxSingleLeg()

    def toXml(self):
        xml = "<fxSingleLeg>\n"
        xml += self.exchangedCurrencies[0].toXml('exchangedCurrency1')
        xml += self.exchangedCurrencies[1].toXml('exchangedCurrency2')
        xml += "<valueDate>%s</valueDate>\n" % self.valueDate
        xml += self.exchangeRate.toXml()
        xml += "</fxSingleLeg>\n"
        return xml


class AssetFactory:
    def __init__(self):
        self.builders = {}

        self.builders['fxSingleLeg'] = FxSingleLeg()

    def isAsset(self, name):
        return self.builders.has_key(name)

    def buildFromXmlNode(self, node):
        if self.builders.has_key(node.nodeName):
            asset = self.builders[node.nodeName].clone()
            asset.fromXmlNode(node)
            return asset
        return None

assetFactory = AssetFactory()

class Trade:
    def __init__(self):
        self.tradeId = None
        self.counterparty = None
        self.tradeDate = None
        self.assets = []

    # trade is an XML DOM Node
    def fromXmlNode(self, trade):
        for child in trade.childNodes:
            if child.nodeType == child.ELEMENT_NODE:
                if child.nodeName == "tradeHeader":
                    party = child.getElementsByTagName('partyReference')[0]
                    self.counterparty = getText(party.attributes['href'].childNodes)
                    self.tradeId = getText(child.getElementsByTagName('tradeId')[0].childNodes)
                    self.tradeDate = getText(child.getElementsByTagName('tradeDate')[0].childNodes)
                elif assetFactory.isAsset(child.nodeName):
                    asset = assetFactory.buildFromXmlNode(child)
                    self.assets.append(asset)

    def toXml(self):
        xml = ''
        xml += "<trade>\n"
        xml += "  <tradeHeader>\n"
        xml += "    <partyTradeIdentifier>\n"
        xml += "      <partyReference href='%s' />\n" % self.counterparty
        xml += "      <tradeId tradeIdScheme='%s'>%s</tradeId>\n" % (tradeIdScheme, self.tradeId)
        xml += "    </partyTradeIdentifier>\n"
        xml += "    <tradeDate>%s</tradeDate>\n" % self.tradeDate
        xml += "  </tradeHeader>\n"

        for asset in self.assets:
            xml += asset.toXml()

        xml += "</trade>\n"
        return xml

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: %s <trade.xml>")
        exit(0)

    filename = sys.argv[1]

    dom = parse(filename)
    trNode = dom.getElementsByTagName('trade')[0]

    t = Trade()
    t.fromXmlNode(trNode)

    print(t.toXml())
