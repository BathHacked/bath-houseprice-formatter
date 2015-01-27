bath-houseprice-formatter
==============

Takes the Land Registry Houseprice Price Paid data, filters it to houses sold within BANES and formats it for input into the [BathHacked datastore](https://data.bathhacked.org/)

**Usage**

To install dependencies on ubuntu, run bootstrap.sh.

If you're on Windows or don't have the dependencies installed, install vagrant, then run:

    vagrant up
    
Vagrant will boot a VM, and install the dependencies. Then use vagrant ssh and proceed as below.

Either run doeverything.sh (which does the following 3), or run the following scripts in order:

*Download.sh*
Run download.sh to populate /datain with the latest complete house-price registry data from:
https://www.gov.uk/government/statistical-data-sets/price-paid-data-downloads#history
(csv file direct link: http://publicdata.landregistry.gov.uk/market-trend-data/price-paid-data/a/pp-complete.csv)

And the latest version of the bathnes postcodes from:
https://data.bathhacked.org/Government-and-Society/Bath-North-East-Somerset-Postcodes/vnes-itp9

*convert.sh*
Takes the files in /datain, processes them through several steps. At the end, output.csv will be created which can then be imported to Socrata.

*upload-to-socrata.php*
Uploads the output.csv file to socrata. Upserts using the transaction_unique_identifier as ID.




Source code (excluding data) is licensed under the [MIT License](http://opensource.org/licenses/MIT)

