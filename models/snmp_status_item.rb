# frozen_string_literal: true
require 'active_model'
class SNMPStatusItem
  include ActiveModel::Serialization
  include ActiveModel::Serializers::JSON

  attr_accessor :oid, :name, :value

  def attributes
    { 'oid' => oid, 'name' => name, 'value' => value }
  end

  def initialize(varbind_list)
    @oid = varbind_list.name.to_a.join('.')
    @name = varbind_list.name.to_s
    @value = varbind_list.value == SNMP::NoSuchObject ? nil : varbind_list.value.to_s
  end
end
