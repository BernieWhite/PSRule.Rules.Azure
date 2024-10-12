// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example Redis Cache.
resource cache 'Microsoft.Cache/redis@2024-03-01' = {
  name: name
  location: location
  properties: {
    redisVersion: '6'
    sku: {
      name: 'Premium'
      family: 'P'
      capacity: 1
    }
    redisConfiguration: {
      'aad-enabled': 'True'
      'maxmemory-reserved': '615'
    }
    enableNonSslPort: false
    publicNetworkAccess: 'Disabled'
  }
  zones: [
    '1'
    '2'
    '3'
  ]
}

// An example firewall rule for Redis Cache.
resource rule 'Microsoft.Cache/redis/firewallRules@2024-03-01' = {
  parent: cache
  name: 'allow-on-premises'
  properties: {
    startIP: '10.0.1.1'
    endIP: '10.0.1.31'
  }
}
