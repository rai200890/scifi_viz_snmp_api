# wifi_uff_location_snmp_api
 SNMP NMS JSON API

## Endpoints:

### /snmp/get
Performs SNMP GET operation retrieving channel, power and location. 

#### Required parameters:
  - host 
  - token

#### Optional parameters:
  - port
  - community

Response:
  - channel
  - power
  - syslocation


### /snmp/search
Performs SNMP GET operation retrieving the given fields. 

#### Required parameters:
  - host 
  - token
  - fields
  
#### Optional parameters:
  - port
  - community

Response:
 Array containing oid, name and value for the required fields
