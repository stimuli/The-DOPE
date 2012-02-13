#!/usr/bin/python
import sys
from xml.dom import minidom
import Turbine

if len(sys.argv) != 4:
    print("USAGE: %s <xmldir> <data.txt> <data.xml>" % sys.argv[0])
    exit(0)

xmldir = sys.argv[1]
datafilename = sys.argv[2]
defnfilename = sys.argv[3]

schema = Turbine.Schema()
schema.initFromDirectory(xmldir)

xmldoc = minidom.parse(defnfilename)

dataDefs = xmldoc.getElementsByTagName('data')
dataDef = dataDefs[0]
tableName = dataDef.attributes['table'].value
table = schema.tablesByName[tableName]

fieldDelimiter = "\t"
fieldQuoted = False
fieldQuoteChar = '"'
if dataDef.attributes.has_key('fieldDelimiter'):
    fieldDelimiter = dataDef.attributes['fieldDelimiter'].value

    if fieldDelimiter == "\\t":
        fieldDelimiter = "\t"

if dataDef.attributes.has_key('fieldQuoted'):
    isQuoted = dataDef.attributes['fieldQuoted'].value
    if isQuoted == 'true':
        fieldQuoted = True

if fieldQuoted and dataDef.attributes.has_key('fieldQuoteChar'):
    fieldQuoteChar = dataDef.attributes['fieldQuoteChar'].value

cols = []
columns = dataDef.getElementsByTagName('column')
for column in columns:
    offset = int(column.attributes['offset'].value)
    tableCol = column.attributes['tableColumn'].value

    while offset >= len(cols):
        cols.append(None)

    cols[offset] = tableCol

datafile = open(datafilename, "r")
for line in datafile:
    line = line.rstrip()

    fields = []
    if not fieldQuoted:
        fields = line.split(fieldDelimiter)
    else:
        # each field is quoted
        flds = line.split(fieldDelimiter)
        fieldOffset = 0
        for i in range(0, len(flds)):
            # first strip any white space
            val = flds[i].strip()
            if val[0:len(fieldQuoteChar)] != fieldQuoteChar:
                if len(fields) >= fieldOffset:
                    # if we are growing the current field, because we didn't find the end delimiter
                    
                    if val[len(val)-len(fieldQuoteChar):] == fieldQuoteChar:
                        # Have we found the end delimiter?
                        val = flds[i].rstrip().rstrip(fieldQuoteChar)
                        fields[fieldOffset] = fields[fieldOffset] + fieldDelimiter + val
                        fieldOffset = fieldOffset + 1
                    else:
                        fields[fieldOffset] = fields[fieldOffset] + fieldDelimiter + flds[i]
                else:
                    print("ERROR at row %d. Field %d is not quoted" % row)
                    exit(0)
            else:
                val = val.lstrip(fieldQuoteChar)
                if val[len(val)-len(fieldQuoteChar):] == fieldQuoteChar:
                    val = val.rstrip(fieldQuoteChar)

                    while fieldOffset >= len(fields):
                        fields.append(None)

                    fields[fieldOffset] = val
                    fieldOffset = fieldOffset + 1
                else:
                    while fieldOffset >= len(fields):
                        fields.append(None)

                    fields[fieldOffset] = flds[i].lstrip().lstrip(fieldQuoteChar)
    sys.stdout.write("INSERT INTO " + tableName + "(")
    for i in range(0, len(cols)):
        if i > 0:
            sys.stdout.write(",")
        sys.stdout.write(cols[i])
    sys.stdout.write(") VALUES (")

    for i in range(0, len(cols)):
        if i > 0:
            sys.stdout.write(",")
        val = fields[i]
        val = val.replace("'", "''")
        colName = cols[i]
        if val == "*NULL*":
            sys.stdout.write('null')
        else:
            col = table.columnsByName[colName]
            if col.isNumericType():
                sys.stdout.write(val)
            else:
                sys.stdout.write("'" + val + "'")
    sys.stdout.write(");\n")
datafile.close()

