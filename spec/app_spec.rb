describe 'SNMP API' do
  describe '/snmp_status' do
    xit 'should return snmp info from device if it can connect to device' do
      response = get '/api/snmp_statuses/0.0.0.0?token=token&oids[]=1.3.6.1.2.1.1.6.0'
      expect(response).to be_ok
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be({})
    end
  end
end
