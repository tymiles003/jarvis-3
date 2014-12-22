# Jarvis Vagrant Machine

![](http://img4.wikia.nocookie.net/__cb20130421191808/marvelmovies/images/0/06/J.A.R.V.I.S..jpg)

The goal of this Vagrant machine is to provide a basic Python development environment. Initial provisioning will install multiple database technologies, some very useful command line tools, and a few system wide Python packages.

### Box Info:

* Host Name: Jarvis
* Operating System: Ubuntu 14.04 "Trusty"
* IP Address: 33.33.33.3
* CPU Count: 1
* Memory: 2048 MB
* Host: `/path/to/Jarvis/data` --> Vagrant: `/data`


## Setup

* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html)
* Clone this repo
  * `git clone https://github.com/jadametz/jarvis.git`
* Navigate to the root of the cloned repo and `vagrant up`
* `vagrant ssh` after setup and provisioning to login to the box


## Provisioning

The first time you run `vagrant up` the box will be provisioned with the following:

|Databases|Web|Command Line|Python|
|---------|---|------------|------|
|[Percona MySQL v5.6](http://www.percona.com/services/mysql-5.6-solutions-from-percona)|[nginx](http://nginx.org/en/)|[htop](http://hisham.hm/htop/)|python-dev|
|[PostgreSQL 9.4](http://www.postgresql.org/download/linux/ubuntu/)||[ifstat](http://dev.man-online.org/man1/ifstat/)|[python-pip](https://pypi.python.org/pypi/pip)|
|[MongoDB](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/)||[mutt](http://www.mutt.org/)|python-setuptools|
||||build-essential|
||||[virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/)|
||||[csvkit](https://csvkit.readthedocs.org/en/0.9.0/)|


## Configuration Files

Files used during provisioning for configuration are located at `/path/to/Jarivs/data/conf`
