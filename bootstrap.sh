#!/bin/bash -ex

sudo apt-get update;
sudo apt-get install -yq python-dev python-pip python-setuptools build-essential curl php7.0-cli php7.0-curl git wget;
sudo pip install csvkit;

php composer.phar install
