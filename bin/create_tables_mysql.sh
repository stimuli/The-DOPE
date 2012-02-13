#!/bin/sh


DB=thedope
PATH_TO_SQL=../sql/mysql

if [ ! -d "${PATH_TO_SQL}" ]; then
    echo "${PATH_TO_SQL} must specify a valid path to your mysql sql directory."
    exit 0
fi

mysql -e "source ${PATH_TO_SQL}/unit.sql" ${DB}

mysql -e "source ${PATH_TO_SQL}/book_group.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/buysell_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/option_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/calendar.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/company.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/currency.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/date_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/product.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/region.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/sector.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/trade_status.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/user.sql" ${DB}

mysql -e "source ${PATH_TO_SQL}/book.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/calendar_date.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/calendar_relation.sql" ${DB}

mysql -e "source ${PATH_TO_SQL}/subregion.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/subsector.sql" ${DB}

mysql -e "source ${PATH_TO_SQL}/industry.sql" ${DB}

mysql -e "source ${PATH_TO_SQL}/company_industry.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/counterparty.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/country.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/currency_pair.sql" ${DB}

mysql -e "source ${PATH_TO_SQL}/equity.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/dividend.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/equity_buyback.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/equity_split.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/exchange.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/trade.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/trade_type.sql" ${DB}

mysql -e "source ${PATH_TO_SQL}/asset_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/date_roll_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/day_count_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/extrap_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/interp_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/internal_unit.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/rate_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/termstruct_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/money_market_type.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/asset.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/rate.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/rate_value.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/rate_group.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/rate_group_rate_value.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/termstruct_rate.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/termstruct.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/money_market_asset.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/swap_asset.sql" ${DB}
mysql -e "source ${PATH_TO_SQL}/trade_asset.sql" ${DB}
