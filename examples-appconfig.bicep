// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the App Configuration Store.')
param storeName string

@description('The location resources will be deployed.')
param location string = resourceGroup().location

// An example App Configuration Store
resource configStore 'Microsoft.AppConfiguration/configurationStores@2020-06-01' = {
  name: storeName
  location: location
  sku: {
    name: 'standard'
  }
}
