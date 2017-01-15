# wifi_uff_location_snmp_api
 SCIFI VIZ SNMP API

##Install on your machine

You should have [RVM](https://rvm.io/) with ruby 2.3.0 installed on your machine

Bundler gem should be installed in the global gemset for this version

### Ubuntu

#### Install RVM and Bundler
```shell
sudo apt-get install -y curl
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable#install rvm latest stable version
source ~/.rvm/scripts/rvm #load rvm
rvm install 2.3.0 #install ruby 2.3.0
rvm use 2.3.0@global #select global gemset
gem install bundler  #install bundler in this gemset
```

#### Install project's dependencies
```shell
rvm use 2.3.0@wifi_uff_location_snmp_api --create #create project's gemset, only if necessary
bundle install #install project's dependencies in this gemset
```

### CentOS 6.5

#### Install RVM and Bundler
```shell
yum install -y curl
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.3.0 #install ruby 2.3.0
rvm use 2.3.0@global #select global gemset
gem install bundler  #install bundler in this gemset
```
#### Install project's dependencies
```shell
rvm use 2.3.0@wifi_uff_location_snmp_api --create #create project's gemset, only if necessary
bundle install #install project's dependencies in this gemset
```

## Create config file

Create .env file using the .env_template contents

Edit this file according to your needs, by default server will run at 0.0.0.0 on port 3001

Please change API_TOKEN to secure your api

##Run app

```shell
  rackup -o 0.0.0.0 -p 3001 #run server at http://0.0.0.0:3001
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
