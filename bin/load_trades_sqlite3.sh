#!/bin/sh

if [ ! -e load_trades_sqlite3.sh ]; then
    echo "ERROR: This script must be run from the ./bin directory"
    exit 1
fi

if [ "x${DBFILE}x" == "xx" ]; then
    DBFILE=thedope.db
fi

if [ "x${TRADEDIR}x" == "xx" ]; then
    TRADEDIR=../data/example/trades
fi

python load_trades_sqlite3.py "${DBFILE}" "${TRADEDIR}"
