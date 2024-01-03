// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the resource.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('The resource ID for the subnet to connect to.')
param subnetId string

@description('The resource ID of the public IP address to use.')
param pipId string

// An example Virtual Network Gateway with availablity zone aware SKU.
resource vng 'Microsoft.Network/virtualNetworkGateways@2023-06-01' = {
  name: name
  location: location
  properties: {
    gatewayType: 'Vpn'
    ipConfigurations: [
      {
        name: 'default'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnetId
          }
          publicIPAddress: {
            id: pipId
          }
        }
      }
    ]
    vpnType: 'RouteBased'
    vpnGatewayGeneration: 'Generation2'
    sku: {
      name: 'VpnGw1AZ'
      tier: 'VpnGw1AZ'
    }
  }
}
