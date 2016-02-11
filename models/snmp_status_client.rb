require 'active_model'
require_relative 'snmp_status'
class SNMPStatusClient
  include ActiveModel::Model
  attr_accessor :host, :community, :port, :version, :mib_modules, :fields, :response

  #SOURCE CODE: https://github.com/hallidave/ruby-snmp/blob/master/lib/snmp/manager.rb

  #UCD-SNMP-MIB::extOutput.30 - CHANNEL - 1.3.6.1.4.1.2021.8.1.101.30
  #UCD-SNMP-MIB::extOutput.31 - POWER - 1.3.6.1.4.1.2021.8.1.101.31

  def initialize params = {}
    @host = params[:host] || 'localhost'
    @community = params[:community] || 'public'
    @port = params[:port] || 161
    @version = :SNMPv2c
    @mib_modules = ["UCD-SNMP-MIB", "SNMPv2-SMI", "SNMPv2-MIB", "IF-MIB", "IP-MIB", "TCP-MIB", "UDP-MIB"]
    @fields = ['sysLocation.0', 'UCD-SNMP-MIB::extOutput.30', 'UCD-SNMP-MIB::extOutput.31']
  end

  def self.get params = {}
    client = self.new params
    SNMP::Manager.open(client.manager_options) do |manager|
      begin
        response = manager.get(client.fields).varbind_list
        parsed_response = {syslocation: response[0], channel: response[1], power: response[2]}
        client.response = SNMPStatus.new(parsed_response)
      rescue Exception => e
        client.errors.add(:base, e.message)
      end
    end
    client
  end

  def manager_options
    {host: host, community: community, version: version, port: port, mib_modules: mib_modules}
  end

end
