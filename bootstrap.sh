#!/bin/bash -ex

apt-get update;
apt-get install -yq python-dev python-pip python-setuptools build-essential curl php7.0-cli php7.0-curl git wget;
pip install csvkit;

php composer.phar install
