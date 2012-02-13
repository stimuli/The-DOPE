#!/bin/bash

if [ ! -e README ]; then
    echo "ERROR: This script must be executed from the base directory"
    exit 0
fi

VERSION=`head -1 VERSION`

BASE_FILES="README AUTHORS VERSION INSTALL"
SCRIPTS=`ls bin/*.py bin/*.sh`
XML_FILES=`ls xml/*.xml`
SQL_FILES=`find sql -name \*.sql`
DATA_FILES=`find data -name \*.xml -o -name \*.txt -o -name \*.el`

tar cvfz "thedope-${VERSION}.tgz" ${BASE_FILES} ${SCRIPTS} ${XML_FILES} ${SQL_FILES} ${DATA_FILES}

mkdir "thedope-${VERSION}"
cd "thedope-${VERSION}"
tar xvfz "../thedope-${VERSION}.tgz"
cd ..
rm "thedope-${VERSION}.tgz"
tar cvfz "thedope-${VERSION}.tgz" "thedope-${VERSION}"
rm -rf "thedope-${VERSION}"
