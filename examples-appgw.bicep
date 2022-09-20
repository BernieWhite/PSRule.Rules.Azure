// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

@description('The name of the Application Gateway.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

resource name_resource 'Microsoft.Network/applicationGateways@2019-09-01' = {
  name: name
  location: location
  zones: [
    '1'
    '2'
    '3'
  ]
  tags: {}
  properties: {
    sku: {
      name: 'WAF_v2'
      tier: 'WAF_v2'
    }
    gatewayIPConfigurations: []
    frontendIPConfigurations: []
    frontendPorts: []
    backendAddressPools: []
    backendHttpSettingsCollection: []
    httpListeners: []
    requestRoutingRules: []
    enableHttp2: false
    sslCertificates: []
    probes: []
    autoscaleConfiguration: {
      minCapacity: 2
      maxCapacity: 3
    }
    webApplicationFirewallConfiguration: {
      enabled: true
      firewallMode: 'Detection'
      ruleSetType: 'OWASP'
      ruleSetVersion: '3.0'
    }
  }
}
