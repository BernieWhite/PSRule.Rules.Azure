// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@sys.description('The name of the resource.')
param name string

@sys.description('The location resources will be deployed.')
param location string = resourceGroup().location

@sys.description('The subnet ID for the NIC.')
param subnetId string

// An example network interface card.
resource nic 'Microsoft.Network/networkInterfaces@2024-05-01' = {
  name: name
  location: location
  properties: {
    dnsSettings: {
      dnsServers: []
    }
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnetId
          }
        }
      }
    ]
  }
}
