#!/usr/bin/env bash
#Install RVM
sudo apt-get install -y curl
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
#Install ruby
rvm install 2.3.0
rvm use 2.3.0@global
gem install bundler
