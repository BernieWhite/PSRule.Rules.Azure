// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the App Configuration Store.')
param name string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example App Configuration Store
resource store 'Microsoft.AppConfiguration/configurationStores@2022-05-01' = {
  name: name
  location: location
  sku: {
    name: 'standard'
  }
  properties: {
    disableLocalAuth: true
    enablePurgeProtection: true
  }
}
