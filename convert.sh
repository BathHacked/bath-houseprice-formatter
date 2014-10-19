#! /bin/bash 
set -v
cd /vagrant

#Create a list of all possible postcodes
csvcut datain/Bath___North_East_Somerset_Postcodes.csv -c 2 > intermediate/1-allpostcodes.csv

#Extract the lat/long centroids and postcodes from the postcodes file (they are not separate columns in the original postcodes file).
csvcut -c 2,5 datain/Bath___North_East_Somerset_Postcodes.csv | tail --lines=+2 > intermediate/2-postcodeswithcentroids.csv
echo "postcode, latitude, longitude" > intermediate/3-postcodeswithlatlng.csv
sed "s/[\"\(\)]//g" intermediate/2-postcodeswithcentroids.csv >> intermediate/3-postcodeswithlatlng.csv

#Add a header row.
echo "Transaction Unique Identifier,Price,Date of Transfer,Postcode,Property Type,Old/New,Duration,Primary Addressable Object Name,Secondary Addressable Object Name,Locality,Town/City,District,County,Location,Status" > intermediate/4-filteredtobathpostcodesonly.csv

#Filter the list of sales to only those which contain a Bath postcode.
csvgrep -c 4 -f intermediate/1-allpostcodes.csv datain/pp-complete.csv >> intermediate/4-filteredtobathpostcodesonly.csv

#Filter again because csvgrep always copies the first line (Bug: https://github.com/onyxfish/csvkit/issues/254).
csvgrep -c 4 -f intermediate/1-allpostcodes.csv intermediate/4-filteredtobathpostcodesonly.csv >> intermediate/5-filteredtobathpostcodesonly.csv

#Rejoin the possible postcodes to the filtered list so we can add the centroid.
csvjoin -c 1,4 intermediate/3-postcodeswithlatlng.csv intermediate/5-filteredtobathpostcodesonly.csv > intermediate/6-filteredwithlatlng.csv

#Select and order the columns to keep.
csvcut -c 4,5,6,7,8,9,10,11,12,13,14,15,16,17,2,3 intermediate/6-filteredwithlatlng.csv > intermediate/7-usefulcolumns.csv



cp intermediate/7-usefulcolumns.csv output.csv