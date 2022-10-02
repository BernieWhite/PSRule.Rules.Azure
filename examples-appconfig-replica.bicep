// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Bicep documentation examples

@description('The name of the app configuration store.')
param appConfigName string = 'configstore01'

@description('The name of the replica.')
param replicaName string = 'replica01'

@description('The location resources will be deployed.')
param appConfigLocation string = resourceGroup().location

@description('The location where the replica will be deployed.')
param replicaLocation string = 'northeurope' 

// An example App Configuration Store
resource store 'Microsoft.AppConfiguration/configurationStores@2022-05-01' = {
  name: appConfigName
  location: appConfigLocation
  sku: {
    name: 'standard'
  }
  properties: {
    disableLocalAuth: true
    enablePurgeProtection: true
  }
}

resource replica 'Microsoft.AppConfiguration/configurationStores/replicas@2022-03-01-preview' = {
  name: replicaName
  location: replicaLocation
  parent: store
}
