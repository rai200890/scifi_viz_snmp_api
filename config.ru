require 'rubygems'
require 'bundler'

Bundler.require
Dotenv.load

require './app'
run SNMPApi.new
