#!/bin/sh

if [ "x${DBFILE}x" == "xx" ]; then
    DBFILE=thedope.db
fi

PATH_TO_SQL=../sql/sqlite3

if [ ! -d "${PATH_TO_SQL}" ]; then
    echo "${PATH_TO_SQL} must specify a valid path to your sqlite3 sql directory."
    exit 0
fi

sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/unit.sql"

sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/book_group.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/buysell_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/option_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/calendar.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/company.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/currency.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/date_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/product.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/region.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/sector.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/trade_status.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/user.sql"

sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/book.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/calendar_date.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/calendar_relation.sql"

sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/subregion.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/subsector.sql"

sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/industry.sql"

sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/company_industry.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/counterparty.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/country.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/currency_pair.sql"

sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/equity.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/dividend.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/equity_buyback.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/equity_split.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/exchange.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/trade.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/trade_type.sql"

sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/asset_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/date_roll_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/day_count_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/extrap_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/interp_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/internal_unit.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/rate_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/termstruct_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/money_market_type.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/asset.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/rate.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/rate_value.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/rate_group.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/rate_group_rate_value.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/termstruct_rate.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/termstruct.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/money_market_asset.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/swap_asset.sql"
sqlite3 ${DBFILE} ".read ${PATH_TO_SQL}/trade_asset.sql"
