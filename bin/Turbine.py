#!/usr/bin/python
#
# @author Brett Hutley <brett@hutley.net>
#
# @desc This file provides some classes for parsing Turbine XML
# files and producing SQL schema output.
#
#  Copyright 2009 Brett Hutley <brett@hutley.net>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

import sys, os, glob
from xml.dom import minidom

KNOWN_DB_TYPES = [ "sqlite3", "mysql" ]
DBTYPE = "sqlite3"

AUTOINCREMENT = "AUTOINCREMENT"
#AUTOINCREMENT = "AUTO_INCREMENT"

def setDbType(dbtype):
    global AUTOINCREMENT

    dbtype = dbtype.lower()

    if dbtype == "sqlite3":
        AUTOINCREMENT = "AUTOINCREMENT"
    elif dbtype == "mysql":
        AUTOINCREMENT = "AUTO_INCREMENT"
    else:
        errmsg = "ERROR: Unknown dbtype '" + dbtype + "'\n" + \
            " the dbtype parameter can be one of the following (so far):\n"
        for dbt in KNOWN_DB_TYPES:
            errmsg += "    " + dbt + "\n"
        raise(RuntimeError(errmsg))

class Column:

    def __init__(self):
        self.name = None
        self.description = None
        self.type = None
        self.size = 0
        self.precision = 0
        self.scale = 0
        self.primaryKey = False
        self.autoIncrement = False
        self.required = False

    def fromXml(self, xmlNode):
        if xmlNode.tagName != "column":
            raise "Error: fromXml() parsed in Node must be a 'column' element"

        self.name = xmlNode.attributes['name'].value
        self.type = xmlNode.attributes['type'].value
        self.required = (xmlNode.attributes['required'].value == 'true')

        if self.type == 'CHAR' or self.type == 'VARCHAR':
            self.size = int(xmlNode.attributes['size'].value)
        elif self.type == 'NUMERIC':
            sizeStr = xmlNode.attributes['size'].value
            flds = sizeStr.split(",")
            if len(flds) == 2:
                self.precision = int(flds[0])
                self.scale = int(flds[1])
            else:
                self.precision = int(flds[0])

        self.primaryKey = (xmlNode.attributes.has_key('primaryKey') and xmlNode.attributes['primaryKey'].value == 'true')
        self.autoIncrement = (xmlNode.attributes.has_key('autoIncrement') and xmlNode.attributes['autoIncrement'].value == 'true')

    def toSql(self):
        sql = self.name
        sql += " " + self.type
        if self.type == 'CHAR' or self.type == 'VARCHAR':
            sql += "(" + str(self.size) + ")"
        elif self.type == 'NUMERIC':
            if self.scale > 0:
                sql += "(" + str(self.precision) + "," + str(self.scale) + ")"
            else:
                sql += "(" + str(self.precision) + ")"

        if self.required:
            sql += " NOT NULL"

        if self.primaryKey:
            sql += " PRIMARY KEY"

        if self.type == 'TIMESTAMP':
            sql += " DEFAULT CURRENT_TIMESTAMP"
        
        if self.autoIncrement:
            sql += " " + AUTOINCREMENT
        return sql

    def isNumericType(self):
        return self.type == "INTEGER" or self.type == "DOUBLE" or self.type == "NUMERIC" or self.type == "FLOAT"


class ForeignKey:
    def __init__(self):
        self.foreignTable = None
        self.localCol = None
        self.foreignCol = None

    def fromXml(self, xmlNode):
        references = xmlNode.getElementsByTagName('reference')
        reference = references[0]
        self.localCol = reference.attributes['local'].value
        self.foreignCol = reference.attributes['foreign'].value
        self.foreignTable = xmlNode.attributes['foreignTable'].value

    def toSql(self):
        return "FOREIGN KEY (" + self.localCol + ") REFERENCES " + self.foreignTable + "(" + self.foreignCol + ")"

class IndexRef:
    def __init__(self):
        self.name = None
        self.columnNames = []

    def fromXml(self, xmlNode):
        self.name = xmlNode.attributes['name'].value
        indexColumns = xmlNode.getElementsByTagName('index-column')

        for indexColumn in indexColumns:
            self.columnNames.append(indexColumn.attributes['name'].value)

    def toSql(self, tableName):
        sql = "CREATE INDEX " + self.name + " ON " + tableName + "("
        for indexColumn in self.columnNames:
            sql += indexColumn
            if indexColumn != self.columnNames[len(self.columnNames)-1]:
                sql += ","
        sql += ");"
        return sql

class UniqueRef:
    def __init__(self):
        self.name = None
        self.columnNames = []

    def fromXml(self, xmlNode):
        self.name = xmlNode.attributes['name'].value
        indexColumns = xmlNode.getElementsByTagName('unique-column')

        for indexColumn in indexColumns:
            self.columnNames.append(indexColumn.attributes['name'].value)

    def toSql(self, tableName):
        sql = "CREATE UNIQUE INDEX " + self.name + " ON " + tableName + "("
        for indexColumn in self.columnNames:
            sql += indexColumn
            if indexColumn != self.columnNames[len(self.columnNames)-1]:
                sql += ","
        sql += ");"
        return sql


class Table:
    def __init__(self):
        self.name = None
        self.columns = []
        self.foreignKeys = []
        self.uniques = []
        self.indices = []
        self.columnsByName = {}

    def fromXml(self, xmlNode):
        self.name = xmlNode.attributes["name"].value
        for child in xmlNode.childNodes:
            if child.nodeType == child.ELEMENT_NODE:
                if child.tagName == 'column':
                    column = Column()
                    column.fromXml(child)
                    self.columns.append(column)
                    self.columnsByName[column.name] = column
                elif child.tagName == 'foreign-key':
                    forKey = ForeignKey()
                    forKey.fromXml(child)
                    self.foreignKeys.append(forKey)
                elif child.tagName == 'unique':
                    indexRef = UniqueRef()
                    indexRef.fromXml(child)
                    self.uniques.append(indexRef)
                elif child.tagName == 'index':
                    indexRef = IndexRef()
                    indexRef.fromXml(child)
                    self.indices.append(indexRef)

    def toSql(self):
        sql = ''
        sql += "drop table if exists " + self.name + ";\n\n"
        sql += "create table " + self.name + " (\n"

        for column in self.columns:
            sql += "  " + column.toSql()
            if len(self.foreignKeys) > 0 or column != self.columns[len(self.columns)-1]:
                sql += ","
            sql += "\n"

        for foreignKey in self.foreignKeys:
            sql += "  " + foreignKey.toSql()
            if foreignKey != self.foreignKeys[len(self.foreignKeys)-1]:
                sql += ","
            sql += "\n"


        sql += ");\n"

        if len(self.uniques) > 0:
            sql += "\n"
        for unique in self.uniques:
            sql += unique.toSql(self.name) + "\n"

        if len(self.indices) > 0:
            sql += "\n"
        for index in self.indices:
            sql += index.toSql(self.name) + "\n"

        return sql

    def getPrimaryKey(self):
        for col in self.columns:
            if col.primaryKey:
                return col
        return None

class Schema:
    def __init__(self):
        self.tables = []
        self.tablesByName = {}

    def initFromFile(self, filename):
        xmldoc = minidom.parse(filename)

        tables = xmldoc.getElementsByTagName('table')
        for table in tables:
            t = Table()
            t.fromXml(table)
            self.tables.append(t)
            self.tablesByName[t.name] = t

    def initFromDirectory(self, dirname):
        for filename in glob.glob(os.path.join(dirname, '*.xml')):
            self.initFromFile(filename)


