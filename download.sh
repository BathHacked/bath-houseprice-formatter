#!/bin/bash
set -v

cd datain;
wget -q -N http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-complete.csv
wget -q https://data.bathhacked.org/api/views/vnes-itp9/rows.csv?accessType=DOWNLOAD -O Bath___North_East_Somerset_Postcodes.csv
