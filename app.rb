# frozen_string_literal: true
require "sinatra/json"
require 'sinatra'
require_relative 'models/init'

class SNMPApi < Sinatra::Application
  configure do
    set :server, :puma
    set :bind, ENV['BIND']
    set :port, ENV['PORT']
  end

  def valid_token?(token)
    ENV['API_TOKEN'] == token
  end

  before do
    halt 401 unless valid_token? params[:token]
  end

  get '/api/snmp_statuses/:host' do
    content_type :json
    snmp_status = SNMPStatusClient.new(params).get
    if snmp_status.errors.any?
      halt 422, json({errors: snmp_status.errors})
    else
      halt 200, json(snmp_status.body)
    end
  end
end
