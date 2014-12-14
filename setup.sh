#!/bin/bash

# ================= basic setup =================
sudo chmod a+w /etc/apt/sources.list
# percona
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
echo "deb http://repo.percona.com/apt trusty main" >> /etc/apt/sources.list
echo "deb-src http://repo.percona.com/apt trusty main" >> /etc/apt/sources.list
# postgres
sudo touch /etc/apt/sources.list.d/pgdg.list
sudo chmod a+w /etc/apt/sources.list.d/pgdg.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

sudo apt-get update
sudo apt-get -y install python-dev

# install percona
sudo debconf-set-selections <<< 'percona-server-server percona-server-server/root_password password t0ps3kr3t'
sudo debconf-set-selections <<< 'percona-server-server percona-server-server/root_password_again password t0ps3kr3t'
sudo apt-get -y install percona-server-server-5.6

# install postgres
sudo apt-get -y install postgresql-9.3 postgresql-9.3-postgis-2.1
sudo apt-get -y install postgresql-server-dev-9.3

# install mongodb
sudo apt-get install -y mongodb-org

# ================= server setup =================
sudo apt-get -y install libmysqlclient-dev

# percona setup
sudo cp /data/conf/my.cnf /etc/mysql/my.cnf
sudo mysql -u root -pt0ps3kr3t -e "create user 'jesse'@'%' identified by 'jesse'"
sudo mysql -u root -pt0ps3kr3t -e "grant all privileges on *.* to 'jesse'@'%' with grant option"
sudo service mysql restart

# setup postgres and postgis
sudo -H -u postgres bash -c "psql -c \"alter user postgres with password 'postgres'\""
createdb () {
	sudo -H -u postgres bash -c "createdb $1"
	sudo -H -u postgres bash -c "psql -d $1 -c \"create extension postgis\""
	sudo -H -u postgres bash -c "psql -d $1 -c \"create extension postgis_topology\""
	sudo -H -u postgres bash -c "psql -d $1 -c \"create extension hstore\""
}
createdb 'main'
# change md5 login and ip bind
sudo cp /data/conf/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
sudo cp /data/conf/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
sudo service postgresql restart

# setup mongodb
