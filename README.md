bath-houseprice-formatter
==============

Takes the Land Registry Houseprice Price Paid data, filters it to houses sold within BANES and formats it for input into the [BathHacked datastore](https://data.bathhacked.org/)

**Usage**

Get the latest house-price registry data from:
https://www.gov.uk/government/statistical-data-sets/price-paid-data-downloads#history 
(csv file direct link: http://publicdata.landregistry.gov.uk/market-trend-data/price-paid-data/a/pp-complete.csv)

And the latest version of the bathnes postcodes from: 
https://data.bathhacked.org/Government-and-Society/Bath-North-East-Somerset-Postcodes/vnes-itp9

Put these input files in the datain directory and run convert.sh.

output.csv will be created which can then be imported to Socrata.

To install dependencies on ubuntu, run bootstrap.sh.

If you're on Windows or don't have the dependencies installed, install vagrant, then run:

    vagrant up
    
Vagrant will boot a VM, install the dependencies, and run convert.sh.

Source code (excluding data) is licensed under the [MIT License](http://opensource.org/licenses/MIT)

