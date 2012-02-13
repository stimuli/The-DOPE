#!/bin/bash
if [ ! -e gen_create_sql.py ]; then
    echo "ERROR: This script must be executed from the 'bin' directory!"
    exit 0
fi

usage()
{
    echo "USAGE: $0 <subdir>"
    echo " where subdir is a subdirectory under the ../sql directory"
}

if [ $# -ne 1 ]; then
    usage
    exit 0
fi

OUTPUTPATH="../sql/$1"
DBTYPE=$1

if [ ! -d "${OUTPUTPATH}" ]; then
    usage
    exit 0
fi

for f in ../xml/*.xml; do
    BN=`basename $f .xml`
    ./gen_create_sql.py $DBTYPE "$f" > "${OUTPUTPATH}/${BN}.sql"
done
