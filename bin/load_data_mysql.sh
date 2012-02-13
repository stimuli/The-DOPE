#!/bin/sh


DB=thedope
PATH_TO_SQL=../sql/data/base

if [ ! -d "${PATH_TO_SQL}" ]; then
    echo "${PATH_TO_SQL} must specify a valid path to your base data sql directory."
    exit 0
fi

for f in ${PATH_TO_SQL}/*.sql; do
    mysql -e "source $f" ${DB}
done
