#!/usr/bin/env bash

sudo echo export LANGUAGE=en_US.UTF-8 >> /etc/bash.bashrc
sudo echo export LANG=en_US.UTF-8 >> /etc/bash.bashrc
sudo echo export LC_ALL=en_US.UTF-8 >> /etc/bash.bashrc

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Enabling geo-location apt-mirrors
sed -i '1s/^/deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse\n/' /etc/apt/sources.list
sed -i '1s/^/deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse\n/' /etc/apt/sources.list
sed -i '1s/^/deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse\n/' /etc/apt/sources.list
sed -i '1s/^/deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse\n/' /etc/apt/sources.list

sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y vim
sudo apt-get install -y curl
sudo apt-get install -y python-software-properties

# PostgreSQL
sudo add-apt-repository -y ppa:pitti/postgresql
sudo apt-get update
sudo apt-get install -y postgresql-9.2 postgresql-server-dev-9.2 po stgresql-contrib-9.2 postgresql postgresql-client libpq-dev
# sudo apt-get install -y postgresql postgresql-client libpq-dev postgresql-contrib-9.1
sudo -u postgres createuser vagrant -s

sudo apt-get install -y redis-server
sudo apt-get install -y mongodb
sudo apt-get install -y install memcached
sudo apt-get install -y libxslt-dev
sudo apt-get install -y g++

# Elastic Search
sudo apt-get install -y openjdk-7-jre-headless -y
sudo apt-get install -y qt4-dev-tools libqt4-dev libqt4-core libqt4-gui
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.deb
sudo dpkg -i elasticsearch-1.0.1.deb
rm elasticsearch-1.0.1.deb

# PhantomJS
# sudo apt-get install -y phantomjs
cd /usr/local/share
sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.6-linux-x86_64.tar.bz2
sudo tar xjf phantomjs-1.9.6-linux-x86_64.tar.bz2
sudo ln -s /usr/local/share/phantomjs-1.9.6-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.6-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.6-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

