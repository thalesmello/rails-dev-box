#!/usr/bin/env bash

# Support functions
language_setting () {
  for SETTING in $@
  do
    sudo echo export $1 >> /etc/bash.bashrc
    export $1
  done
}

insert_source () {
  sed -i "1s|^|`echo $2`\n|" /etc/apt/sources.list
}

apt_install () {
  sudo apt-get install -y $@
}

language_setting 'LANGUAGE=en_US.UTF-8' 'LANG=en_US.UTF-8' 'LC_ALL=en_US.UTF-8'

# Enabling geo-location apt-mirrors
insert_source 'deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse'
insert_source 'deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse'
insert_source 'deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse'
insert_source 'deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse'

sudo apt-get update

# General tools
apt_install git vim curl python-software-properties

# PostgreSQL 9.2
sudo add-apt-repository -y ppa:pitti/postgresql
sudo apt-get update
apt_install postgresql-9.2 postgresql-server-dev-9.2 stgresql-contrib-9.2 postgresql postgresql-client libpq-dev

# Creates Vagrant user
sudo -u postgres createuser vagrant -s

# Remaining packages
apt_install redis-server mongodb install memcached libxslt-dev g++

# Elastic Search 1.0.1
apt_install openjdk-7-jre-headless qt4-dev-tools libqt4-dev libqt4-core libqt4-gui # Dependencies
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.deb
sudo dpkg -i elasticsearch-1.0.1.deb
rm elasticsearch-1.0.1.deb

# PhantomJS
cd /usr/local/share
sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.6-linux-x86_64.tar.bz2
sudo tar xjf phantomjs-1.9.6-linux-x86_64.tar.bz2
sudo ln -s /usr/local/share/phantomjs-1.9.6-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.6-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.6-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

# Heroku Toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

