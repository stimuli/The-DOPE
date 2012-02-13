#!/bin/sh

XMLDIR=../xml

if [ ! -d "${XMLDIR}" ]; then
    echo "ERROR: The XML directory '${XMLDIR}' doesn't exist"
    exit 0
fi

for od in base example; do
    DATADIR=../data/$od
    OUTPUTDIR=../sql/data/$od

    if [ ! -d "${DATADIR}" ]; then
        echo "ERROR: The data directory '${DATADIR}' doesn't exist"
        exit 0
    fi

    if [ ! -d "${OUTPUTDIR}" ]; then
        echo "ERROR: The output directory '${OUTPUTDIR}' doesn't exist"
        exit 0
    fi

    for f in ${DATADIR}/*.txt; do
        BN=`basename $f .txt`
        XMLFILE=${DATADIR}/${BN}.xml
        if [ -e "${XMLFILE}" ]; then
            python gen_data_sql.py "${XMLDIR}" "$f" "${XMLFILE}" > "${OUTPUTDIR}/${BN}.sql"
        fi
    done
done
