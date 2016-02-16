require 'active_model'
class SNMPStatus
  include ActiveModel::Serialization
  include ActiveModel::Serializers::JSON

  attr_accessor :syslocation, :channel, :power

    def attributes
      {'syslocation' => syslocation, 'channel' => channel, 'power' => power}
    end

  def initialize params = {}
    @syslocation = SNMPStatusItem.new(params[:syslocation])
    @channel = SNMPStatusItem.new(params[:channel])
    @power = SNMPStatusItem.new(params[:power])
  end

end
