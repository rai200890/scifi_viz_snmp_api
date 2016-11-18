# frozen_string_literal: true
require 'snmp'
class SNMPStatusClient
  attr_reader :host, :community, :port, :version, :oids, :body, :errors

  SNMP_VERSIONS = { '1' => :SNMPv1, '2c' => :SNMPv2c }.freeze

  def initialize(params = {})
    @host = params[:host] || 'localhost'
    @community = params[:community] || 'public'
    @port = params[:port] || 161
    @version = SNMP_VERSIONS[params[:version]] || :SNMPv2c
    @oids = params[:oids]
    @body = []
    @errors = []
  end

  def get
    SNMP::Manager.open(manager_options) do |manager|
      begin
        response = manager.get(oids).varbind_list
        response.map do |item|
          oid = item.oid.join('.')
          value = item.value
          if value == SNMP::NoSuchObject or value == SNMP::NoSuchInstance
            @errors << "Couldn't fetch value for oid #{oid}"
          else
            @body << { oid: oid, value: value.to_s }
          end
        end
      rescue StandardError => e
        @errors << e.message
      end
    end
    self
  end

  def manager_options
    { host: host, community: community, version: version, port: port }
  end
end
