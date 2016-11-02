# frozen_string_literal: true
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

  get '/snmp/get' do
    snmp_status = SNMPStatusClient.get(host: params[:host],
                                       community: params[:community], port: params[:port],
                                       version: params[:version])
    if snmp_status.errors.any?
      status 422
    else
      json snmp_status.response
    end
  end

  get '/snmp/search' do
    snmp_status = SNMPStatusClient.search(host: params[:host],
                                          community: params[:community], port: params[:port],
                                          version: params[:version], fields: params[:fields])
    if snmp_status.errors.any?
      status 422
    else
      json snmp_status.response
    end
  end
end

#   mock_object = {
#   syslocation: {
#     name: "SNMPv2-MIB::sysLocation.0",
#     oid: "1.3.6.1.2.1.1.6.0",
#     value: "Sitting on the Dock of the Bay"
#   },
#   channel: {
#     name: "SNMPv2-SMI::enterprises.2021.8.1.101.30",
#     oid: "1.3.6.1.4.1.2021.8.1.101.30",
#     value: [1,6,11].sample#(1..11).to_a.sample
#   },
#   power: {
#     name: "SNMPv2-SMI::enterprises.2021.8.1.101.31",
#     oid: "1.3.6.1.4.1.2021.8.1.101.31",
#     value: [0,4,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20].sample
#   }
# }
