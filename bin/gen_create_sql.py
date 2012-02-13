#!/usr/bin/python
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
#
import sys
import Turbine

if len(sys.argv) != 3:
    print("USAGE: %s <dbtype> <file.xml>" % sys.argv[0])
    print(" the dbtype parameter can be one of the following (so far):")
    for dbt in Turbine.KNOWN_DB_TYPES:
        print("    %s" % dbt)
    exit(0)

dbtype = sys.argv[1]
filename = sys.argv[2]

Turbine.setDbType(dbtype)

schema = Turbine.Schema()
schema.initFromFile(filename)
for table in schema.tables:
    print(table.toSql())
