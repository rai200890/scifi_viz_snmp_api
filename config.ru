# frozen_string_literal: true
require 'rubygems'
require 'bundler'

Bundler.require
Dotenv.load

require './app'
run SNMPApi.new
