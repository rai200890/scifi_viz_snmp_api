# wifi_uff_location_snmp_api
 SNMP NMS JSON API

##Install on your machine

You should have [RVM](https://rvm.io/) with ruby 2.3.0 installed on your machine

Bundler gem should be installed in the global gemset for this version

### Install RVM and Bundler
```shell
rvm install 2.3.0 #install ruby 2.3.0
rvm use 2.3.0@global #select global gemset
gem install bundler  #install bundler in this gemset
```

### Install project's dependencies
```shell
rvm use 2.3.0@wifi_uff_location_snmp_api --create #create project's gemset
bundle install #install project's dependencies in this gemset
```

##Boot Vagrant machine

Make sure you have Git, VirtualBox and Vagrant installed on your machine.

```shell
  sudo apt-get install git virtualbox vagrant
```
OR install latest [Virtualbox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) packages.

```shell
vagrant up #provision machine
vagrant ssh # connect to the machine
cd /vagrant #enter synced folder(where Vagrantfile is located)
bundle install #install project's dependencies
exit #disconnect from ssh
vagrant halt #shut down machine
```

## Create config file

Create .env file using the .env_template contents

Edit this file according to your needs, by default server will run at 0.0.0.0 on port 3001

Please change API_TOKEN to secure your api

##Run app

```shell
  rackup #run server at http://0.0.0.0:3001
```

## Endpoints:

### /snmp/get
Performs SNMP GET operation retrieving channel, power and location.

#### Required parameters:
  - host
  - token

#### Optional parameters:
  - port
  - community

Response:
  - channel
  - power
  - syslocation


### /snmp/search
Performs SNMP GET operation retrieving the given fields.

#### Required parameters:
  - host
  - token
  - fields

#### Optional parameters:
  - port
  - community

Response:
 Array containing oid, name and value for the required fields
