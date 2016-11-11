describe 'SNMP API' do
  describe '/snmp_status' do
    it 'should return snmp info from device if it can connect to device' do
      response = get '/snmp_status/0.0.0.0'
      expect(response).to be_ok
      parsed_response = JSON.parse(response.body)
      expect(parsed_response) == {}
    end
  end
end
