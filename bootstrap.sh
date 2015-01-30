#!/bin/bash -ex

sudo apt-get update;
sudo apt-get install -yq python-dev python-pip python-setuptools build-essential curl php5-cli php5-curl git wget;
sudo pip install csvkit;

php composer.phar install