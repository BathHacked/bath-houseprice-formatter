#! /bin/bash 
set -v

./download.sh
./convert.sh
php upload-to-socrata.php