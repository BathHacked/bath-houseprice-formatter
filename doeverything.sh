#! /bin/bash 
set -v

cd /vagrant
./download.sh
./convert.sh
php upload-to-socrata.php