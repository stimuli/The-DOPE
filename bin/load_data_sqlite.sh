#!/bin/sh

if [ "x${DBFILE}x" == "xx" ]; then
    DBFILE=thedope.db
fi

LOAD_EXAMPLES=Y

SQLDIR=../sql/data/base
EXAMPLEDIR=../sql/data/example

if [ ! -d "${SQLDIR}" ]; then
    echo "ERROR: The SQL directory '${SQLDIR}' doesn't exist"
    exit 0
fi

if [ "x${LOAD_EXAMPLES}x" == "xYx" ]; then
    if [ ! -d "${EXAMPLEDIR}" ]; then
        echo "ERROR: The SQL examples directory '${EXAMPLEDIR}' doesn't exist"
        exit 0
    fi
fi
    
for f in ${SQLDIR}/*.sql; do
    sqlite3 ${DBFILE} ".read $f"
done

if [ "x${LOAD_EXAMPLES}x" == "xYx" ]; then
    echo "Loading Examples...."
    for f in ${EXAMPLEDIR}/*.sql; do
        echo "Loading "`basename $f`
        sqlite3 ${DBFILE} ".read $f"
    done
fi
