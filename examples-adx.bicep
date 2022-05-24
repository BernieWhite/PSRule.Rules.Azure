// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the Data Explorer cluster.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example data explorer cluster
resource adx 'Microsoft.Kusto/clusters@2021-08-27' = {
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
