// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@minLength(1)
@maxLength(80)
@sys.description('The name of the resource.')
param name string

@sys.description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example zone redundant public IP address
resource pip 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
  name: name
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
  }
  zones: [
    '1'
    '2'
    '3'
  ]
}
