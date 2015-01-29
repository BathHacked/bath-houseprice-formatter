#!/bin/bash
set -v

cd datain;
wget -N http://publicdata.landregistry.gov.uk/market-trend-data/price-paid-data/a/pp-complete.csv
wget https://data.bathhacked.org/api/views/vnes-itp9/rows.csv?accessType=DOWNLOAD -O Bath___North_East_Somerset_Postcodes.csv