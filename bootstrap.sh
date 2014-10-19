#!/bin/bash -ex

sudo apt-get update;
sudo apt-get install -yq python-dev python-pip python-setuptools build-essential;
sudo pip install csvkit;

/vagrant/convert.sh;