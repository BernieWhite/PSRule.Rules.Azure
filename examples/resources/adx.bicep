// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the Data Explorer cluster.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

@description('An example data explorer cluster using a managed identity.')
resource adx 'Microsoft.Kusto/clusters@2023-08-15' = {
  name: name
  location: location
  sku: {
    name: 'Standard_D11_v2'
    tier: 'Standard'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    enableDiskEncryption: true
  }
}
